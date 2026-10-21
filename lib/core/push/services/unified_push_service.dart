import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/push/android/android_push_pipeline.dart';
import 'package:fluxer_app/core/push/local_push_notifications.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_account_index.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_message_mapper.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_vapid_cache.dart';
import 'package:unifiedpush/unifiedpush.dart' as up;

const String kFluxerUnifiedPushInstance = 'fluxer';

const Duration _kEndpointWaitTimeout = Duration(seconds: 12);
const Duration _kRegistrationRetryDelay = Duration(seconds: 5);
const Duration _kDecryptionHealCooldown = Duration(seconds: 30);
const Duration _kBackgroundMessageWait = Duration(seconds: 25);

bool _isUnifiedPushAndroid() =>
    PushProviderGuard.isUnifiedPush && Platform.isAndroid;

class UnifiedPushEndpoint {
  const UnifiedPushEndpoint({required this.instance, required this.endpoint});

  final String instance;
  final up.PushEndpoint endpoint;
}

class UnifiedPushService implements PushService {
  factory UnifiedPushService() => instance;

  UnifiedPushService._();

  static final UnifiedPushService instance = UnifiedPushService._();

  final StreamController<PushMessage> _messages =
      StreamController<PushMessage>.broadcast();
  final StreamController<UnifiedPushEndpoint> _endpointEvents =
      StreamController<UnifiedPushEndpoint>.broadcast();
  final Map<String, up.PushEndpoint> _endpointsByInstance =
      <String, up.PushEndpoint>{};
  final Map<String, String> _vapidByInstance = <String, String>{};
  final Map<String, String> _registeredVapidByInstance = <String, String>{};
  final Map<String, up.FailedReason> _failureByInstance =
      <String, up.FailedReason>{};
  final Map<String, DateTime> _healAtByInstance = <String, DateTime>{};
  final Set<String> _desiredInstances = <String>{};
  final Set<String> _retryingInstances = <String>{};

  bool _initialized = false;
  bool _needsDistributorPicker = false;
  bool _retiredLegacyInstance = false;
  FluxerDatabase? _database;
  static bool _backgroundMode = false;
  Future<void>? _initializeFuture;
  Completer<void>? _backgroundMessageHandled;
  Future<void> _registrationQueue = Future<void>.value();
  final StreamController<void> _pickerRequests =
      StreamController<void>.broadcast();

  Stream<UnifiedPushEndpoint> get endpointStream => _endpointEvents.stream;

  Stream<void> get distributorPickerRequests => _pickerRequests.stream;

  bool get needsDistributorPicker => _needsDistributorPicker;

  List<String> get distributorInstances =>
      List<String>.unmodifiable(_desiredInstances);

  up.PushEndpoint? endpointFor(String instance) =>
      _endpointsByInstance[instance];

  bool _hasEndpoint(String instance) {
    final up.PushEndpoint? endpoint = _endpointsByInstance[instance];
    return endpoint != null && endpoint.url.isNotEmpty;
  }

