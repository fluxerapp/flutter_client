import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_snap.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration kVoiceSpeakingRingInDuration = Duration.zero;
const Duration kVoiceSpeakingRingOutDuration = Duration(milliseconds: 200);
const Duration kVoiceSpeakingRingOutDelay = Duration(milliseconds: 100);
const double kVoiceSpeakingRingWidth = 2.5;

double voiceSpeakingAvatarRingSize(double shortestSide) {
  return voiceTileAvatarSize(shortestSide) + kVoiceSpeakingRingWidth * 2;
}

class VoiceSpeakingRingLayer extends StatelessWidget {
  const VoiceSpeakingRingLayer({
    required this.enabled,
    required this.identity,
    required this.aroundAvatar,
    this.sid,
    super.key,
  });

  final bool enabled;
  final String identity;
  final String? sid;
  final bool aroundAvatar;

  @override
  Widget build(BuildContext context) {
    if (!enabled || identity.isEmpty) {
      return const SizedBox.shrink();
    }
    final Widget overlay = VoiceSpeakingRingOverlay(
      enabled: true,
      identity: identity,
      sid: sid,
      circular: aroundAvatar,
    );
    if (!aroundAvatar) {
      return overlay;
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double size = voiceSpeakingAvatarRingSize(
          math.min(constraints.maxWidth, constraints.maxHeight),
        );
        return Center(
          child: SizedBox(width: size, height: size, child: overlay),
        );
      },
    );
  }
}

class VoiceSpeakingRingOverlay extends ConsumerWidget {
  const VoiceSpeakingRingOverlay({
    required this.enabled,
    required this.identity,
    this.sid,
    this.circular = false,
    super.key,
  });

  final bool enabled;
  final String identity;
  final String? sid;
  final bool circular;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!enabled || identity.isEmpty) {
      return const SizedBox.shrink();
    }
    final bool speaking = ref.watch(
      voiceActiveSpeakersProvider.select(
        (VoiceActiveSpeakersState speakers) =>
            speakers.speakingKeys.contains(identity) ||
            (sid != null && speakers.speakingKeys.contains(sid)),
      ),
    );
    return _VoiceSpeakingRingPaint(
      speaking: speaking,
      circular: circular,
      color: context.colors.statusOnline,
    );
  }
}

class _VoiceSpeakingRingPaint extends StatefulWidget {
  const _VoiceSpeakingRingPaint({
    required this.speaking,
    required this.circular,
    required this.color,
  });

  final bool speaking;
  final bool circular;
  final Color color;

  @override
  State<_VoiceSpeakingRingPaint> createState() =>
      _VoiceSpeakingRingPaintState();
}

class _VoiceSpeakingRingPaintState extends State<_VoiceSpeakingRingPaint> {
  bool _visible = false;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _visible = widget.speaking;
  }

  @override
  void didUpdateWidget(covariant _VoiceSpeakingRingPaint oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.speaking) {
      _hideTimer?.cancel();
      _hideTimer = null;
      if (!_visible) {
        setState(() => _visible = true);
      }
      return;
    }
    if (!_visible || _hideTimer != null) {
      return;
    }
    _hideTimer = Timer(kVoiceSpeakingRingOutDelay, () {
      _hideTimer = null;
      if (mounted && !widget.speaking) {
        setState(() => _visible = false);
      }
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Duration duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : (_visible
              ? kVoiceSpeakingRingInDuration
              : kVoiceSpeakingRingOutDuration);
    return IgnorePointer(
      child: RepaintBoundary(
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: duration,
          curve: Curves.easeOut,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: widget.circular
                  ? BorderRadius.circular(999)
                  : BorderRadius.circular(13),
              border: Border.all(
                color: widget.color,
                width: kVoiceSpeakingRingWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
