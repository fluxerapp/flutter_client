import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kPreviewAvatarSize = 14.0;
const _kPreviewMockColors = <Color>[
  Color(0xFF5865F2),
  Color(0xFF57F287),
  Color(0xFFEB459E),
];

class TypingIndicatorPreview extends StatelessWidget {
  const TypingIndicatorPreview({
    required this.mode,
    required this.channelName,
    super.key,
  });

  final ChannelTypingIndicatorMode mode;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;

    return Container(
      constraints: const BoxConstraints(maxWidth: 264),
      padding: EdgeInsets.symmetric(horizontal: layout.s3, vertical: layout.s2),
      decoration: BoxDecoration(
        color: colors.backgroundModifierSelected,
        borderRadius: layout.radiusMd,
      ),
      child: Row(
        children: [
          PhosphorIcon(
            PhosphorIconsRegular.hash,
            size: 18,
            color: colors.interactiveActive,
          ),
          SizedBox(width: layout.s2),
          Expanded(
            child: Text(
              channelName,
              style: textStyles.bodyMedium.copyWith(
                color: colors.interactiveActive,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (mode != ChannelTypingIndicatorMode.hidden) ...[
            SizedBox(width: layout.s2),
            _TypingDots(color: colors.interactiveActive),
            if (mode == ChannelTypingIndicatorMode.avatars) ...[
              SizedBox(width: layout.s1),
              FluxerAvatarStack(
                size: _kPreviewAvatarSize,
                avatars: [
                  for (final color in _kPreviewMockColors)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots({required this.color});

  final Color color;

  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _dotCount = 3;
  static const _dotSize = 4.0;
  static const _dotGap = 2.5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _dotCount * _dotSize + (_dotCount - 1) * _dotGap,
      height: _dotSize,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Stack(
            children: [
              for (int i = 0; i < _dotCount; i++)
                Positioned(
                  left: i * (_dotSize + _dotGap),
                  top: 0,
                  child: Opacity(
                    opacity: _opacityFor(i, _controller.value),
                    child: Container(
                      width: _dotSize,
                      height: _dotSize,
                      decoration: BoxDecoration(
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  double _opacityFor(int index, double phase) {
    final offset = index * 0.25;
    final local = (phase - offset) % 1.0;
    return local < 0.5 ? 1.0 : 0.25;
  }
}
