import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/domain/hide_muted_channels_filter.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/voice_channel_participants.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_dart/gateway.dart';
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
        if (isMobileLayout(context)) {
          ref
              .read(toastProvider.notifier)
              .show(const FluxerToast(message: 'Coming soon'));
          return;
        }

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
                        (channel) => shouldShowChannelWhenHidingMuted(
                          channelId: channel.id,
                          mutedChannelIds: mutedSet,
                          selectedChannelId: selectedId,
                        ),
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
            if (!isCollapsed) ...<Widget>[
              for (final Channel channel in category.channels) ...<Widget>[
                _buildChannelTile(
                  context,
                  ref,
                  channel,
                  channel.id == selectedId,
                  mutedSet: mutedSet,
                ),
                if (guildId != null && channel.type == ChannelType.voice)
                  VoiceChannelParticipantsList(
                    guildId: guildId,
                    channelId: channel.id,
                  ),
              ],
            ],
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
  ) {
    final hasMarkReadAction = category.channels.any(_canMarkChannelRead);
    return InkWell(
      onTap: () => ref
          .read(channelListViewModelProvider.notifier)
          .toggleCategory(category.id),
      onSecondaryTapUp: hasMarkReadAction
          ? (details) => unawaited(
              _showCategoryActions(
                context,
                ref,
                category,
                details.globalPosition,
              ),
            )
          : null,
      onLongPress: hasMarkReadAction && isMobileLayout(context)
          ? () => unawaited(
              _showCategoryActions(context, ref, category, Offset.zero),
            )
          : null,
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
  }

  Widget _buildChannelTile(
    BuildContext context,
    WidgetRef ref,
    Channel channel,
    bool isSelected, {
    Set<String>? mutedSet,
  }) {
    final unreadAsync = ref.watch(channelUnreadProvider(channel.id));
    final unread = unreadAsync.value;
    final hasUnread = unread?.hasUnread ?? false;
    final mentionCount = unread?.mentionCount ?? 0;
    final hasUnreadMessages = unread?.hasUnreadMessages ?? false;
    final currentUserId = ref.watch(currentUserIdProvider);
    final guildId = ref.watch(activeGuildIdProvider);
    final effectiveMutedSet =
        mutedSet ??
        (guildId != null
            ? ref.watch(mutedChannelIdsProvider(guildId)).value ??
                  const <String>{}
            : const <String>{});
    final isChannelDirectlyMuted = _isChannelDirectlyMuted(
      channel,
      effectiveMutedSet,
    );
    final showFadedUnread = ref.watch(
      appearancePreferencesProvider.select(
        (s) => s.showFadedUnreadOnMutedChannels,
      ),
    );
    final channelUnreadState = getChannelUnreadState(
      unreadCount: hasUnreadMessages ? 1 : 0,
      mentionCount: mentionCount,
      isMuted: isChannelDirectlyMuted,
      showFadedUnreadOnMutedChannels: showFadedUnread,
      unreadBadgesLevel: unread?.unreadBadgesLevel,
    );
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
    final int? effectivePermissionBits = ref
        .watch(effectiveGuildChannelPermissionBitsProvider(channel.id))
        .value;
    final VoiceSessionState voiceSession = ref.watch(voiceSessionProvider);
    final Map<String, VoiceState> voiceStates = ref.watch(
      voiceStatesMapProvider,
    );
    final Guild? guild = ref.watch(channelListViewModelProvider).guild;
    final bool showE2eeVoiceIcon =
        channel.type == ChannelType.voice &&
        guildId != null &&
        guild != null &&
        isVoiceChannelE2eeEncryptedForIcon(
          voiceStates: voiceStates,
          guildId: guildId,
          channelId: channel.id,
          connectedVoiceGuildId: voiceSession.guildId,
          connectedVoiceChannelId: voiceSession.channelId,
          guildHasVoiceE2ee: guild.hasVoiceE2ee,
        );

    final Color textColor = isSelected
        ? context.colors.textPrimary
        : channelUnreadState.isHighlight
        ? context.colors.textSecondary
        : context.colors.textTertiaryMuted;
    final double rowOpacity = isChannelDirectlyMuted && !isSelected ? 0.5 : 1.0;
    final bool showUnreadIndicator =
        !isSelected && channelUnreadState.shouldShowUnreadIndicator;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (showUnreadIndicator)
          Positioned(
            left: 1,
            top: 0,
            bottom: 0,
            child: Center(
              child: ChannelUnreadIndicator(faded: isChannelDirectlyMuted),
            ),
          ),
        Opacity(
          opacity: rowOpacity,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onSecondaryTapUp: _canMarkChannelRead(channel)
                  ? (details) => unawaited(
                      _showChannelActions(
                        context,
                        ref,
                        channel,
                        hasUnread: hasUnread,
                        position: details.globalPosition,
                      ),
                    )
                  : null,
              onLongPress:
                  _canMarkChannelRead(channel) && isMobileLayout(context)
                  ? () => unawaited(
                      _showChannelActions(
                        context,
                        ref,
                        channel,
                        hasUnread: hasUnread,
                        position: Offset.zero,
                      ),
                    )
                  : null,
              onTap: () async {
                final String? guildId = ref.read(activeGuildIdProvider);
                if (guildId == null) {
                  return;
                }
                await navigateToGuildChannelContent(
                  context: context,
                  ref: ref,
                  guildId: guildId,
                  channel: channel,
                  effectivePermissionBits: effectivePermissionBits,
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
                    ChannelIcon(
                      type: channel.type,
                      channel: channel,
                      effectivePermissionBits: effectivePermissionBits,
                      color: textColor,
                      e2eeEncrypted: showE2eeVoiceIcon,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        channel.name,
                        style: context.textStyles.channelName.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (hasTyping) ...[
                      const SizedBox(width: 4),
                      FluxerLoadingSpinner(color: context.colors.textSecondary),
                    ],
                    if (!isSelected &&
                        mentionCount > 0 &&
                        channelUnreadState.hasMentions) ...[
                      const SizedBox(width: 4),
                      FluxerBadge.count(count: mentionCount),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showChannelActions(
    BuildContext context,
    WidgetRef ref,
    Channel channel, {
    required bool hasUnread,
    required Offset position,
  }) async {
    final showFavorites = ref.read(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    final isFavorite =
        showFavorites &&
        await ref
            .read(favoriteChannelsRepositoryProvider)
            .isFavorite(channel.id);
    if (!context.mounted) {
      return;
    }
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (context, close) => [
        if (showFavorites)
          FluxerMenuItem(
            label: isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
            icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
            onPressed: () {
              close();
              unawaited(
                _toggleFavorite(ref, channel: channel, isFavorite: isFavorite),
              );
            },
          ),
        FluxerMenuItem(
          label: 'Mark as Read',
          icon: PhosphorIconsRegular.envelopeOpen,
          enabled: hasUnread,
          onPressed: () {
            close();
            unawaited(_readStateRepository(ref).ackLatest(channel.id));
          },
        ),
      ],
    );
  }

  Future<void> _toggleFavorite(
    WidgetRef ref, {
    required Channel channel,
    required bool isFavorite,
  }) async {
    final repository = ref.read(favoriteChannelsRepositoryProvider);
    if (isFavorite) {
      await repository.removeChannel(channel.id);
      return;
    }
    await repository.addChannel(
      channelId: channel.id,
      guildId: channel.guildId,
      nickname: channel.name,
    );
  }

  Future<void> _showCategoryActions(
    BuildContext context,
    WidgetRef ref,
    ChannelCategory category,
    Offset position,
  ) {
    final channelIds = category.channels
        .where(_canMarkChannelRead)
        .map((channel) => channel.id)
        .toList();
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (context, close) => [
        FluxerMenuItem(
          label: 'Mark Category as Read',
          icon: PhosphorIconsRegular.envelopeOpen,
          onPressed: () {
            close();
            unawaited(_readStateRepository(ref).ackLatestBulk(channelIds));
          },
        ),
      ],
    );
  }

  ReadStateRepository _readStateRepository(WidgetRef ref) =>
      ReadStateRepository(
        ref.read(fluxerClientProvider),
        ref.read(fluxerDatabaseProvider),
      );
}

bool _isChannelDirectlyMuted(Channel channel, Set<String> mutedSet) {
  return mutedSet.contains(channel.id);
}

bool _canMarkChannelRead(Channel channel) =>
    channel.type != ChannelType.category && channel.type != ChannelType.link;
