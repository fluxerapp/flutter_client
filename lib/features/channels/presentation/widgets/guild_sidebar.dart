import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/overlapping_panels.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_join_bottom_sheet.dart'
    show VoiceChannelJoinOutcome, showVoiceChannelJoinBottomSheet;
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildSidebar extends ConsumerWidget {
  const GuildSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(channelListViewModelProvider);
    final guild = state.guild;
    final categories = state.categories;
    final selectedId = ref.watch(activeChannelIdProvider);
    final collapsed = state.collapsedCategories;

    return Container(
      width: 240,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: context.colors.channelSidebarBackground,
        border: Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: Column(
        children: [
          _buildServerHeader(context, ref, guild),
          Expanded(
            child: _buildChannelList(
              context,
              ref,
              categories,
              selectedId,
              collapsed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServerHeader(BuildContext context, WidgetRef ref, Guild? guild) {
    final bool hasImage = guild?.banner != null;
    const double headerHeight = 56;
    const double bannerAspectRatio = 16 / 9;
    final List<Shadow> bannerShadows = hasImage
        ? <Shadow>[
            Shadow(
              color: const Color(0xCC000000).withValues(alpha: 0.7),
              offset: const Offset(0, 1),
              blurRadius: 18,
            ),
          ]
        : const <Shadow>[];
    final Widget headerContent = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final guildId = ref.read(activeGuildIdProvider);
        if (guildId != null) {
          unawaited(context.push(RoutePaths.guildSettingsPath(guildId)));
        }
      },
      child: Row(
        crossAxisAlignment: hasImage
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (guild != null &&
              (guild.isPartnered || guild.isVerified || guild.isDiscoverable))
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: FluxerGuildBadge(
                features: guild.features,
                shadows: bannerShadows,
                forceBrightness: hasImage ? Brightness.dark : null,
              ),
            ),
          Expanded(
            child: Text(
              guild?.name ?? '',
              style: context.textStyles.channelName.copyWith(
                shadows: bannerShadows,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          PhosphorIcon(
            PhosphorIconsFill.caretDown,
            color: context.colors.textChat,
            size: 16,
            shadows: bannerShadows,
          ),
        ],
      ),
    );

    if (hasImage) {
      return AspectRatio(
        aspectRatio: bannerAspectRatio,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: context.colors.channelSidebarBackground,
            border: Border(
              bottom: BorderSide(color: context.colors.borderColor),
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(guild!.bannerUrl!),
              fit: BoxFit.cover,
            ),
          ),
          child: headerContent,
        ),
      );
    }
    return Container(
      height: headerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.colors.channelSidebarBackground,
        border: Border(bottom: BorderSide(color: context.colors.borderColor)),
      ),
      child: headerContent,
    );
  }

  Widget _buildChannelList(
    BuildContext context,
    WidgetRef ref,
    List<ChannelCategory> categories,
    String? selectedId,
    Set<String> collapsed,
  ) {
    final guildId = ref.watch(activeGuildIdProvider);
    final muteState = guildId != null
        ? ref.watch(guildMuteProvider(guildId)).value
        : null;
    final hideMutedChannels = muteState?.hideMutedChannels ?? false;
    final guildMuted = muteState?.isMuted ?? false;
    final mutedSet = guildId != null
        ? ref.watch(mutedChannelIdsProvider(guildId)).value ?? const <String>{}
        : const <String>{};
    final visibleCategories = hideMutedChannels
        ? categories
              .map(
                (category) => ChannelCategory(
                  id: category.id,
                  name: category.name,
                  channels: category.channels
                      .where(
                        (channel) =>
                            channel.id == selectedId ||
                            !_isChannelMuted(channel, mutedSet, guildMuted),
                      )
                      .toList(),
                ),
              )
              .where((category) => category.channels.isNotEmpty)
              .toList()
        : categories;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: visibleCategories.length,
      itemBuilder: (context, index) {
        final category = visibleCategories[index];
        final isCollapsed = collapsed.contains(category.id);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryHeader(context, ref, category, isCollapsed),
            if (!isCollapsed)
              ...category.channels.map(
                (channel) => _buildChannelTile(
                  context,
                  ref,
                  channel,
                  channel.id == selectedId,
                  mutedSet: mutedSet,
                  guildMuted: guildMuted,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCategoryHeader(
    BuildContext context,
    WidgetRef ref,
    ChannelCategory category,
    bool isCollapsed,
  ) => InkWell(
    onTap: () => ref
        .read(channelListViewModelProvider.notifier)
        .toggleCategory(category.id),
    child: Padding(
      padding: const EdgeInsets.only(left: 12, right: 8, top: 16, bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              category.name,
              style: context.textStyles.categoryName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          PhosphorIcon(
            isCollapsed
                ? PhosphorIconsRegular.caretRight
                : PhosphorIconsRegular.caretDown,
            size: 12,
            color: context.colors.textPrimaryMuted,
          ),
        ],
      ),
    ),
  );

  Widget _buildChannelTile(
    BuildContext context,
    WidgetRef ref,
    Channel channel,
    bool isSelected, {
    Set<String>? mutedSet,
    bool? guildMuted,
  }) {
    final unreadAsync = ref.watch(channelUnreadProvider(channel.id));
    final unread = unreadAsync.value;
    final hasUnread = unread?.hasUnread ?? false;
    final mentionCount = unread?.mentionCount ?? 0;
    final currentUserId = ref.watch(currentUserIdProvider);
    final guildId = ref.watch(activeGuildIdProvider);
    final effectiveMutedSet =
        mutedSet ??
        (guildId != null
            ? ref.watch(mutedChannelIdsProvider(guildId)).value ??
                  const <String>{}
            : const <String>{});
    final effectiveGuildMuted =
        guildMuted ??
        (guildId != null &&
            (ref.watch(guildMuteProvider(guildId)).value?.isMuted ?? false));
    final isMuted = _isChannelMuted(
      channel,
      effectiveMutedSet,
      effectiveGuildMuted,
    );
    final showFadedUnread = ref.watch(
      appearancePreferencesProvider.select(
        (s) => s.showFadedUnreadOnMutedChannels,
      ),
    );
    final treatAsUnread = hasUnread && (!isMuted || showFadedUnread);
    final hasTyping = ref.watch(
      typingIndicatorsProvider.select((entries) {
        final now = DateTime.now();
        return entries.any(
          (t) =>
              t.channelId == channel.id &&
              t.userId != currentUserId &&
              t.expiresAt.isAfter(now),
        );
      }),
    );

    final textColor = isSelected
        ? context.colors.textPrimary
        : treatAsUnread
        ? context.colors.textChat
        : context.colors.textTertiary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          if (channel.type == ChannelType.link) {
            final channelUrl = channel.url;
            if (channelUrl != null && channelUrl.isNotEmpty) {
              unawaited(handleExternalLinkTap(context, channelUrl));
            }
            return;
          }

          final String? guildId = ref.read(activeGuildIdProvider);
          if (guildId != null) {
            final VoiceSessionState voiceSession = ref.read(voiceSessionProvider);
            final bool isInCurrentVoiceChannel =
                channel.type == ChannelType.voice &&
                voiceSession.isInVoice &&
                voiceSession.guildId == guildId &&
                voiceSession.channelId == channel.id;
            if (channel.type == ChannelType.voice && isMobileLayout(context)) {
              if (isInCurrentVoiceChannel) {
                navigateToContent(
                  context,
                  RoutePaths.guildChannel(guildId, channel.id),
                );
                return;
              }
              final VoiceChannelJoinOutcome? joinOutcome =
                  await showVoiceChannelJoinBottomSheet(
                context,
                channelName: channel.name,
              );
              if (!context.mounted || joinOutcome == null) {
                return;
              }
              navigateToContent(
                context,
                RoutePaths.guildChannel(guildId, channel.id),
              );
              unawaited(
                joinVoiceChannelWithConfirmation(
                  ref: ref,
                  context: context,
                  guildId: guildId,
                  channelId: channel.id,
                  initialSelfMute: joinOutcome.initialSelfMute,
                  initialSelfDeaf: joinOutcome.initialSelfDeaf,
                ),
              );
              return;
            }
            navigateToContent(
              context,
              RoutePaths.guildChannel(guildId, channel.id),
            );
            if (channel.type == ChannelType.voice && !isInCurrentVoiceChannel) {
              unawaited(
                joinVoiceChannelWithConfirmation(
                  ref: ref,
                  context: context,
                  guildId: guildId,
                  channelId: channel.id,
                ),
              );
            }
          }
          unawaited(
            OverlappingPanels.of(context)?.moveToState(RevealSide.main) ??
                Future<void>.value(),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.backgroundModifierSelected
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              ChannelIcon(type: channel.type, color: textColor),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  channel.name,
                  style: context.textStyles.channelName.copyWith(
                    color: textColor,
                    fontWeight: treatAsUnread ? FontWeight.w600 : null,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (hasTyping) ...[
                const SizedBox(width: 4),
                FluxerLoadingSpinner(color: context.colors.textSecondary),
              ],
              if (!isSelected && (mentionCount > 0 || treatAsUnread)) ...[
                const SizedBox(width: 4),
                if (mentionCount > 0)
                  FluxerBadge.count(count: mentionCount)
                else if (isMuted)
                  const Opacity(opacity: 0.4, child: FluxerBadge.dot())
                else
                  const FluxerBadge.dot(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

bool _isChannelMuted(Channel channel, Set<String> mutedSet, bool guildMuted) {
  return guildMuted ||
      mutedSet.contains(channel.id) ||
      (channel.parentId != null && mutedSet.contains(channel.parentId));
}
