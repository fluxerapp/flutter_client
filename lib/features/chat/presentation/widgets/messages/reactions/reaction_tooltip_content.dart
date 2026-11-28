import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/message_reactions_sheet.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_reactors_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_utils.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_dart/export.dart';

const double _kTooltipEmojiSize = 32;
const double _kTooltipMaxWidth = 264;
const double _kTooltipMinTextWidth = 160;
const double _kTooltipMinHeight = 56;
const int _kTooltipReactorCount = 3;

class ReactionTooltipContent extends ConsumerWidget {
  const ReactionTooltipContent({
    required this.message,
    required this.reaction,
    super.key,
  });

  final Message message;
  final Reaction reaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<MessageReactorsState> reactors = ref.watch(
      messageReactorsProvider(
        channelId: message.channelId,
        messageId: message.id,
        emoji: reaction.apiParam,
      ),
    );
    final String? guildId = ref.watch(contextualGuildIdProvider);
    final List<UserPartialResponse> users =
        reactors.value?.users.take(_kTooltipReactorCount).toList() ??
        const <UserPartialResponse>[];
    final List<String> names = <String>[
      for (final UserPartialResponse user in users)
        _reactorName(ref, user, guildId),
    ];
    final TextStyle primaryStyle = context.textStyles.label.copyWith(
      fontSize: 13,
      height: 1.25,
      fontWeight: FontWeight.w500,
      color: context.colors.textPrimary,
    );
    final TextStyle subtextStyle = context.textStyles.label.copyWith(
      fontSize: 12,
      height: 1.25,
      fontWeight: FontWeight.w400,
      color: context.colors.textPrimaryMuted,
    );
    final Widget primary = reactors.isLoading && names.isEmpty
        ? const Align(
            alignment: AlignmentDirectional.centerStart,
            child: FluxerLoadingSpinner(size: FluxerLoadingSpinnerSize.small),
          )
        : Text(
            names.isEmpty
                ? reactionEmojiName(reaction)
                : l10n.reactionTooltipReactedBy(
                    reactionEmojiName(reaction),
                    _joinReactors(
                      l10n,
                      names,
                      others: _othersCount(names.length),
                    ),
                  ),
            style: primaryStyle,
            textAlign: TextAlign.start,
          );
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _kTooltipMaxWidth),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _TooltipEmoji(reaction: reaction),
          const SizedBox(width: 12),
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: _kTooltipMinTextWidth,
                minHeight: _kTooltipMinHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  primary,
                  const SizedBox(height: 4),
                  Text(
                    l10n.reactionTooltipViewAll,
                    style: subtextStyle,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _othersCount(int shown) {
    final int total = reaction.count > shown ? reaction.count : shown;
    return total - shown;
  }

  String _reactorName(
    WidgetRef ref,
    UserPartialResponse user,
    String? guildId,
  ) {
    if (guildId != null && guildId.isNotEmpty) {
      final GuildUserDisplay? display = ref
          .watch(guildUserDisplayFromDbProvider((user.id, guildId)))
          .value;
      if (display != null) {
        return display.displayName;
      }
    }
    return resolveDisplayName(
      friendNickname: ref.watch(friendNicknameProvider(user.id)).value,
      globalName: user.globalName,
      username: user.username,
    );
  }
}

String _joinReactors(
  FluxerLocalizations l10n,
  List<String> names, {
  required int others,
}) {
  final List<String> parts = <String>[
    ...names,
    if (others > 0) l10n.reactionTooltipOthers(others),
  ];
  return switch (parts.length) {
    0 => '',
    1 => parts.first,
    2 => l10n.reactionTooltipListPair(parts[0], parts[1]),
    _ => l10n.reactionTooltipListMany(
      parts.sublist(0, parts.length - 1).join(', '),
      parts.last,
    ),
  };
}

class _TooltipEmoji extends StatelessWidget {
  const _TooltipEmoji({required this.reaction});

  final Reaction reaction;

  @override
  Widget build(BuildContext context) {
    if (reaction.isCustom) {
      return CachedEmojiImage(
        emojiId: reaction.emojiId!,
        animated: reaction.animated,
        requestSize: kCustomEmojiFetchSize,
        size: _kTooltipEmojiSize,
        pauseWhenOffscreen: false,
      );
    }
    return UnicodeEmojiWidget(emoji: reaction.emoji, size: _kTooltipEmojiSize);
  }
}
