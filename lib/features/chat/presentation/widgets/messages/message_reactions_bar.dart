import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/reaction_chip_colors.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

const _kReactionEmojiSize = 19.0;
const _kAddReactionIconSize = 19.0;
const _kDesktopReactionEmojiSize = 20.0;
const _kDesktopAddReactionIconSize = 20.0;

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
    channelId: channelId,
    visibleTabs: const [ExpressionPickerTab.emojis],
    onEmojiSelected: onEmojiSelected,
  );
}

class MessageReactionsBar extends StatelessWidget {
  const MessageReactionsBar({
    required this.reactions,
    required this.channelId,
    required this.onReactionTap,
    this.onReactionLongPress,
    this.showAddReaction = false,
    this.isMobile = false,
    super.key,
  });

  final List<Reaction> reactions;
  final String channelId;
  final ReactionToggleCallback onReactionTap;
  final ValueChanged<Reaction>? onReactionLongPress;
  final bool showAddReaction;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final bool desktop = usesDesktopPointerUi(context);
    return ChatSurfaceTheme(
      builder: (BuildContext context) => Wrap(
        spacing: 4,
        runSpacing: desktop ? 0 : 4,
        children: [
          for (final reaction in reactions)
            _ReactionChip(
              reaction: reaction,
              desktop: desktop,
              onTap: () {
                FluxerHaptics.selection();
                onReactionTap(
                  reaction.emoji,
                  emojiId: reaction.emojiId,
                  animated: reaction.animated,
                );
              },
              onLongPress: onReactionLongPress == null
                  ? null
                  : () {
                      FluxerHaptics.medium();
                      onReactionLongPress!(reaction);
                    },
            ),
          if (showAddReaction)
            _InlineAddReactionButton(
              channelId: channelId,
              onReaction: onReactionTap,
              isMobile: isMobile,
              desktop: desktop,
            ),
        ],
      ),
    );
  }
}

class _ReactionChip extends StatelessWidget {
  const _ReactionChip({
    required this.reaction,
    required this.desktop,
    required this.onTap,
    this.onLongPress,
  });

  final Reaction reaction;
  final bool desktop;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final double emojiSize = desktop
        ? _kDesktopReactionEmojiSize
        : _kReactionEmojiSize;
    final hasReacted = reaction.hasReacted;
    final String emojiName = reaction.emoji;
    return Semantics(
      button: true,
      toggled: hasReacted,
      label: '$emojiName, ${reaction.count}',
      child: FluxerGestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: ExcludeSemantics(
          child: _ReactionChipSurface(
            desktop: desktop,
            hasReacted: hasReacted,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (reaction.isCustom)
                  CachedEmojiImage(
                    emojiId: reaction.emojiId!,
                    animated: reaction.animated,
                    requestSize: kCustomEmojiFetchSize,
                    size: emojiSize,
                    pauseWhenOffscreen: false,
                  )
                else
                  UnicodeEmojiWidget(emoji: reaction.emoji, size: emojiSize),
                const SizedBox(width: 6),
                Text(
                  '${reaction.count}',
                  style: context.textStyles.smallText.copyWith(
                    color: _chipCountColor(context, hasReacted: hasReacted),
                    fontWeight: desktop ? FontWeight.w600 : FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReactionChipSurface extends StatefulWidget {
  const _ReactionChipSurface({
    required this.desktop,
    required this.hasReacted,
    required this.child,
  });

  final bool desktop;
  final bool hasReacted;
  final Widget child;

  @override
  State<_ReactionChipSurface> createState() => _ReactionChipSurfaceState();
}

class _ReactionChipSurfaceState extends State<_ReactionChipSurface> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered != value) {
      setState(() => _hovered = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool desktop = widget.desktop;
    final bool hasReacted = widget.hasReacted;
    final bool hovered = _hovered && desktop;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: desktop ? (_) => _setHovered(true) : null,
      onExit: desktop ? (_) => _setHovered(false) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: hovered
              ? (hasReacted
                    ? selectedReactionChipColors(context).hover
                    : _chipHoverBackground(context))
              : _chipBackground(context, hasReacted: hasReacted),
          border: Border.all(
            color: hovered && !hasReacted
                ? _chipHoverBorderColor(context)
                : _chipBorderColor(context, hasReacted: hasReacted),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: widget.child,
      ),
    );
  }
}

Color _chipBackground(BuildContext context, {required bool hasReacted}) {
  final colors = context.colors;
  if (hasReacted) {
    return selectedReactionChipColors(context).background;
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

Color _chipHoverBackground(BuildContext context) {
  final colors = context.colors;
  if (Theme.of(context).brightness == Brightness.light) {
    return fluxerCssColorMix(
      colors.brandPrimaryLight,
      colors.backgroundSecondary,
      0.08,
    );
  }
  return colors.backgroundModifierHover;
}

Color _chipHoverBorderColor(BuildContext context) {
  final colors = context.colors;
  if (Theme.of(context).brightness == Brightness.light) {
    return fluxerCssColorMix(
      colors.brandPrimary,
      colors.backgroundSecondary,
      0.12,
    );
  }
  return colors.backgroundModifierAccent;
}

Color _chipBorderColor(BuildContext context, {required bool hasReacted}) {
  final colors = context.colors;
  if (hasReacted) {
    return selectedReactionChipColors(context).border;
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
  if (!hasReacted) {
    return context.colors.textTertiary;
  }
  return selectedReactionChipColors(context).foreground;
}

class _InlineAddReactionButton extends StatefulWidget {
  const _InlineAddReactionButton({
    required this.channelId,
    required this.onReaction,
    required this.isMobile,
    required this.desktop,
  });

  final String channelId;
  final ReactionToggleCallback onReaction;
  final bool isMobile;
  final bool desktop;

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
              size: widget.isMobile || !widget.desktop
                  ? _kAddReactionIconSize
                  : _kDesktopAddReactionIconSize,
              color: isActive ? colors.textPrimary : colors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
