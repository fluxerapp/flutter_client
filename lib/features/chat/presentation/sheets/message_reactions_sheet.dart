import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/reaction_chip_colors.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_reactors_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_dart/export.dart';

const double _kReactionTabEmojiSize = 18;
const double _kAvatarSize = 36;

String reactionEmojiName(Reaction reaction) {
  if (reaction.isCustom) {
    return ':${reaction.emoji}:';
  }
  final EmojiEntry? entry = EmojiRegistry.entryBySurrogates(reaction.emoji);
  if (entry == null) {
    return reaction.emoji;
  }
  return buildEmojiWireToken(entry.primaryName, reaction.emoji);
}

Future<void> showMessageReactionsSheet(
  BuildContext context, {
  required Message message,
  Reaction? initialReaction,
}) {
  if (message.reactions.isEmpty) {
    return Future<void>.value();
  }
  final selected = initialReaction ?? message.reactions.first;
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: FluxerLocalizations.of(context).chatReactionsSheetTitle,
    initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
    builder: (sheetContext, scrollController, close) =>
        _MessageReactionsSheetBody(
          message: message,
          initialReaction: selected,
          scrollController: scrollController,
        ),
  );
}

class _MessageReactionsSheetBody extends ConsumerStatefulWidget {
  const _MessageReactionsSheetBody({
    required this.message,
    required this.initialReaction,
    required this.scrollController,
  });

  final Message message;
  final Reaction initialReaction;
  final ScrollController scrollController;

  @override
  ConsumerState<_MessageReactionsSheetBody> createState() =>
      _MessageReactionsSheetBodyState();
}

class _MessageReactionsSheetBodyState
    extends ConsumerState<_MessageReactionsSheetBody> {
  late Reaction _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialReaction;
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) {
      return;
    }
    final position = widget.scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      unawaited(
        ref
            .read(
              messageReactorsProvider(
                channelId: widget.message.channelId,
                messageId: widget.message.id,
                emoji: _selected.apiParam,
              ).notifier,
            )
            .loadMore(),
      );
    }
  }

  void _selectReaction(Reaction reaction) {
    if (reaction.emoji == _selected.emoji &&
        reaction.emojiId == _selected.emojiId) {
      return;
    }
    setState(() => _selected = reaction);
    if (widget.scrollController.hasClients) {
      widget.scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);
    final reactionsAsync = ref.watch(
      messageReactorsProvider(
        channelId: widget.message.channelId,
        messageId: widget.message.id,
        emoji: _selected.apiParam,
      ),
    );

    final String? guildId = ref.watch(contextualGuildIdProvider);
    ref.watch(emojiRegistryLoadedProvider);
    return Column(
      children: [
        _ReactionTabRow(
          reactions: widget.message.reactions,
          selected: _selected,
          onSelected: _selectReaction,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: context.layout.s4,
            right: context.layout.s4,
            bottom: context.layout.s2,
          ),
          child: Text(
            reactionEmojiName(_selected),
            style: context.textStyles.label.copyWith(
              color: colors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: colors.backgroundModifierAccent.withValues(alpha: 0.3),
        ),
        Expanded(
          child: reactionsAsync.when(
            data: (data) {
              if (data.users.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      l10n.chatReactionsSheetEmpty,
                      style: context.textStyles.label.copyWith(
                        color: colors.textTertiary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return ListView.builder(
                controller: widget.scrollController,
                padding: FluxerBottomSheet.scrollViewPadding(
                  context,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.layout.s4,
                    vertical: context.layout.s2,
                  ),
                ),
                itemCount: data.users.length + (data.isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= data.users.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: FluxerLoadingSpinner()),
                    );
                  }
                  return _ReactorRow(user: data.users[index], guildId: guildId);
                },
              );
            },
            loading: () => const Center(child: FluxerLoadingSpinner()),
            error: (error, _) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  userFacingErrorMessage(error, l10n.networkErrorMessage),
                  style: context.textStyles.label.copyWith(
                    color: colors.textDanger,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReactionTabRow extends StatelessWidget {
  const _ReactionTabRow({
    required this.reactions,
    required this.selected,
    required this.onSelected,
  });

  final List<Reaction> reactions;
  final Reaction selected;
  final ValueChanged<Reaction> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: context.layout.s4,
        vertical: context.layout.s2,
      ),
      child: Row(
        children: [
          for (final reaction in reactions)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _ReactionTab(
                reaction: reaction,
                isSelected:
                    reaction.emoji == selected.emoji &&
                    reaction.emojiId == selected.emojiId,
                onTap: () => onSelected(reaction),
              ),
            ),
        ],
      ),
    );
  }
}

class _ReactionTab extends StatelessWidget {
  const _ReactionTab({
    required this.reaction,
    required this.isSelected,
    required this.onTap,
  });

  final Reaction reaction;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color card = FluxerBottomSheet.cardColorOf(context);
    final SelectedReactionChipColors selected = selectedReactionChipColors(
      context,
      surface: card,
    );
    return FluxerGestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        key: ValueKey<String>('reaction-tab-${reaction.apiParam}'),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? selected.background : card,
          border: Border.all(
            color: isSelected ? selected.border : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (reaction.isCustom)
              CachedNetworkImage(
                imageUrl: FluxerMediaUrl.customEmoji(
                  id: reaction.emojiId!,
                  animated: reaction.animated,
                  size: _kReactionTabEmojiSize.toInt(),
                ),
                width: _kReactionTabEmojiSize,
                height: _kReactionTabEmojiSize,
              )
            else
              UnicodeEmojiWidget(
                emoji: reaction.emoji,
                size: _kReactionTabEmojiSize,
              ),
            const SizedBox(width: 6),
            Text(
              '${reaction.count}',
              style: context.textStyles.label.copyWith(
                color: isSelected ? selected.foreground : colors.textChat,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReactorRow extends ConsumerWidget {
  const _ReactorRow({required this.user, required this.guildId});

  final UserPartialResponse user;
  final String? guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasGlobalName = user.globalName?.isNotEmpty ?? false;
    final String? resolvedGuildId = guildId;
    final GuildUserDisplay? resolved =
        resolvedGuildId == null || resolvedGuildId.isEmpty
        ? null
        : ref
              .watch(guildUserDisplayFromDbProvider((user.id, resolvedGuildId)))
              .value;
    final displayName =
        resolved?.displayName ??
        resolveDisplayName(
          friendNickname: ref.watch(friendNicknameProvider(user.id)).value,
          globalName: user.globalName,
          username: user.username,
        );

    return FluxerGestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => unawaited(
        FluxerUserProfileSheet.show(context, userId: user.id, guildId: guildId),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            FluxerAvatar.user(
              userId: user.id,
              fallbackText: displayName,
              imageUrl: FluxerMediaUrl.userAvatar(
                userId: user.id,
                hash: user.avatar,
              ),
              avatarColor: user.avatarColor,
              showStatus: false,
              size: _kAvatarSize,
            ),
            SizedBox(width: context.layout.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    displayName,
                    style: context.textStyles.label.copyWith(
                      color: context.colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (hasGlobalName)
                    Text(
                      user.username,
                      style: context.textStyles.bodySmall.copyWith(
                        color: context.colors.textTertiary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
