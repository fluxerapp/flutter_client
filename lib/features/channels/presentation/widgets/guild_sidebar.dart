import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math' as math;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/presentation/category_menu_data.dart';
import 'package:fluxer_app/features/channels/presentation/channel_menu_data.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_flow.dart';
import 'package:fluxer_app/features/channels/presentation/delete_channel_flow.dart';
import 'package:fluxer_app/features/channels/presentation/modals/show_channel_invite_modal.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_notification_settings_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_list_typing_indicator.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar_skeleton.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/voice_channel_participants.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/voice_channel_user_count.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_entries_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_scroll_store_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/channels/utils/channel_scroll_indicator_severity.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/channels/utils/show_channel_debug_sheet.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/members/utils/guild_members_page_permissions.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_member_count_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/navigation_item_semantics.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildSidebar extends ConsumerStatefulWidget {
  const GuildSidebar({super.key});

  @override
  ConsumerState<GuildSidebar> createState() => _GuildSidebarState();
}

class _GuildSidebarState extends ConsumerState<GuildSidebar> {
  Future<void> _handleServerHeaderTap(BuildContext context, Guild guild) async {
    if (isMobileLayout(context)) {
      await presentGuildMenuSheet(context, ref, guild: guild);
      return;
    }

    await ref
        .read(guildPermissionsProvider.notifier)
        .refreshPermissions(guild.id);
    if (!context.mounted) {
      return;
    }

    final int permissions = ref.read(guildPermissionsProvider)[guild.id] ?? 0;
    if (canOpenGuildSettingsForRef(
      ref: ref,
      permissions: permissions,
      guild: guild,
    )) {
      await context.push(RoutePaths.guildSettingsPath(guild.id));
      return;
    }

    await presentGuildMenuSheet(context, ref, guild: guild);
  }

