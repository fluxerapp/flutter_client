import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_notification_settings_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/voice_channel_participants.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/voice_channel_user_count.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_entries_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_scroll_store_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_member_count_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildSidebar extends ConsumerStatefulWidget {
  const GuildSidebar({super.key});

  @override
  ConsumerState<GuildSidebar> createState() => _GuildSidebarState();
}

class _GuildSidebarState extends ConsumerState<GuildSidebar> {
  late final ScrollController _scrollController;
  String? _restoredGuildId;
  bool _restoring = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_persistScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_persistScroll)
      ..dispose();
    super.dispose();
  }

  void _persistScroll() {
    if (_restoring) {
      return;
    }
    final String? guildId = ref.read(activeGuildIdProvider);
    if (guildId != null && _scrollController.hasClients) {
      ref
          .read(guildSidebarScrollStoreProvider)
          .setOffset(guildId, _scrollController.offset);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Guild? guild = ref.watch(
      channelListViewModelProvider.select((s) => s.guild),
    );
    final String? guildId = ref.watch(activeGuildIdProvider);
    final List<GuildSidebarEntry> sidebarEntries = ref.watch(
      guildSidebarEntriesProvider,
    );

    if (guildId == null) {
      _restoredGuildId = null;
    } else if (guildId != _restoredGuildId) {
      _restoredGuildId = guildId;
      _restoring = true;
      final double saved =
          ref.read(guildSidebarScrollStoreProvider).offsetFor(guildId) ?? 0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(
            saved.clamp(0, _scrollController.position.maxScrollExtent),
          );
        }
        _restoring = false;
      });
    }

    return Container(
      width: 240,
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      decoration: BoxDecoration(
        color: context.colors.channelSidebarBackground,
        border: Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: Column(
        children: [
          _buildServerHeader(context, guild),
          Expanded(
            child: _buildChannelList(
              context,
              guild: guild,
              guildId: guildId,
              sidebarEntries: sidebarEntries,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServerHeader(BuildContext context, Guild? guild) {
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
    BuildContext context, {
    required Guild? guild,
    required String? guildId,
    required List<GuildSidebarEntry> sidebarEntries,
  }) {
    final String? selectedId = ref.watch(activeChannelIdProvider);

    return ListView.builder(
      controller: _scrollController,
      scrollCacheExtent: const ScrollCacheExtent.pixels(600),
      padding: const EdgeInsets.only(top: 12),
      itemCount: sidebarEntries.length,
      itemBuilder: (BuildContext context, int index) {
        final GuildSidebarEntry entry = sidebarEntries[index];
        switch (entry.kind) {
          case GuildSidebarEntryKind.categoryHeader:
            return _CategoryHeader(
              key: ValueKey<String>('cat:${entry.category!.id}'),
              category: entry.category!,
              isCollapsed: entry.isCategoryCollapsed,
              guildId: guildId!,
            );
          case GuildSidebarEntryKind.channel:
            return _ChannelTile(
              key: ValueKey<String>(entry.channel!.id),
              channel: entry.channel!,
              isSelected: entry.channel!.id == selectedId,
              guildId: guildId!,
              guild: guild!,
            );
          case GuildSidebarEntryKind.voiceParticipants:
            return VoiceChannelParticipantsList(
              key: ValueKey<String>('vp:${entry.channel!.id}'),
              guildId: entry.guildId!,
              channelId: entry.channel!.id,
            );
        }
      },
    );
  }
}

class _ChannelTile extends ConsumerWidget {
  const _ChannelTile({
    required this.channel,
    required this.isSelected,
    required this.guildId,
    required this.guild,
    super.key,
  });

  final Channel channel;
  final bool isSelected;
  final String guildId;
  final Guild guild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unread = ref.watch(channelUnreadProvider(channel.id)).value;
    final bool hasUnread = unread?.hasUnread ?? false;
    final int mentionCount = unread?.mentionCount ?? 0;
    final bool hasUnreadMessages = unread?.hasUnreadMessages ?? false;
    final bool isChannelDirectlyMuted = ref.watch(
      mutedChannelIdsProvider(
        guildId,
      ).select((a) => (a.value ?? const <String>{}).contains(channel.id)),
    );
    final bool showFadedUnread = ref.watch(
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
    final bool hasTyping = ref.watch(channelHasTypingProvider(channel.id));
    final int? connectPermissionBits = ref
        .watch(channelSidebarIconConnectBitsProvider(channel.id))
        .value;
    final int? effectivePermissionBits = ref
        .watch(effectiveGuildChannelPermissionBitsProvider(channel.id))
        .value;

    final bool isVoice = channel.type == ChannelType.voice;
    final String? connectedVoiceGuildId = isVoice
        ? ref.watch(
            voiceSessionProvider.select((VoiceSessionState s) => s.guildId),
          )
        : null;
    final String? connectedVoiceChannelId = isVoice
        ? ref.watch(
            voiceSessionProvider.select((VoiceSessionState s) => s.channelId),
          )
        : null;
    final bool showE2eeVoiceIcon =
        isVoice &&
        guild.hasVoiceE2ee &&
        ref.watch(
          voiceStatesMapProvider.select(
            (Map<String, VoiceState> map) => isVoiceChannelE2eeEncryptedForIcon(
              voiceStates: map,
              guildId: guildId,
              channelId: channel.id,
              connectedVoiceGuildId: connectedVoiceGuildId,
              connectedVoiceChannelId: connectedVoiceChannelId,
              guildHasVoiceE2ee: guild.hasVoiceE2ee,
            ),
          ),
        );

    final Color textColor = isSelected
        ? context.colors.textPrimary
        : channelUnreadState.isHighlight
        ? context.colors.textSecondary
        : context.colors.textTertiaryMuted;
    final double rowOpacity = isChannelDirectlyMuted && !isSelected ? 0.5 : 1.0;
    final bool showUnreadIndicator =
        !isSelected && channelUnreadState.shouldShowUnreadIndicator;

    final int voiceUserLimit = channel.userLimit ?? 0;
    final bool showVoiceUserCount =
        isVoice && voiceUserLimit > 0 && !isSelected && mentionCount == 0;
    final int voiceCurrentCount = showVoiceUserCount
        ? ref.watch(
            voiceChannelMemberCountProvider(
              voiceChannelParticipantsFamilyKey(guildId, channel.id),
            ),
          )
        : 0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (showUnreadIndicator)
          Positioned(
            left: 1,
            top: 0,
            bottom: 0,
            child: Center(
              child: ChannelUnreadIndicator(
                faded: channelUnreadState.isUnreadIndicatorMuted,
              ),
            ),
          ),
        Opacity(
          opacity: rowOpacity,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onSecondaryTapUp: (details) => unawaited(
                _showChannelActions(
                  context,
                  ref,
                  hasUnread: hasUnread,
                  position: details.globalPosition,
                ),
              ),
              onLongPress: isMobileLayout(context)
                  ? () => unawaited(
                      _showChannelActions(
                        context,
                        ref,
                        hasUnread: hasUnread,
                        position: Offset.zero,
                      ),
                    )
                  : null,
              onTap: () async {
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
                      effectivePermissionBits: connectPermissionBits,
                      canConnectPermissionBits: connectPermissionBits,
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
                      RepaintBoundary(
                        child: FluxerLoadingSpinner(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                    if (!isSelected &&
                        mentionCount > 0 &&
                        channelUnreadState.hasMentions) ...[
                      const SizedBox(width: 4),
                      FluxerBadge.count(count: mentionCount),
                    ],
                    if (showVoiceUserCount) ...[
                      const SizedBox(width: 4),
                      VoiceChannelUserCount(
                        currentUserCount: voiceCurrentCount,
                        userLimit: voiceUserLimit,
                      ),
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
    WidgetRef ref, {
    required bool hasUnread,
    required Offset position,
  }) async {
    final l10n = FluxerLocalizations.of(context);
    final bool showFavorites = ref.read(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    final bool isFavorite =
        showFavorites &&
        await ref
            .read(favoriteChannelsRepositoryProvider)
            .isFavorite(channel.id);
    final bool canMute = _canMuteChannel(channel);
    final bool canMarkRead = _canMarkChannelRead(channel);
    final bool developerMode = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final bool canOpenLink =
        channel.type == ChannelType.link && (channel.url?.isNotEmpty ?? false);
    final int? permissionBits =
        ref
            .read(effectiveGuildChannelPermissionBitsProvider(channel.id))
            .value ??
        ref.read(channelPermissionCacheProvider)[channel.id];
    final bool canManageChannel =
        permissionBits != null &&
        hasPermission(permissionBits, Permission.manageChannels);
    final Set<String> mutedIds =
        ref.read(mutedChannelIdsProvider(guildId)).value ?? const <String>{};
    final bool isMuted = mutedIds.contains(channel.id);
    final muteConfig = await _loadChannelMuteConfig(ref, guildId, channel.id);
    final String? mutedHint = isMuted ? formatMutedHintText(muteConfig) : null;
    if (!context.mounted) {
      return;
    }
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => [
        if (canMarkRead)
          FluxerMenuItem(
            label: 'Mark as Read',
            icon: PhosphorIconsRegular.envelopeOpen,
            enabled: hasUnread,
            onPressed: () {
              close();
              unawaited(_readStateRepository(ref).ackLatest(channel.id));
            },
          ),
        if (showFavorites)
          FluxerMenuItem(
            label: isFavorite ? 'Remove from Favorites' : 'Add to Favorites',
            icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
            onPressed: () {
              close();
              unawaited(_toggleFavorite(ref, isFavorite: isFavorite));
            },
          ),
        if (canOpenLink)
          FluxerMenuItem(
            label: 'Open Link',
            icon: PhosphorIconsRegular.arrowSquareOut,
            onPressed: () {
              close();
              final uri = Uri.tryParse(channel.url ?? '');
              if (uri != null) {
                unawaited(
                  openExternalUrl(
                    uri,
                    style: ExternalUrlBrowserStyle.fromColorTheme(
                      menuContext.colors,
                    ),
                  ),
                );
              }
            },
          ),
        FluxerMenuItem(
          label: 'Copy Link',
          icon: PhosphorIconsRegular.link,
          onPressed: () {
            close();
            unawaited(
              _copyToClipboard(ref, channelLink(channel.id, channel.guildId)),
            );
          },
        ),
        if (canMute)
          FluxerMenuItem(
            label: isMuted
                ? l10n.notificationUnmuteChannel
                : l10n.notificationMuteChannel,
            icon: isMuted
                ? PhosphorIconsRegular.bell
                : PhosphorIconsRegular.bellSlash,
            hint: mutedHint,
            onPressed: () {
              unawaited(
                _openChannelMuteSheet(
                  menuContext,
                  ref,
                  close: close,
                  isMuted: isMuted,
                  muteConfig: muteConfig,
                ),
              );
            },
          ),
        if (canMarkRead)
          FluxerMenuItem(
            label: 'Notification Settings',
            icon: PhosphorIconsRegular.bell,
            onPressed: () {
              close();
              unawaited(
                showChannelNotificationSettingsSheet(
                  menuContext,
                  channel: channel,
                  onSetNotification: (setting) async {
                    await ref
                        .read(guildUserSettingsRepositoryProvider)
                        .updateChannelOverride(
                          guildId: channel.guildId,
                          channelId: channel.id,
                          messageNotifications: setting,
                        );
                    ref
                        .read(toastProvider.notifier)
                        .show(
                          const FluxerToast(
                            message: 'Notification settings updated',
                            variant: FluxerToastVariant.success,
                          ),
                        );
                  },
                ),
              );
            },
          ),
        if (developerMode)
          FluxerMenuItem(
            label: 'Debug Channel',
            icon: PhosphorIconsRegular.bug,
            onPressed: () {
              close();
              unawaited(_showDebugChannelSheet(menuContext, ref));
            },
          ),
        FluxerMenuItem(
          label: 'Copy Channel ID',
          icon: PhosphorIconsRegular.copy,
          onPressed: () {
            close();
            unawaited(_copyToClipboard(ref, channel.id));
          },
        ),
        if (canManageChannel)
          FluxerMenuItem(
            label: 'Delete Channel',
            icon: PhosphorIconsRegular.trash,
            isDanger: true,
            onPressed: () {
              close();
              unawaited(_confirmDeleteChannel(menuContext, ref));
            },
          ),
      ],
    );
  }

  Future<void> _showDebugChannelSheet(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final channelResponse = await ref
          .read(fluxerClientProvider)
          .channels
          .getChannel(channelId: channel.id);
      if (!context.mounted) {
        return;
      }
      await showDebugBottomSheet(
        context,
        title: FluxerLocalizations.of(context).dmDebugChannel,
        data: channelResponse.toJson(),
        onCopied: (message) => ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: message,
                variant: FluxerToastVariant.success,
              ),
            ),
      );
    } on Exception catch (_) {
      // Ignore — failed to fetch channel for debug view.
    }
  }

  Future<void> _confirmDeleteChannel(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await FluxerConfirmSheet.show(
      context,
      title: 'Delete Channel',
      description:
          'Are you sure you want to delete #${channel.name}? '
          'This action cannot be undone.',
      confirmLabel: 'Delete Channel',
      isDanger: true,
      onConfirm: () => unawaited(_deleteChannel(ref)),
    );
  }

  Future<void> _deleteChannel(WidgetRef ref) async {
    final toast = ref.read(toastProvider.notifier);
    try {
      await ref
          .read(fluxerClientProvider)
          .channels
          .deleteChannel(
            channelId: channel.id,
            body: const SudoVerificationSchema(),
          );
      toast.show(
        const FluxerToast(
          message: 'Channel deleted',
          variant: FluxerToastVariant.success,
        ),
      );
    } on Object {
      toast.show(
        const FluxerToast(
          message: 'Failed to delete channel',
          variant: FluxerToastVariant.danger,
        ),
      );
    }
  }

  Future<void> _openChannelMuteSheet(
    BuildContext context,
    WidgetRef ref, {
    required VoidCallback close,
    required bool isMuted,
    required ChannelOverridesMuteConfig? muteConfig,
  }) async {
    final l10n = FluxerLocalizations.of(context);
    final selection = await showMuteDurationSheet(
      context,
      isMuted: isMuted,
      muteConfig: muteConfig,
      muteTitle: l10n.notificationMuteChannel,
      unmuteTitle: l10n.notificationUnmuteChannel,
      useRootNavigator: isMobileLayout(context),
    );
    if (selection == null) {
      return;
    }
    close();
    final String resolvedGuildId = guildId.isNotEmpty
        ? guildId
        : channel.guildId;
    if (resolvedGuildId.isEmpty) {
      return;
    }
    await ref
        .read(guildUserSettingsRepositoryProvider)
        .updateChannelOverride(
          guildId: resolvedGuildId,
          channelId: channel.id,
          muted: selection.muted,
          durationSeconds: selection.durationSeconds,
        );
  }

  Future<void> _toggleFavorite(
    WidgetRef ref, {
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
}

class _CategoryHeader extends ConsumerWidget {
  const _CategoryHeader({
    required this.category,
    required this.isCollapsed,
    required this.guildId,
    super.key,
  });

  final ChannelCategory category;
  final bool isCollapsed;
  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        unawaited(
          ref
              .read(guildUserSettingsRepositoryProvider)
              .toggleCategoryCollapsed(
                guildId: guildId,
                categoryId: category.id,
              ),
        );
      },
      onSecondaryTapUp: (details) =>
          unawaited(_showCategoryActions(context, ref, details.globalPosition)),
      onLongPress: isMobileLayout(context)
          ? () => unawaited(_showCategoryActions(context, ref, Offset.zero))
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

  Future<void> _showCategoryActions(
    BuildContext context,
    WidgetRef ref,
    Offset position,
  ) async {
    final List<String> channelIds = category.channels
        .where(_canMarkChannelRead)
        .map((channel) => channel.id)
        .toList();
    final Set<String> mutedIds =
        ref.read(mutedChannelIdsProvider(guildId)).value ?? const <String>{};
    final bool isMuted = mutedIds.contains(category.id);
    final muteConfig = await _loadChannelMuteConfig(ref, guildId, category.id);
    final String? mutedHint = isMuted ? formatMutedHintText(muteConfig) : null;
    if (!context.mounted) {
      return;
    }
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => [
        FluxerMenuItem(
          label: 'Mark Category as Read',
          icon: PhosphorIconsRegular.envelopeOpen,
          enabled: channelIds.isNotEmpty,
          onPressed: () {
            close();
            unawaited(_readStateRepository(ref).ackLatestBulk(channelIds));
          },
        ),
        FluxerMenuItem(
          label: isMuted ? 'Unmute Category' : 'Mute Category',
          icon: isMuted
              ? PhosphorIconsRegular.bell
              : PhosphorIconsRegular.bellSlash,
          hint: mutedHint,
          onPressed: () {
            unawaited(
              _openCategoryMuteSheet(
                menuContext,
                ref,
                close: close,
                isMuted: isMuted,
                muteConfig: muteConfig,
              ),
            );
          },
        ),
        FluxerMenuItem(
          label: 'Copy Category ID',
          icon: PhosphorIconsRegular.copy,
          onPressed: () {
            close();
            unawaited(_copyToClipboard(ref, category.id));
          },
        ),
      ],
    );
  }

  Future<void> _openCategoryMuteSheet(
    BuildContext context,
    WidgetRef ref, {
    required VoidCallback close,
    required bool isMuted,
    required ChannelOverridesMuteConfig? muteConfig,
  }) async {
    final selection = await showMuteDurationSheet(
      context,
      isMuted: isMuted,
      muteConfig: muteConfig,
      muteTitle: 'Mute Category',
      unmuteTitle: 'Unmute Category',
      useRootNavigator: isMobileLayout(context),
    );
    if (selection == null) {
      return;
    }
    close();
    await ref
        .read(guildUserSettingsRepositoryProvider)
        .updateChannelOverride(
          guildId: guildId,
          channelId: category.id,
          muted: selection.muted,
          durationSeconds: selection.durationSeconds,
        );
  }
}

ReadStateRepository _readStateRepository(WidgetRef ref) => ReadStateRepository(
  ref.read(fluxerClientProvider),
  ref.read(fluxerDatabaseProvider),
);

Future<void> _copyToClipboard(WidgetRef ref, String value) async {
  await Clipboard.setData(ClipboardData(text: value));
  ref
      .read(toastProvider.notifier)
      .show(
        const FluxerToast(
          message: 'Copied to clipboard',
          variant: FluxerToastVariant.success,
        ),
      );
}

Future<ChannelOverridesMuteConfig?> _loadChannelMuteConfig(
  WidgetRef ref,
  String guildId,
  String channelId,
) async {
  final row = await ref
      .read(fluxerDatabaseProvider)
      .userGuildSettingsDao
      .getByGuildId(guildId);
  if (row == null) {
    return null;
  }
  try {
    final settings = UserGuildSettingsResponse.fromJson(
      jsonDecode(row.data) as Map<String, dynamic>,
    );
    return settings.channelOverrides?[channelId]?.muteConfig;
  } on Object {
    return null;
  }
}

bool _canMarkChannelRead(Channel channel) =>
    channel.type != ChannelType.category && channel.type != ChannelType.link;

bool _canMuteChannel(Channel channel) =>
    channel.type == ChannelType.text || channel.type == ChannelType.voice;
