import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/push/foreground_push_notification_policy.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_message_mapper.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_vapid_cache.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

/// Fixed UnifiedPush instance id for this app.
const String kFluxerUnifiedPushInstance = 'fluxer';

const Duration _kEndpointWaitTimeout = Duration(seconds: 12);
const Duration _kEndpointPollInterval = Duration(milliseconds: 100);
const Duration _kRegistrationRetryDelay = Duration(seconds: 5);

class UnifiedPushService implements PushService {
  factory UnifiedPushService() => instance;

  UnifiedPushService._();

  static final UnifiedPushService instance = UnifiedPushService._();

  final StreamController<PushMessage> _messages =
      StreamController<PushMessage>.broadcast();
  final StreamController<up.PushEndpoint> _endpoints =
      StreamController<up.PushEndpoint>.broadcast();

  up.PushEndpoint? _endpoint;
  bool _initialized = false;
  bool _needsDistributorPicker = false;
  String? _pendingVapid;
  String? _lastRegisteredVapid;
  bool _registrationRetryScheduled = false;
  FluxerDatabase? _database;
  static bool _backgroundMode = false;
  bool _appForeground = true;

  Stream<up.PushEndpoint> get endpointStream => _endpoints.stream;

  up.PushEndpoint? get currentEndpoint => _endpoint;

  bool get needsDistributorPicker => _needsDistributorPicker;

  String? get pendingVapid => _pendingVapid;

  /// Reuses the main isolate's Riverpod database so cache reads and writes do
  /// not open a second connection. Stays null on the background isolate, which
  /// has no Riverpod and falls back to the standalone cache helpers.
  void attachDatabase(FluxerDatabase database) {
    if (_database != null) {
      return;
    }
    _database = database;
  }

  set appForeground(bool isAppForeground) {
    _appForeground = isAppForeground;
  }

  @visibleForTesting
  bool get appForegroundForTesting => _appForeground;

  @visibleForTesting
  static bool get backgroundModeForTesting => _backgroundMode;

  @visibleForTesting
  static void resetBackgroundModeForTesting() {
    _backgroundMode = false;
  }

  static Future<void> ensureBackgroundInitialized() async {
    if (!PushProviderGuard.isUnifiedPush || !Platform.isAndroid) {
      return;
    }
    _backgroundMode = true;
    await requestPushNotificationPermission();
    await LocalPushNotifications().ensureInitialized();
    await instance.loadCachedVapidPublicKey();
    await instance._ensureUnifiedPushInitialized();
  }

  void setPendingVapid(String? vapid) {
    if (vapid != null && vapid.isNotEmpty) {
      _pendingVapid = vapid;
    }
  }

