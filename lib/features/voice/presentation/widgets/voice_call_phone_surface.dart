import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceCallJoinOverlay extends ConsumerStatefulWidget {
  const VoiceCallJoinOverlay({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<VoiceCallJoinOverlay> createState() =>
      _VoiceCallJoinOverlayState();
}

class _VoiceCallJoinOverlayState extends ConsumerState<VoiceCallJoinOverlay> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      if (peekVoicePipSkipPhoneEnter()) {
        ref.read(voiceCallOverlayProvider.notifier).reveal();
        return;
      }
      ref.read(voiceCallOverlayProvider.notifier).armJoinOverlay();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
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
  const VoiceCallPhoneSurface({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VoiceCallJoinOverlay(child: _VoiceCallPhoneEnter(child: child));
  }
}

class _VoiceCallPhoneEnter extends ConsumerStatefulWidget {
  const _VoiceCallPhoneEnter({required this.child});

  final Widget child;

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

  @override
  void initState() {
    super.initState();
    _overlay = ref.read(voiceCallOverlayProvider.notifier);
    _overlay.registerPhoneExitHost();
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
        if (next) {
          _playExit();
        }
      },
    );
    if (peekVoicePipSkipPhoneEnter()) {
      _enter.value = 1;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || ref.read(voiceCallOverlayProvider).isExiting) {
        return;
      }
      if (takeVoicePipSkipPhoneEnter() || _enter.value == 1) {
        _enter.value = 1;
        return;
      }
      _enter.forward();
    });
  }

  @override
  void dispose() {
    _exitSub?.close();
    _overlay.unregisterPhoneExitHost();
    _enter.dispose();
    super.dispose();
  }

  void _playExit() {
    if (_enter.status == AnimationStatus.dismissed) {
      _overlay.completePhoneExit();
      return;
    }
    unawaited(
      _enter.reverse().whenComplete(() {
        if (!mounted) {
          return;
        }
        _overlay.completePhoneExit();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.chatBackground,
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: widget.child),
      ),
    );
  }
}
