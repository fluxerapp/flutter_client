import 'dart:async';
import 'dart:io';

// LiveKit CallKit audio ownership APIs are marked @experimental.
// ignore_for_file: experimental_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' show BuildContext, WidgetsBinding;
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/push/apns/apns_voip_mobile_device_registration.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:fluxer_app/features/voice/utils/incoming_voice_call_actions.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_ring.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_params.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_session_store.dart';
import 'package:fluxer_app/features/voice/utils/voice_session_navigation.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_callkit_coordinator.g.dart';

const MethodChannel _iosVoipCallKit = MethodChannel('fluxer_app/voip_callkit');

VoiceCallKitVoiceSnapshot _voiceCallKitVoiceSnapshot(VoiceSessionState state) {
  return (
    isInVoice: state.isInVoice,
    isConnected: state.isConnected,
    isConnecting: state.isConnecting,
    channelId: state.channelId,
    activeConnectionId: state.activeConnectionId,
  );
}

@Riverpod(keepAlive: true)
void voiceCallKitCoordinator(Ref ref) {
  if (kIsWeb || !(Platform.isIOS || Platform.isAndroid)) {
    return;
  }
  final VoiceCallKitCoordinatorLogic logic = VoiceCallKitCoordinatorLogic(ref)
    ..init();
  ref.onDispose(logic.dispose);
}

class VoiceCallKitCoordinatorLogic {
  VoiceCallKitCoordinatorLogic(this._ref)
    : _isMobileCallKitPlatform =
          !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  final Ref _ref;
  final bool _isMobileCallKitPlatform;
  final VoiceCallKitSessionStore _sessions = VoiceCallKitSessionStore();
  StreamSubscription<CallEvent?>? _eventSubscription;
  Future<void> _syncQueue = Future<void>.value();
  bool _permissionsRequested = false;
  bool _isEndingProgrammatically = false;
  bool _isApplyingCallKitMuteToVoice = false;
  bool _isSyncingMuteToCallKit = false;
  bool _callKitOwnsAudioSession = false;
  DateTime? _suppressUserEndHandlingUntil;
  final Set<String> _acceptInFlight = <String>{};
  final Set<String> _pendingRingsSeen = <String>{};
  final Set<String> _handledAcceptIds = <String>{};
  Timer? _audioSessionRecoveryTimer;
  final List<Timer> _speakerReapplyTimers = <Timer>[];