  Future<void> loadCachedVapidPublicKey() async {
    final FluxerDatabase? database = _database;
    final String? cached = database != null
        ? await database.mobilePushRegistrationDao.getCachedVapidPublicKey()
        : await readCachedUnifiedPushVapidPublicKey();
    if (cached != null && cached.isNotEmpty) {
      _pendingVapid = cached;
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] loaded cached VAPID key');
      }
    }
  }

  Future<void> persistVapidPublicKey(String vapidPublicKey) async {
    if (vapidPublicKey.isEmpty) {
      return;
    }
    setPendingVapid(vapidPublicKey);
    final FluxerDatabase? database = _database;
    if (database != null) {
      await database.mobilePushRegistrationDao.saveGlobalVapidPublicKey(
        vapidPublicKey,
      );
    } else {
      await writeCachedUnifiedPushVapidPublicKey(vapidPublicKey);
    }
  }

  /// Updates cached VAPID and re-registers with the distributor when needed.
  Future<void> applyVapidAndReregisterIfNeeded(String? vapid) async {
    if (!PushProviderGuard.isUnifiedPush || !Platform.isAndroid) {
      return;
    }
    if (vapid == null || vapid.isEmpty) {
      return;
    }
    await persistVapidPublicKey(vapid);
    final String? distributor = await up.UnifiedPush.getDistributor();
    if (distributor == null || distributor.isEmpty) {
      return;
    }
    final bool vapidChanged = _lastRegisteredVapid != vapid;
    if (!vapidChanged && _endpoint != null && _endpoint!.url.isNotEmpty) {
      return;
    }
    await _ensureUnifiedPushInitialized();
    await registerWithSavedDistributor(vapid: vapid);
  }

  @override
  Future<void> requestPermissions() async {
    await requestPushNotificationPermission();
  }

  @override
  Future<void> initialize() async {
    await initializeWithOptions();
  }

  Future<void> initializeWithOptions({String? vapid}) async {
    if (!PushProviderGuard.isUnifiedPush || !Platform.isAndroid) {
      return;
    }
    setPendingVapid(vapid);
    if (_pendingVapid == null) {
      await loadCachedVapidPublicKey();
    }
    if (vapid != null && vapid.isNotEmpty) {
      await persistVapidPublicKey(vapid);
    }
    await _ensureUnifiedPushInitialized();
  }

  /// Registers with the saved distributor and waits for an endpoint
  Future<void> syncRegistration({
    bool force = false,
    bool hasPersistedSubscription = false,
  }) async {
    if (!PushProviderGuard.isUnifiedPush || !Platform.isAndroid) {
      return;
    }
    await _ensureUnifiedPushInitialized();
    if (!force &&
        hasPersistedSubscription &&
        _endpoint != null &&
        _endpoint!.url.isNotEmpty) {
      return;
    }
    await _registerWithDistributor();
    if (await _waitForEndpoint()) {
      return;
    }
    if (!force && hasPersistedSubscription && _endpoint != null) {
      return;
    }
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushService] no endpoint after register; '
        'unregister+register fallback',
      );
    }
    await unregisterFromDistributor();
    await _registerWithDistributor();
    await _waitForEndpoint();
  }

  Future<void> registerWithSavedDistributor({String? vapid}) async {
    if (!PushProviderGuard.isUnifiedPush || !Platform.isAndroid) {
      return;
    }
    if (vapid != null && vapid.isNotEmpty) {
      await persistVapidPublicKey(vapid);
    } else if (_pendingVapid == null) {
      await loadCachedVapidPublicKey();
    }
    await up.UnifiedPush.register(
      instance: kFluxerUnifiedPushInstance,
      vapid: _pendingVapid,
    );
    if (_pendingVapid != null && _pendingVapid!.isNotEmpty) {
      _lastRegisteredVapid = _pendingVapid;
    }
    _needsDistributorPicker = false;
  }

  Future<void> unregisterFromDistributor() async {
    if (!PushProviderGuard.isUnifiedPush || !Platform.isAndroid) {
      return;
    }
    await _ensureUnifiedPushInitialized();
    await up.UnifiedPush.unregister(kFluxerUnifiedPushInstance);
    _endpoint = null;
    _lastRegisteredVapid = null;
    _needsDistributorPicker = false;
  }

  @override
  Future<String?> getToken() async {
    return _endpoint?.url;
  }

  @override
  Stream<PushMessage> watchMessages() => _messages.stream;

  Future<void> _ensureUnifiedPushInitialized() async {
    if (_initialized) {
      return;
    }
    final bool hasDistributor = await up.UnifiedPush.initialize(
      onNewEndpoint: _onNewEndpoint,
      onRegistrationFailed: _onRegistrationFailed,
      onUnregistered: _onUnregistered,
      onMessage: _onMessage,
      onTempUnavailable: _onTempUnavailable,
    );
    _initialized = true;
    if (hasDistributor) {
      _needsDistributorPicker = false;
    }
  }

  Future<void> _registerWithDistributor() async {
    final String? distributor = await up.UnifiedPush.getDistributor();
    if (distributor != null && distributor.isNotEmpty) {
      await registerWithSavedDistributor();
      return;
    }
    final bool usedDefault =
        await up.UnifiedPush.tryUseCurrentOrDefaultDistributor();
    if (usedDefault) {
      await registerWithSavedDistributor();
      return;
    }
    _needsDistributorPicker = true;
  }

  Future<bool> _waitForEndpoint({
    Duration timeout = _kEndpointWaitTimeout,
  }) async {
    final DateTime deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      if (_endpoint != null && _endpoint!.url.isNotEmpty) {
        return true;
      }
      await Future<void>.delayed(_kEndpointPollInterval);
    }
    return _endpoint != null && _endpoint!.url.isNotEmpty;
  }

  void _onNewEndpoint(up.PushEndpoint endpoint, String instance) {
    if (instance != kFluxerUnifiedPushInstance) {
      return;
    }
    _endpoint = endpoint;
    _needsDistributorPicker = false;
    _endpoints.add(endpoint);
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushService] endpoint (temp=${endpoint.temporary}): '
        '${endpoint.url}',
      );
    }
  }

  void _onRegistrationFailed(up.FailedReason reason, String instance) {
    if (instance != kFluxerUnifiedPushInstance) {
      return;
    }
    if (kDebugMode) {
      debugPrint('[UnifiedPushService] registration failed: $reason');
    }
    _onUnregistered(instance);
    switch (reason) {
      case up.FailedReason.network:
      case up.FailedReason.internalError:
      case up.FailedReason.vapidRequired:
        unawaited(_retryRegistrationAfterFailure(reason));
      case up.FailedReason.actionRequired:
        _needsDistributorPicker = true;
    }
  }

  Future<void> _retryRegistrationAfterFailure(up.FailedReason reason) async {
    if (reason == up.FailedReason.vapidRequired) {
      await loadCachedVapidPublicKey();
      if (_pendingVapid != null && _pendingVapid!.isNotEmpty) {
        await applyVapidAndReregisterIfNeeded(_pendingVapid);
      }
    }
    _scheduleRegistrationRetry();
  }

  void _onTempUnavailable(String instance) {
    if (instance != kFluxerUnifiedPushInstance) {
      return;
    }
    if (kDebugMode) {
      debugPrint('[UnifiedPushService] distributor temporarily unavailable');
    }
    _scheduleRegistrationRetry();
  }

  void _scheduleRegistrationRetry() {
    if (_registrationRetryScheduled) {
      return;
    }
    _registrationRetryScheduled = true;
    Future<void>.delayed(_kRegistrationRetryDelay, () async {
      _registrationRetryScheduled = false;
      if (!PushProviderGuard.isUnifiedPush || !Platform.isAndroid) {
        return;
      }
      await syncRegistration(force: true);
    });
  }

  void _onUnregistered(String instance) {
    if (instance != kFluxerUnifiedPushInstance) {
      return;
    }
    _endpoint = null;
    if (kDebugMode) {
      debugPrint('[UnifiedPushService] unregistered');
    }
  }

  Future<void> _onMessage(up.PushMessage message, String instance) async {
    if (instance != kFluxerUnifiedPushInstance) {
      return;
    }
    final PushMessage mapped = mapUnifiedPushMessage(message);
    if (_backgroundMode) {
      await _displayUnifiedPushMessage(mapped);
      return;
    }
    if (!ForegroundPushNotificationPolicy.shouldProcessPush(
      isAppForeground: _appForeground,
      payload: mapped.payload,
    )) {
      return;
    }
    if (isNotificationClearPayload(mapped.payload)) {
      await PushNotificationClear.handleClearPayload(mapped.payload);
      return;
    }
    await _displayUnifiedPushMessage(mapped);
  }

  Future<void> _displayUnifiedPushMessage(PushMessage mapped) async {
    _messages.add(mapped);
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushService] display push id=${mapped.id} '
        'title=${mapped.title} body=${mapped.body} bg=$_backgroundMode',
      );
    }
    final LocalPushNotifications localPush = LocalPushNotifications();
    final bool ready = await localPush.ensureInitialized();
    if (!ready) {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] local notifications not initialized');
      }
      return;
    }
    await localPush.showPushMessage(mapped);
  }
}
