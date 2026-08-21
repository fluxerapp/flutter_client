import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_info_data.dart';
import 'package:fluxer_app/features/emoji/presentation/sheets/emoji_info_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kReactionEmojiSize = 19.0;
const _kAddReactionIconSize = 19.0;

typedef ReactionToggleCallback =
    void Function(String emoji, {String? emojiId, bool animated});

void dispatchSelectedEmojiReaction(
  FluxerSelectedEmoji emoji,
  ReactionToggleCallback onReaction,
) {
  FluxerHaptics.selection();
  if (emoji.isCustom) {
    onReaction(emoji.name, emojiId: emoji.emojiId, animated: emoji.animated);
    return;
  }
  onReaction(emoji.surrogates);
}

Future<void> openReactionPickerSheet(
  BuildContext context, {
  required ValueChanged<FluxerSelectedEmoji> onEmojiSelected,
  String? channelId,
}) {
  return FluxerEmojiPickerSheet.show(
    context,
    maxHeight: 0.88,
    channelId: channelId,
    visibleTabs: const [ExpressionPickerTab.emojis],
    trackEmojiUsageOnSelect: false,
    onEmojiSelected: onEmojiSelected,
  );
}

class MessageReactionsBar extends StatelessWidget {
  const MessageReactionsBar({
    required this.reactions,
    required this.channelId,
    required this.onReactionTap,
    this.showAddReaction = false,
    this.isMobile = false,
    super.key,
  });

  final List<Reaction> reactions;
  final String channelId;
  final ReactionToggleCallback onReactionTap;
  final bool showAddReaction;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        for (final reaction in reactions)
          _ReactionChip(
            reaction: reaction,
            onTap: () {
              FluxerHaptics.selection();
              onReactionTap(
                reaction.emoji,
                emojiId: reaction.emojiId,
                animated: reaction.animated,
              );
            },
          ),
        if (showAddReaction)
          _InlineAddReactionButton(
            channelId: channelId,
            onReaction: onReactionTap,
            isMobile: isMobile,
          ),
      ],
    );
  }
}

class _ReactionChip extends StatelessWidget {
  const _ReactionChip({required this.reaction, required this.onTap});

  final Reaction reaction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasReacted = reaction.hasReacted;
    final String emojiName = reaction.emoji;
    return Semantics(
      button: true,
      toggled: hasReacted,
      label: '$emojiName, ${reaction.count}',
      child: FluxerGestureDetector(
        onTap: onTap,
        onLongPress: () {
          openEmojiInfoBottomSheet(
            context,
            emoji: EmojiInfoData.fromReaction(reaction),
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: ExcludeSemantics(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: _chipBackground(context, hasReacted: hasReacted),
                border: Border.all(
                  color: _chipBorderColor(context, hasReacted: hasReacted),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (reaction.isCustom)
                    CachedEmojiImage(
                      emojiId: reaction.emojiId!,
                      animated: reaction.animated,
                      requestSize: kCustomEmojiFetchSize,
                      size: _kReactionEmojiSize,
                    )
                  else
                    UnicodeEmojiWidget(
                      emoji: reaction.emoji,
                      size: _kReactionEmojiSize,
                    ),
                  const SizedBox(width: 6),
                  Text(
                    '${reaction.count}',
                    style: context.textStyles.smallText.copyWith(
                      color: _chipCountColor(context, hasReacted: hasReacted),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _chipBackground(BuildContext context, {required bool hasReacted}) {
    final colors = context.colors;
    if (hasReacted) {
      return Color.lerp(colors.backgroundSecondary, colors.brandPrimary, 0.36)!;
    }
    final isLight = Theme.of(context).brightness == Brightness.light;
    if (isLight) {
      return Color.lerp(
        colors.backgroundSecondary,
        colors.brandPrimaryLight,
        0.06,
      )!;
    }
    if (colors.backgroundSecondary == colors.backgroundPrimary) {
      return colors.backgroundSecondaryAlt;
    }
    return colors.backgroundPrimary;
  }

  Color _chipBorderColor(BuildContext context, {required bool hasReacted}) {
    final colors = context.colors;
    if (hasReacted) {
      return colors.brandPrimary;
    }
    if (Theme.of(context).brightness == Brightness.light) {
      return Color.lerp(
        colors.backgroundSecondary,
        colors.brandPrimaryLight,
        0.10,
      )!;
    }
    return Colors.transparent;
  }

  Color _chipCountColor(BuildContext context, {required bool hasReacted}) {
    final colors = context.colors;
    if (!hasReacted) {
      return colors.textTertiary;
    }
    final isLight = Theme.of(context).brightness == Brightness.light;
    return isLight ? colors.brandPrimary : colors.textOnBrandPrimary;
  }
}

class _InlineAddReactionButton extends StatefulWidget {
  const _InlineAddReactionButton({
    required this.channelId,
    required this.onReaction,
    required this.isMobile,
  });

  final String channelId;
  final ReactionToggleCallback onReaction;
  final bool isMobile;

  @override
  State<_InlineAddReactionButton> createState() =>
      _InlineAddReactionButtonState();
}

class _InlineAddReactionButtonState extends State<_InlineAddReactionButton> {
  final _pickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();
  var _isPickerOpen = false;
  var _isHovered = false;

  void _handleEmojiSelected(FluxerSelectedEmoji emoji) =>
      dispatchSelectedEmojiReaction(emoji, widget.onReaction);

  @override
  Widget build(BuildContext context) {
    if (widget.isMobile) {
      return _buildButton(
        context,
        onTap: () => unawaited(
          openReactionPickerSheet(
            context,
            channelId: widget.channelId,
            onEmojiSelected: _handleEmojiSelected,
          ),
        ),
      );
    }
    return FluxerEmojiPickerPopout(
      key: _pickerKey,
      closeOnEmojiSelect: true,
      visibleTabs: const [ExpressionPickerTab.emojis],
      trackEmojiUsageOnSelect: false,
      channelId: widget.channelId,
      onClose: () => setState(() => _isPickerOpen = false),
      onEmojiSelected: _handleEmojiSelected,
      child: _buildButton(
        context,
        onTap: () {
          _pickerKey.currentState?.toggle();
          setState(() {
            _isPickerOpen = _pickerKey.currentState?.isOpen ?? false;
          });
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required VoidCallback? onTap}) {
    final colors = context.colors;
    final isActive = _isPickerOpen || _isHovered;
    return Semantics(
      label: FluxerLocalizations.of(context).chatMessageAddReaction,
      button: true,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: FluxerGestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? colors.backgroundModifierHover
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: PhosphorIcon(
              PhosphorIconsFill.smiley,
              size: _kAddReactionIconSize,
              color: isActive ? colors.textPrimary : colors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
