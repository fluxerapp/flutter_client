import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_dart/export.dart';

const int kCustomStatusEmojiRequestSize = 32;

class CustomStatusDisplay extends StatelessWidget {
  const CustomStatusDisplay({
    required this.stored,
    this.maxLines = 2,
    this.emojiSize = 16,
    super.key,
  });

  final String? stored;
  final int maxLines;
  final double emojiSize;

  @override
  Widget build(BuildContext context) {
    final CustomStatusResponse? status = parseStoredCustomStatus(stored);
    if (status == null) {
      return const SizedBox.shrink();
    }
    final String? text = status.text?.trim();
    final bool hasText = text != null && text.isNotEmpty;
    final Widget? emoji = _buildEmoji(status);
    if (emoji == null && !hasText) {
      return const SizedBox.shrink();
    }
    return Row(
      children: <Widget>[
        if (emoji != null) ...<Widget>[
          emoji,
          if (hasText) const SizedBox(width: 4),
        ],
        if (hasText)
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  Widget? _buildEmoji(CustomStatusResponse status) {
    final SnowflakeType? emojiId = status.emojiId;
    if (emojiId != null) {
      return CachedEmojiImage(
        emojiId: emojiId.toString(),
        animated: status.emojiAnimated,
        requestSize: kCustomStatusEmojiRequestSize,
        size: emojiSize,
      );
    }
    final String? emojiName = status.emojiName;
    if (emojiName != null && emojiName.isNotEmpty) {
      return UnicodeEmojiWidget(emoji: emojiName, size: emojiSize);
    }
    return null;
  }
}
