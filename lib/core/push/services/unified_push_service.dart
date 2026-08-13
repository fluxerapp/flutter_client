import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_notification_clear.dart';
import 'package:fluxer_app/core/push/push_notification_permission.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_incoming_policy.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_message_mapper.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_vapid_cache.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

/// Fixed UnifiedPush instance id for this app.
const String kFluxerUnifiedPushInstance = 'fluxer';

const Duration _kEndpointWaitTimeout = Duration(seconds: 12);
const Duration _kRegistrationRetryDelay = Duration(seconds: 5);
const Duration _kDecryptionHealCooldown = Duration(seconds: 30);
const Duration _kBackgroundMessageWait = Duration(seconds: 3);

bool _isUnifiedPushAndroid() =>
    PushProviderGuard.isUnifiedPush && Platform.isAndroid;

class UnifiedPushService implements PushService {
  factory UnifiedPushService() => instance;

  UnifiedPushService._();

  static final UnifiedPushService instance = UnifiedPushService._();

  final StreamController<PushMessage> _messages =
      StreamController<PushMessage>.broadcast();
  final StreamController<up.PushEndpoint> _endpoints =
      StreamController<up.PushEndpoint>.broadcast();
  final LocalPushNotifications _localPush = LocalPushNotifications();

  up.PushEndpoint? _endpoint;
  bool _initialized = false;
  bool _needsDistributorPicker = false;
  String? _pendingVapid;
  String? _lastRegisteredVapid;
  bool _registrationRetryScheduled = false;
  DateTime? _lastDecryptionHealAt;
  UnifiedPushVapidResolver? vapidNetworkResolver;
  Future<String?>? _ensureVapidFuture;
  FluxerDatabase? _database;
  static bool _backgroundMode = false;
  Future<void>? _initializeFuture;
  Completer<void>? _backgroundMessageHandled;

  Stream<up.PushEndpoint> get endpointStream => _endpoints.stream;

  up.PushEndpoint? get currentEndpoint => _endpoint;

  bool get needsDistributorPicker => _needsDistributorPicker;

  String? get pendingVapid => _pendingVapid;

  bool get _hasEndpoint => _endpoint != null && _endpoint!.url.isNotEmpty;

  /// Resolves VAPID from memory, cache, then the stored network resolver.
  Future<String?> ensureVapidPublicKey() {
    if (hasUnifiedPushVapid(_pendingVapid)) {
      return Future<String?>.value(_pendingVapid);
    }
    return _ensureVapidFuture ??= _resolveVapidPublicKey().whenComplete(() {
      _ensureVapidFuture = null;
    });
  }

  Future<String?> _resolveVapidPublicKey() async {
    await loadCachedVapidPublicKey();
    if (hasUnifiedPushVapid(_pendingVapid)) {
      return _pendingVapid;
    }
    final UnifiedPushVapidResolver? resolve = vapidNetworkResolver;
    if (resolve == null) {
      return _pendingVapid;
    }
    try {
      final String? fetched = await resolve();
      if (hasUnifiedPushVapid(fetched)) {
        await persistVapidPublicKey(fetched!);
      }
    } on Object {
      // Network fetch is best-effort.
    }
    return _pendingVapid;
  }

  /// Reuses the main isolate's Riverpod database so cache reads and writes do
  /// not open a second connection. Stays null on the background isolate, which
  /// has no Riverpod and falls back to the standalone cache helpers.
  void attachDatabase(FluxerDatabase database) {
    _database ??= database;
  }

  @visibleForTesting
  static bool get backgroundModeForTesting => _backgroundMode;

  @visibleForTesting
  static void resetBackgroundModeForTesting() {
    _backgroundMode = false;
  }

  static Future<void> ensureBackgroundInitialized() async {
    if (!_isUnifiedPushAndroid()) {
      return;
    }
    _backgroundMode = true;
    instance._backgroundMessageHandled = Completer<void>();
    await LocalPushNotifications().ensureInitialized();
    await instance._ensureUnifiedPushInitialized();
    await instance._backgroundMessageHandled!.future.timeout(
      _kBackgroundMessageWait,
      onTimeout: () {},
    );
  }

