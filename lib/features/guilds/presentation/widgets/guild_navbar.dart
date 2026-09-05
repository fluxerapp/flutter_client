import 'dart:async';
import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/create_category_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/create_channel_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/utils/delete_my_messages_in_channel_action.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_navbar_context_menu.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_navbar_item.dart';
import 'package:fluxer_app/features/dm/providers/dm_folder_view_model.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/favorites/providers/favorites_unread_provider.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_modal.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_bottom_sheet.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_context_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_drag_wrapper.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_folder_context_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_folder_settings_modal.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/add_guild_enabled_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_navbar_scroll_store_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_voice_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/guilds/providers/visible_unavailable_guild_count_provider.dart';
import 'package:fluxer_app/features/guilds/utils/guild_folder_icon.dart';
import 'package:fluxer_app/features/guilds/utils/guild_folder_menu_actions.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';
import 'package:fluxer_app/features/guilds/utils/guild_settings_actions.dart';
import 'package:fluxer_app/features/guilds/utils/leave_guild_action.dart';
import 'package:fluxer_app/features/moderation/iar/iar_report_guild.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/root_overlay_navigation.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'guild_navbar_folder.dart';
part 'guild_navbar_list_item.dart';
part 'guild_navbar_list_item_state.dart';
part 'guild_navbar_home_buttons.dart';
part 'guild_navbar_dashed_icon.dart';
part 'guild_navbar_tooltip.dart';
part 'guild_navbar_indicators.dart';

enum _NavbarListEntryKind {
  directMessages,
  favorites,
  allowlistedDm,
  regularDm,
  divider,
  unavailableGuilds,
  organizedGuild,
  organizedFolder,
  exploreCommunities,
  addCommunity,
  help,
}

class _NavbarListEntry {
  const _NavbarListEntry({
    required this.kind,
    this.dm,
    this.organizedItem,
    this.unavailableCount,
  });

  final _NavbarListEntryKind kind;
  final DmChannel? dm;
  final GuildNavbarItem? organizedItem;
  final int? unavailableCount;
}

class GuildNavbar extends ConsumerStatefulWidget {
  const GuildNavbar({super.key});

  @override
  ConsumerState<GuildNavbar> createState() => _GuildNavbarState();
}

class _GuildNavbarState extends ConsumerState<GuildNavbar> {
  late final ScrollController _scrollController;
  final Map<String, GlobalKey> _itemKeys = <String, GlobalKey>{};
  late final GuildScrollIndicatorController _scrollIndicator;
  bool _restoring = false;
  bool _needsScrollClamp = false;
  GuildNavbarScrollStore? _scrollStore;

