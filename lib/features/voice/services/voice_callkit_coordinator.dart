import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/incoming_voice_call_actions.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_params.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_session_store.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_callkit_coordinator.g.dart';

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
  final VoiceCallKitCoordinatorLogic logic = VoiceCallKitCoordinatorLogic(ref);
  logic.init();
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
  DateTime? _suppressUserEndHandlingUntil;
  FluxerLocalizations? _cachedLocalizations;
  Locale? _cachedLocale;

  void init() {
    _eventSubscription = FlutterCallkitIncoming.onEvent.listen(_handleCallEvent);
    _ref.listen<List<String>>(pendingIncomingVoiceChannelIdsProvider, (
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
    });
    _ref.listen<Map<String, CallState>>(activeCallsProvider, (
      Map<String, CallState>? _,
      Map<String, CallState> next,
    ) {
      if (_sessions.isEmpty) {
        return;
      }
      _scheduleSync(() => _syncStaleCallKitSessions(next));
    });
    _ref.listen<VoiceSessionState>(voiceSessionProvider, (
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
    });
    _ref.listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
      if (previous == next) {
        return;
      }
      _scheduleSync(() => _syncForegroundChange(isForeground: next));
    });
    _ref.listen<Map<String, VoiceState>>(voiceStatesMapProvider, (
      Map<String, VoiceState>? previous,
      Map<String, VoiceState> next,
    ) {
      if (_sessions.isEmpty) {
        return;
      }
      _scheduleSync(
        () => _syncCallKitMuteFromVoiceStates(
          previous: previous,
          next: next,
        ),
      );
    });
  }

  void dispose() {
    unawaited(_eventSubscription?.cancel());
    unawaited(_endAllCallKitSessions());
  }

  void _scheduleSync(Future<void> Function() work) {
    _syncQueue = _syncQueue
        .then((_) => work())
        .catchError((Object error, StackTrace stackTrace) {
          talker.warning('[VoiceCallKit] sync failed: $error\n$stackTrace');
        });
  }

  Future<void> _ensureAndroidPermissions() async {
    if (!Platform.isAndroid || _permissionsRequested) {
      return;
    }
    _permissionsRequested = true;
    try {
      await FlutterCallkitIncoming.requestNotificationPermission(<String, dynamic>{
        'title': 'Notification permission',
        'rationaleMessagePermission':
            'Notification permission is required to show incoming calls.',
        'postNotificationMessageRequired':
            'Notification permission is required. Allow it in Settings.',
      });
      final bool canUseFullScreen =
          await FlutterCallkitIncoming.canUseFullScreenIntent();
      if (!canUseFullScreen) {
        await FlutterCallkitIncoming.requestFullIntentPermission();
      }
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] Android permission request failed: $error');
    }
  }

  Future<void> _syncIncomingPresentation(
    List<String> pendingChannelIds, {
    VoiceCallKitVoiceSnapshot? activeVoice,
  }) async {
    final bool isForeground = _ref.read(appUiForegroundProvider);
    if (!shouldPresentIncomingVoiceCallKit(
      isMobileCallKitPlatform: _isMobileCallKitPlatform,
      isForeground: isForeground,
      hasPendingIncoming: pendingChannelIds.isNotEmpty,
    )) {
      return;
    }
    final VoiceCallKitVoiceSnapshot voiceSnapshot = activeVoice ??
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

  Future<void> _syncStaleCallKitSessions(Map<String, CallState> activeCalls) async {
    final List<String> staleChannelIds = <String>[];
    for (final MapEntry<String, String> entry in _sessions.channelEntries) {
      final VoiceCallKitSession? session =
          _sessions.sessionForCallKitId(entry.value);
      if (session == null) {
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
      await _endAllCallKitSessions();
      return;
    }
    if (didJoinVoiceCall(previous: previous, next: next)) {
      final String? previousChannelId = previous?.channelId;
      if (previous != null &&
          previous.isInVoice &&
          previousChannelId != null &&
          previousChannelId != next.channelId) {
        await _endCallKitForChannel(previousChannelId);
      }
      await _startCallKitOnVoiceJoin(next);
      if (next.isConnected) {
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
      final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
        _ref.read(voiceSessionProvider),
      );
      if (!shouldDismissCallKitOnForeground(
        isIos: Platform.isIOS,
        isInVoice: voice.isInVoice,
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
    final List<String> pending =
        _ref.read(pendingIncomingVoiceChannelIdsProvider);
    await _syncIncomingPresentation(pending, activeVoice: voice);
  }

  Future<void> _showIncomingCallKit({required String channelId}) async {
    final CallState? callState = _ref.read(activeCallsProvider)[channelId];
    final String callKitId = _sessions.registerSession(
      channelId: channelId,
      messageId: callState?.messageId,
      kind: VoiceCallKitSessionKind.incomingRing,
    );
    final CallKitParams params = buildVoiceCallKitParams(
      ref: _ref,
      callKitId: callKitId,
      channelId: channelId,
      l10n: _resolveLocalizations(),
      messageId: callState?.messageId,
      forActiveVoice: false,
    );
    try {
      await FlutterCallkitIncoming.showCallkitIncoming(params);
      _sessions.markIncomingPresented(channelId);
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
    await _startCallKitOnVoiceJoin(voice, allowBackgroundStart: allowBackgroundStart);
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
    } on Object catch (error) {
      talker.warning('[VoiceCallKit] startCall on voice join failed: $error');
      _sessions.unregisterSession(callKitId, channelId: channelId);
      return;
    }
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

  Future<void> _markCallConnected(String callKitId) async {
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

  bool _shouldIgnoreUserCallKitEndEvent() {
    if (_isEndingProgrammatically) {
      return true;
    }
    final DateTime? suppressUntil = _suppressUserEndHandlingUntil;
    if (suppressUntil != null && DateTime.now().isBefore(suppressUntil)) {
      return true;
    }
    return false;
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
    if (_sessions.isEmpty) {
      return;
    }
    await _runProgrammaticCallKitEnd(() async {
      try {
        await FlutterCallkitIncoming.endAllCalls();
      } on Object catch (error) {
        talker.warning('[VoiceCallKit] dismiss UI failed: $error');
      }
      _sessions.clearAll();
    });
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
        await FlutterCallkitIncoming.endCall(callKitId);
      } on Object catch (error) {
        talker.warning('[VoiceCallKit] endCall failed: $error');
      }
      _sessions.unregisterSession(callKitId, channelId: channelId);
    });
  }

  Future<void> _endAllCallKitSessions() async {
    if (_sessions.isEmpty) {
      return;
    }
    await _runProgrammaticCallKitEnd(() async {
      try {
        await FlutterCallkitIncoming.endAllCalls();
      } on Object catch (error) {
        talker.warning('[VoiceCallKit] endAllCalls failed: $error');
      }
      _sessions.clearAll();
    });
  }

  FluxerLocalizations _resolveLocalizations() {
    final BuildContext? ctx = rootNavigatorKey.currentContext;
    if (ctx != null && ctx.mounted) {
      final Locale locale = Localizations.localeOf(ctx);
      if (_cachedLocalizations != null && _cachedLocale == locale) {
        return _cachedLocalizations!;
      }
      _cachedLocale = locale;
      _cachedLocalizations = FluxerLocalizations.of(ctx);
      return _cachedLocalizations!;
    }
    return lookupFluxerLocalizations(const Locale('en'));
  }

  String? _resolveChannelId({required String callKitId, CallKitParams? params}) {
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
        await _handleDecline(callKitParams);
      case CallEventActionCallEnded(:final callKitParams):
        await _handleEnded(callKitParams);
      case CallEventActionCallTimeout(:final id):
        await _handleTimeout(id);
      case CallEventActionCallToggleMute(:final id, :final isMuted):
        _scheduleSync(() => _handleToggleMute(id, isMuted: isMuted));
      case CallEventActionDidUpdateDevicePushTokenVoip():
      case CallEventActionCallIncoming():
      case CallEventActionCallCallback():
      case CallEventActionCallToggleHold():
      case CallEventActionCallToggleDmtf():
      case CallEventActionCallToggleGroup():
      case CallEventActionCallToggleAudioSession():
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
    if (channelId == null || voice.channelId != channelId || !voice.isConnected) {
      return;
    }
    await _markCallConnected(params.id);
  }

  Future<void> _handleCallConnectedById(String callKitId) async {
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    final String? channelId = _resolveChannelId(callKitId: callKitId);
    if (channelId == null || voice.channelId != channelId || !voice.isConnected) {
      return;
    }
    await _markCallConnected(callKitId);
  }

  Future<void> _handleAccept(CallKitParams params) async {
    final String? channelId = _resolveChannelId(
      callKitId: params.id,
      params: params,
    );
    if (channelId == null) {
      return;
    }
    await executeAcceptIncomingVoiceCallFromCallKit(_ref, channelId);
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    if (!voice.isConnected || voice.channelId != channelId) {
      return;
    }
    final String callKitId = _sessions.callKitIdForChannel(channelId) ?? params.id;
    if (_sessions.sessionForCallKitId(callKitId) == null) {
      _sessions.registerExistingSession(
        VoiceCallKitSession(
          callKitId: callKitId,
          channelId: channelId,
          kind: VoiceCallKitSessionKind.activeVoice,
          messageId: params.extra?[kVoiceCallKitExtraMessageId] as String?,
          connectionId: voice.activeConnectionId,
        ),
      );
    }
    await _markCallConnected(callKitId);
  }

  Future<void> _handleDecline(CallKitParams params) async {
    final String? channelId = _resolveChannelId(
      callKitId: params.id,
      params: params,
    );
    if (channelId == null) {
      return;
    }
    await _endCallKitForChannel(channelId);
    await executeDeclineIncomingVoiceCallFromCallKit(_ref, channelId);
  }

  Future<void> _handleEnded(CallKitParams params) async {
    if (_shouldIgnoreUserCallKitEndEvent()) {
      return;
    }
    final String? channelId = _resolveChannelId(
      callKitId: params.id,
      params: params,
    );
    if (channelId == null) {
      return;
    }
    final VoiceCallKitVoiceSnapshot voice = _voiceCallKitVoiceSnapshot(
      _ref.read(voiceSessionProvider),
    );
    await _endCallKitForChannel(channelId);
    if (voice.channelId == channelId && voice.isInVoice) {
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

  Future<void> _handleToggleMute(String callKitId, {required bool isMuted}) async {
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
      await _ref.read(voiceSessionProvider.notifier).setSelfMute(isMuted);
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