  void init() {
    _eventSubscription = FlutterCallkitIncoming.onEvent.listen(
      _handleCallEvent,
    );
    unawaited(_adoptNativeCalls());
    _ref
      ..listen<List<String>>(pendingIncomingVoiceChannelIdsProvider, (
        List<String>? _,
        List<String> next,
      ) {
        _scheduleSync(
          () => _syncIncomingPresentation(
            next,
            activeVoice: _voiceCallKitVoiceSnapshot(
              _ref.read(voiceSessionProvider),
            ),
          ),
        );
      })
      ..listen<Map<String, CallState>>(activeCallsProvider, (
        Map<String, CallState>? _,
        Map<String, CallState> next,
      ) {
        if (_sessions.isEmpty) {
          return;
        }
        _scheduleSync(() => _syncStaleCallKitSessions(next));
      })
      ..listen<VoiceSessionState>(voiceSessionProvider, (
        VoiceSessionState? previous,
        VoiceSessionState next,
      ) {
        final VoiceCallKitVoiceSnapshot? previousSnapshot = previous == null
            ? null
            : _voiceCallKitVoiceSnapshot(previous);
        final VoiceCallKitVoiceSnapshot nextSnapshot =
            _voiceCallKitVoiceSnapshot(next);
        if (previousSnapshot == nextSnapshot) {
          return;
        }
        _scheduleSync(() => _syncVoiceSession(previousSnapshot, nextSnapshot));
      })
      ..listen<bool>(gatewayReadyProvider, (bool? _, bool next) {
        if (!next) {
          return;
        }
        _scheduleSync(_endRingsMissingFromGateway);
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (previous == next) {
          return;
        }
        _scheduleSync(() => _syncForegroundChange(isForeground: next));
      })
      ..listen<Map<String, VoiceState>>(voiceStatesMapProvider, (
        Map<String, VoiceState>? previous,
        Map<String, VoiceState> next,
      ) {
        if (_sessions.isEmpty) {
          return;
        }
        _scheduleSync(
          () => _syncCallKitMuteFromVoiceStates(previous: previous, next: next),
        );
      })
      ..listen<VoiceSettingsState>(voiceSettingsProvider, (
        VoiceSettingsState? previous,
        VoiceSettingsState next,
      ) {
        final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
          _ref.read(voiceSessionProvider),
        );
        if (!shouldReapplySpeakerOutputOnPreferenceChange(
          isInVoice: voice.isInVoice,
          speakerPreferenceChanged: previous?.outputRoute != next.outputRoute,
        )) {
          return;
        }
        _scheduleSync(
          () => _applySpeakerOutputAndRetry(reason: 'speaker setting'),
        );
      });
  }

  void dispose() {
    _cancelAudioSessionRecovery();
    _cancelSpeakerOutputReapply();
    unawaited(_eventSubscription?.cancel());
    unawaited(_endAllCallKitSessions());
  }

  void _cancelAudioSessionRecovery() {
    _audioSessionRecoveryTimer?.cancel();
    _audioSessionRecoveryTimer = null;
  }

  void _cancelSpeakerOutputReapply() {
    for (final Timer timer in _speakerReapplyTimers) {
      timer.cancel();
    }
    _speakerReapplyTimers.clear();
  }

  void _scheduleSpeakerOutputReapply() {
    _cancelSpeakerOutputReapply();
    for (final Duration delay in kVoiceCallKitSpeakerReapplyDelays) {
      _speakerReapplyTimers.add(
        Timer(delay, () {
          _scheduleSync(
            () => _applySpeakerOutputForCallKitAudioSession(
              reason: 'speaker reapply',
            ),
          );
        }),
      );
    }
  }

  void _scheduleAudioSessionRecovery() {
    _cancelAudioSessionRecovery();
    _audioSessionRecoveryTimer = Timer(
      kVoiceCallKitAudioSessionRecoveryDelay,
      () {
        _scheduleSync(_recoverCallKitAudioSessionIfNeeded);
      },
    );
  }

  Future<void> _recoverCallKitAudioSessionIfNeeded() async {
    if (!_sessions.hasActiveVoiceSession) {
      return;
    }
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    if (!voice.isInVoice) {
      return;
    }
    await _enterCallKitAudioOwnership();
    try {
      await AudioManager.instance.setEngineAvailability(
        AudioEngineAvailability.defaultAvailability,
      );
    } on Object catch (error) {
      talker.warning(
        '[VoiceCallKit] audio session recovery setEngineAvailability failed: $error',
      );
    }
    await _applySpeakerOutputForCallKitAudioSession(
      reason: 'audio session recovery',
    );
  }

  Future<void> _enterCallKitAudioOwnership() async {
    if (_callKitOwnsAudioSession) {
      return;
    }
    _callKitOwnsAudioSession = true;
    try {
      await AudioManager.instance.setAudioSessionManagementMode(
        AudioSessionManagementMode.externalCallSystem,
      );
    } on Object catch (error) {
      talker.warning(
        '[VoiceCallKit] enter external audio ownership failed: $error',
      );
    }
  }

  Future<void> _exitCallKitAudioOwnership() async {
    if (!shouldRestoreLiveKitAutomaticAudioSession(
      callKitOwnsAudio: _callKitOwnsAudioSession,
      hasCallKitSessions: !_sessions.isEmpty,
    )) {
      return;
    }
    _callKitOwnsAudioSession = false;
    try {
      await AudioManager.instance.setEngineAvailability(
        AudioEngineAvailability.defaultAvailability,
      );
      await AudioManager.instance.setAudioSessionManagementMode(
        AudioSessionManagementMode.automatic,
      );
    } on Object catch (error) {
      talker.warning(
        '[VoiceCallKit] restore automatic audio ownership failed: $error',
      );
    }
  }

  Future<void> _handleToggleAudioSession({required bool isActive}) async {
    if (isActive) {
      final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
        _ref.read(voiceSessionProvider),
      );
      if (!voice.isInVoice) {
        return;
      }
      _cancelAudioSessionRecovery();
      await _enterCallKitAudioOwnership();
      await _setEngineAvailabilityForCallKitAudioSession(isActive: true);
      await _applySpeakerOutputAndRetry(reason: 'audio session activate');
      return;
    }
    await _setEngineAvailabilityForCallKitAudioSession(isActive: false);
    if (shouldScheduleCallKitAudioSessionRecovery(
      isAudioSessionActive: false,
      hasActiveVoiceSession: _sessions.hasActiveVoiceSession,
    )) {
      _scheduleAudioSessionRecovery();
      return;
    }
    await _exitCallKitAudioOwnership();
  }

  Future<void> _setEngineAvailabilityForCallKitAudioSession({
    required bool isActive,
  }) async {
    final bool enableEngine = shouldEnableLiveKitEngineForCallKitAudioSession(
      isAudioSessionActive: isActive,
    );
    try {
      await AudioManager.instance.setEngineAvailability(
        enableEngine
            ? AudioEngineAvailability.defaultAvailability
            : AudioEngineAvailability.none,
      );
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] setEngineAvailability failed: $error');
    }
  }

  bool _shouldApplySpeakerOutput() {
    return shouldApplySpeakerOutputWhileInVoice(
      hasActiveVoiceSession: _sessions.hasActiveVoiceSession,
      isInVoice: _voiceCallKitVoiceSnapshot(
        _ref.read(voiceSessionProvider),
      ).isInVoice,
    );
  }

  Future<void> _applySpeakerOutputAndRetry({required String reason}) async {
    if (!_shouldApplySpeakerOutput()) {
      return;
    }
    await _applySpeakerOutputForCallKitAudioSession(reason: reason);
    _scheduleSpeakerOutputReapply();
  }

  Future<void> _applySpeakerOutputForCallKitAudioSession({
    required String reason,
  }) async {
    if (!_shouldApplySpeakerOutput()) {
      return;
    }
    try {
      await _ref
          .read(voiceSettingsApplicatorProvider)
          .applySpeakerOutput(settings: _ref.read(voiceSettingsProvider));
    } on Object catch (error) {
      talker.warning(
        '[VoiceCallKit] $reason applySpeakerOutput failed: $error',
      );
    }
  }

  void _scheduleSync(Future<void> Function() work) {
    _syncQueue = _syncQueue.then((_) => work()).catchError((
      Object error,
      StackTrace stackTrace,
    ) {
      talker.warning('[VoiceCallKit] sync failed: $error\n$stackTrace');
    });
  }

  Future<void> _ensureAndroidPermissions() async {
    if (!Platform.isAndroid || _permissionsRequested) {
      return;
    }
    _permissionsRequested = true;
    try {
      await FlutterCallkitIncoming.requestNotificationPermission(
        <String, dynamic>{
          'title': 'Notification permission',
          'rationaleMessagePermission':
              'Notification permission is required to show incoming calls.',
          'postNotificationMessageRequired':
              'Notification permission is required. Allow it in Settings.',
        },
      );
      final bool canUseFullScreen =
          await FlutterCallkitIncoming.canUseFullScreenIntent();
      if (!canUseFullScreen) {
        await FlutterCallkitIncoming.requestFullIntentPermission();
      }
    } on Object catch (error) {
      talker.warning(
        '[VoiceCallKit] Android permission request failed: $error',
      );
    }
  }

  Future<void> _syncIncomingPresentation(
    List<String> pendingChannelIds, {
    VoiceCallKitVoiceSnapshot? activeVoice,
  }) async {
    final Set<String> pendingSet = pendingChannelIds.toSet();
    final List<String> staleIncomingRingChannelIds = <String>[];
    for (final MapEntry<String, String> entry in _sessions.channelEntries) {
      final VoiceCallKitSession? session = _sessions.sessionForCallKitId(
        entry.value,
      );
      if (session == null) {
        continue;
      }
      if (pendingSet.contains(entry.key)) {
        _pendingRingsSeen.add(entry.key);
        continue;
      }
      if (!_pendingRingsSeen.contains(entry.key)) {
        continue;
      }
      if (shouldEndIncomingRingCallKitSession(
        session: session,
        pendingIncomingChannelIds: pendingSet,
      )) {
        staleIncomingRingChannelIds.add(entry.key);
      }
    }
    for (final String channelId in staleIncomingRingChannelIds) {
      await _endCallKitForChannel(channelId);
    }

    final bool isForeground = _ref.read(appUiForegroundProvider);
    if (!isForeground && pendingChannelIds.isNotEmpty && Platform.isIOS) {
      await _adoptNativeCallsForChannels(pendingSet);
    }
    if (!shouldPresentIncomingVoiceCallKit(
      isMobileCallKitPlatform: _isMobileCallKitPlatform,
      isForeground: isForeground,
      hasPendingIncoming: pendingChannelIds.isNotEmpty,
    )) {
      return;
    }
    final VoiceCallKitVoiceSnapshot voiceSnapshot =
        activeVoice ??
        _voiceCallKitVoiceSnapshot(_ref.read(voiceSessionProvider));
    for (final String channelId in pendingChannelIds) {
      if (shouldSuppressIncomingVoiceCallKitForChannel(
        channelId: channelId,
        activeVoice: voiceSnapshot,
      )) {
        continue;
      }
      if (_sessions.wasIncomingPresented(channelId)) {
        continue;
      }
      await _ensureAndroidPermissions();
      await _showIncomingCallKit(channelId: channelId);
      return;
    }
  }

  Future<void> _syncStaleCallKitSessions(
    Map<String, CallState> activeCalls,
  ) async {
    final List<String> staleChannelIds = <String>[];
    for (final MapEntry<String, String> entry in _sessions.channelEntries) {
      final VoiceCallKitSession? session = _sessions.sessionForCallKitId(
        entry.value,
      );
      if (session == null) {
        continue;
      }
      if (session.kind == VoiceCallKitSessionKind.incomingRing) {
        continue;
      }
      if (shouldEndCallKitSessionForActiveCallsChange(
        session: session,
        activeCallChannelIds: activeCalls.keys.toSet(),
      )) {
        staleChannelIds.add(entry.key);
      }
    }
    for (final String channelId in staleChannelIds) {
      await _endCallKitForChannel(channelId);
    }
  }

  Future<void> _syncVoiceSession(
    VoiceCallKitVoiceSnapshot? previous,
    VoiceCallKitVoiceSnapshot next,
  ) async {
    if (!next.isInVoice) {
      _cancelSpeakerOutputReapply();
      ChatAttachmentAudioSession.instance.restoreAfterVoiceCall();
      if ((previous?.isInVoice ?? false) && !_sessions.hasIncomingRing) {
        await _endAllCallKitSessions();
      }
      return;
    }
    if (previous == null || !previous.isInVoice) {
      await ChatAttachmentAudioSession.instance.clearForVoiceCall();
    }
    if (didJoinVoiceCall(previous: previous, next: next)) {
      final String? previousChannelId = previous?.channelId;
      if (previous != null &&
          previous.isInVoice &&
          previousChannelId != null &&
          previousChannelId != next.channelId) {
        await _endCallKitForChannel(previousChannelId);
      }
      if (shouldStartCallKitOnVoiceJoin(voice: next)) {
        await _startCallKitOnVoiceJoin(next);
        await _syncCallKitConnectedState(next);
      }
      return;
    }
    if (next.isConnected && previous?.isConnected != true) {
      await _ensureCallKitSessionForVoice(next);
      await _syncCallKitConnectedState(next);
    }
  }

  Future<void> _syncForegroundChange({required bool isForeground}) async {
    if (isForeground) {
      if (_sessions.hasIncomingRing) {
        return;
      }
      if (Platform.isIOS && await _iosHasUnansweredCall()) {
        return;
      }
      final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
        _ref.read(voiceSessionProvider),
      );
      if (!shouldDismissCallKitOnForeground(
        isInVoice: voice.isInVoice,
        lifecycleState: WidgetsBinding.instance.lifecycleState,
      )) {
        return;
      }
      await _dismissCallKitUiOnly();
      return;
    }
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    if (shouldMaintainBackgroundVoiceCallKit(
      isMobileCallKitPlatform: _isMobileCallKitPlatform,
      isForeground: false,
      isInVoice: voice.isInVoice,
    )) {
      await _ensureCallKitSessionForVoice(voice, allowBackgroundStart: true);
      await _syncCallKitConnectedState(voice);
    }
    final List<String> pending = _ref.read(
      pendingIncomingVoiceChannelIdsProvider,
    );
    await _syncIncomingPresentation(pending, activeVoice: voice);
  }

  void _publishIncomingHold() {
    _ref
        .read(callKitIncomingHoldProvider.notifier)
        .setActive(value: _sessions.hasIncomingRing);
  }

  Future<void> _adoptNativeCalls() async {
    final List<CallKitParams> calls;
    try {
      calls = await FlutterCallkitIncoming.activeCalls();
    } on Object {
      return;
    }
    for (final CallKitParams params in calls) {
      final bool accepted = await _adoptCall(params);
      if (accepted) {
        await _handleAccept(params);
      }
    }
  }

  Future<void> _adoptNativeCallsForChannels(Set<String> channelIds) async {
    if (channelIds.isEmpty) {
      return;
    }
    final List<CallKitParams> calls;
    try {
      calls = await FlutterCallkitIncoming.activeCalls();
    } on Object {
      return;
    }
    for (final CallKitParams params in calls) {
      final String? channelId = _resolveChannelId(
        callKitId: params.id,
        params: params,
      );
      if (channelId == null || !channelIds.contains(channelId)) {
        continue;
      }
      if (params.isAccepted) {
        await _handleAccept(params);
        continue;
      }
      if (_sessions.containsChannel(channelId)) {
        continue;
      }
      await _adoptCall(params);
    }
  }

  Future<bool> _adoptCall(CallKitParams params) async {
    final String? channelId = _resolveChannelId(
      callKitId: params.id,
      params: params,
    );
    if (channelId == null) {
      return false;
    }
    if (params.isAccepted &&
        shouldDismissCallKitOnForeground(
          isInVoice: false,
          lifecycleState: WidgetsBinding.instance.lifecycleState,
        )) {
      return true;
    }
    _sessions
      ..registerSession(
        channelId: channelId,
        callKitId: params.id,
        messageId: params.extra?[kVoiceCallKitExtraMessageId] as String?,
        kind: VoiceCallKitSessionKind.incomingRing,
      )
      ..markIncomingPresented(channelId);
    _publishIncomingHold();
    await nudgeGatewayReconnectAfterResume(
      _ref.read(gatewayConnectionProvider),
    );
    return params.isAccepted;
  }

  Future<void> _endRingsMissingFromGateway() async {
    if (!_ref.read(gatewayReadyProvider)) {
      return;
    }
    await Future<void>.delayed(const Duration(seconds: 3));
    if (!_ref.read(gatewayReadyProvider)) {
      return;
    }
    final List<String> stale = _sessions.incomingRingChannelIdsAbsentFrom(
      _ref.read(activeCallsProvider).keys.toSet(),
    );
    for (final String channelId in stale) {
      if (_acceptInFlight.contains(channelId)) {
        continue;
      }
      await _endCallKitForChannel(channelId);
    }
    _publishIncomingHold();
  }

  Future<void> _showIncomingCallKit({required String channelId}) async {
    if (Platform.isIOS) {
      return;
    }
    if (_sessions.containsChannel(channelId)) {
      _sessions.markIncomingPresented(channelId);
      return;
    }
    final CallState? callState = _ref.read(activeCallsProvider)[channelId];
    final String? messageId = callState?.messageId;
    final String callKitId = _sessions.registerSession(
      channelId: channelId,
      callKitId: messageId == null || messageId.isEmpty
          ? null
          : callKitIdForMessageId(messageId),
      messageId: messageId,
      kind: VoiceCallKitSessionKind.incomingRing,
    );
    final CallKitParams params = buildVoiceCallKitParams(
      ref: _ref,
      callKitId: callKitId,
      channelId: channelId,
      l10n: _resolveLocalizations(),
      messageId: callState?.messageId,
    );
    try {
      await FlutterCallkitIncoming.showCallkitIncoming(params);
      _sessions.markIncomingPresented(channelId);
      _publishIncomingHold();
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] showCallkitIncoming failed: $error');
      _sessions.unregisterSession(callKitId, channelId: channelId);
    }
  }

  Future<void> _ensureCallKitSessionForVoice(
    VoiceCallKitVoiceSnapshot voice, {
    bool allowBackgroundStart = false,
  }) async {
    final String? channelId = voice.channelId;
    if (channelId == null || _sessions.containsChannel(channelId)) {
      return;
    }
    await _startCallKitOnVoiceJoin(
      voice,
      allowBackgroundStart: allowBackgroundStart,
    );
  }

  Future<void> _startCallKitOnVoiceJoin(
    VoiceCallKitVoiceSnapshot voice, {
    bool allowBackgroundStart = false,
  }) async {
    if (!_isMobileCallKitPlatform) {
      return;
    }
    final String? channelId = voice.channelId;
    if (channelId == null) {
      return;
    }
    if (_sessions.containsChannel(channelId)) {
      await _syncCallKitConnectedState(voice);
      return;
    }
    if (Platform.isIOS) {
      if (voice.isConnected) {
        await _holdIosVoipCall();
      }
      return;
    }
    if (!allowBackgroundStart &&
        shouldDeferMobileCallKitStartCall(
          isMobileCallKitPlatform: _isMobileCallKitPlatform,
          lifecycleState: WidgetsBinding.instance.lifecycleState,
        )) {
      talker.info(
        '[VoiceCallKit] deferring startCall until app is backgrounded in voice',
      );
      return;
    }
    await _ensureAndroidPermissions();
    await _enterCallKitAudioOwnership();
    final CallState? callState = _ref.read(activeCallsProvider)[channelId];
    final String callKitId = _sessions.registerSession(
      channelId: channelId,
      messageId: callState?.messageId,
      connectionId: voice.activeConnectionId,
      kind: VoiceCallKitSessionKind.activeVoice,
    );
    final CallKitParams params = buildVoiceCallKitParams(
      ref: _ref,
      callKitId: callKitId,
      channelId: channelId,
      l10n: _resolveLocalizations(),
      messageId: callState?.messageId,
      guildId: _ref.read(voiceSessionProvider).guildId,
      forActiveVoice: true,
    );
    try {
      await FlutterCallkitIncoming.startCall(params);
      _armSuppressUserCallKitEndEvents();
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] startCall on voice join failed: $error');
      _sessions.unregisterSession(callKitId, channelId: channelId);
      await _exitCallKitAudioOwnership();
      return;
    }
    await _applySpeakerOutputAndRetry(reason: 'startCall');
    if (voice.isConnected) {
      await _markCallConnected(callKitId);
    }
  }

  Future<void> _syncCallKitConnectedState(
    VoiceCallKitVoiceSnapshot voice,
  ) async {
    final String? channelId = voice.channelId;
    if (channelId == null) {
      return;
    }
    final String? callKitId = _sessions.callKitIdForChannel(channelId);
    if (callKitId == null) {
      return;
    }
    _sessions.promoteSessionToActiveVoice(
      callKitId: callKitId,
      channelId: channelId,
      voice: voice,
    );
    if (voice.isConnected) {
      await _markCallConnected(callKitId);
    }
  }

  Future<bool> _iosHasUnansweredCall() async {
    try {
      return await _iosVoipCallKit.invokeMethod<bool>('hasUnanswered') ?? false;
    } on Object {
      return false;
    }
  }

  Future<void> _holdIosVoipCall() async {
    if (!Platform.isIOS) {
      return;
    }
    try {
      await _iosVoipCallKit.invokeMethod<void>('hold');
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] hold ios call failed: $error');
    }
  }

  Future<void> _endIosVoipCall() async {
    if (!Platform.isIOS) {
      return;
    }
    try {
      await _iosVoipCallKit.invokeMethod<void>('endAll');
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] end ios call failed: $error');
    }
  }

  Future<void> _markCallConnected(String callKitId) async {
    if (Platform.isIOS) {
      await _holdIosVoipCall();
      return;
    }
    if (_sessions.isCallKitConnected(callKitId)) {
      return;
    }
    try {
      await FlutterCallkitIncoming.setCallConnected(callKitId);
      _sessions.markCallKitConnected(callKitId);
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] setCallConnected failed: $error');
    }
  }

  bool _shouldIgnoreUserCallKitEndEvent({
    required String callKitId,
    required String? channelId,
    required VoiceCallKitVoiceSnapshot voice,
  }) {
    final VoiceCallKitSession? session = _sessions.sessionForCallKitId(
      callKitId,
    );
    final bool isLiveVoiceCall =
        session?.kind == VoiceCallKitSessionKind.activeVoice ||
        (channelId != null &&
            shouldLeaveVoiceFromCallKitEnd(voice: voice, channelId: channelId));
    return shouldIgnoreCallKitUserEndEvent(
      isEndingProgrammatically: _isEndingProgrammatically,
      suppressUntil: _suppressUserEndHandlingUntil,
      now: DateTime.now(),
      isLiveVoiceCall: isLiveVoiceCall,
    );
  }

  void _armSuppressUserCallKitEndEvents() {
    _suppressUserEndHandlingUntil = DateTime.now().add(
      const Duration(seconds: 2),
    );
  }

  Future<void> _runProgrammaticCallKitEnd(
    Future<void> Function() action,
  ) async {
    _isEndingProgrammatically = true;
    try {
      await action();
    } finally {
      _isEndingProgrammatically = false;
      _armSuppressUserCallKitEndEvents();
    }
  }

  Future<void> _dismissCallKitUiOnly() async {
    if (Platform.isIOS) {
      await _endIosVoipCall();
    }
    if (_sessions.isEmpty) {
      return;
    }
    await _runProgrammaticCallKitEnd(() async {
      try {
        if (!Platform.isIOS) {
          await FlutterCallkitIncoming.endAllCalls();
        }
      } on Object catch (error) {
        talker.warning('[VoiceCallKit] dismiss UI failed: $error');
      }
      _sessions.clearAll();
      _pendingRingsSeen.clear();
    });
    await _exitCallKitAudioOwnership();
  }

  Future<void> _endCallKitForChannel(String channelId) async {
    final String? callKitId = _sessions.callKitIdForChannel(channelId);
    if (callKitId == null) {
      _sessions.clearPresentedIncoming(channelId);
      return;
    }
    await _endCallKitSession(callKitId, channelId: channelId);
  }

  Future<void> _endCallKitSession(
    String callKitId, {
    required String channelId,
  }) async {
    await _runProgrammaticCallKitEnd(() async {
      try {
        if (Platform.isIOS) {
          await _endIosVoipCall();
        } else {
          await FlutterCallkitIncoming.endCall(callKitId);
        }
      } on Object catch (error) {
        talker.warning('[VoiceCallKit] endCall failed: $error');
      }
      _sessions.unregisterSession(callKitId, channelId: channelId);
      _pendingRingsSeen.remove(channelId);
    });
    _publishIncomingHold();
    await _exitCallKitAudioOwnership();
  }

  Future<void> _endAllCallKitSessions() async {
    if (Platform.isIOS) {
      await _endIosVoipCall();
    }
    if (_sessions.isEmpty) {
      await _exitCallKitAudioOwnership();
      return;
    }
    await _runProgrammaticCallKitEnd(() async {
      try {
        if (!Platform.isIOS) {
          await FlutterCallkitIncoming.endAllCalls();
        }
      } on Object catch (error) {
        talker.warning('[VoiceCallKit] endAllCalls failed: $error');
      }
      _sessions.clearAll();
      _pendingRingsSeen.clear();
    });
    await _exitCallKitAudioOwnership();
  }

  FluxerLocalizations _resolveLocalizations() {
    return _ref.read(appLocalizationsProvider);
  }

  String? _resolveChannelId({
    required String callKitId,
    CallKitParams? params,
  }) {
    final String? fromExtra = resolveChannelIdFromCallKitExtra(params?.extra);
    if (fromExtra != null) {
      return fromExtra;
    }
    return _sessions.sessionForCallKitId(callKitId)?.channelId;
  }

  Future<void> _handleCallEvent(CallEvent? event) async {
    if (event == null) {
      return;
    }
    switch (event) {
      case CallEventActionCallAccept(:final callKitParams):
        await _handleAccept(callKitParams);
      case CallEventActionCallDecline(:final callKitParams):
        await _handleUserEndedCallKitCall(callKitParams);
      case CallEventActionCallEnded(:final callKitParams):
        await _handleUserEndedCallKitCall(callKitParams);
      case CallEventActionCallTimeout(:final id):
        await _handleTimeout(id);
      case CallEventActionCallToggleMute(:final id, :final isMuted):
        _scheduleSync(() => _handleToggleMute(id, isMuted: isMuted));
      case CallEventActionCallToggleAudioSession(:final isActive):
        _scheduleSync(() => _handleToggleAudioSession(isActive: isActive));
      case CallEventActionDidUpdateDevicePushTokenVoip():
        if (Platform.isIOS) {
          unawaited(
            _ref.read(apnsVoipMobileDeviceRegistrationProvider.notifier).sync(),
          );
        }
      case CallEventActionCallIncoming(:final callKitParams):
        await _adoptCall(callKitParams);
      case CallEventActionCallCallback():
      case CallEventActionCallToggleHold():
      case CallEventActionCallToggleDmtf():
      case CallEventActionCallToggleGroup():
      case CallEventActionCallCustom():
        break;
      case CallEventActionCallStart(:final callKitParams):
        await _handleCallStart(callKitParams);
      case CallEventActionCallConnected(:final id):
        await _handleCallConnectedById(id);
    }
  }

  Future<void> _handleCallStart(CallKitParams params) async {
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    final String? channelId = _resolveChannelId(
      callKitId: params.id,
      params: params,
    );
    if (channelId == null ||
        voice.channelId != channelId ||
        !voice.isConnected) {
      return;
    }
    await _markCallConnected(params.id);
    await _applySpeakerOutputAndRetry(reason: 'call start');
  }

  Future<void> _handleCallConnectedById(String callKitId) async {
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    final String? channelId = _resolveChannelId(callKitId: callKitId);
    if (channelId == null ||
        voice.channelId != channelId ||
        !voice.isConnected) {
      return;
    }
    await _markCallConnected(callKitId);
  }

  Future<void> _handleAccept(CallKitParams params) async {
    if (_handledAcceptIds.contains(params.id) ||
        !_acceptInFlight.add(params.id)) {
      return;
    }
    String? channelId;
    _ref.read(callKitIncomingHoldProvider.notifier).setActive(value: true);
    try {
      final CallKitParams resolved = await _paramsWithChannel(params);
      channelId = _resolveChannelId(callKitId: resolved.id, params: resolved);
      if (channelId == null) {
        return;
      }
      _handledAcceptIds.add(params.id);
      _acceptInFlight.add(channelId);
      _sessions.registerSession(
        channelId: channelId,
        callKitId: resolved.id,
        messageId: resolved.extra?[kVoiceCallKitExtraMessageId] as String?,
        kind: VoiceCallKitSessionKind.incomingRing,
      );
      await _enterCallKitAudioOwnership();
      final bool ready = await waitUntilGatewayReadyForCall(_ref);
      if (!ready) {
        await _endCallKitSession(resolved.id, channelId: channelId);
        return;
      }
      await executeAcceptIncomingVoiceCallFromCallKit(_ref, channelId);
      final VoiceSessionState joined = _ref.read(voiceSessionProvider);
      final bool joining =
          joined.channelId == channelId &&
          (joined.isConnecting || joined.isConnected);
      if (!joining) {
        await _endCallKitSession(resolved.id, channelId: channelId);
        return;
      }
      unawaited(_openJoinedCall(channelId));
      final bool connected = await _waitUntilVoiceConnected(channelId);
      if (!connected) {
        return;
      }
      final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
        _ref.read(voiceSessionProvider),
      );
      final String callKitId = resolved.id;
      if (_sessions.sessionForCallKitId(callKitId) == null) {
        _sessions.registerExistingSession(
          VoiceCallKitSession(
            callKitId: callKitId,
            channelId: channelId,
            kind: VoiceCallKitSessionKind.activeVoice,
            messageId: resolved.extra?[kVoiceCallKitExtraMessageId] as String?,
            connectionId: voice.activeConnectionId,
          ),
        );
      }
      await _markCallConnected(callKitId);
      await _applySpeakerOutputAndRetry(reason: 'call accept');
    } finally {
      _acceptInFlight.remove(params.id);
      final String? acceptedChannelId = channelId;
      if (acceptedChannelId != null) {
        _acceptInFlight.remove(acceptedChannelId);
      }
      _publishIncomingHold();
    }
  }

  Future<CallKitParams> _paramsWithChannel(CallKitParams params) async {
    if (_resolveChannelId(callKitId: params.id, params: params) != null) {
      return params;
    }
    for (var attempt = 0; attempt < 10; attempt++) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
      try {
        final List<CallKitParams> calls =
            await FlutterCallkitIncoming.activeCalls();
        for (final CallKitParams call in calls) {
          if (call.id != params.id) {
            continue;
          }
          if (_resolveChannelId(callKitId: call.id, params: call) != null) {
            return call;
          }
        }
      } on Object {
        break;
      }
    }
    return params;
  }

  Future<void> _openJoinedCall(String channelId) async {
    for (var attempt = 0; attempt < 25; attempt++) {
      final BuildContext? ctx = rootNavigatorKey.currentContext;
      final VoiceSessionState voice = _ref.read(voiceSessionProvider);
      if (ctx != null &&
          ctx.mounted &&
          voice.channelId == channelId &&
          (voice.isConnecting || voice.isConnected)) {
        navigateToActiveVoiceSession(ctx, voice: voice);
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
  }

  Future<bool> _waitUntilVoiceConnected(String channelId) async {
    final DateTime deadline = DateTime.now().add(const Duration(seconds: 20));
    while (DateTime.now().isBefore(deadline)) {
      final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
        _ref.read(voiceSessionProvider),
      );
      if (voice.isConnected && voice.channelId == channelId) {
        return true;
      }
      if (!voice.isConnecting && voice.channelId != channelId) {
        return false;
      }
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    return voice.isConnected && voice.channelId == channelId;
  }

  void _unregisterCallKitSessionForChannel(String channelId) {
    final String? callKitId = _sessions.callKitIdForChannel(channelId);
    if (callKitId != null) {
      _sessions.unregisterSession(callKitId, channelId: channelId);
    } else {
      _sessions.clearPresentedIncoming(channelId);
    }
  }

  Future<void> _handleUserEndedCallKitCall(CallKitParams params) async {
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    String? channelId = _resolveChannelId(callKitId: params.id, params: params);
    if (channelId == null && !_sessions.hasIncomingRing) {
      channelId = _sessions.soleActiveVoiceChannelId;
    }
    if (_shouldIgnoreUserCallKitEndEvent(
      callKitId: params.id,
      channelId: channelId,
      voice: voice,
    )) {
      return;
    }
    if (channelId == null) {
      return;
    }
    _cancelAudioSessionRecovery();
    _unregisterCallKitSessionForChannel(channelId);
    await _exitCallKitAudioOwnership();
    if (shouldLeaveVoiceFromCallKitEnd(voice: voice, channelId: channelId)) {
      await _ref.read(voiceSessionProvider.notifier).leaveVoice();
      return;
    }
    await executeDeclineIncomingVoiceCallFromCallKit(_ref, channelId);
  }

  Future<void> _handleTimeout(String callKitId) async {
    final String? channelId = _resolveChannelId(callKitId: callKitId);
    if (channelId == null) {
      return;
    }
    await _endCallKitForChannel(channelId);
    await executeIgnoreIncomingVoiceCallFromCallKit(_ref, channelId);
  }

  Future<void> _handleToggleMute(
    String callKitId, {
    required bool isMuted,
  }) async {
    if (_isSyncingMuteToCallKit) {
      return;
    }
    final String? channelId = _resolveChannelId(callKitId: callKitId);
    if (channelId == null) {
      talker.warning('[VoiceCallKit] mute toggle ignored: unknown call id');
      return;
    }
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    if (voice.channelId != channelId || !voice.isInVoice) {
      return;
    }
    _isApplyingCallKitMuteToVoice = true;
    try {
      await _ref
          .read(voiceSessionProvider.notifier)
          .setSelfMute(isMuted: isMuted);
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] setSelfMute from CallKit failed: $error');
    } finally {
      _isApplyingCallKitMuteToVoice = false;
    }
  }

  Future<void> _syncCallKitMuteFromVoiceStates({
    required Map<String, VoiceState>? previous,
    required Map<String, VoiceState> next,
  }) async {
    if (_isApplyingCallKitMuteToVoice) {
      return;
    }
    final VoiceSessionState voice = _ref.read(voiceSessionProvider);
    final String? connectionId = voice.activeConnectionId;
    final String? channelId = voice.channelId;
    if (!voice.isInVoice ||
        !voice.isConnected ||
        connectionId == null ||
        channelId == null) {
      return;
    }
    final String? callKitId = _sessions.callKitIdForChannel(channelId);
    if (callKitId == null) {
      return;
    }
    final VoiceState? selfState = next[connectionId];
    if (selfState == null) {
      return;
    }
    final bool nextMute = selfState.selfMute;
    if (previous?[connectionId]?.selfMute == nextMute) {
      return;
    }
    _isSyncingMuteToCallKit = true;
    try {
      await FlutterCallkitIncoming.muteCall(callKitId, isMuted: nextMute);
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] sync mute to CallKit failed: $error');
    } finally {
      _isSyncingMuteToCallKit = false;
    }
  }
}