  void attachDatabase(FluxerDatabase database) {
    _database ??= database;
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

  @override
  Future<void> initialize() async {
    if (!_isUnifiedPushAndroid()) {
      return;
    }
    await _ensureUnifiedPushInitialized();
  }

  Future<void> syncInstance({
    required String instance,
    String? vapid,
    bool force = false,
    bool hasPersistedSubscription = false,
  }) {
    return _enqueue(
      () => _syncInstance(
        instance: instance,
        vapid: vapid,
        force: force,
        hasPersistedSubscription: hasPersistedSubscription,
      ),
    );
  }

  Future<void> unregisterInstance(String instance) {
    return _enqueue(() async {
      await _dropDistributorInstance(instance);
      _desiredInstances.remove(instance);
      if (_desiredInstances.isEmpty) {
        _needsDistributorPicker = false;
      }
    });
  }

  Future<void> retainInstances(Set<String> keep) {
    return _enqueue(() => _retainInstances(keep));
  }

  Future<void> _syncInstance({
    required String instance,
    String? vapid,
    bool force = false,
    bool hasPersistedSubscription = false,
  }) async {
    if (!_isUnifiedPushAndroid() || instance.isEmpty) {
      return;
    }
    _desiredInstances.add(instance);
    await _ensureUnifiedPushInitialized();
    if (!await _ensureDistributor()) {
      return;
    }
    final String? resolved = await _resolveVapid(instance, vapid);
    if (!hasUnifiedPushVapid(resolved)) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushService] deferring $instance until VAPID is available',
        );
      }
      return;
    }
    final bool vapidChanged = _registeredVapidByInstance[instance] != resolved;
    if (!force &&
        !vapidChanged &&
        hasPersistedSubscription &&
        _hasEndpoint(instance)) {
      return;
    }
    await _registerInstance(instance, resolved!);
    await _waitForEndpoint(instance);
  }

  Future<void> _registerInstance(String instance, String vapid) async {
    _failureByInstance.remove(instance);
    await up.UnifiedPush.register(instance: instance, vapid: vapid);
    _registeredVapidByInstance[instance] = vapid;
    _needsDistributorPicker = false;
  }

  Future<void> _dropDistributorInstance(String instance) async {
    if (!_isUnifiedPushAndroid() || instance.isEmpty) {
      return;
    }
    await _ensureUnifiedPushInitialized();
    await up.UnifiedPush.unregister(instance);
    _endpointsByInstance.remove(instance);
    _registeredVapidByInstance.remove(instance);
    _failureByInstance.remove(instance);
  }

  Future<void> _retainInstances(Set<String> keep) async {
    if (keep.isEmpty && _desiredInstances.isEmpty) {
      return;
    }
    if (!_isUnifiedPushAndroid()) {
      return;
    }
    final Set<String> remove = <String>{
      ..._desiredInstances,
      ..._endpointsByInstance.keys,
    };
    if (!_retiredLegacyInstance) {
      remove.add(kFluxerUnifiedPushInstance);
    }
    remove.removeAll(keep);
    for (final String instance in remove) {
      if (instance == kFluxerUnifiedPushInstance) {
        _retiredLegacyInstance = true;
      }
      await _dropDistributorInstance(instance);
      _desiredInstances.remove(instance);
    }
    if (_desiredInstances.isEmpty) {
      _needsDistributorPicker = false;
    }
  }

  Future<String?> _resolveVapid(String instance, String? vapid) async {
    if (hasUnifiedPushVapid(vapid)) {
      await _persistVapid(instance, vapid!);
      return vapid;
    }
    final String? memory = _vapidByInstance[instance];
    if (hasUnifiedPushVapid(memory)) {
      return memory;
    }
    final FluxerDatabase? database = _database;
    final String? cached = database != null
        ? await database.mobilePushRegistrationDao.getVapidForInstance(instance)
        : await readCachedUnifiedPushVapidPublicKey(instance);
    if (!hasUnifiedPushVapid(cached)) {
      return null;
    }
    _vapidByInstance[instance] = cached!;
    return cached;
  }

  Future<void> _persistVapid(String instance, String vapid) async {
    _vapidByInstance[instance] = vapid;
    final FluxerDatabase? database = _database;
    if (database != null) {
      await database.mobilePushRegistrationDao.saveVapidForInstance(
        instanceId: instance,
        vapidPublicKey: vapid,
      );
      return;
    }
    await writeCachedUnifiedPushVapidPublicKey(instance, vapid);
  }

  @override
  Future<String?> getToken() async {
    final List<up.PushEndpoint> endpoints = _endpointsByInstance.values
        .where((up.PushEndpoint endpoint) => endpoint.url.isNotEmpty)
        .toList();
    if (endpoints.length != 1) {
      return null;
    }
    return endpoints.single.url;
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

  Future<void> _enqueue(Future<void> Function() action) {
    final Future<void> run = _registrationQueue.then((_) => action());
    _registrationQueue = run.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return run;
  }

  Future<bool> _hasSavedDistributor() async {
    final String? distributor = await up.UnifiedPush.getDistributor();
    return distributor != null && distributor.isNotEmpty;
  }

  Future<bool> _ensureDistributor() async {
    if (await _hasSavedDistributor()) {
      return true;
    }
    final bool usedDefault =
        await up.UnifiedPush.tryUseCurrentOrDefaultDistributor();
    if (usedDefault) {
      return true;
    }
    _markDistributorPickerNeeded();
    return false;
  }

  void _markDistributorPickerNeeded() {
    final bool changed = !_needsDistributorPicker;
    _needsDistributorPicker = true;
    if (!changed || _backgroundMode || _pickerRequests.isClosed) {
      return;
    }
    _pickerRequests.add(null);
  }

  Future<bool> _waitForEndpoint(
    String instance, {
    Duration timeout = _kEndpointWaitTimeout,
  }) async {
    if (_hasEndpoint(instance)) {
      return true;
    }
    final Completer<void> arrived = Completer<void>();
    final StreamSubscription<UnifiedPushEndpoint> subscription = _endpointEvents
        .stream
        .listen((UnifiedPushEndpoint update) {
          if (update.instance != instance ||
              update.endpoint.url.isEmpty ||
              arrived.isCompleted) {
            return;
          }
          arrived.complete();
        });
    try {
      if (_hasEndpoint(instance)) {
        return true;
      }
      await arrived.future.timeout(timeout);
      return true;
    } on TimeoutException {
      return _hasEndpoint(instance);
    } finally {
      await subscription.cancel();
    }
  }

  void _onNewEndpoint(up.PushEndpoint endpoint, String instance) {
    if (instance.isEmpty) {
      return;
    }
    _failureByInstance.remove(instance);
    _endpointsByInstance[instance] = endpoint;
    _needsDistributorPicker = false;
    _endpointEvents.add(
      UnifiedPushEndpoint(instance: instance, endpoint: endpoint),
    );
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushService] endpoint $instance '
        '(temp=${endpoint.temporary}): ${endpoint.url}',
      );
    }
  }

  void _onRegistrationFailed(up.FailedReason reason, String instance) {
    if (instance.isEmpty) {
      return;
    }
    _failureByInstance[instance] = reason;
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushService] registration failed ($instance): $reason',
      );
    }
    if (reason != up.FailedReason.actionRequired) {
      unawaited(_retryRegistrationAfterFailure(instance, reason));
    }
  }

  Future<void> _retryRegistrationAfterFailure(
    String instance,
    up.FailedReason reason,
  ) async {
    await Future<void>.delayed(Duration.zero);
    if (!_desiredInstances.contains(instance)) {
      return;
    }
    if (reason == up.FailedReason.vapidRequired &&
        hasUnifiedPushVapid(await _resolveVapid(instance, null))) {
      await syncInstance(instance: instance, force: true);
      return;
    }
    _scheduleRegistrationRetry(instance);
  }

  void _onTempUnavailable(String instance) {
    if (instance.isEmpty) {
      return;
    }
    if (kDebugMode) {
      debugPrint(
        '[UnifiedPushService] distributor temporarily unavailable ($instance)',
      );
    }
    _scheduleRegistrationRetry(instance);
  }

  void _scheduleRegistrationRetry(String instance) {
    if (_backgroundMode || !_retryingInstances.add(instance)) {
      return;
    }
    Future<void>.delayed(_kRegistrationRetryDelay, () async {
      _retryingInstances.remove(instance);
      if (!_desiredInstances.contains(instance) || !_isUnifiedPushAndroid()) {
        return;
      }
      await syncInstance(instance: instance, force: true);
    });
  }

  void _onUnregistered(String instance) {
    if (instance.isEmpty) {
      return;
    }
    _endpointsByInstance.remove(instance);
    _registeredVapidByInstance.remove(instance);
    if (kDebugMode) {
      debugPrint('[UnifiedPushService] unregistered $instance');
    }
  }

  Future<void> _onMessage(up.PushMessage message, String instance) async {
    if (instance.isEmpty) {
      return;
    }
    try {
      await _handleIncomingMessage(message, instance);
    } finally {
      _completeBackgroundMessageWait();
    }
  }

  Future<void> _handleIncomingMessage(
    up.PushMessage message,
    String instance,
  ) async {
    if (message.content.isEmpty) {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] skip empty push');
      }
      return;
    }
    if (!message.decrypted) {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] skip undecrypted push');
      }
      if (_backgroundMode) {
        await _healDecryptionFailure(instance);
      } else {
        unawaited(_healDecryptionFailure(instance));
      }
      return;
    }
    final PushMessage mapped;
    try {
      mapped = mapUnifiedPushMessage(message);
    } on FormatException {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] skip invalid push payload');
      }
      return;
    }
    await _stampTargetUser(mapped, instance);
    final PushMessage? emitted;
    try {
      emitted = await AndroidPushPipeline.dispatch(
        message: mapped,
        backgroundMode: _backgroundMode,
        decrypted: true,
      );
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] push dispatch failed: $e\n$st');
      }
      return;
    }
    if (emitted != null) {
      if (kDebugMode) {
        debugPrint(
          '[UnifiedPushService] emit push id=${emitted.id} '
          'title=${emitted.title}',
        );
      }
      _messages.add(emitted);
    }
  }

  Future<void> _stampTargetUser(PushMessage message, String instance) async {
    final String? existing = message.payload['target_user_id'];
    if (existing != null && existing.isNotEmpty) {
      return;
    }
    try {
      final String? userId = await unifiedPushTargetUserForInstance(instance);
      if (userId != null) {
        message.payload['target_user_id'] = userId;
      }
    } on Object {
      // Show the notification anyway.
    }
  }

  void _completeBackgroundMessageWait() {
    if (!_backgroundMode) {
      return;
    }
    final Completer<void>? pending = _backgroundMessageHandled;
    if (pending == null || pending.isCompleted) {
      return;
    }
    pending.complete();
  }

  Future<void> _healDecryptionFailure(String instance) async {
    if (!_backgroundMode && !_desiredInstances.contains(instance)) {
      return;
    }
    final DateTime now = DateTime.now();
    final DateTime? previous = _healAtByInstance[instance];
    if (previous != null &&
        now.difference(previous) < _kDecryptionHealCooldown) {
      return;
    }
    _healAtByInstance[instance] = now;
    if (kDebugMode) {
      debugPrint('[UnifiedPushService] healing undecrypted push for $instance');
    }
    try {
      await syncInstance(instance: instance, force: true);
    } on Object catch (e, st) {
      if (kDebugMode) {
        debugPrint('[UnifiedPushService] heal failed: $e\n$st');
      }
    }
  }
}
