import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_utils.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

const double _kRemoveReactionEmojiSize = 22;

Future<void> removeAllReactionsForEmoji({
  required MessageRepository repository,
  required Message message,
  required Reaction reaction,
}) async {
  try {
    await repository.removeAllReactionsForEmoji(
      channelId: message.channelId,
      messageId: message.id,
      emoji: reaction.apiParam,
    );
  } on Object catch (error, stackTrace) {
    talker.error(
      '[RemoveReactions] removeAllReactionsForEmoji failed',
      error,
      stackTrace,
    );
  }
}

String reactionShortcode(Reaction reaction) {
  if (reaction.isCustom) {
    return ':${reaction.emoji}:';
  }
  final EmojiEntry? entry = EmojiRegistry.entryBySurrogates(reaction.emoji);
  return entry == null ? reaction.emoji : ':${entry.primaryName}:';
}

class RemoveReactionsSubmenuItem extends StatelessWidget {
  const RemoveReactionsSubmenuItem({
    required this.reactions,
    required this.onRemove,
    super.key,
  });

  final List<Reaction> reactions;
  final ValueChanged<Reaction> onRemove;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MaterialLocalizations material = MaterialLocalizations.of(context);
    return FluxerMenuSubmenuItem(
      label: l10n.chatMessageRemoveReactions,
      isDanger: true,
      submenuBuilder: (BuildContext _) => <Widget>[
        for (final Reaction reaction in reactions)
          if (reaction.count > 0)
            FluxerDesktopMenuRow(
              label: reactionShortcode(reaction),
              hint: material.formatDecimal(reaction.count),
              onTap: () => onRemove(reaction),
              trailing: SizedBox.square(
                dimension: _kRemoveReactionEmojiSize,
                child: Center(child: ReactionEmojiGlyph(reaction: reaction)),
              ),
            ),
      ],
    );
  }
}

class ReactionEmojiGlyph extends StatelessWidget {
  const ReactionEmojiGlyph({
    required this.reaction,
    this.size = _kRemoveReactionEmojiSize,
    super.key,
  });

  final Reaction reaction;
  final double size;

  @override
  Widget build(BuildContext context) {
    final String? emojiId = reaction.emojiId;
    if (emojiId != null) {
      return CachedEmojiImage(
        emojiId: emojiId,
        animated: false,
        requestSize: kCustomEmojiFetchSize,
        size: size,
      );
    }
    return UnicodeEmojiWidget(emoji: reaction.emoji, size: size);
  }
}
