import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/providers/messages/voice_message_max_duration_provider.dart';
import 'package:fluxer_app/features/chat/service/voice_message_recording_service.dart';
import 'package:fluxer_app/features/chat/service/voice_message_send.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_recording_gestures.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class VoiceMessageRecordingController extends ChangeNotifier {
  VoiceMessageRecordingController({
    required WidgetRef ref,
    required this.onPrepareUi,
    VoiceMessageRecordingService? recordingService,
  }) : _ref = ref,
       _recordingService = recordingService ?? VoiceMessageRecordingService(),
       _shellGestureBlock = ref.read(shellManualGestureBlockProvider.notifier);

  final WidgetRef _ref;
  final VoidCallback onPrepareUi;
  final VoiceMessageRecordingService _recordingService;
  final ShellManualGestureBlock _shellGestureBlock;

  final ValueNotifier<double> rmsLevel = ValueNotifier<double>(0);
  final ValueNotifier<int> durationMs = ValueNotifier<int>(0);
  final GlobalKey trashKey = GlobalKey();
  final GlobalKey lockKey = GlobalKey();

  Timer? _durationTimer;
  Timer? _rmsTimer;
  StreamSubscription<void>? _maxDurationSubscription;
  int? _pointerId;
  Offset? _pointerStart;
  PointerRoute? _pointerRoute;
  String _channelId = '';
  bool _isActive = false;
  bool _isRecording = false;
  bool _isLocked = false;
  bool _isSending = false;
  bool _lockPreview = false;
  bool _discardPreview = false;
  bool _disposed = false;

  bool get isActive => _isActive;
  bool get isRecording => _isRecording;
  bool get isLocked => _isLocked;
  bool get isSending => _isSending;
  bool get lockPreview => _lockPreview;
  bool get discardPreview => _discardPreview;
  String get channelId => _channelId;

  void _emit() {
    if (_disposed) {
      return;
    }
    notifyListeners();
  }

  void _setShellGesturesBlocked(bool blocked) {
    _shellGestureBlock.setBlocked(value: blocked);
  }

  void _attachPointerRoute(int pointer) {
    _detachPointerRoute();
    _pointerRoute = _onGlobalPointerEvent;
    _pointerId = pointer;
    GestureBinding.instance.pointerRouter.addRoute(pointer, _pointerRoute!);
  }

  void _detachPointerRoute() {
    if (_pointerId != null && _pointerRoute != null) {
      GestureBinding.instance.pointerRouter.removeRoute(
        _pointerId!,
        _pointerRoute!,
      );
    }
    _pointerRoute = null;
  }

  void _onGlobalPointerEvent(PointerEvent event) {
    if (_pointerId != event.pointer) {
      return;
    }
    if (event is PointerMoveEvent) {
      _handlePointerMove(event);
    } else if (event is PointerUpEvent) {
      _handlePointerUp(event);
    } else if (event is PointerCancelEvent) {
      _handlePointerCancel(event);
    }
  }

  bool _isVoiceMicInUse() {
    return _ref.read(voiceSessionProvider).isInVoice;
  }

  void _listenForMaxDuration() {
    unawaited(_maxDurationSubscription?.cancel());
    _maxDurationSubscription = _recordingService.onMaxDurationReached.listen((
      _,
    ) {
      if (_isRecording && !_isSending) {
        unawaited(stop(send: true));
      }
    });
  }

  void _startMeters() {
    _durationTimer?.cancel();
    _rmsTimer?.cancel();
    _durationTimer = Timer.periodic(
      const Duration(milliseconds: kVoiceMessageRecordingTickMs),
      (_) {
        if (!_isRecording) {
          return;
        }
        durationMs.value = _recordingService.capturedDurationMs;
      },
    );
    _rmsTimer = Timer.periodic(
      const Duration(milliseconds: kVoiceMessageRmsUpdateIntervalMs),
      (_) {
        if (!_isRecording) {
          return;
        }
        rmsLevel.value = _recordingService.liveRmsLevel;
      },
    );
  }

  void _stopMeters() {
    _durationTimer?.cancel();
    _durationTimer = null;
    _rmsTimer?.cancel();
    _rmsTimer = null;
  }

  Future<void> startHold({
    required BuildContext context,
    required String channelId,
    required PointerDownEvent event,
  }) async {
    if (_isActive || _isSending || _pointerId != null) {
      return;
    }
    _channelId = channelId;
    _pointerStart = event.position;
    _attachPointerRoute(event.pointer);
    _beginSession(locked: false);
    await _startRecording(context);
  }

  Future<void> startLocked({
    required BuildContext context,
    required String channelId,
  }) async {
    if (_isActive || _isSending) {
      return;
    }
    _channelId = channelId;
    _beginSession(locked: true);
    await _startRecording(context);
  }

  void _beginSession({required bool locked}) {
    _setShellGesturesBlocked(true);
    onPrepareUi();
    _isActive = true;
    _isLocked = locked;
    _lockPreview = false;
    _discardPreview = false;
    _isSending = false;
    durationMs.value = 0;
    rmsLevel.value = 0;
    _emit();
  }

  Future<void> _startRecording(BuildContext context) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    try {
      final int maxSeconds = _ref.read(maxVoiceMessageDurationSecondsProvider);
      await _recordingService.start(
        maxDurationSeconds: maxSeconds,
        isMicrophoneInUse: _isVoiceMicInUse(),
      );
    } on VoiceMessageMicrophoneInUseException {
      if (context.mounted) {
        _ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.voiceMessageMicInUse,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
      await cancel();
      return;
    } on VoiceMessageRecordingPermissionException catch (error) {
      talker.warning(
        '[VoiceMessageRecorder] Microphone permission denied (channel=$_channelId)',
        error,
      );
      if (context.mounted) {
        if (error.requiresSettings) {
          await ensureSystemPermission(
            context,
            SystemPermissionKind.microphone,
          );
        } else {
          _ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.voiceMessageMicPermissionDenied,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      }
      await cancel();
      return;
    } on Object catch (error, stackTrace) {
      talker.error(
        '[VoiceMessageRecorder] Failed to start recording (channel=$_channelId)',
        error,
        stackTrace,
      );
      if (context.mounted) {
        _ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.voiceMessageRecordingFailed,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
      await cancel();
      return;
    }
    if (_disposed) {
      await _recordingService.discard();
      return;
    }
    if (_pointerId == null && !_isLocked) {
      talker.debug(
        '[VoiceMessageRecorder] Pointer released before recording started (channel=$_channelId)',
      );
      await _recordingService.discard();
      await cancel();
      return;
    }
    _isRecording = true;
    if (!_isLocked) {
      _lockPreview = false;
      _discardPreview = false;
    }
    durationMs.value = 0;
    FluxerHaptics.medium();
    _emit();
    _listenForMaxDuration();
    _startMeters();
  }

  Future<void> cancel() async {
    _detachPointerRoute();
    _stopMeters();
    await _maxDurationSubscription?.cancel();
    _maxDurationSubscription = null;
    if (_recordingService.isRecording) {
      await _recordingService.discard();
    }
    _pointerId = null;
    _pointerStart = null;
    _resetUi();
  }

  Future<void> stop({required bool send}) async {
    if (!_isRecording || _isSending) {
      await cancel();
      return;
    }
    _stopMeters();
    await _maxDurationSubscription?.cancel();
    _maxDurationSubscription = null;
    final int capturedMs = durationMs.value;
    if (!send || capturedMs < kVoiceMessageMinSendDurationMs) {
      await _recordingService.discard();
      _detachPointerRoute();
      _pointerId = null;
      _pointerStart = null;
      _resetUi();
      return;
    }
    _isSending = true;
    _emit();
    final VoiceMessagePreparedRecording? prepared = await _recordingService
        .stop();
    if (prepared == null) {
      talker.error(
        '[VoiceMessageRecorder] stop() returned no recording (channel=$_channelId, durationMs=$capturedMs)',
      );
      _showSendOrRecordFailed(recording: true);
      _detachPointerRoute();
      _pointerId = null;
      _pointerStart = null;
      _resetUi();
      return;
    }
    try {
      await sendPreparedVoiceMessage(ref: _ref, prepared: prepared);
    } on Object catch (error, stackTrace) {
      talker.error(
        '[VoiceMessageRecorder] Failed to send voice message (channel=$_channelId)',
        error,
        stackTrace,
      );
      _showSendOrRecordFailed(recording: false);
    }
    _detachPointerRoute();
    _pointerId = null;
    _pointerStart = null;
    _resetUi();
  }

  void _showSendOrRecordFailed({required bool recording}) {
    final BuildContext? context = trashKey.currentContext;
    if (context == null || !context.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    _ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: recording
                ? l10n.voiceMessageRecordingFailed
                : l10n.voiceMessageSendFailed,
            variant: FluxerToastVariant.danger,
          ),
        );
  }

  void _resetUi() {
    _setShellGesturesBlocked(false);
    _isActive = false;
    _isRecording = false;
    _isLocked = false;
    _isSending = false;
    _lockPreview = false;
    _discardPreview = false;
    durationMs.value = 0;
    rmsLevel.value = 0;
    _emit();
  }

  void _updateHoldPreviews(Offset globalPosition) {
    if (_isLocked || _pointerId == null || !_isRecording) {
      return;
    }
    final VoiceMessageHoldPreview next = voiceMessageHoldPreview(
      globalPosition: globalPosition,
      pointerStart: _pointerStart,
      trashRect: voiceMessageHitRect(trashKey),
      lockRect: voiceMessageHitRect(lockKey),
    );
    if (next.discardPreview == _discardPreview &&
        next.lockPreview == _lockPreview) {
      return;
    }
    if ((next.discardPreview && !_discardPreview) ||
        (next.lockPreview && !_lockPreview)) {
      FluxerHaptics.soft();
    }
    _discardPreview = next.discardPreview;
    _lockPreview = next.lockPreview;
    _emit();
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_pointerId != event.pointer) {
      return;
    }
    _updateHoldPreviews(event.position);
    final VoiceMessageHoldReleaseAction action = resolveVoiceMessageHoldRelease(
      isLocked: _isLocked,
      isSending: _isSending,
      isRecording: _isRecording,
      discardPreview: _discardPreview,
      lockPreview: _lockPreview,
      durationMs: durationMs.value,
    );
    _detachPointerRoute();
    _pointerId = null;
    _pointerStart = null;
    switch (action) {
      case VoiceMessageHoldReleaseAction.lock:
        FluxerHaptics.success();
        _isLocked = true;
        _lockPreview = false;
        _discardPreview = false;
        _emit();
      case VoiceMessageHoldReleaseAction.discard:
        unawaited(stop(send: false));
      case VoiceMessageHoldReleaseAction.send:
        unawaited(stop(send: true));
      case VoiceMessageHoldReleaseAction.ignore:
        break;
    }
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (_pointerId != event.pointer || _isLocked) {
      return;
    }
    _updateHoldPreviews(event.position);
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (_pointerId != event.pointer) {
      return;
    }
    if (_isLocked) {
      _detachPointerRoute();
      _pointerId = null;
      _pointerStart = null;
      return;
    }
    _detachPointerRoute();
    _pointerId = null;
    _pointerStart = null;
    if (_isRecording && !_isSending) {
      unawaited(stop(send: durationMs.value >= kVoiceMessageMinSendDurationMs));
    } else {
      unawaited(cancel());
    }
  }

  Future<void> discardIfDisabled() async {
    if (_isRecording && !_isSending) {
      await stop(send: false);
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _detachPointerRoute();
    _stopMeters();
    unawaited(_maxDurationSubscription?.cancel());
    _maxDurationSubscription = null;
    scheduleMicrotask(() => _shellGestureBlock.setBlocked(value: false));
    unawaited(_recordingService.dispose());
    rmsLevel.dispose();
    durationMs.dispose();
    super.dispose();
  }
}