  @override
  void initState() {
    super.initState();
    _scrollStore = ref.read(guildNavbarScrollStoreProvider);
    final double savedOffset = _scrollStore?.offset ?? 0;
    _needsScrollClamp = savedOffset > 0;
    _scrollController = ScrollController(initialScrollOffset: savedOffset)
      ..addListener(_persistScroll);
    _scrollIndicator = GuildScrollIndicatorController(
      scrollController: _scrollController,
      itemKeys: _itemKeys,
      resolveSeverity: _resolveGuildScrollSeverity,
      isMounted: () => mounted,
      hideTopWhen: (double scrollOffset) => scrollOffset < 80,
    )..attach();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _prefetchGuildPermissions(ref.read(organizedGuildListProvider));
      _clampScrollOffset();
      _scrollIndicator.scheduleUpdate();
    });
  }

  void _persistScroll() {
    if (_restoring) {
      return;
    }
    if (_scrollStore != null && _scrollController.hasClients) {
      _scrollStore!.offset = _scrollController.offset;
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
    final double saved = _scrollStore?.offset ?? 0;
    final double target = saved.clamp(0, maxExtent);
    if ((_scrollController.offset - target).abs() > 0.5) {
      _restoring = true;
      _scrollController.jumpTo(target);
      _restoring = false;
    }
    _needsScrollClamp = false;
    _scrollIndicator.scheduleUpdate();
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

  void _prefetchGuildPermissions(List<GuildNavbarItem> items) {
    final GuildPermissions permissionsNotifier = ref.read(
      guildPermissionsProvider.notifier,
    );
    for (final GuildNavbarItem item in items) {
      switch (item) {
        case GuildNavbarGuild(:final Guild guild):
          unawaited(permissionsNotifier.getPermissions(guild.id));
        case GuildNavbarFolder(:final List<Guild> guilds):
          for (final Guild guild in guilds) {
            unawaited(permissionsNotifier.getPermissions(guild.id));
          }
      }
    }
  }

  List<_NavbarListEntry> _buildNavbarEntries({
    required bool showFavorites,
    required List<DmChannel> allowlistedDms,
    required List<DmChannel> regularDms,
    required bool dmItemsVisible,
    required int pendingUnavailableCount,
    required List<GuildNavbarItem> organizedItems,
    required bool showAddCommunity,
    required bool hideDirectMessages,
  }) {
    final List<_NavbarListEntry> entries = <_NavbarListEntry>[];
    if (!hideDirectMessages) {
      entries.add(
        const _NavbarListEntry(kind: _NavbarListEntryKind.directMessages),
      );
    }
    if (showFavorites) {
      entries.add(const _NavbarListEntry(kind: _NavbarListEntryKind.favorites));
    }
    if (!hideDirectMessages) {
      for (final DmChannel dm in allowlistedDms) {
        entries.add(
          _NavbarListEntry(kind: _NavbarListEntryKind.allowlistedDm, dm: dm),
        );
      }
      if (dmItemsVisible) {
        for (final DmChannel dm in regularDms) {
          entries.add(
            _NavbarListEntry(kind: _NavbarListEntryKind.regularDm, dm: dm),
          );
        }
      }
    }
    entries.add(const _NavbarListEntry(kind: _NavbarListEntryKind.divider));
    if (pendingUnavailableCount > 0) {
      entries.add(
        _NavbarListEntry(
          kind: _NavbarListEntryKind.unavailableGuilds,
          unavailableCount: pendingUnavailableCount,
        ),
      );
    }
    for (final GuildNavbarItem item in organizedItems) {
      switch (item) {
        case GuildNavbarGuild():
          entries.add(
            _NavbarListEntry(
              kind: _NavbarListEntryKind.organizedGuild,
              organizedItem: item,
            ),
          );
        case GuildNavbarFolder():
          entries.add(
            _NavbarListEntry(
              kind: _NavbarListEntryKind.organizedFolder,
              organizedItem: item,
            ),
          );
      }
    }
    entries
      ..add(const _NavbarListEntry(kind: _NavbarListEntryKind.divider))
      ..add(
        const _NavbarListEntry(kind: _NavbarListEntryKind.exploreCommunities),
      );
    if (showAddCommunity) {
      entries.add(
        const _NavbarListEntry(kind: _NavbarListEntryKind.addCommunity),
      );
    }
    entries.add(const _NavbarListEntry(kind: _NavbarListEntryKind.help));
    return entries;
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

  GuildScrollIndicatorSeverity? _resolveGuildScrollSeverity(String guildId) {
    final GuildReadStateEntry? unread = ref.read(
      guildReadStateProvider,
    )[guildId];
    if (unread == null) {
      return null;
    }
    if (unread.mentionCount > 0) {
      return GuildScrollIndicatorSeverity.mention;
    }
    if (unread.hasUnread) {
      return GuildScrollIndicatorSeverity.unread;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _scrollStore = ref.read(guildNavbarScrollStoreProvider);
    final organizedItems = ref.watch(organizedGuildListProvider);
    final guilds = ref.watch(
      guildListViewModelProvider.select((s) => s.guilds),
    );
    final activeGuildId = ref.watch(activeGuildIdProvider);
    final unavailableCount = unavailableGuildCount(
      trackedUnavailableGuildIds: ref.watch(guildAvailabilityProvider),
      guilds: guilds,
    );
    final pendingUnavailableCount = ref.watch(
      visibleUnavailableGuildCountProvider,
    );

    final dmFolderState = ref.watch(dmFolderProvider);
    ref.watch(unreadDmChannelsProvider.select(dmNavbarMembershipToken));
    final unreadDms = ref.read(unreadDmChannelsProvider).channels;
    final showFavorites = ref.watch(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );

    final List<DmChannel> allowlistedDms;
    final List<DmChannel> regularDms;

    if (dmFolderState.collapseDMs && !dmFolderState.expanded) {
      allowlistedDms = unreadDms
          .where((dm) => dmFolderState.allowlistedIds.contains(dm.id))
          .toList();
      regularDms = unreadDms
          .where((dm) => !dmFolderState.allowlistedIds.contains(dm.id))
          .toList();
    } else {
      allowlistedDms = [];
      regularDms = unreadDms;
    }

    final dmItemsVisible = !dmFolderState.collapseDMs || dmFolderState.expanded;

    ref
      ..listen<List<GuildNavbarItem>>(organizedGuildListProvider, (
        List<GuildNavbarItem>? previous,
        List<GuildNavbarItem> next,
      ) {
        if (previous != next) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              return;
            }
            _prefetchGuildPermissions(next);
          });
        }
        if (_needsScrollClamp && next.isNotEmpty) {
          _scheduleScrollClamp();
        }
      })
      ..listen(guildReadStateProvider, (_, _) {
        _scrollIndicator.scheduleUpdate();
      })
      ..listen(folderExpandedStateProvider, (_, _) {
        _scrollIndicator.scheduleUpdate();
      });

    final bool showAddCommunity = ref.watch(addGuildEnabledProvider);
    final bool hideDirectMessages = ref.watch(
      instanceRuntimeConfigProvider.select(
        (config) => config.directMessagesDisabled,
      ),
    );
    final double topPadding = max<double>(MediaQuery.paddingOf(context).top, 4);
    final List<_NavbarListEntry> navbarEntries = _buildNavbarEntries(
      showFavorites: showFavorites,
      allowlistedDms: allowlistedDms,
      regularDms: regularDms,
      dmItemsVisible: dmItemsVisible,
      pendingUnavailableCount: pendingUnavailableCount,
      organizedItems: organizedItems,
      showAddCommunity: showAddCommunity,
      hideDirectMessages: hideDirectMessages,
    );
    final guildListView = ListView.builder(
      scrollCacheExtent: const ScrollCacheExtent.pixels(600),
      controller: _scrollController,
      padding: EdgeInsets.only(top: topPadding, bottom: 8),
      itemCount: navbarEntries.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildNavbarListItem(
          context,
          entry: navbarEntries[index],
          dmFolderState: dmFolderState,
          activeGuildId: activeGuildId,
          unavailableCount: unavailableCount,
        );
      },
    );

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Container(
      width: 72,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        border: Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: GuildScrollIndicatorLayer(
          controller: _scrollIndicator,
          label: l10n.scrollIndicatorNew,
          topInset: 8 + topPadding,
          child: guildListView,
        ),
      ),
    );
  }

  Widget _buildNavbarListItem(
    BuildContext context, {
    required _NavbarListEntry entry,
    required DmFolderViewState dmFolderState,
    required String? activeGuildId,
    required int unavailableCount,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    switch (entry.kind) {
      case _NavbarListEntryKind.directMessages:
        return const _HomeDmButton();
      case _NavbarListEntryKind.favorites:
        return const _FavoritesButton();
      case _NavbarListEntryKind.allowlistedDm:
        final DmChannel dm = entry.dm!;
        return DmNavbarItem(
          key: ValueKey('dm-${dm.id}'),
          channelId: dm.id,
          recipientId: dm.recipientId,
          displayName: dm.name ?? l10n.favoritesDirectMessageSubtitle,
          type: dm.type,
          onContextMenu: (Offset position) => _handleDmContextMenu(
            context,
            position: position,
            dm: dm,
            isCollapsed: dmFolderState.collapseDMs,
            isAllowlisted: true,
          ),
        );
      case _NavbarListEntryKind.regularDm:
        final DmChannel dm = entry.dm!;
        return DmNavbarItem(
          key: ValueKey('dm-${dm.id}'),
          channelId: dm.id,
          recipientId: dm.recipientId,
          displayName: dm.name ?? l10n.favoritesDirectMessageSubtitle,
          type: dm.type,
          onContextMenu: (Offset position) => _handleDmContextMenu(
            context,
            position: position,
            dm: dm,
            isCollapsed: dmFolderState.collapseDMs,
            isAllowlisted: false,
          ),
        );
      case _NavbarListEntryKind.divider:
        return _SidebarDivider(color: context.colors.backgroundModifierHover);
      case _NavbarListEntryKind.unavailableGuilds:
        return _UnavailableGuildsIndicator(count: entry.unavailableCount ?? 0);
      case _NavbarListEntryKind.organizedGuild:
        final GuildNavbarGuild guildItem =
            entry.organizedItem! as GuildNavbarGuild;
        final Guild guild = guildItem.guild;
        return Consumer(
          builder: (context, ref, child) {
            final unread = ref.watch(
              guildReadStateProvider.select((s) => s[guild.id]),
            );
            final GlobalKey<_GuildListItemState> itemKey =
                _itemKeys.putIfAbsent(
                      guild.id,
                      GlobalKey<_GuildListItemState>.new,
                    )
                    as GlobalKey<_GuildListItemState>;
            final bool hasUnread =
                !guild.unavailable && (unread?.hasUnread ?? false);
            return GuildDragWrapper(
              key: ValueKey<String>('guild-${guild.id}'),
              itemId: guild.id,
              isFolder: false,
              enabled: !guild.unavailable,
              dragFeedback: GuildDragFeedback(
                label: guild.name,
                iconUrl: guild.iconUrl,
                isUnavailable: guild.unavailable,
              ),
              peekMenu: buildGuildPeekMenuConfig(
                context,
                guild: guild,
                hasUnread: hasUnread,
                onAction:
                    (
                      BuildContext actionContext,
                      GuildIconPeekAction action,
                    ) async {
                      await itemKey.currentState?.handlePeekAction(
                        actionContext,
                        action,
                      );
                    },
              ),
              child: _buildGuildItem(
                context,
                guild: guild,
                activeGuildId: activeGuildId,
                unavailableCount: unavailableCount,
                itemKey: itemKey,
              ),
            );
          },
        );
      case _NavbarListEntryKind.organizedFolder:
        final GuildNavbarFolder folderItem =
            entry.organizedItem! as GuildNavbarFolder;
        return _GuildFolderWidget(
          key: ValueKey<String>('folder-${folderItem.id}'),
          folder: folderItem,
          activeGuildId: activeGuildId,
          unavailableCount: unavailableCount,
          resolveGuildItemKey: (String guildId) =>
              _itemKeys.putIfAbsent(guildId, GlobalKey<_GuildListItemState>.new)
                  as GlobalKey<_GuildListItemState>,
        );
      case _NavbarListEntryKind.exploreCommunities:
        final bool isDiscover = ref.watch(
          currentLocationProvider.select(
            (String l) => l == RoutePaths.discover,
          ),
        );
        return _DashedGuildIcon(
          label: l10n.guildNavbarExploreDiscoverableCommunities,
          icon: PhosphorIconsBold.compass,
          isSelected: isDiscover,
          onTap: () {
            if (ref.read(currentLocationProvider) == RoutePaths.discover) {
              return;
            }
            openDiscover(context, ref);
          },
        );
      case _NavbarListEntryKind.addCommunity:
        return _DashedGuildIcon(
          label: l10n.guildNavbarAddCommunity,
          icon: PhosphorIconsBold.plus,
          onTap: () => unawaited(showAddGuildModal(context, ref)),
        );
      case _NavbarListEntryKind.help:
        return _DashedGuildIcon(
          label: l10n.guildNavbarHelp,
          icon: PhosphorIconsBold.question,
          onTap: () =>
              handleExternalLinkTap(context, 'https://help.fluxer.app'),
        );
    }
  }

  Future<void> _handleDmContextMenu(
    BuildContext context, {
    required Offset position,
    required DmChannel dm,
    required bool isCollapsed,
    required bool isAllowlisted,
  }) async {
    final isGroupDm = isDmGroupType(dm.type);
    final pinnedIds = ref.read(pinnedDmChannelIdsProvider).value ?? {};
    final mutedIds = ref.read(mutedDmChannelIdsProvider).value ?? {};
    final action = await showDmNavbarContextMenu(
      context,
      position: position,
      channelId: dm.id,
      hasUnread: ref.read(unreadDmChannelsProvider).hasUnread(dm.id),
      isMuted: mutedIds.contains(dm.id),
      isPinned: pinnedIds.contains(dm.id),
      isCollapsed: isCollapsed,
      isAllowlisted: isAllowlisted,
      isGroupDm: isGroupDm,
    );

    if (action == null || !context.mounted) {
      return;
    }

    final l10n = FluxerLocalizations.of(context);
    final dmFolderNotifier = ref.read(dmFolderProvider.notifier);

    switch (action) {
      case DmNavbarAction.markAsRead:
        unawaited(ref.read(dmRepositoryProvider).markAsRead(dm.id));
      case DmNavbarAction.alwaysShow:
        dmFolderNotifier.addToAllowlist(dm.id);
      case DmNavbarAction.removeAlwaysShow:
        dmFolderNotifier.removeFromAllowlist(dm.id);
      case DmNavbarAction.deleteMyMessages:
        unawaited(
          confirmAndDeleteMyMessagesInChannel(
            context,
            ref,
            channelId: dm.id,
            isPrivateConversation: true,
          ),
        );
      case DmNavbarAction.closeDm:
        await _confirmCloseDm(context, dm: dm);
      case DmNavbarAction.copyChannelId:
        unawaited(copyToClipboard(context: context, value: dm.id));
      case DmNavbarAction.copyUserId:
        unawaited(copyToClipboard(context: context, value: dm.recipientId));
      case DmNavbarAction.pinDm:
        unawaited(ref.read(dmRepositoryProvider).pinDm(dm.id));
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.dmPinned,
                variant: FluxerToastVariant.success,
              ),
            );
      case DmNavbarAction.unpinDm:
        unawaited(ref.read(dmRepositoryProvider).unpinDm(dm.id));
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.dmUnpinned,
                variant: FluxerToastVariant.success,
              ),
            );
      case DmNavbarAction.mute:
        unawaited(ref.read(dmRepositoryProvider).muteDm(dm.id));
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.dmMuted,
                variant: FluxerToastVariant.success,
              ),
            );
      case DmNavbarAction.unmute:
        unawaited(ref.read(dmRepositoryProvider).unmuteDm(dm.id));
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.dmUnmuted,
                variant: FluxerToastVariant.success,
              ),
            );
    }
  }

  Future<void> _confirmCloseDm(
    BuildContext context, {
    required DmChannel dm,
  }) async {
    final l10n = FluxerLocalizations.of(context);
    final db = ref.read(fluxerDatabaseProvider);
    final user = await db.userDao.getUserById(dm.recipientId);
    final relationship = isDmGroupType(dm.type)
        ? null
        : await db.relationshipDao.getRelationship(dm.recipientId);
    final username = resolveDisplayName(
      friendNickname: relationship?.nickname,
      globalName: user?.globalName,
      username: user?.username ?? dm.recipientId,
    );

    if (!context.mounted) {
      return;
    }

    await FluxerConfirmModal.show(
      context,
      title: l10n.dmCloseDmConfirmTitle,
      description: l10n.dmCloseDmConfirmDescription(username),
      confirmLabel: l10n.dmCloseDm,
      isDanger: true,
      onConfirm: () {
        unawaited(ref.read(dmRepositoryProvider).closeDmChannel(dm.id));
      },
    );
  }

  Widget _buildGuildItem(
    BuildContext context, {
    required Guild guild,
    required String? activeGuildId,
    required int unavailableCount,
    required GlobalKey<_GuildListItemState> itemKey,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        final FluxerLocalizations l10n = FluxerLocalizations.of(context);
        final unread = ref.watch(
          guildReadStateProvider.select((s) => s[guild.id]),
        );
        final guildUnreadReady = ref.watch(guildReadStateReadyProvider);
        final muteState = ref.watch(guildMuteProvider(guild.id)).value;
        final voiceActivity = ref.watch(guildVoiceActivityProvider(guild.id));
        final permissions = ref.watch(
          guildPermissionsProvider.select((s) => s[guild.id] ?? 0),
        );
        final invitesPaused =
            guild.features.contains('INVITES_DISABLED') &&
            hasPermission(permissions, Permission.manageGuild);
        final currentUserId = ref.watch(currentUserIdProvider);
        final developerMode = ref.watch(
          userSettingsViewModelProvider.select((s) => s.developerMode),
        );
        return _GuildListItem(
          key: itemKey,
          label: guild.name,
          guild: guild,
          isSelected: guild.id == activeGuildId,
          permissions: permissions,
          isOwner: guild.ownerId == currentUserId,
          iconUrl: guild.iconUrl,
          isUnavailable: guild.unavailable,
          unavailableCount: unavailableCount,
          isMuted: muteState?.isMuted ?? false,
          muteEndTime: muteState?.muteEndTime,
          hideMutedChannels: muteState?.hideMutedChannels ?? false,
          voiceActivity: voiceActivity,
          hasUnread: !guild.unavailable && (unread?.hasUnread ?? false),
          mentionCount: guild.unavailable ? 0 : unread?.mentionCount ?? 0,
          guildUnreadReady: guildUnreadReady,
          invitesPaused: invitesPaused,
          developerMode: developerMode,
          enableLongPressMenu: !isMobileLayout(context),
          onTap: () {
            DrawerNavigationCoordinator.selectGuild(ref.container, guild.id);
          },
          onMenuOpened: () {
            ref.read(guildSyncProvider.notifier).syncIfNeeded(guild.id);
          },
          resolveMenuPermissions: () =>
              _resolveGuildMenuPermissions(ref, guild.id),
          onMarkAsRead: () {
            unawaited(
              markGuildAsRead(
                guild.id,
                ref.read(fluxerDatabaseProvider),
                ref.read(fluxerClientProvider),
              ),
            );
          },
          onLeaveGuild: () {
            unawaited(leaveGuildAndCleanup(ref, guild.id));
          },
          onDeleteMyMessages: (guildId) async {
            await ref
                .read(fluxerClientProvider)
                .guilds
                .bulkDeleteMyMessagesInGuild(
                  guildId: guildId,
                  body: const SudoVerificationSchema(),
                );
          },
          onGuildSettingsAction: (action) {
            unawaited(
              updateGuildUserSettings(
                action,
                guild.id,
                ref.read(fluxerDatabaseProvider),
                ref.read(fluxerClientProvider),
              ),
            );
          },
          onCreateCategory: (name) {
            unawaited(
              ref
                  .read(fluxerClientProvider)
                  .guilds
                  .createGuildChannel(
                    guildId: guild.id,
                    body: ChannelCreateRequest4(
                      name: name,
                      type: GuildCategoryChannelCreateRequestTypeType
                          .guildCategory,
                      topic: null,
                      url: null,
                      parentId: null,
                      bitrate: null,
                      userLimit: null,
                      voiceConnectionLimit: null,
                      permissionOverwrites: [],
                      rateLimitPerUser: null,
                      nsfw: false,
                      nsfwOverride: null,
                      contentWarningLevel: ContentWarningLevel.inherit,
                      contentWarningText: null,
                    ),
                  ),
            );
          },
          onCreateChannel: (request) {
            unawaited(
              ref
                  .read(fluxerClientProvider)
                  .guilds
                  .createGuildChannel(guildId: guild.id, body: request),
            );
          },
          onCreateInvite:
              ({
                int maxAge = 604800,
                int maxUses = 0,
                bool temporary = false,
              }) async {
                final db = ref.read(fluxerDatabaseProvider);
                final client = ref.read(fluxerClientProvider);
                final channels = await db.channelDao.getChannels(guild.id);
                final invitable = channels
                    .where((c) => isGuildTextBasedChannel(c.type))
                    .firstOrNull;
                if (invitable == null) {
                  return null;
                }
                final String inviteBase = ref.read(
                  instanceInviteBaseUrlProvider,
                );
                final invite = await client.invites.createChannelInvite(
                  channelId: invitable.id,
                  body: ChannelInviteCreateRequest(
                    maxAge: maxAge,
                    maxUses: maxUses,
                    temporary: temporary,
                  ),
                );
                final code = GuildInviteMetadataResponse.fromJson(
                  invite.toJson(),
                ).code;
                return (url: '$inviteBase/$code', channelName: invitable.name);
              },
          onGetRecipients: () async {
            final friendRepo = ref.read(friendRepositoryProvider);
            final dmRepo = ref.read(dmRepositoryProvider);
            final friends = await friendRepo.getRelationships();
            final dms = await dmRepo.getDmChannels();
            return _buildRecipientList(friends, dms, l10n);
          },
          onSendInviteTo: (channelId, recipientId, url) async {
            final client = ref.read(fluxerClientProvider);
            var targetId = channelId;
            if (targetId == null && recipientId != null) {
              final ch = await client.users.createPrivateChannel(
                body: CreatePrivateChannelRequest(recipientId: recipientId),
              );
              targetId = ch.id;
            }
            if (targetId != null) {
              await client.channels.sendMessage(
                channelId: targetId,
                content: url,
              );
            }
          },
          onGetPrivacyState: () => getGuildPrivacyState(
            db: ref.read(fluxerDatabaseProvider),
            userId: ref.read(currentUserIdProvider)!,
            guildId: guild.id,
          ),
          onToggleDms: ({required bool allowed}) {
            unawaited(
              updateGuildPrivacySetting(
                client: ref.read(fluxerClientProvider),
                db: ref.read(fluxerDatabaseProvider),
                userId: ref.read(currentUserIdProvider)!,
                guildId: guild.id,
                dmsAllowed: allowed,
              ),
            );
          },
          onToggleBotDms: ({required bool allowed}) {
            unawaited(
              updateGuildPrivacySetting(
                client: ref.read(fluxerClientProvider),
                db: ref.read(fluxerDatabaseProvider),
                userId: ref.read(currentUserIdProvider)!,
                guildId: guild.id,
                botDmsAllowed: allowed,
              ),
            );
          },
          onGetGuildDebugJson: () => buildGuildDebugJson(
            client: ref.read(fluxerClientProvider),
            db: ref.read(fluxerDatabaseProvider),
            userId: ref.read(currentUserIdProvider)!,
            guildId: guild.id,
          ),
          onShowToast: (toast) {
            ref.read(toastProvider.notifier).show(toast);
          },
          onGetNotificationSettings: () => getGuildNotificationSettings(
            db: ref.read(fluxerDatabaseProvider),
            guildId: guild.id,
          ),
          onUpdateNotificationSetting:
              ({
                bool? muted,
                UserNotificationSettings? messageNotifications,
                bool? suppressEveryone,
                bool? suppressRoles,
                bool? mobilePush,
              }) {
                unawaited(
                  updateGuildNotificationSetting(
                    db: ref.read(fluxerDatabaseProvider),
                    client: ref.read(fluxerClientProvider),
                    guildId: guild.id,
                    muted: muted,
                    messageNotifications: messageNotifications,
                    suppressEveryone: suppressEveryone,
                    suppressRoles: suppressRoles,
                    mobilePush: mobilePush,
                  ),
                );
              },
          onGetGuildChannels: () => getGuildChannelsForSettings(
            db: ref.read(fluxerDatabaseProvider),
            guildId: guild.id,
          ),
          onUpdateChannelOverride:
              (channelId, messageNotifications, {required muted}) {
                unawaited(
                  ref
                      .read(guildUserSettingsRepositoryProvider)
                      .updateChannelOverride(
                        guildId: guild.id,
                        channelId: channelId,
                        messageNotifications: UserNotificationSettings.fromJson(
                          messageNotifications,
                        ),
                        muted: muted,
                      ),
                );
              },
          onRemoveChannelOverride: (channelId) {
            unawaited(
              ref
                  .read(guildUserSettingsRepositoryProvider)
                  .removeChannelOverride(
                    guildId: guild.id,
                    channelId: channelId,
                  ),
            );
          },
        );
      },
    );
  }
}
