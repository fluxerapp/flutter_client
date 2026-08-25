import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_waveform.dart';
import 'package:fluxer_app/features/chat/providers/messages/voice_message_max_duration_provider.dart';
import 'package:fluxer_app/features/chat/service/voice_message_recording_service.dart';
import 'package:fluxer_app/features/chat/service/voice_message_send.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// Hold to record on mobile. Overlay bar, lock on drag up, release to send.
class VoiceMessageRecorder extends ConsumerStatefulWidget {
  const VoiceMessageRecorder({
    required this.channelId,
    required this.disabled,
    this.buttonSize = FluxerButtonSize.compact,
    super.key,
  });

  final String channelId;
  final bool disabled;
  final FluxerButtonSize buttonSize;

  @override
  ConsumerState<VoiceMessageRecorder> createState() =>
      _VoiceMessageRecorderState();
}

class _VoiceMessageRecorderState extends ConsumerState<VoiceMessageRecorder>
    with SingleTickerProviderStateMixin {
  late final ShellManualGestureBlock _shellGestureBlock;
  final VoiceMessageRecordingService _recordingService =
      VoiceMessageRecordingService();
  OverlayEntry? _recordingOverlayEntry;
  Timer? _durationTimer;
  Timer? _waveformTimer;
  StreamSubscription<void>? _maxDurationSubscription;
  AnimationController? _barAnimationController;
  Animation<double>? _barFadeAnimation;
  Animation<double>? _barSlideAnimation;
  int? _pointerId;
  Offset? _pointerStart;
  PointerRoute? _pointerRoute;
  bool _isRecording = false;
  bool _isLocked = false;
  bool _isSending = false;
  bool _lockPreview = false;
  int _recordingDurationMs = 0;
  List<double> _waveformBars = List<double>.filled(
    kVoiceMessageWaveformBarCount,
    0,
  );
  final GlobalKey _micKey = GlobalKey();
  final GlobalKey _sendKey = GlobalKey();
  final GlobalKey _lockIndicatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _shellGestureBlock = ref.read(shellManualGestureBlockProvider.notifier);
    _initBarAnimations();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _barAnimationController?.duration = context.motion.normal;
  }

  void _initBarAnimations() {
    if (_barAnimationController != null) {
      return;
    }
    final AnimationController controller = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.normalDuration,
    );
    _barAnimationController = controller;
    _barFadeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );
    _barSlideAnimation = Tween<double>(
      begin: 16,
      end: 0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  void _disposeBarAnimations() {
    _barAnimationController?.dispose();
    _barAnimationController = null;
    _barFadeAnimation = null;
    _barSlideAnimation = null;
  }

  Future<void> _reverseBarAnimation() async {
    final AnimationController? controller = _barAnimationController;
    if (controller == null || !mounted) {
      return;
    }
    if (controller.isCompleted) {
      await controller.reverse();
    }
  }

  void _forwardBarAnimation() {
    final AnimationController? controller = _barAnimationController;
    if (controller == null || !mounted) {
      return;
    }
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    if (reduceMotion) {
      controller.value = 1;
    } else {
      controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _detachPointerRoute();
    _recordingOverlayEntry?.remove();
    _recordingOverlayEntry = null;
    // Provider mutation is illegal in dispose; defer the unblock.
    scheduleMicrotask(() => _shellGestureBlock.setBlocked(value: false));
    _durationTimer?.cancel();
    _waveformTimer?.cancel();
    unawaited(_maxDurationSubscription?.cancel());
    _maxDurationSubscription = null;
    _disposeBarAnimations();
    unawaited(_recordingService.dispose());
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VoiceMessageRecorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.disabled && _isRecording && !_isSending) {
      unawaited(_stopRecording(send: false));
    }
  }

  // Stops drawer drag and chat back swipe while the user is holding the mic.
  void _setShellGesturesBlocked(bool blocked) {
    _shellGestureBlock.setBlocked(value: blocked);
  }

  void _insertRecordingOverlay() {
    if (_recordingOverlayEntry != null) {
      return;
    }
    final OverlayState overlay = Overlay.of(context, rootOverlay: true);
    _setShellGesturesBlocked(true);
    _recordingOverlayEntry = OverlayEntry(
      builder: (BuildContext overlayContext) {
        if (!mounted || _barAnimationController == null) {
          return const SizedBox.shrink();
        }
        return _buildRecordingOverlayRoot(overlayContext);
      },
    );
    overlay.insert(_recordingOverlayEntry!);
  }

  void _removeRecordingOverlay() {
    _recordingOverlayEntry?.remove();
    _recordingOverlayEntry = null;
    _setShellGesturesBlocked(false);
  }

  void _updateRecordingOverlay() {
    if (!mounted) {
      return;
    }
    _recordingOverlayEntry?.markNeedsBuild();
  }

  // Listener on the mic alone misses moves once the finger leaves the button.
  // Router keeps tracking the active pointer until up or cancel.
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
      _detachPointerRoute();
    } else if (event is PointerCancelEvent) {
      _handlePointerCancel(event);
      _detachPointerRoute();
    }
  }

  bool _isVoiceMicInUse() {
    final voice = ref.read(voiceSessionProvider);
    return voice.isInVoice;
  }

  void _listenForMaxDuration() {
    unawaited(_maxDurationSubscription?.cancel());
    _maxDurationSubscription = _recordingService.onMaxDurationReached.listen((
      _,
    ) {
      if (mounted && _isRecording && !_isSending) {
        unawaited(_stopRecording(send: true));
      }
    });
  }

  Future<void> _startRecording() async {
    if (_isRecording || _isSending || widget.disabled) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    try {
      final int maxSeconds = ref.read(maxVoiceMessageDurationSecondsProvider);
      await _recordingService.start(
        maxDurationSeconds: maxSeconds,
        isMicrophoneInUse: _isVoiceMicInUse(),
      );
    } on VoiceMessageMicrophoneInUseException {
      if (mounted) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.voiceMessageMicInUse,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
      await _cancelGesture();
      return;
    } on VoiceMessageRecordingPermissionException catch (error) {
      talker.warning(
        '[VoiceMessageRecorder] Microphone permission denied (channel=${widget.channelId})',
        error,
      );
      if (mounted) {
        if (error.requiresSettings) {
          await ensureSystemPermission(
            context,
            SystemPermissionKind.microphone,
          );
        } else {
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.voiceMessageMicPermissionDenied,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      }
      await _cancelGesture();
      return;
    } on Object catch (error, stackTrace) {
      talker.error(
        '[VoiceMessageRecorder] Failed to start recording (channel=${widget.channelId})',
        error,
        stackTrace,
      );
      if (mounted) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.voiceMessageRecordingFailed,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
      await _cancelGesture();
      return;
    }
    if (!mounted) {
      return;
    }
    // Quick tap: recording may not have started before the finger came up.
    if (_pointerId == null && !_isLocked) {
      talker.debug(
        '[VoiceMessageRecorder] Pointer released before recording started (channel=${widget.channelId})',
      );
      await _recordingService.discard();
      await _cancelGesture();
      return;
    }
    setState(() {
      _isRecording = true;
      if (!_isLocked) {
        _lockPreview = false;
      }
      _recordingDurationMs = 0;
      _waveformBars = List<double>.filled(kVoiceMessageWaveformBarCount, 0);
    });
    FluxerHaptics.medium();
    _forwardBarAnimation();
    _updateRecordingOverlay();
    _listenForMaxDuration();
    _durationTimer = Timer.periodic(
      const Duration(milliseconds: kVoiceMessageRecordingTickMs),
      (_) {
        if (!_isRecording) {
          return;
        }
        setState(() {
          _recordingDurationMs = _recordingService.capturedDurationMs;
        });
        _updateRecordingOverlay();
      },
    );
    _waveformTimer = Timer.periodic(
      const Duration(milliseconds: kVoiceMessageWaveformUpdateIntervalMs),
      (_) {
        if (!_isRecording) {
          return;
        }
        _recordingService.tickLiveWaveform();
        setState(() {
          _waveformBars = List<double>.from(_recordingService.liveWaveformBars);
        });
        _updateRecordingOverlay();
      },
    );
  }

  Future<void> _cancelGesture() async {
    _detachPointerRoute();
    _durationTimer?.cancel();
    _waveformTimer?.cancel();
    await _maxDurationSubscription?.cancel();
    _maxDurationSubscription = null;
    if (_recordingService.isRecording) {
      await _recordingService.discard();
    }
    _pointerId = null;
    _pointerStart = null;
    await _reverseBarAnimation();
    _removeRecordingOverlay();
    if (mounted) {
      setState(() {
        _isRecording = false;
        _isLocked = false;
        _lockPreview = false;
      });
    }
  }

  Future<void> _stopRecording({required bool send}) async {
    if (!_isRecording || _isSending) {
      await _cancelGesture();
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    _durationTimer?.cancel();
    _waveformTimer?.cancel();
    await _maxDurationSubscription?.cancel();
    _maxDurationSubscription = null;
    if (!send || _recordingDurationMs < kVoiceMessageMinSendDurationMs) {
      await _recordingService.discard();
      await _resetState();
      return;
    }
    setState(() => _isSending = true);
    _updateRecordingOverlay();
    final VoiceMessagePreparedRecording? prepared = await _recordingService
        .stop();
    if (prepared == null) {
      talker.error(
        '[VoiceMessageRecorder] stop() returned no recording (channel=${widget.channelId}, durationMs=$_recordingDurationMs)',
      );
      if (mounted) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.voiceMessageRecordingFailed,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
      await _resetState();
      return;
    }
    try {
      await sendPreparedVoiceMessage(ref: ref, prepared: prepared);
    } on Object catch (error, stackTrace) {
      talker.error(
        '[VoiceMessageRecorder] Failed to send voice message (channel=${widget.channelId})',
        error,
        stackTrace,
      );
      if (mounted) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.voiceMessageSendFailed,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
    }
    await _resetState();
  }

  Future<void> _resetState() async {
    _detachPointerRoute();
    _durationTimer?.cancel();
    _waveformTimer?.cancel();
    await _maxDurationSubscription?.cancel();
    _maxDurationSubscription = null;
    _pointerId = null;
    _pointerStart = null;
    await _reverseBarAnimation();
    _removeRecordingOverlay();
    if (!mounted) {
      return;
    }
    setState(() {
      _isRecording = false;
      _isLocked = false;
      _isSending = false;
      _lockPreview = false;
      _recordingDurationMs = 0;
      _waveformBars = List<double>.filled(kVoiceMessageWaveformBarCount, 0);
    });
  }

  void _updateLockPreview(Offset globalPosition) {
    if (_isLocked || _pointerId == null || !_isRecording) {
      return;
    }
    // Hit test the floating lock chip, not the send button bounds (those overlap the mic).
    bool insideLockIndicator = false;
    final RenderBox? lockBox =
        _lockIndicatorKey.currentContext?.findRenderObject() as RenderBox?;
    if (lockBox != null && lockBox.hasSize) {
      final Rect lockRect = lockBox.localToGlobal(Offset.zero) & lockBox.size;
      insideLockIndicator = lockRect.contains(globalPosition);
    }
    final Offset? start = _pointerStart;
    final bool passesThreshold =
        start != null &&
        voiceMessageLockGesturePassesThreshold(
          pointerStart: start,
          globalPosition: globalPosition,
        );
    final bool next = insideLockIndicator || passesThreshold;
    if (next != _lockPreview) {
      if (next) {
        FluxerHaptics.soft();
      }
      setState(() => _lockPreview = next);
      _updateRecordingOverlay();
    }
  }

  void _handleMicPointerDown(PointerDownEvent event) {
    if (widget.disabled || _isSending || _pointerId != null) {
      return;
    }
    _pointerStart = event.position;
    _attachPointerRoute(event.pointer);
    _insertRecordingOverlay();
    unawaited(_startRecording());
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_pointerId != event.pointer) {
      return;
    }
    _updateLockPreview(event.position);
    if (_lockPreview && !_isLocked) {
      // Locked: keep recording until trash or send on the overlay.
      FluxerHaptics.success();
      setState(() {
        _isLocked = true;
        _lockPreview = false;
      });
      _pointerId = null;
      _pointerStart = null;
      _updateRecordingOverlay();
      return;
    }
    if (_isLocked) {
      _pointerId = null;
      _pointerStart = null;
      return;
    }
    if (!_isRecording || _isSending) {
      _pointerId = null;
      _pointerStart = null;
      return;
    }
    final bool shouldSend =
        _recordingDurationMs >= kVoiceMessageMinSendDurationMs;
    _pointerId = null;
    _pointerStart = null;
    unawaited(_stopRecording(send: shouldSend));
  }

  void _handlePointerMove(PointerMoveEvent event) {
    if (_pointerId != event.pointer || _isLocked) {
      return;
    }
    _updateLockPreview(event.position);
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (_pointerId != event.pointer) {
      return;
    }
    if (_isLocked) {
      _pointerId = null;
      _pointerStart = null;
      return;
    }
    final bool shouldSend =
        _isRecording &&
        !_isSending &&
        _recordingDurationMs >= kVoiceMessageMinSendDurationMs;
    _pointerId = null;
    _pointerStart = null;
    if (_isRecording && !shouldSend) {
      unawaited(_stopRecording(send: false));
    } else if (shouldSend) {
      unawaited(_stopRecording(send: true));
    } else {
      unawaited(_cancelGesture());
    }
  }

  Widget? _buildFloatingLockIndicator(FluxerColorTheme colors) {
    final RenderBox? sendBox =
        _sendKey.currentContext?.findRenderObject() as RenderBox?;
    if (sendBox == null || !sendBox.hasSize) {
      return null;
    }
    final Offset sendOrigin = sendBox.localToGlobal(Offset.zero);
    const double lockWidth = 36;
    const double lockHeight = 44;
    final bool showLockedStyle = _isLocked;
    final bool showActive = _lockPreview || _isLocked;
    return Positioned(
      left: sendOrigin.dx + (sendBox.size.width - lockWidth) / 2,
      top: sendOrigin.dy - lockHeight - 8,
      child: IgnorePointer(
        child: Opacity(
          opacity: showActive ? 1 : 0.55,
          child: Container(
            key: _lockIndicatorKey,
            width: lockWidth,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: showLockedStyle ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  showLockedStyle
                      ? PhosphorIconsFill.lockSimple
                      : PhosphorIconsFill.lockSimpleOpen,
                  size: 18,
                  color: showLockedStyle ? colors.accentSuccess : Colors.white,
                ),
                if (!showLockedStyle)
                  const Icon(
                    PhosphorIconsBold.caretUp,
                    size: 16,
                    color: Colors.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecordingOverlayRoot(BuildContext context) {
    if (!_isRecording && !_isSending && !_isLocked) {
      return const SizedBox.shrink();
    }
    final AnimationController? controller = _barAnimationController;
    final Animation<double>? fade = _barFadeAnimation;
    final Animation<double>? slide = _barSlideAnimation;
    if (controller == null || fade == null || slide == null) {
      return const SizedBox.shrink();
    }
    final FluxerColorTheme colors = context.colors;
    final Widget? floatingLock = _buildFloatingLockIndicator(colors);
    return Positioned.fill(
      child: Listener(
        behavior: HitTestBehavior.opaque,
        // Claim touches on the overlay so horizontal shell gestures do not fire.
        onPointerDown: (_) {},
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform.translate(
                    offset: Offset(0, slide.value),
                    child: Opacity(opacity: fade.value, child: child),
                  );
                },
                child: _buildRecordingBar(context),
              ),
            ),
            if (floatingLock != null && !_isSending) floatingLock,
          ],
        ),
      ),
    );
  }

  Widget _buildRecordingBar(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final double bottomPadding = MediaQuery.paddingOf(context).bottom;
    return Material(
      color: colors.brandPrimary,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.25),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 10,
          bottom: 10 + bottomPadding,
        ),
        child: Row(
          children: [
            _OverlayIconButton(
              icon: PhosphorIconsFill.trash,
              backgroundColor: Color.alphaBlend(
                Colors.black.withValues(alpha: 0.85),
                colors.brandPrimary,
              ),
              foregroundColor: Colors.white,
              semanticLabel: l10n.voiceMessageDiscard,
              onPressed: _isSending
                  ? null
                  : () => unawaited(_stopRecording(send: false)),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color.alphaBlend(
                    Colors.black.withValues(alpha: 0.85),
                    colors.brandPrimary,
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: colors.accentDanger,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: colors.accentDanger.withValues(alpha: 0.4),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      formatVoiceDurationMs(_recordingDurationMs),
                      style: context.textStyles.label.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: VoiceMessageMobileWaveform(bars: _waveformBars),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 6),
            _OverlayIconButton(
              key: _sendKey,
              icon: PhosphorIconsFill.paperPlaneRight,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              semanticLabel: l10n.voiceMessageSend,
              onPressed: _isSending
                  ? null
                  : () => unawaited(
                      _stopRecording(
                        send:
                            _recordingDurationMs >=
                            kVoiceMessageMinSendDurationMs,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Semantics(
      label: l10n.voiceMessageTitle,
      button: true,
      child: Listener(
        behavior: HitTestBehavior.opaque,
        onPointerDown: _handleMicPointerDown,
        child: AnimatedScale(
          scale: _isRecording && !reduceMotion ? 1.05 : 1,
          duration: reduceMotion
              ? Duration.zero
              : const Duration(milliseconds: 120),
          child: IgnorePointer(
            child: ExcludeSemantics(
              child: FluxerButton.circle(
                key: _micKey,
                icon: PhosphorIconsFill.microphone,
                variant: FluxerButtonVariant.secondary,
                iconSize: 20,
                size: widget.buttonSize,
                recording: _isRecording,
                onPressed: widget.disabled ? null : () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OverlayIconButton extends StatelessWidget {
  const _OverlayIconButton({
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
    required this.semanticLabel,
    super.key,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      enabled: onPressed != null,
      child: Material(
        color: backgroundColor,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: 36,
            height: 36,
            child: ExcludeSemantics(
              child: Icon(icon, color: foregroundColor, size: 20),
            ),
          ),
        ),
      ),
    );
  }
}
