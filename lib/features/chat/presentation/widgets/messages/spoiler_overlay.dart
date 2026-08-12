import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class SpoilerOverlay extends StatefulWidget {
  const SpoilerOverlay({
    required this.child,
    required this.isSpoiler,
    required this.initiallyRevealed,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.spoilerSyncController,
    this.syncKeys = const [],
    super.key,
  });

  final Widget child;
  final bool isSpoiler;
  final bool initiallyRevealed;
  final BorderRadius borderRadius;
  final FluxerSpoilerSyncController? spoilerSyncController;
  final List<String> syncKeys;

  @override
  State<SpoilerOverlay> createState() => _SpoilerOverlayState();
}

class _SpoilerOverlayState extends State<SpoilerOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late bool _revealed;
  var _manuallyRevealed = false;

  bool get _sharedRevealed =>
      widget.spoilerSyncController?.isRevealed(widget.syncKeys) ?? false;

  bool get _shouldReveal =>
      !widget.isSpoiler ||
      widget.initiallyRevealed ||
      _manuallyRevealed ||
      _sharedRevealed;

  @override
  void initState() {
    super.initState();
    _revealed = _shouldReveal;
    widget.spoilerSyncController?.addListener(_handleSyncChanged);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 160),
      value: _revealed ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(covariant SpoilerOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.spoilerSyncController != widget.spoilerSyncController) {
      oldWidget.spoilerSyncController?.removeListener(_handleSyncChanged);
      widget.spoilerSyncController?.addListener(_handleSyncChanged);
    }
    if (!listEquals(oldWidget.syncKeys, widget.syncKeys) ||
        oldWidget.isSpoiler != widget.isSpoiler) {
      _manuallyRevealed = false;
    }
    _applyRevealState();
  }

  @override
  void dispose() {
    widget.spoilerSyncController?.removeListener(_handleSyncChanged);
    _controller.dispose();
    super.dispose();
  }

  void _handleSyncChanged() {
    _applyRevealState();
  }

  void _applyRevealState() {
    final shouldReveal = _shouldReveal;
    if (_revealed == shouldReveal) {
      return;
    }
    setState(() => _revealed = shouldReveal);
    unawaited(_revealed ? _controller.forward() : _controller.reverse());
  }

  void _reveal() {
    if (_revealed) {
      return;
    }
    setState(() {
      _manuallyRevealed = true;
      _revealed = true;
    });
    widget.spoilerSyncController?.reveal(widget.syncKeys);
    unawaited(_controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isSpoiler) {
      return widget.child;
    }

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Semantics(
        button: true,
        label: l10n.chatMediaSpoilerRevealLabel,
        onTap: _reveal,
        child: FluxerGestureDetector(
          onTap: _reveal,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              FadeTransition(
                opacity: _controller,
                child: IgnorePointer(ignoring: !_revealed, child: widget.child),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: _revealed,
                  child: FadeTransition(
                    opacity: ReverseAnimation(_controller),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colors.spoilerBackground,
                        borderRadius: widget.borderRadius,
                      ),
                      child: Center(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colors.backgroundSecondary
                                .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Text(
                              l10n.chatMediaSpoilerOverlayLabel,
                              style: context.textStyles.bodySmall.copyWith(
                                color: context.colors.textPrimary,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.42,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
