import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceCallJoinOverlay extends ConsumerStatefulWidget {
  const VoiceCallJoinOverlay({
    required this.child,
    this.active = true,
    super.key,
  });

  final Widget child;
  final bool active;

  @override
  ConsumerState<VoiceCallJoinOverlay> createState() =>
      _VoiceCallJoinOverlayState();
}

class _VoiceCallJoinOverlayState extends ConsumerState<VoiceCallJoinOverlay> {
  @override
  void initState() {
    super.initState();
    _armJoinOverlayIfNeeded();
  }

  @override
  void didUpdateWidget(VoiceCallJoinOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.active && widget.active) {
      _armJoinOverlayIfNeeded();
    }
  }

  void _armJoinOverlayIfNeeded() {
    if (!widget.active) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !widget.active) {
        return;
      }
      if (peekVoicePipSkipPhoneEnter()) {
        ref.read(voiceCallOverlayProvider.notifier).reveal();
        return;
      }
      ref.read(voiceCallOverlayProvider.notifier).armJoinOverlay();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !widget.active) {
          return;
        }
        ref.read(voiceCallOverlayProvider.notifier).reveal();
      });
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class VoiceCallPhoneSurface extends StatelessWidget {
  const VoiceCallPhoneSurface({
    required this.child,
    this.active = true,
    super.key,
  });

  final Widget child;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return VoiceCallJoinOverlay(
      active: active,
      child: _VoiceCallPhoneEnter(active: active, child: child),
    );
  }
}

class _VoiceCallPhoneEnter extends ConsumerStatefulWidget {
  const _VoiceCallPhoneEnter({required this.child, this.active = true});

  final Widget child;
  final bool active;

  @override
  ConsumerState<_VoiceCallPhoneEnter> createState() =>
      _VoiceCallPhoneEnterState();
}

class _VoiceCallPhoneEnterState extends ConsumerState<_VoiceCallPhoneEnter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _enter;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  late final VoiceCallOverlay _overlay;
  ProviderSubscription<bool>? _exitSub;
  bool _exitHostRegistered = false;
  int _enterGeneration = 0;

  @override
  void initState() {
    super.initState();
    _overlay = ref.read(voiceCallOverlayProvider.notifier);
    _enter = AnimationController(
      vsync: this,
      duration: kVoiceCallPhoneTransitionDuration,
    );
    final CurvedAnimation curved = CurvedAnimation(
      parent: _enter,
      curve: kVoiceCallPhoneTransitionCurve,
    );
    _fade = curved;
    _slide = Tween<Offset>(
      begin: kVoiceCallPhoneSlideBegin,
      end: Offset.zero,
    ).animate(curved);
    _exitSub = ref.listenManual<bool>(
      voiceCallOverlayProvider.select((VoiceCallOverlayState s) => s.isExiting),
      (bool? previous, bool next) {
        if (next && _exitHostRegistered) {
          _playExit();
        }
      },
    );
    _syncActiveState();
  }

  @override
  void didUpdateWidget(_VoiceCallPhoneEnter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.active != widget.active) {
      _syncActiveState();
    }
  }

  void _syncActiveState() {
    if (!widget.active) {
      if (ref.read(voiceCallOverlayProvider).isExiting) {
        return;
      }
      _unregisterExitHost();
      _enter.value = 1;
      return;
    }
    _registerExitHost();
    if (peekVoicePipSkipPhoneEnter()) {
      _enter.value = 1;
    }
    final int generation = ++_enterGeneration;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !widget.active || generation != _enterGeneration) {
        return;
      }
      if (ref.read(voiceCallOverlayProvider).isExiting) {
        return;
      }
      if (takeVoicePipSkipPhoneEnter() || _enter.value == 1) {
        _enter.value = 1;
        return;
      }
      _enter
        ..value = 0
        ..forward();
    });
  }

  void _registerExitHost() {
    if (_exitHostRegistered) {
      return;
    }
    _overlay.registerPhoneExitHost();
    _exitHostRegistered = true;
  }

  void _unregisterExitHost() {
    if (!_exitHostRegistered) {
      return;
    }
    _overlay.unregisterPhoneExitHost();
    _exitHostRegistered = false;
  }

  @override
  void dispose() {
    _exitSub?.close();
    _unregisterExitHost();
    _enter.dispose();
    super.dispose();
  }

  void _playExit() {
    if (_enter.status == AnimationStatus.dismissed ||
        !TickerMode.getValuesNotifier(context).value.enabled) {
      _finishPhoneExit();
      return;
    }
    _enter.reverse().whenCompleteOrCancel(() {
      if (!mounted) {
        return;
      }
      _finishPhoneExit();
    });
  }

  void _finishPhoneExit() {
    _overlay.completePhoneExit();
    if (!widget.active) {
      _unregisterExitHost();
    }
    _enter.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    final Color background = widget.active
        ? context.colors.chatBackground
        : Colors.transparent;
    return ColoredBox(
      color: background,
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: widget.child),
      ),
    );
  }
}
