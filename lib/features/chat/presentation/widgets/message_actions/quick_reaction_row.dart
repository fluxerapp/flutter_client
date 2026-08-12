import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

sealed class QuickReactionItem {
  const QuickReactionItem();
}

class UnicodeQuickReaction extends QuickReactionItem {
  const UnicodeQuickReaction(this.emoji);
  final String emoji;
}

class CustomQuickReaction extends QuickReactionItem {
  const CustomQuickReaction(this.emoji);
  final GuildEmojiEntry emoji;
}

const List<QuickReactionItem> kQuickReactionDefaults = [
  UnicodeQuickReaction('\u{1F44D}'),
  UnicodeQuickReaction('\u{1F44C}'),
  UnicodeQuickReaction('\u{1F389}'),
  UnicodeQuickReaction('\u{2764}\u{FE0F}'),
];

class QuickReactionRow extends StatelessWidget {
  final List<QuickReactionItem> items;
  final ValueChanged<QuickReactionItem> onReaction;
  final VoidCallback? onAddMore;

  const QuickReactionRow({
    required this.onReaction,
    this.items = kQuickReactionDefaults,
    this.onAddMore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.only(
        left: layout.s1_5,
        right: layout.s1_5,
        top: layout.s1,
        bottom: layout.s1_5,
      ),
      child: Row(
        spacing: layout.s1,
        children: [
          for (final item in items)
            Expanded(
              child: _QuickReactionButton(
                onTap: () => onReaction(item),
                child: _QuickReactionGlyph(item: item),
              ),
            ),
          if (onAddMore != null)
            Expanded(
              child: _QuickReactionButton(
                onTap: onAddMore!,
                child: PhosphorIcon(
                  PhosphorIconsBold.plus,
                  size: 24,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _QuickReactionGlyph extends StatelessWidget {
  const _QuickReactionGlyph({required this.item});

  final QuickReactionItem item;

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      UnicodeQuickReaction(:final emoji) => UnicodeEmojiWidget(
        emoji: emoji,
        size: 24,
      ),
      CustomQuickReaction(:final emoji) => CachedEmojiImage(
        emojiId: emoji.id,
        animated: false,
        requestSize: kCustomEmojiFetchSize,
        size: 24,
      ),
    };
  }
}

class _QuickReactionButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _QuickReactionButton({required this.child, required this.onTap});

  @override
  State<_QuickReactionButton> createState() => _QuickReactionButtonState();
}

class _QuickReactionButtonState extends State<_QuickReactionButton> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: FluxerGestureDetector(
        onTap: () {
          FluxerHaptics.selection();
          widget.onTap();
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _isHovered
                  ? context.colors.backgroundModifierSelected
                  : context.colors.backgroundModifierHover,
              borderRadius: context.layout.radiusLg,
            ),
            child: Center(child: widget.child),
          ),
        ),
      ),
    );
  }
}
