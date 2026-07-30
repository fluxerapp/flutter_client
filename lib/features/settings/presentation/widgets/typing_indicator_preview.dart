import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
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
            PhosphorIconsBold.hash,
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
            RepaintBoundary(
              child: FluxerLoadingSpinner(color: colors.interactiveActive),
            ),
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