  Future<void> loadCachedVapidPublicKey() async {
    if (hasUnifiedPushVapid(_pendingVapid)) {
      return;
    }
    final FluxerDatabase? database = _database;
    final String? cached = database != null
        ? await database.mobilePushRegistrationDao.getCachedVapidPublicKey()
        : await readCachedUnifiedPushVapidPublicKey();
    if (hasUnifiedPushVapid(cached)) {
      _pendingVapid = cached;
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] loaded cached VAPID key');
      }
    }
  }

  Future<void> persistVapidPublicKey(String vapidPublicKey) async {
    if (!hasUnifiedPushVapid(vapidPublicKey)) {
      return;
    }
    _pendingVapid = vapidPublicKey;
    final FluxerDatabase? database = _database;
    if (database != null) {
      await database.mobilePushRegistrationDao.saveGlobalVapidPublicKey(
        vapidPublicKey,
      );
    } else {
      await writeCachedUnifiedPushVapidPublicKey(vapidPublicKey);
    }
  }

  Future<void> persistVapidForUser({
    required String userId,
    required String vapidPublicKey,
  }) async {
    await persistVapidPublicKey(vapidPublicKey);
    final FluxerDatabase? database = _database;
    if (database == null) {
      return;
    }
    await database.mobilePushRegistrationDao.saveVapidForUser(
      userId: userId,
      vapidPublicKey: vapidPublicKey,
    );
  }

  /// Updates cached VAPID and re-registers with the distributor when needed.
  Future<void> applyVapidAndReregisterIfNeeded(String? vapid) async {
    if (!_isUnifiedPushAndroid() || !hasUnifiedPushVapid(vapid)) {
      return;
    }
    await persistVapidPublicKey(vapid!);
    final String? distributor = await up.UnifiedPush.getDistributor();
    if (distributor == null || distributor.isEmpty) {
      return;
    }
    final bool vapidChanged = _lastRegisteredVapid != vapid;
    if (!vapidChanged && _hasEndpoint) {
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
    if (!_isUnifiedPushAndroid()) {
      return;
    }
    if (hasUnifiedPushVapid(vapid)) {
      if (_pendingVapid != vapid) {
        await persistVapidPublicKey(vapid!);
      }
    } else {
      await loadCachedVapidPublicKey();
    }
    await _ensureUnifiedPushInitialized();
  }

  /// Registers with the saved distributor and waits for an endpoint
  Future<void> syncRegistration({
    bool force = false,
    bool hasPersistedSubscription = false,
  }) async {
    if (!_isUnifiedPushAndroid()) {
      return;
    }
    await _ensureUnifiedPushInitialized();
    if (!hasUnifiedPushVapid(await ensureVapidPublicKey())) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushService] deferring registration until VAPID is available',
        );
      }
      return;
    }
    if (!force && hasPersistedSubscription && _hasEndpoint) {
      return;
    }
    await _registerWithDistributor();
    if (await _waitForEndpoint()) {
      return;
    }
    if (!force && hasPersistedSubscription && _endpoint != null) {
      return;
    }
    if (_backgroundMode) {
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
    if (!_isUnifiedPushAndroid()) {
      return;
    }
    if (hasUnifiedPushVapid(vapid)) {
      await persistVapidPublicKey(vapid!);
    } else {
      await loadCachedVapidPublicKey();
    }
    if (!hasUnifiedPushVapid(_pendingVapid)) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushService] skipping register without VAPID public key',
        );
      }
      return;
    }
    await up.UnifiedPush.register(
      instance: kFluxerUnifiedPushInstance,
      vapid: _pendingVapid,
    );
    _lastRegisteredVapid = _pendingVapid;
    _needsDistributorPicker = false;
  }

  Future<void> unregisterFromDistributor() async {
    if (!_isUnifiedPushAndroid()) {
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

  Future<void> _ensureUnifiedPushInitialized() {
    if (_initialized) {
      return Future<void>.value();
    }
    return _initializeFuture ??= _bindUnifiedPushCallbacks().whenComplete(() {
      _initializeFuture = null;
    });
  }

  Future<void> _bindUnifiedPushCallbacks() async {
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
    if (_hasEndpoint) {
      return true;
    }
    final Future<up.PushEndpoint> next = _endpoints.stream
        .where((up.PushEndpoint endpoint) => endpoint.url.isNotEmpty)
        .first;
    if (_hasEndpoint) {
      return true;
    }
    try {
      await next.timeout(timeout);
      return true;
    } on TimeoutException {
      return _hasEndpoint;
    }
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
    if (reason == up.FailedReason.vapidRequired &&
        hasUnifiedPushVapid(await ensureVapidPublicKey())) {
      await applyVapidAndReregisterIfNeeded(_pendingVapid);
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
    if (_backgroundMode || _registrationRetryScheduled) {
      return;
    }
    _registrationRetryScheduled = true;
    Future<void>.delayed(_kRegistrationRetryDelay, () async {
      _registrationRetryScheduled = false;
      if (!_isUnifiedPushAndroid()) {
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
    try {
      await _handleIncomingMessage(message, instance);
    } finally {
      _completeBackgroundMessageHandled();
    }
  }

  Future<void> _handleIncomingMessage(
    up.PushMessage message,
    String instance,
  ) async {
    if (instance != kFluxerUnifiedPushInstance) {
      return;
    }
    if (!message.decrypted) {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] skip undecrypted push');
      }
      unawaited(_healDecryptionFailure());
      return;
    }
    final PushMessage mapped = mapUnifiedPushMessage(message);
    switch (resolveUnifiedPushIncomingAction(
      instance: instance,
      expectedInstance: kFluxerUnifiedPushInstance,
      decrypted: true,
      backgroundMode: _backgroundMode,
      payload: mapped.payload,
    )) {
      case UnifiedPushIncomingAction.ignore:
      case UnifiedPushIncomingAction.healUndecrypted:
        return;
      case UnifiedPushIncomingAction.handleClear:
        if (kDebugMode) {
          debugPrint('[UnifiedPushService] clear payload id=${mapped.id}');
        }
        await PushNotificationClear.handleClearPayload(mapped.payload);
      case UnifiedPushIncomingAction.emitToCoordinator:
        if (kDebugMode) {
          debugPrint(
            '[UnifiedPushService] emit push id=${mapped.id} '
            'title=${mapped.title}',
          );
        }
        _messages.add(mapped);
      case UnifiedPushIncomingAction.showLocally:
        await _displayUnifiedPushMessage(mapped);
    }
  }

  void _completeBackgroundMessageHandled() {
    if (!_backgroundMode) {
      return;
    }
    final Completer<void>? pending = _backgroundMessageHandled;
    if (pending == null || pending.isCompleted) {
      return;
    }
    pending.complete();
  }

  Future<void> _displayUnifiedPushMessage(PushMessage mapped) async {
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushService] display push id=${mapped.id} '
        'title=${mapped.title} body=${mapped.body} bg=$_backgroundMode',
      );
    }
    final bool ready = await _localPush.ensureInitialized();
    if (!ready) {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] local notifications not initialized');
      }
      return;
    }
    await _localPush.showPushMessage(mapped);
  }

  Future<void> _healDecryptionFailure() async {
    final DateTime now = DateTime.now();
    if (_lastDecryptionHealAt != null &&
        now.difference(_lastDecryptionHealAt!) < _kDecryptionHealCooldown) {
      return;
    }
    _lastDecryptionHealAt = now;
    if (kDebugMode) {
      debugPrint('[UnifiedPushService] healing undecrypted push payload');
    }
    await ensureVapidPublicKey();
    if (_backgroundMode) {
      await registerWithSavedDistributor(vapid: _pendingVapid);
      return;
    }
    await applyVapidAndReregisterIfNeeded(_pendingVapid);
    await syncRegistration(force: true);
  }
}