  @override
  Widget build(BuildContext context) {
    final Guild? guild = ref.watch(
      channelListViewModelProvider.select((s) => s.guild),
    );
    final String? guildId = ref.watch(activeGuildIdProvider);
    final bool hasReceivedInitialChannelList = ref.watch(
      channelListViewModelProvider.select(
        (s) => s.hasReceivedInitialChannelList,
      ),
    );
    final bool guildReady =
        guild != null && guildId != null && guild.id == guildId;

    return Container(
      width: isMobileLayout(context) ? null : 240,
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      decoration: BoxDecoration(
        color: context.colors.channelSidebarBackground,
        border: Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: Column(
        children: [
          _buildServerHeader(context, guild),
          Expanded(
            child: !guildReady || !hasReceivedInitialChannelList
                ? const GuildSidebarSkeleton()
                : _GuildSidebarChannelListHost(
                    activeGuildId: guildId,
                    guild: guild,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildServerHeader(BuildContext context, Guild? guild) {
    final bool hasImage = guild?.banner != null;
    const double headerHeight = 56;
    final List<Shadow> bannerShadows = hasImage
        ? <Shadow>[
            Shadow(
              color: const Color(0xCC000000).withValues(alpha: 0.7),
              offset: const Offset(0, 1),
              blurRadius: 18,
            ),
          ]
        : const <Shadow>[];
    final Color? bannerForegroundColor = hasImage ? Colors.white : null;
    final Widget headerContent = FluxerGestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: guild == null
          ? null
          : () => unawaited(_handleServerHeaderTap(context, guild)),
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
                color: bannerForegroundColor,
                forceBrightness: hasImage ? Brightness.dark : null,
              ),
            ),
          Expanded(
            child: Text(
              guild?.name ?? '',
              style: context.textStyles.channelName.copyWith(
                color: bannerForegroundColor,
                shadows: bannerShadows,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          PhosphorIcon(
            PhosphorIconsFill.caretDown,
            color: bannerForegroundColor ?? context.colors.textChat,
            size: 16,
            shadows: bannerShadows,
          ),
        ],
      ),
    );

    if (hasImage) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double height = guildSidebarBannerHeight(
            width: constraints.maxWidth,
            isMobile: isMobileLayout(context),
          );
          return SizedBox(
            height: height,
            width: double.infinity,
            child: DecoratedBox(
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
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 40,
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              context.colors.guildBannerGradient,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: headerContent,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
    return Container(
      constraints: const BoxConstraints(minHeight: headerHeight),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.colors.channelSidebarBackground,
        border: Border(bottom: BorderSide(color: context.colors.borderColor)),
      ),
      child: headerContent,
    );
  }
}

@visibleForTesting
double guildSidebarBannerHeight({
  required double width,
  required bool isMobile,
  double aspectRatio = Breakpoints.guildBannerAspectRatio,
  double mobileMaxHeight = Breakpoints.mobileGuildBannerMaxHeight,
}) {
  if (width <= 0) {
    return 0;
  }
  final double naturalHeight = width / aspectRatio;
  if (!isMobile) {
    return naturalHeight;
  }
  return math.min(naturalHeight, mobileMaxHeight);
}

const int _maxCachedGuildChannelLists = 5;

class _GuildSidebarChannelListHost extends StatefulWidget {
  const _GuildSidebarChannelListHost({
    required this.activeGuildId,
    required this.guild,
  });

  final String activeGuildId;
  final Guild guild;

  @override
  State<_GuildSidebarChannelListHost> createState() =>
      _GuildSidebarChannelListHostState();
}

class _GuildSidebarChannelListHostState
    extends State<_GuildSidebarChannelListHost> {
  final LinkedHashMap<String, Guild> _guildsById =
      LinkedHashMap<String, Guild>();

  void _rememberActiveGuild() {
    final String guildId = widget.activeGuildId;
    _guildsById
      ..remove(guildId)
      ..[guildId] = widget.guild;
    while (_guildsById.length > _maxCachedGuildChannelLists) {
      _guildsById.remove(_guildsById.keys.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    _rememberActiveGuild();
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        for (final MapEntry<String, Guild> entry in _guildsById.entries)
          Offstage(
            offstage: entry.key != widget.activeGuildId,
            child: _GuildSidebarChannelList(
              key: ValueKey<String>(entry.key),
              guildId: entry.key,
              guild: entry.value,
              isActive: entry.key == widget.activeGuildId,
            ),
          ),
      ],
    );
  }
}

class _GuildSidebarChannelList extends ConsumerStatefulWidget {
  const _GuildSidebarChannelList({
    required this.guildId,
    required this.guild,
    required this.isActive,
    super.key,
  });

  final String guildId;
  final Guild guild;
  final bool isActive;

  @override
  ConsumerState<_GuildSidebarChannelList> createState() =>
      _GuildSidebarChannelListState();
}

class _GuildSidebarChannelListState
    extends ConsumerState<_GuildSidebarChannelList> {
  static const double _scrollRestoreStep = 480;

  late final ScrollController _scrollController;
  late final GuildScrollIndicatorController _scrollIndicator;
  final Map<String, GlobalKey> _channelKeys = <String, GlobalKey>{};
  bool _restoring = false;
  bool _needsScrollClamp = false;
  bool _deferChannelList = false;
  GuildSidebarScrollStore? _scrollStore;
  Widget? _inactiveList;

  double _savedScrollOffset() => _scrollStore?.offsetFor(widget.guildId) ?? 0;

  void _syncScrollRestoreState() {
    final bool hasSavedOffset = _savedScrollOffset() > 0;
    _needsScrollClamp = hasSavedOffset;
    _deferChannelList = widget.isActive && hasSavedOffset;
  }

  void _refreshGuildPermissions() {
    unawaited(
      ref
          .read(guildPermissionsProvider.notifier)
          .refreshPermissions(widget.guildId),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollStore = ref.read(guildSidebarScrollStoreProvider);
    _syncScrollRestoreState();
    _scrollController = ScrollController()..addListener(_persistScroll);
    _scrollIndicator = GuildScrollIndicatorController(
      scrollController: _scrollController,
      itemKeys: _channelKeys,
      resolveSeverity: _resolveChannelScrollSeverity,
      isMounted: () => mounted,
    )..attach();
    if (widget.isActive) {
      _refreshGuildPermissions();
      _scheduleScrollRestore();
    }
  }

  @override
  void didUpdateWidget(_GuildSidebarChannelList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isActive && widget.isActive) {
      _refreshGuildPermissions();
      _syncScrollRestoreState();
      _scheduleScrollRestore();
    }
  }

  void _scheduleScrollRestore() {
    if (_deferChannelList) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !widget.isActive) {
          return;
        }
        setState(() {
          _deferChannelList = false;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || !widget.isActive) {
            return;
          }
          _clampScrollOffset();
        });
      });
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !widget.isActive) {
        return;
      }
      _clampScrollOffset();
      _scrollIndicator.scheduleUpdate();
    });
  }

  @override
  void deactivate() {
    _persistScroll();
    super.deactivate();
  }

  @override
  void dispose() {
    _persistScroll();
    _scrollController
      ..removeListener(_persistScroll)
      ..dispose();
    _scrollIndicator.detach();
    super.dispose();
  }

  GuildScrollIndicatorSeverity? _resolveChannelScrollSeverity(
    String channelId,
  ) {
    return channelScrollIndicatorSeverity(
      ref: ref,
      guildId: widget.guildId,
      channelId: channelId,
    );
  }

  void _persistScroll() {
    if (_restoring) {
      return;
    }
    if (_scrollStore != null && _scrollController.hasClients) {
      _scrollStore!.setOffset(widget.guildId, _scrollController.offset);
    }
  }

  void _clampScrollOffset() {
    if (!_needsScrollClamp || !_scrollController.hasClients) {
      return;
    }
    final double maxExtent = _scrollController.position.maxScrollExtent;
    if (maxExtent <= 0) {
      return;
    }
    final double target = _savedScrollOffset().clamp(0.0, maxExtent);
    final double current = _scrollController.offset;
    if (current >= target - 0.5) {
      _restoring = true;
      _scrollController.jumpTo(target);
      _restoring = false;
      setState(() {
        _needsScrollClamp = false;
      });
      _scrollIndicator.scheduleUpdate();
      return;
    }
    _restoring = true;
    _scrollController.jumpTo((current + _scrollRestoreStep).clamp(0.0, target));
    _restoring = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !widget.isActive) {
        return;
      }
      _clampScrollOffset();
    });
  }

  void _scheduleScrollClamp() {
    if (!_needsScrollClamp) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _clampScrollOffset();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive) {
      return _inactiveList ?? const SizedBox.shrink();
    }
    if (_deferChannelList) {
      return const SizedBox.shrink();
    }
    _scrollStore = ref.read(guildSidebarScrollStoreProvider);
    final List<GuildSidebarEntry> sidebarEntries = ref.watch(
      guildSidebarEntriesProvider,
    );
    ref
      ..listen(guildReadStateProvider.select((s) => s[widget.guildId]), (_, _) {
        _scrollIndicator.scheduleUpdate();
      })
      ..listen<List<GuildSidebarEntry>>(guildSidebarEntriesProvider, (
        List<GuildSidebarEntry>? previous,
        List<GuildSidebarEntry> next,
      ) {
        _scrollIndicator.scheduleUpdate();
        if (_needsScrollClamp && next.isNotEmpty) {
          _scheduleScrollClamp();
        }
      });
    final String? selectedId = ref.watch(activeChannelIdProvider);
    final RouteState routeState = ref.watch(routeStateProvider);
    final bool showMembersEntry =
        !isMobileLayout(context) &&
        hasMembersPagePermission(
          ref.watch(guildPermissionsProvider)[widget.guildId] ?? 0,
        );
    final bool isMembersSelected =
        routeState.kind == RouteKind.guildMembers &&
        routeState.guildId == widget.guildId;
    final int membersOffset = showMembersEntry ? 2 : 0;
    final Widget channelListView = ListView.builder(
      controller: _scrollController,
      scrollCacheExtent: const ScrollCacheExtent.pixels(600),
      padding: const EdgeInsets.only(top: 12),
      itemCount: membersOffset + sidebarEntries.length,
      itemBuilder: (BuildContext context, int index) {
        if (showMembersEntry) {
          if (index == 0) {
            return _MembersSidebarTile(
              guildId: widget.guildId,
              isSelected: isMembersSelected,
            );
          }
          if (index == 1) {
            return Divider(
              height: 1,
              indent: 12,
              endIndent: 12,
              color: context.colors.borderColor,
            );
          }
          index -= membersOffset;
        }
        final GuildSidebarEntry entry = sidebarEntries[index];
        switch (entry.kind) {
          case GuildSidebarEntryKind.categoryHeader:
            return _CategoryHeader(
              key: ValueKey<String>('cat:${entry.category!.id}'),
              category: entry.category!,
              isCollapsed: entry.isCategoryCollapsed,
              guildId: widget.guildId,
            );
          case GuildSidebarEntryKind.channel:
            final String channelId = entry.channel!.id;
            return RepaintBoundary(
              child: _ChannelTile(
                key: ValueKey<String>(channelId),
                tileKey: _channelKeys.putIfAbsent(channelId, GlobalKey.new),
                channel: entry.channel!,
                isSelected: channelId == selectedId,
                guildId: widget.guildId,
                guild: widget.guild,
              ),
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
    final Widget child = ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: GuildScrollIndicatorLayer(
        controller: _scrollIndicator,
        label: FluxerLocalizations.of(context).scrollIndicatorNewMessage,
        child: Opacity(
          opacity: _needsScrollClamp ? 0 : 1,
          child: channelListView,
        ),
      ),
    );
    _inactiveList = child;
    return child;
  }
}

class _ChannelTile extends ConsumerWidget {
  const _ChannelTile({
    required this.channel,
    required this.isSelected,
    required this.guildId,
    required this.guild,
    this.tileKey,
    super.key,
  });

  final Channel channel;
  final bool isSelected;
  final String guildId;
  final Guild guild;
  final GlobalKey? tileKey;

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
    final int? cachedPermissionBits = ref.watch(
      channelPermissionCacheProvider.select(
        (ChannelPermissionCaches caches) => caches[channel.id],
      ),
    );
    final int? connectPermissionBits =
        cachedPermissionBits ??
        ref.watch(channelSidebarIconConnectBitsProvider(channel.id)).value;
    final int? effectivePermissionBits = cachedPermissionBits;

    final bool isVoice = channel.type == ChannelType.guildVoice;
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

    final double rowOpacity = isChannelDirectlyMuted && !isSelected ? 0.5 : 1.0;
    final Color baseTextColor = isSelected
        ? context.colors.textPrimary
        : channelUnreadState.isHighlight
        ? context.colors.textSecondary
        : context.colors.textTertiaryMuted;
    final Color textColor = rowOpacity < 1
        ? baseTextColor.withValues(alpha: baseTextColor.a * rowOpacity)
        : baseTextColor;
    final bool showUnreadOnSelectedChannel = isMobileLayout(context);
    final bool showUnreadIndicator =
        channelUnreadState.shouldShowUnreadIndicator &&
        (showUnreadOnSelectedChannel || !isSelected);
    final bool showMentionBadge =
        mentionCount > 0 &&
        channelUnreadState.hasMentions &&
        (showUnreadOnSelectedChannel || !isSelected);

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
      key: tileKey,
      clipBehavior: Clip.none,
      children: [
        if (showUnreadIndicator)
          ChannelUnreadIndicator.positioned(
            faded: channelUnreadState.isUnreadIndicatorMuted,
          ),
        FluxerSelectableRow(
          isSelected: isSelected,
          selectedColor: context.colors.backgroundModifierSelected,
          borderRadius: BorderRadius.circular(4),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          semanticLabel: navigationItemSemanticLabel(
            l10n: FluxerLocalizations.of(context),
            name: channel.name,
            isSelected: isSelected,
            hasUnread: showUnreadIndicator,
            mentionCount: showMentionBadge ? mentionCount : 0,
            isMuted: isChannelDirectlyMuted,
          ),
          onSecondaryTapUp: (details) => unawaited(
            _showChannelActions(
              context,
              ref,
              hasUnread: hasUnread,
              position: details.globalPosition,
            ),
          ),
          onLongPress: isTouchPrimaryInput(ref)
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
              ChannelListTypingIndicator(
                channelId: channel.id,
                guildId: guildId,
                isSelected: isSelected,
              ),
              if (showMentionBadge) ...[
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
    final int? cachedPermissionBits = ref.read(
      channelPermissionCacheProvider,
    )[channel.id];
    final int? permissionBits =
        cachedPermissionBits ??
        await ref.read(
          effectiveGuildChannelPermissionBitsProvider(channel.id).future,
        );
    final Set<String> mutedIds =
        ref.read(mutedChannelIdsProvider(guildId)).value ?? const <String>{};
    final bool isMuted = mutedIds.contains(channel.id);
    final muteConfig = await _loadChannelMuteConfig(ref, guildId, channel.id);
    final String? mutedHint = isMuted ? formatMutedHintText(muteConfig) : null;
    final bool developerMode = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final bool nsfwAllowed = ref.read(sensitiveContentProvider).nsfwAllowed;
    final bool hasAgreedToMatureContent = ref
        .read(matureContentAgreementsProvider)
        .agreedChannelIds
        .contains(channel.id);
    final Channel? parentCategory = await _loadParentCategory(ref, channel);
    if (!context.mounted) {
      return;
    }
    final ChannelMenuState menuState = resolveChannelMenuState(
      channel: channel,
      guild: guild,
      parentCategory: parentCategory,
      permissionBits: permissionBits,
      hasUnread: hasUnread,
      showFavorites: showFavorites,
      isFavorite: isFavorite,
      isMuted: isMuted,
      developerMode: developerMode,
      nsfwAllowed: nsfwAllowed,
      hasAgreedToMatureContent: hasAgreedToMatureContent,
      voiceChannelJoinRequiresDoubleClick: ref.read(
        advancedPreferencesProvider.select(
          (state) => state.voiceChannelJoinRequiresDoubleClick,
        ),
      ),
      mutedHint: mutedHint,
    );
    final List<ChannelMenuGroup> groups = buildChannelMenuGroups(
      l10n: l10n,
      state: menuState,
    );
    if (isMobileLayout(context)) {
      return FluxerBottomSheet.showScrollable<void>(
        context,
        title: channel.name,
        initialChildSize: 0.5,
        minChildSize: 0.25,
        builder: (sheetContext, scrollController, close) {
          return channelMenuGroupsToBottomSheetContent(
            context: sheetContext,
            scrollController: scrollController,
            groups: groups,
            menuState: menuState,
            onAction: (ChannelMenuAction action) => _handleChannelMenuAction(
              action,
              hostContext: context,
              menuContext: sheetContext,
              ref: ref,
              close: close,
              menuState: menuState,
            ),
          );
        },
      );
    }
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => channelMenuGroupsToWidgets(
        context: menuContext,
        groups: groups,
        menuState: menuState,
        onAction: (ChannelMenuAction action) => _handleChannelMenuAction(
          action,
          hostContext: context,
          menuContext: menuContext,
          ref: ref,
          close: close,
          menuState: menuState,
        ),
      ),
    );
  }

  Future<Channel?> _loadParentCategory(WidgetRef ref, Channel channel) async {
    final String? parentId = channel.parentId;
    if (parentId == null) {
      return null;
    }
    final row = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(parentId);
    if (row == null) {
      return null;
    }
    final Channel parent = Channel.fromRow(row);
    return parent.isCategory ? parent : null;
  }

  void _handleChannelMenuAction(
    ChannelMenuAction action, {
    required BuildContext hostContext,
    required BuildContext menuContext,
    required WidgetRef ref,
    required VoidCallback close,
    required ChannelMenuState menuState,
  }) {
    switch (action) {
      case ChannelMenuAction.openChat:
        close();
        unawaited(_openVoiceChannelChat(menuContext, ref));
      case ChannelMenuAction.markAsRead:
        close();
        unawaited(_readStateRepository(ref).ackLatest(channel.id));
      case ChannelMenuAction.toggleFavorite:
        close();
        unawaited(_toggleFavorite(ref, isFavorite: menuState.isFavorite));
      case ChannelMenuAction.invitePeople:
        close();
        unawaited(
          showChannelInviteModal(
            hostContext,
            ref,
            channelId: channel.id,
            channelName: channel.name,
            guildId: guildId,
            useVanityUrl: menuState.useVanityInvite,
            vanityUrlCode: menuState.vanityUrlCode,
          ),
        );
      case ChannelMenuAction.openLink:
        close();
        final url = channel.url;
        if (url != null && url.isNotEmpty) {
          unawaited(handleExternalLinkTap(menuContext, url));
        }
      case ChannelMenuAction.copyLink:
        close();
        unawaited(
          copyToClipboard(
            context: menuContext,
            value: channelLink(channel.id, channel.guildId),
          ),
        );
      case ChannelMenuAction.copyRedirectLink:
        close();
        unawaited(copyToClipboard(context: menuContext, value: channel.url!));
      case ChannelMenuAction.mute:
        unawaited(
          _openChannelMuteSheet(
            menuContext,
            ref,
            close: close,
            isMuted: menuState.isMuted,
          ),
        );
      case ChannelMenuAction.notificationSettings:
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
      case ChannelMenuAction.editChannel:
        close();
        unawaited(ChannelSettingsFlow.show(menuContext, channelId: channel.id));
      case ChannelMenuAction.duplicateChannel:
        close();
        _showComingSoon(menuContext, ref);
      case ChannelMenuAction.debugChannel:
        close();
        unawaited(_showDebugChannelSheet(menuContext, ref));
      case ChannelMenuAction.resetMatureContentAgree:
        close();
        unawaited(
          ref
              .read(matureContentAgreementsProvider.notifier)
              .revokeChannelAgreement(channel.id),
        );
      case ChannelMenuAction.copyChannelId:
        close();
        unawaited(copyToClipboard(context: menuContext, value: channel.id));
      case ChannelMenuAction.deleteChannel:
        close();
        unawaited(_confirmDeleteChannel(menuContext, ref));
      case ChannelMenuAction.deleteMyMessages:
        close();
        unawaited(_confirmDeleteMyMessagesInChannel(menuContext, ref));
    }
  }

  Future<void> _openVoiceChannelChat(
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (isMobileLayout(context)) {
      await showVoiceChannelChatSheet(
        context,
        channelId: channel.id,
        channelName: channel.name,
        useRootNavigator: true,
      );
      return;
    }
    navigateToContent(context, RoutePaths.guildChannel(guildId, channel.id));
  }

  void _showComingSoon(BuildContext context, WidgetRef ref) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: FluxerLocalizations.of(context).comingSoon));
  }

  Future<void> _confirmDeleteMyMessagesInChannel(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await FluxerConfirmModal.show(
      context,
      title: l10n.channelMenuDeleteMyMessagesTitle,
      description: l10n.channelMenuDeleteMyMessagesDescription,
      confirmLabel: l10n.channelMenuDeleteMyMessagesConfirm,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true) {
      return;
    }
    final toast = ref.read(toastProvider.notifier);
    try {
      await ref
          .read(fluxerClientProvider)
          .channels
          .bulkDeleteMyMessagesInChannel(
            channelId: channel.id,
            body: const SudoVerificationSchema(),
          );
      toast.show(
        FluxerToast(
          message: l10n.channelMenuDeletedYourMessages,
          variant: FluxerToastVariant.success,
        ),
      );
    } on Object {
      toast.show(
        FluxerToast(
          message: l10n.channelMenuCouldNotDeleteYourMessages,
          variant: FluxerToastVariant.danger,
        ),
      );
    }
  }

  Future<void> _showDebugChannelSheet(BuildContext context, WidgetRef ref) =>
      showChannelDebugSheet(
        context,
        ref: ref,
        channelId: channel.id,
        title: FluxerLocalizations.of(context).dmDebugChannel,
      );

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
  }) async {
    final String resolvedGuildId = guildId.isNotEmpty
        ? guildId
        : channel.guildId;
    if (resolvedGuildId.isEmpty) {
      close();
      return;
    }
    final repository = ref.read(guildUserSettingsRepositoryProvider);
    if (isMuted) {
      close();
      await repository.updateChannelOverride(
        guildId: resolvedGuildId,
        channelId: channel.id,
        muted: false,
      );
      return;
    }
    final l10n = FluxerLocalizations.of(context);
    final selection = await showMuteDurationSheet(
      context,
      muteTitle: l10n.notificationMuteChannel,
      useRootNavigator: isMobileLayout(context),
    );
    if (selection == null) {
      return;
    }
    close();
    await repository.updateChannelOverride(
      guildId: resolvedGuildId,
      channelId: channel.id,
      muted: true,
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
    return Semantics(
      button: true,
      expanded: !isCollapsed,
      label: category.name,
      child: ExcludeSemantics(
        child: InkWell(
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
          onSecondaryTapUp: (details) => unawaited(
            _showCategoryActions(context, ref, details.globalPosition),
          ),
          onLongPress: isTouchPrimaryInput(ref)
              ? () => unawaited(_showCategoryActions(context, ref, Offset.zero))
              : null,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 8,
              top: 16,
              bottom: 4,
            ),
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
                      ? PhosphorIconsBold.caretRight
                      : PhosphorIconsBold.caretDown,
                  size: 12,
                  color: context.colors.textPrimaryMuted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showCategoryActions(
    BuildContext context,
    WidgetRef ref,
    Offset position,
  ) async {
    final l10n = FluxerLocalizations.of(context);
    final List<ChannelCategory> allCategories = ref
        .read(channelListViewModelProvider)
        .categories;
    final List<String> allCategoryIds = allCategories
        .where((ChannelCategory category) => !category.isUncategorized)
        .map((ChannelCategory category) => category.id)
        .toList();
    final List<String> channelIds = category.channels
        .where(_canMarkChannelRead)
        .map((Channel channel) => channel.id)
        .toList();
    final bool hasUnread = channelIds.any((String channelId) {
      return ref.read(channelUnreadProvider(channelId)).value?.hasUnread ??
          false;
    });
    final Set<String> mutedIds =
        ref.read(mutedChannelIdsProvider(guildId)).value ?? const <String>{};
    final bool isMuted = mutedIds.contains(category.id);
    final ChannelOverridesMuteConfig? muteConfig = await _loadChannelMuteConfig(
      ref,
      guildId,
      category.id,
    );
    final String? mutedHint = isMuted ? formatMutedHintText(muteConfig) : null;
    final bool developerMode = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final bool hasAgreedToMatureContent = ref
        .read(matureContentAgreementsProvider.notifier)
        .hasAgreedToCategory(category.id);
    final int? cachedPermissionBits = ref.read(
      channelPermissionCacheProvider,
    )[category.id];
    final int? permissionBits =
        cachedPermissionBits ??
        await ref.read(
          effectiveGuildChannelPermissionBitsProvider(category.id).future,
        );
    final Set<String> collapsedCategoryIds = await ref.read(
      guildCollapsedCategoriesProvider(guildId).future,
    );
    final bool allCategoriesCollapsed =
        allCategoryIds.isNotEmpty &&
        allCategoryIds.every(collapsedCategoryIds.contains);
    if (!context.mounted) {
      return;
    }
    final CategoryMenuState menuState = resolveCategoryMenuState(
      hasUnread: hasUnread,
      isCollapsed: isCollapsed,
      allCategoriesCollapsed: allCategoriesCollapsed,
      isMuted: isMuted,
      canManageChannels:
          permissionBits != null &&
          hasPermission(permissionBits, Permission.manageChannels),
      developerMode: developerMode,
      hasAgreedToMatureContent: hasAgreedToMatureContent,
      mutedHint: mutedHint,
    );
    final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
      l10n: l10n,
      state: menuState,
    );
    if (isMobileLayout(context)) {
      return FluxerBottomSheet.showScrollable<void>(
        context,
        title: category.name,
        initialChildSize: 0.5,
        minChildSize: 0.25,
        builder: (sheetContext, scrollController, close) {
          return categoryMenuGroupsToBottomSheetContent(
            context: sheetContext,
            scrollController: scrollController,
            groups: groups,
            menuState: menuState,
            onAction: (CategoryMenuAction action) => _handleCategoryMenuAction(
              action,
              menuContext: sheetContext,
              parentContext: context,
              ref: ref,
              close: close,
              menuState: menuState,
              channelIds: channelIds,
              allCategoryIds: allCategoryIds,
            ),
          );
        },
      );
    }
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => categoryMenuGroupsToWidgets(
        context: menuContext,
        groups: groups,
        menuState: menuState,
        onAction: (CategoryMenuAction action) => _handleCategoryMenuAction(
          action,
          menuContext: menuContext,
          parentContext: context,
          ref: ref,
          close: close,
          menuState: menuState,
          channelIds: channelIds,
          allCategoryIds: allCategoryIds,
        ),
      ),
    );
  }

  void _handleCategoryMenuAction(
    CategoryMenuAction action, {
    required BuildContext menuContext,
    required BuildContext parentContext,
    required WidgetRef ref,
    required VoidCallback close,
    required CategoryMenuState menuState,
    required List<String> channelIds,
    required List<String> allCategoryIds,
  }) {
    switch (action) {
      case CategoryMenuAction.markAsRead:
        close();
        unawaited(_readStateRepository(ref).ackLatestBulk(channelIds));
      case CategoryMenuAction.toggleCollapse:
        close();
        unawaited(
          ref
              .read(guildUserSettingsRepositoryProvider)
              .toggleCategoryCollapsed(
                guildId: guildId,
                categoryId: category.id,
              ),
        );
      case CategoryMenuAction.toggleCollapseAll:
        close();
        unawaited(
          ref
              .read(guildUserSettingsRepositoryProvider)
              .toggleAllCategoriesCollapsed(
                guildId: guildId,
                categoryIds: allCategoryIds,
              ),
        );
      case CategoryMenuAction.mute:
        unawaited(
          _openCategoryMuteSheet(
            menuContext,
            ref,
            close: close,
            isMuted: menuState.isMuted,
          ),
        );
      case CategoryMenuAction.editCategory:
        close();
        unawaited(
          ChannelSettingsFlow.show(menuContext, channelId: category.id),
        );
      case CategoryMenuAction.deleteCategory:
        close();
        unawaited(_deleteCategory(parentContext, ref));
      case CategoryMenuAction.copyCategoryId:
        close();
        unawaited(
          copyToClipboard(
            context: menuContext,
            value: category.id,
            message: FluxerLocalizations.of(menuContext).categoryIdCopied,
          ),
        );
      case CategoryMenuAction.debugCategory:
        close();
        unawaited(_showDebugCategorySheet(menuContext, ref));
      case CategoryMenuAction.resetMatureContentAgree:
        close();
        unawaited(
          ref
              .read(matureContentAgreementsProvider.notifier)
              .revokeCategoryAgreement(category.id),
        );
    }
  }

  Future<void> _deleteCategory(BuildContext context, WidgetRef ref) async {
    final Channel? channel = await _loadCategoryChannel(ref);
    if (channel == null) {
      return;
    }
    if (!context.mounted) {
      return;
    }
    await DeleteChannelFlow.confirmAndDelete(context, ref, channel: channel);
  }

  Future<Channel?> _loadCategoryChannel(WidgetRef ref) async {
    final row = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(category.id);
    if (row == null) {
      return null;
    }
    return Channel.fromRow(row);
  }

  Future<void> _showDebugCategorySheet(BuildContext context, WidgetRef ref) =>
      showChannelDebugSheet(
        context,
        ref: ref,
        channelId: category.id,
        title: FluxerLocalizations.of(context).dmDebugCategory,
      );

  Future<void> _openCategoryMuteSheet(
    BuildContext context,
    WidgetRef ref, {
    required VoidCallback close,
    required bool isMuted,
  }) async {
    final repository = ref.read(guildUserSettingsRepositoryProvider);
    if (isMuted) {
      close();
      await repository.updateChannelOverride(
        guildId: guildId,
        channelId: category.id,
        muted: false,
      );
      return;
    }
    final selection = await showMuteDurationSheet(
      context,
      muteTitle: 'Mute Category',
      useRootNavigator: isMobileLayout(context),
    );
    if (selection == null) {
      return;
    }
    close();
    await repository.updateChannelOverride(
      guildId: guildId,
      channelId: category.id,
      muted: true,
      durationSeconds: selection.durationSeconds,
      collapsed: true,
    );
  }
}

ReadStateRepository _readStateRepository(WidgetRef ref) => ReadStateRepository(
  ref.read(fluxerClientProvider),
  ref.read(fluxerDatabaseProvider),
);

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
    channel.type != ChannelType.guildCategory &&
    channel.type != ChannelType.guildLink;

class _MembersSidebarTile extends ConsumerWidget {
  const _MembersSidebarTile({required this.guildId, required this.isSelected});

  final String guildId;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color textColor = isSelected
        ? context.colors.textPrimary
        : context.colors.textTertiaryMuted;
    return FluxerSelectableRow(
      isSelected: isSelected,
      selectedColor: context.colors.backgroundModifierSelected,
      borderRadius: BorderRadius.circular(4),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      semanticLabel: navigationItemSemanticLabel(
        l10n: l10n,
        name: l10n.guildMembersChannelListLabel,
        isSelected: isSelected,
      ),
      onTap: () => context.go(RoutePaths.guildMembers(guildId)),
      child: Row(
        children: <Widget>[
          PhosphorIcon(PhosphorIconsFill.users, size: 20, color: textColor),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              l10n.guildMembersChannelListLabel,
              style: context.textStyles.channelName.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
