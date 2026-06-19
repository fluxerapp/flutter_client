import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/constants/assets.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
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
    'widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_voice_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

String _guildTapPath(BuildContext context, String guildId) {
  final path = RoutePaths.guild(guildId);
  return isMobileLayout(context) ? '$path?view=list' : path;
}

typedef _ScrollIndicatorView = ({
  bool show,
  ScrollIndicatorSeverity severity,
  String? targetId,
});

const _ScrollIndicatorView _hiddenIndicator = (
  show: false,
  severity: ScrollIndicatorSeverity.unread,
  targetId: null,
);

enum _NavbarListEntryKind {
  directMessages,
  favorites,
  allowlistedDm,
  regularDm,
  divider,
  unavailableGuilds,
  organizedGuild,
  organizedFolder,
  exploreServers,
  addServer,
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
  final _scrollController = ScrollController();
  final _itemKeys = <String, GlobalKey>{};
  final ValueNotifier<_ScrollIndicatorView> _topIndicator = ValueNotifier(
    _hiddenIndicator,
  );
  final ValueNotifier<_ScrollIndicatorView> _bottomIndicator = ValueNotifier(
    _hiddenIndicator,
  );
  bool _scrollIndicatorUpdateScheduled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scheduleScrollIndicatorUpdate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _prefetchGuildPermissions(ref.read(organizedGuildListProvider));
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
  }) {
    final List<_NavbarListEntry> entries = <_NavbarListEntry>[
      const _NavbarListEntry(kind: _NavbarListEntryKind.directMessages),
    ];
    if (showFavorites) {
      entries.add(const _NavbarListEntry(kind: _NavbarListEntryKind.favorites));
    }
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
      ..add(const _NavbarListEntry(kind: _NavbarListEntryKind.exploreServers))
      ..add(const _NavbarListEntry(kind: _NavbarListEntryKind.addServer))
      ..add(const _NavbarListEntry(kind: _NavbarListEntryKind.help));
    return entries;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scheduleScrollIndicatorUpdate)
      ..dispose();
    _topIndicator.dispose();
    _bottomIndicator.dispose();
    super.dispose();
  }

  void _scheduleScrollIndicatorUpdate() {
    if (_scrollIndicatorUpdateScheduled) {
      return;
    }
    _scrollIndicatorUpdateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollIndicatorUpdateScheduled = false;
      _updateScrollIndicators();
    });
  }

  void _updateScrollIndicators() {
    if (!_scrollController.hasClients || !mounted) {
      return;
    }

    final scrollPosition = _scrollController.position;

    var showTop = false;
    var showBottom = false;
    var topSeverity = ScrollIndicatorSeverity.unread;
    var bottomSeverity = ScrollIndicatorSeverity.unread;
    String? topTarget;
    String? bottomTarget;
    var topDistance = double.infinity;
    var bottomDistance = double.infinity;

    for (final entry in _itemKeys.entries) {
      final severity = _getItemSeverity(entry.key);
      if (severity == null) {
        continue;
      }

      final key = entry.value;
      final renderObject = key.currentContext?.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.attached) {
        continue;
      }

      final scrollableContext = scrollPosition.context.storageContext;
      final scrollableRenderObject =
          scrollableContext.findRenderObject()! as RenderBox;
      final scrollableTop = scrollableRenderObject
          .localToGlobal(Offset.zero)
          .dy;
      final scrollableBottom = scrollableTop + scrollPosition.viewportDimension;

      final itemTop = renderObject.localToGlobal(Offset.zero).dy;
      final itemBottom = itemTop + renderObject.size.height;

      if (itemBottom < scrollableTop) {
        final distance = scrollableTop - itemBottom;
        final severityPriority = severity == ScrollIndicatorSeverity.mention
            ? 2
            : 1;
        final currentTopPriority =
            topSeverity == ScrollIndicatorSeverity.mention ? 2 : 1;

        if (!showTop ||
            severityPriority > currentTopPriority ||
            (severityPriority == currentTopPriority &&
                distance < topDistance)) {
          showTop = true;
          topSeverity = severity;
          topTarget = entry.key;
          topDistance = distance;
        }
      } else if (itemTop > scrollableBottom) {
        final distance = itemTop - scrollableBottom;
        final severityPriority = severity == ScrollIndicatorSeverity.mention
            ? 2
            : 1;
        final currentBottomPriority =
            bottomSeverity == ScrollIndicatorSeverity.mention ? 2 : 1;

        if (!showBottom ||
            severityPriority > currentBottomPriority ||
            (severityPriority == currentBottomPriority &&
                distance < bottomDistance)) {
          showBottom = true;
          bottomSeverity = severity;
          bottomTarget = entry.key;
          bottomDistance = distance;
        }
      }
    }

    final scrollOffset = scrollPosition.pixels;
    final hideTopIndicatorOverDms = scrollOffset < 80;

    _topIndicator.value = (
      show: showTop && !hideTopIndicatorOverDms,
      severity: topSeverity,
      targetId: topTarget,
    );
    _bottomIndicator.value = (
      show: showBottom,
      severity: bottomSeverity,
      targetId: bottomTarget,
    );
  }

  ScrollIndicatorSeverity? _getItemSeverity(String guildId) {
    final unread = ref.read(guildReadStateProvider)[guildId];
    if (unread == null) {
      return null;
    }
    if (unread.mentionCount > 0) {
      return ScrollIndicatorSeverity.mention;
    }
    if (unread.hasUnread) {
      return ScrollIndicatorSeverity.unread;
    }
    return null;
  }

  void _scrollToItem(String? itemId) {
    if (itemId == null) {
      return;
    }
    final key = _itemKeys[itemId];
    if (key?.currentContext == null) {
      return;
    }
    unawaited(
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final organizedItems = ref.watch(organizedGuildListProvider);
    final guilds = ref.watch(
      guildListViewModelProvider.select((s) => s.guilds),
    );
    final activeGuildId = ref.watch(activeGuildIdProvider);
    final unavailableCount = guilds.where((g) => g.isUnavailable).length;
    final pendingUnavailableCount = ref.watch(guildAvailabilityProvider).length;

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
          _prefetchGuildPermissions(next);
        }
      })
      ..listen(guildReadStateProvider, (_, _) {
        _scheduleScrollIndicatorUpdate();
      });

    _scheduleScrollIndicatorUpdate();

    final double topPadding = max<double>(MediaQuery.paddingOf(context).top, 4);
    final List<_NavbarListEntry> navbarEntries = _buildNavbarEntries(
      showFavorites: showFavorites,
      allowlistedDms: allowlistedDms,
      regularDms: regularDms,
      dmItemsVisible: dmItemsVisible,
      pendingUnavailableCount: pendingUnavailableCount,
      organizedItems: organizedItems,
    );
    final guildListView = ListView.builder(
      scrollCacheExtent: const ScrollCacheExtent.pixels(600),
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
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

    return Container(
      width: 72,
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        border: Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Stack(
          children: [
            guildListView,
            Positioned(
              top: 8 + topPadding,
              left: 0,
              right: 0,
              child: Center(
                child: ValueListenableBuilder<_ScrollIndicatorView>(
                  valueListenable: _topIndicator,
                  builder: (context, view, _) => IgnorePointer(
                    ignoring: !view.show,
                    child: AnimatedSlide(
                      offset: Offset(0, view.show ? 0 : -1),
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeOut,
                      child: AnimatedOpacity(
                        opacity: view.show ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 150),
                        child: GuildScrollIndicator(
                          severity: view.severity,
                          onTap: () => _scrollToItem(view.targetId),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Center(
                child: ValueListenableBuilder<_ScrollIndicatorView>(
                  valueListenable: _bottomIndicator,
                  builder: (context, view, _) => IgnorePointer(
                    ignoring: !view.show,
                    child: AnimatedSlide(
                      offset: Offset(0, view.show ? 0 : 1),
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeOut,
                      child: AnimatedOpacity(
                        opacity: view.show ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 150),
                        child: GuildScrollIndicator(
                          severity: view.severity,
                          onTap: () => _scrollToItem(view.targetId),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
          displayName: dm.name ?? 'Direct Message',
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
          displayName: dm.name ?? 'Direct Message',
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
        return GuildDragWrapper(
          itemId: guild.id,
          isFolder: false,
          enabled: !guild.isUnavailable,
          child: _buildGuildItem(
            context,
            guild: guild,
            activeGuildId: activeGuildId,
            unavailableCount: unavailableCount,
          ),
        );
      case _NavbarListEntryKind.organizedFolder:
        final GuildNavbarFolder folderItem =
            entry.organizedItem! as GuildNavbarFolder;
        return GuildDragWrapper(
          itemId: folderItem.id.toString(),
          isFolder: true,
          child: _GuildFolderWidget(
            folder: folderItem,
            activeGuildId: activeGuildId,
            unavailableCount: unavailableCount,
          ),
        );
      case _NavbarListEntryKind.exploreServers:
        return _DashedGuildIcon(
          label: 'Explore Discoverable Servers',
          icon: PhosphorIconsRegular.compass,
          onTap: () {
            ref
                .read(toastProvider.notifier)
                .show(const FluxerToast(message: 'Coming soon'));
          },
        );
      case _NavbarListEntryKind.addServer:
        return _DashedGuildIcon(
          label: 'Add a Server',
          icon: PhosphorIconsRegular.plus,
          onTap: () => unawaited(showAddGuildModal(context)),
        );
      case _NavbarListEntryKind.help:
        return _DashedGuildIcon(
          label: 'Help',
          icon: PhosphorIconsRegular.question,
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
    final isGroupDm = dm.type == 3;
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
      case DmNavbarAction.closeDm:
        await _confirmCloseDm(context, dm: dm);
      case DmNavbarAction.copyChannelId:
        unawaited(Clipboard.setData(ClipboardData(text: dm.id)));
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.copiedToClipboard,
                variant: FluxerToastVariant.success,
              ),
            );
      case DmNavbarAction.copyUserId:
        unawaited(Clipboard.setData(ClipboardData(text: dm.recipientId)));
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.copiedToClipboard,
                variant: FluxerToastVariant.success,
              ),
            );
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
    final username = user?.globalName ?? user?.username ?? dm.recipientId;

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
  }) {
    final itemKey = _itemKeys.putIfAbsent(guild.id, GlobalKey.new);
    return Consumer(
      builder: (context, ref, child) {
        final unread = ref.watch(
          guildReadStateProvider.select((s) => s[guild.id]),
        );
        final guildUnreadReady = ref.watch(guildReadStateReadyProvider);
        final muteState = ref.watch(guildMuteProvider(guild.id)).value;
        final voiceActivity = ref.watch(guildVoiceActivityProvider(guild.id));
        final voiceRows = ref
            .watch(guildVoiceParticipantsProvider(guild.id))
            .value;
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
          isUnavailable: guild.isUnavailable,
          unavailableCount: unavailableCount,
          isMuted: muteState?.isMuted ?? false,
          muteEndTime: muteState?.muteEndTime,
          hideMutedChannels: muteState?.hideMutedChannels ?? false,
          voiceActivity: voiceActivity,
          voiceRows: voiceRows ?? const [],
          hasUnread: !guild.isUnavailable && (unread?.hasUnread ?? false),
          mentionCount: guild.isUnavailable ? 0 : unread?.mentionCount ?? 0,
          guildUnreadReady: guildUnreadReady,
          invitesPaused: invitesPaused,
          developerMode: developerMode,
          onTap: () {
            context.go(_guildTapPath(context, guild.id));
          },
          onMenuOpened: () {
            ref.read(guildSyncProvider.notifier).syncIfNeeded(guild.id);
          },
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
            unawaited(
              ref
                  .read(fluxerClientProvider)
                  .guilds
                  .leaveGuild(
                    guildId: guild.id,
                    body: const SudoVerificationSchema(),
                  ),
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
                      type: ChannelCreateCategoryRequestTypeType.guildCategory,
                      topic: null,
                      url: null,
                      parentId: null,
                      bitrate: null,
                      userLimit: null,
                      voiceConnectionLimit: null,
                      permissionOverwrites: [],
                      nsfw: false,
                      nsfwOverride: null,
                      contentWarningLevel: null,
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
                    .where((c) => c.type == 0 || c.type == 2)
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
                final code = invite.toGuildInviteMetadataResponse().code;
                return (url: '$inviteBase/$code', channelName: invitable.name);
              },
          onGetRecipients: () async {
            final friendRepo = ref.read(friendRepositoryProvider);
            final dmRepo = ref.read(dmRepositoryProvider);
            final friends = await friendRepo.getRelationships();
            final dms = await dmRepo.getDmChannels();
            return _buildRecipientList(friends, dms);
          },
          onSendInviteTo: (channelId, recipientId, url) async {
            final client = ref.read(fluxerClientProvider);
            final dio = ref.read(fluxerDioProvider);
            var targetId = channelId;
            if (targetId == null && recipientId != null) {
              final ch = await client.users.createPrivateChannel(
                body: CreatePrivateChannelRequest(recipientId: recipientId),
              );
              targetId = ch.id;
            }
            if (targetId != null) {
              await dio.post<Map<String, dynamic>>(
                '/channels/$targetId/messages',
                data: <String, dynamic>{'content': url},
              );
            }
          },
          onGetPrivacyState: () => _getPrivacyState(
            db: ref.read(fluxerDatabaseProvider),
            userId: ref.read(currentUserIdProvider)!,
            guildId: guild.id,
          ),
          onToggleDms: ({required bool allowed}) {
            unawaited(
              _updatePrivacySetting(
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
              _updatePrivacySetting(
                client: ref.read(fluxerClientProvider),
                db: ref.read(fluxerDatabaseProvider),
                userId: ref.read(currentUserIdProvider)!,
                guildId: guild.id,
                botDmsAllowed: allowed,
              ),
            );
          },
          onGetGuildDebugJson: () => _buildGuildDebugJson(
            client: ref.read(fluxerClientProvider),
            db: ref.read(fluxerDatabaseProvider),
            userId: ref.read(currentUserIdProvider)!,
            guildId: guild.id,
          ),
          onShowToast: (toast) {
            ref.read(toastProvider.notifier).show(toast);
          },
          onGetNotificationSettings: () => _getNotificationSettings(
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
                  _updateNotificationSetting(
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
          onGetGuildChannels: () => _getGuildChannels(
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

class _GuildFolderWidget extends ConsumerStatefulWidget {
  final GuildNavbarFolder folder;
  final String? activeGuildId;
  final int unavailableCount;

  const _GuildFolderWidget({
    required this.folder,
    required this.activeGuildId,
    required this.unavailableCount,
  });

  @override
  ConsumerState<_GuildFolderWidget> createState() => _GuildFolderWidgetState();
}

class _GuildFolderWidgetState extends ConsumerState<_GuildFolderWidget>
    with SingleTickerProviderStateMixin {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final folder = widget.folder;
    final isExpanded = ref.watch(
      folderExpandedStateProvider.select((s) => s.contains(folder.id)),
    );

    // Aggregate unread/mention/voice across all guilds in folder.
    var anyUnread = false;
    var totalMentions = 0;
    var folderVoiceActivity = VoiceActivityType.none;
    final guildUnreadReady = ref.watch(guildReadStateReadyProvider);
    for (final guild in folder.guilds) {
      final unread = ref.watch(
        guildReadStateProvider.select((s) => s[guild.id]),
      );
      if (guildUnreadReady &&
          !guild.isUnavailable &&
          (unread?.hasUnread ?? false)) {
        anyUnread = true;
      }
      if (guildUnreadReady && !guild.isUnavailable) {
        totalMentions += unread?.mentionCount ?? 0;
      }
      final voiceActivity = ref.watch(guildVoiceActivityProvider(guild.id));
      if (voiceActivity.index > folderVoiceActivity.index) {
        folderVoiceActivity = voiceActivity;
      }
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final folderAccent = folder.color != null && folder.color != 0
        ? Color(folder.color! | 0xFF000000)
        : isDark
        ? context.colors.brandPrimaryLight
        : context.colors.brandPrimary;

    final folderSurface = Color.lerp(
      context.colors.backgroundSecondary,
      folderAccent,
      isDark ? 0.2 : 0.15,
    )!;

    // Stack: background panel behind header + animated guild list.
    // Background spans from header through guild items when expanded.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Background panel (behind everything, spans full height).
          if (isExpanded)
            Positioned.fill(
              child: Center(
                child: Container(
                  width: 48,
                  decoration: BoxDecoration(
                    color: folderSurface,
                    borderRadius: BorderRadius.circular(48 * 0.3),
                  ),
                ),
              ),
            ),
          // Content column: header + animated guild list.
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFolderButton(
                context,
                folderAccent: folderAccent,
                folderSurface: folderSurface,
                anyUnread: anyUnread,
                totalMentions: totalMentions,
                folderVoiceActivity: folderVoiceActivity,
                isExpanded: isExpanded,
                guildUnreadReady: guildUnreadReady,
              ),
              // Animated expand/collapse of guild items.
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: const Cubic(0.25, 0.1, 0.25, 1),
                alignment: Alignment.topCenter,
                child: isExpanded
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final guild in folder.guilds)
                              _buildGuildItemInFolder(context, guild),
                          ],
                        ),
                      )
                    : const SizedBox(width: 72),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFolderButton(
    BuildContext context, {
    required Color folderAccent,
    required Color folderSurface,
    required bool anyUnread,
    required int totalMentions,
    required VoiceActivityType folderVoiceActivity,
    required bool isExpanded,
    required bool guildUnreadReady,
  }) {
    final folder = widget.folder;
    return Row(
      children: [
        if (!isExpanded)
          AnimatedContainer(
            duration: guildUnreadReady
                ? const Duration(milliseconds: 200)
                : Duration.zero,
            curve: const Cubic(0.25, 0.1, 0.25, 1),
            width: 6,
            height: _isHovered
                ? 20
                : anyUnread
                ? 8
                : 0,
            decoration: BoxDecoration(
              color: context.colors.textPrimary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(999),
                bottomRight: Radius.circular(999),
              ),
            ),
          )
        else
          const SizedBox(width: 6),
        const SizedBox(width: 6),
        Stack(
          clipBehavior: Clip.none,
          children: [
            _RightTooltip(
              content: _TooltipLabel(
                label: isExpanded
                    ? 'Collapse ${folder.name ?? _derivedFolderName}'
                    : folder.name ?? _derivedFolderName,
              ),
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => ref
                      .read(folderExpandedStateProvider.notifier)
                      .toggle(folder.id),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: isExpanded
                        ? Center(
                            child: PhosphorIcon(
                              _folderIcon(folder.icon),
                              color: context.colors.textPrimary,
                              size: 24,
                            ),
                          )
                        : Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 70),
                              curve: Curves.easeOut,
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: folderSurface,
                                borderRadius: BorderRadius.circular(48 * 0.3),
                              ),
                              child: _buildFolderContent(context, folderAccent),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (!isExpanded && totalMentions > 0)
              Positioned(
                bottom: -4,
                right: -4,
                child: FluxerBadge.count(
                  count: totalMentions,
                  cutoutColor: context.colors.backgroundSecondary,
                ),
              ),
            if (!isExpanded && folderVoiceActivity != VoiceActivityType.none)
              Positioned(
                top: -4,
                right: -4,
                child: _VoiceActivityBadge(type: folderVoiceActivity),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildFolderContent(BuildContext context, Color folderAccent) {
    final folder = widget.folder;
    if (folder.showIconWhenCollapsed && folder.icon != null) {
      return Center(
        child: PhosphorIcon(
          _folderIcon(folder.icon),
          color: context.colors.textPrimary,
          size: 24,
        ),
      );
    }

    // 2x2 mini guild icon grid.
    final gridGuilds = folder.guilds.take(4).toList();
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Wrap(
        spacing: 2,
        runSpacing: 2,
        children: [
          for (final guild in gridGuilds)
            SizedBox(
              width: 16,
              height: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16 * 0.3),
                child: guild.iconUrl != null
                    ? CachedNetworkImage(
                        imageUrl: guild.iconUrl!,
                        fit: BoxFit.cover,
                      )
                    : ColoredBox(
                        color: context.colors.serverIconBackground,
                        child: Center(
                          child: Text(
                            abbreviateGuildName(guild.name, maxLength: 2),
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGuildItemInFolder(BuildContext context, Guild guild) {
    return Consumer(
      builder: (context, ref, child) {
        final unread = ref.watch(
          guildReadStateProvider.select((s) => s[guild.id]),
        );
        final guildUnreadReady = ref.watch(guildReadStateReadyProvider);
        final muteState = ref.watch(guildMuteProvider(guild.id)).value;
        final voiceActivity = ref.watch(guildVoiceActivityProvider(guild.id));
        final voiceRows = ref
            .watch(guildVoiceParticipantsProvider(guild.id))
            .value;
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
        return GuildDragWrapper(
          itemId: guild.id,
          isFolder: false,
          child: _GuildListItem(
            label: guild.name,
            guild: guild,
            isSelected: guild.id == widget.activeGuildId,
            permissions: permissions,
            isOwner: guild.ownerId == currentUserId,
            iconUrl: guild.iconUrl,
            isUnavailable: guild.isUnavailable,
            unavailableCount: widget.unavailableCount,
            isMuted: muteState?.isMuted ?? false,
            muteEndTime: muteState?.muteEndTime,
            hideMutedChannels: muteState?.hideMutedChannels ?? false,
            voiceActivity: voiceActivity,
            voiceRows: voiceRows ?? const [],
            hasUnread: !guild.isUnavailable && (unread?.hasUnread ?? false),
            mentionCount: guild.isUnavailable ? 0 : unread?.mentionCount ?? 0,
            guildUnreadReady: guildUnreadReady,
            invitesPaused: invitesPaused,
            developerMode: developerMode,
            onTap: () {
              context.go(_guildTapPath(context, guild.id));
            },
            onMenuOpened: () {
              ref.read(guildSyncProvider.notifier).syncIfNeeded(guild.id);
            },
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
              unawaited(
                ref
                    .read(fluxerClientProvider)
                    .guilds
                    .leaveGuild(
                      guildId: guild.id,
                      body: const SudoVerificationSchema(),
                    ),
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
                        type:
                            ChannelCreateCategoryRequestTypeType.guildCategory,
                        topic: null,
                        url: null,
                        parentId: null,
                        bitrate: null,
                        userLimit: null,
                        voiceConnectionLimit: null,
                        permissionOverwrites: [],
                        nsfw: false,
                        nsfwOverride: null,
                        contentWarningLevel: null,
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
                      .where((c) => c.type == 0 || c.type == 2)
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
                  final code = invite.toGuildInviteMetadataResponse().code;
                  return (
                    url: '$inviteBase/$code',
                    channelName: invitable.name,
                  );
                },
            onGetRecipients: () async {
              final friendRepo = ref.read(friendRepositoryProvider);
              final dmRepo = ref.read(dmRepositoryProvider);
              final friends = await friendRepo.getRelationships();
              final dms = await dmRepo.getDmChannels();
              return _buildRecipientList(friends, dms);
            },
            onSendInviteTo: (channelId, recipientId, url) async {
              final client = ref.read(fluxerClientProvider);
              final dio = ref.read(fluxerDioProvider);
              var targetId = channelId;
              if (targetId == null && recipientId != null) {
                final ch = await client.users.createPrivateChannel(
                  body: CreatePrivateChannelRequest(recipientId: recipientId),
                );
                targetId = ch.id;
              }
              if (targetId != null) {
                await dio.post<Map<String, dynamic>>(
                  '/channels/$targetId/messages',
                  data: <String, dynamic>{'content': url},
                );
              }
            },
            onGetPrivacyState: () => _getPrivacyState(
              db: ref.read(fluxerDatabaseProvider),
              userId: ref.read(currentUserIdProvider)!,
              guildId: guild.id,
            ),
            onToggleDms: ({required bool allowed}) {
              unawaited(
                _updatePrivacySetting(
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
                _updatePrivacySetting(
                  client: ref.read(fluxerClientProvider),
                  db: ref.read(fluxerDatabaseProvider),
                  userId: ref.read(currentUserIdProvider)!,
                  guildId: guild.id,
                  botDmsAllowed: allowed,
                ),
              );
            },
            onGetGuildDebugJson: () => _buildGuildDebugJson(
              client: ref.read(fluxerClientProvider),
              db: ref.read(fluxerDatabaseProvider),
              userId: ref.read(currentUserIdProvider)!,
              guildId: guild.id,
            ),
            onShowToast: (toast) {
              ref.read(toastProvider.notifier).show(toast);
            },
            onGetNotificationSettings: () => _getNotificationSettings(
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
                    _updateNotificationSetting(
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
            onGetGuildChannels: () => _getGuildChannels(
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
                          messageNotifications:
                              UserNotificationSettings.fromJson(
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
          ),
        );
      },
    );
  }

  String get _derivedFolderName {
    final names = widget.folder.guilds.take(3).map((g) => g.name);
    return names.join(', ');
  }

  static IconData _folderIcon(String? icon) {
    return switch (icon) {
      'star' => PhosphorIconsFill.star,
      'heart' => PhosphorIconsFill.heart,
      'bookmark' => PhosphorIconsFill.bookmarkSimple,
      'game_controller' => PhosphorIconsFill.gameController,
      'shield' => PhosphorIconsFill.shield,
      'music_note' => PhosphorIconsFill.musicNote,
      _ => PhosphorIconsFill.folder,
    };
  }
}

List<_InviteRecipient> _buildRecipientList(
  List<Friend> friends,
  List<DmConversation> dms,
) {
  final accepted = friends.where(
    (f) => f.friendStatus == FriendStatus.accepted,
  );
  final dmByRecipient = <String, DmConversation>{};
  final recipients = <_InviteRecipient>[];

  for (final dm in dms) {
    if (dm.isGroup) {
      recipients.add(
        _InviteRecipient(
          id: dm.id,
          displayName: dm.displayName,
          secondaryText: 'Group DM',
          channelId: dm.id,
        ),
      );
    } else {
      dmByRecipient[dm.recipientId] = dm;
    }
  }

  for (final friend in accepted) {
    final dm = dmByRecipient[friend.id];
    final avatarUrl = friend.avatar != null
        ? FluxerMediaUrl.userAvatar(userId: friend.id, hash: friend.avatar)
        : null;
    recipients.add(
      _InviteRecipient(
        id: friend.id,
        displayName: friend.displayName,
        secondaryText: friend.username,
        avatarUrl: avatarUrl,
        status: friend.status,
        channelId: dm?.id,
      ),
    );
  }

  return recipients;
}

Future<void> markGuildAsRead(
  String guildId,
  FluxerDatabase db,
  FluxerClient client,
) async {
  final channels = await db.channelDao.getChannels(guildId);
  final channelIds = channels.map((c) => c.id).toList();
  final readStates = await db.readStateDao
      .watchReadStatesForChannels(channelIds)
      .first;
  final readStateMap = {for (final rs in readStates) rs.channelId: rs};

  final ackEntries = <ReadStateAckBulkRequestReadStates>[];
  for (final channel in channels) {
    final lastMsgId = channel.lastMessageId;
    if (lastMsgId == null) {
      continue;
    }
    final ackId = readStateMap[channel.id]?.lastMessageId;
    final mentionCount = readStateMap[channel.id]?.mentionCount ?? 0;
    final isManual = readStateMap[channel.id]?.manual ?? false;
    if (ackId == lastMsgId && mentionCount == 0 && !isManual) {
      continue;
    }
    ackEntries.add(
      ReadStateAckBulkRequestReadStates(
        channelId: channel.id,
        messageId: lastMsgId,
      ),
    );
  }

  if (ackEntries.isEmpty) {
    return;
  }

  // Optimistically update local read states so the UI clears immediately.
  for (final entry in ackEntries) {
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: Value(entry.channelId),
        lastMessageId: Value(entry.messageId),
        mentionCount: const Value(0),
        manual: const Value(false),
      ),
    );
  }

  unawaited(
    client.readStates.ackBulkMessages(
      body: ReadStateAckBulkRequest(readStates: ackEntries),
    ),
  );
}

Future<({bool isDmsAllowed, bool isBotDmsAllowed})> _getPrivacyState({
  required FluxerDatabase db,
  required String userId,
  required String guildId,
}) async {
  final row = await db.userSettingsDao.getSettings(userId);
  if (row == null) {
    return (isDmsAllowed: true, isBotDmsAllowed: true);
  }
  final data = jsonDecode(row.data) as Map<String, dynamic>;
  final s = UserSettingsResponse.fromJson(data);
  return (
    isDmsAllowed: !s.restrictedGuilds.contains(guildId),
    isBotDmsAllowed: !s.botRestrictedGuilds.contains(guildId),
  );
}

Future<void> _updatePrivacySetting({
  required FluxerClient client,
  required FluxerDatabase db,
  required String userId,
  required String guildId,
  bool? dmsAllowed,
  bool? botDmsAllowed,
}) async {
  try {
    final row = await db.userSettingsDao.getSettings(userId);
    if (row == null) {
      return;
    }

    final data = jsonDecode(row.data) as Map<String, dynamic>;
    final settings = UserSettingsResponse.fromJson(data);

    List<String>? newRestricted;
    if (dmsAllowed != null) {
      newRestricted = List<String>.from(settings.restrictedGuilds);
      if (dmsAllowed) {
        newRestricted.remove(guildId);
      } else if (!newRestricted.contains(guildId)) {
        newRestricted.add(guildId);
      }
    }

    List<String>? newBotRestricted;
    if (botDmsAllowed != null) {
      newBotRestricted = List<String>.from(settings.botRestrictedGuilds);
      if (botDmsAllowed) {
        newBotRestricted.remove(guildId);
      } else if (!newBotRestricted.contains(guildId)) {
        newBotRestricted.add(guildId);
      }
    }

    await client.users.updateCurrentUserSettings(
      body: UserSettingsUpdateRequest(
        restrictedGuilds: newRestricted,
        botRestrictedGuilds: newBotRestricted,
      ),
    );
  } on Exception catch (e) {
    talker.error('[GuildNavbar] Failed to update privacy setting: $e');
  }
}

Future<
  ({
    bool muted,
    int messageNotifications,
    bool suppressEveryone,
    bool suppressRoles,
    bool mobilePush,
    Map<String, ({int messageNotifications, bool muted})> channelOverrides,
  })
>
_getNotificationSettings({
  required FluxerDatabase db,
  required String guildId,
}) async {
  final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
  if (existing == null) {
    return (
      muted: false,
      messageNotifications: 0,
      suppressEveryone: false,
      suppressRoles: false,
      mobilePush: true,
      channelOverrides: <String, ({int messageNotifications, bool muted})>{},
    );
  }

  final json = jsonDecode(existing.data) as Map<String, dynamic>;
  final settings = UserGuildSettingsResponse.fromJson(json);

  final overrides = <String, ({int messageNotifications, bool muted})>{};
  if (settings.channelOverrides != null) {
    for (final entry in settings.channelOverrides!.entries) {
      overrides[entry.key] = (
        messageNotifications:
            entry.value.messageNotifications.json ??
            UserNotificationSettings.inherit.json!,
        muted: entry.value.muted,
      );
    }
  }

  return (
    muted: settings.muted,
    messageNotifications:
        settings.messageNotifications.json ??
        UserNotificationSettings.allMessages.json!,
    suppressEveryone: settings.suppressEveryone,
    suppressRoles: settings.suppressRoles,
    mobilePush: settings.mobilePush,
    channelOverrides: overrides,
  );
}

Future<
  List<({String id, String name, int type, String? parentId, int position})>
>
_getGuildChannels({required FluxerDatabase db, required String guildId}) async {
  final channels = await db.channelDao.getChannels(guildId);
  return channels
      .map(
        (c) => (
          id: c.id,
          name: c.name,
          type: c.type,
          parentId: c.parentId,
          position: c.position,
        ),
      )
      .toList();
}

final _notifSettingTimers = <String, Timer>{};
final _notifSettingPending =
    <
      String,
      ({
        bool? muted,
        UserNotificationSettings? messageNotifications,
        bool? suppressEveryone,
        bool? suppressRoles,
        bool? mobilePush,
      })
    >{};

Future<void> _updateNotificationSetting({
  required FluxerDatabase db,
  required FluxerClient client,
  required String guildId,
  bool? muted,
  UserNotificationSettings? messageNotifications,
  bool? suppressEveryone,
  bool? suppressRoles,
  bool? mobilePush,
}) async {
  try {
    final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
    final data = existing != null
        ? jsonDecode(existing.data) as Map<String, dynamic>
        : <String, dynamic>{};

    if (muted != null) {
      data['muted'] = muted;
      if (!muted) {
        data.remove('mute_config');
      }
    }
    if (messageNotifications != null) {
      data['message_notifications'] = messageNotifications.json;
    }
    if (suppressEveryone != null) {
      data['suppress_everyone'] = suppressEveryone;
    }
    if (suppressRoles != null) {
      data['suppress_roles'] = suppressRoles;
    }
    if (mobilePush != null) {
      data['mobile_push'] = mobilePush;
    }

    await db.userGuildSettingsDao.upsert(
      UserGuildSettingsTableCompanion(
        guildId: Value(guildId),
        data: Value(jsonEncode(data)),
      ),
    );

    final prev = _notifSettingPending[guildId];
    _notifSettingPending[guildId] = (
      muted: muted ?? prev?.muted,
      messageNotifications: messageNotifications ?? prev?.messageNotifications,
      suppressEveryone: suppressEveryone ?? prev?.suppressEveryone,
      suppressRoles: suppressRoles ?? prev?.suppressRoles,
      mobilePush: mobilePush ?? prev?.mobilePush,
    );

    _notifSettingTimers[guildId]?.cancel();
    _notifSettingTimers[guildId] = Timer(const Duration(seconds: 3), () {
      final pending = _notifSettingPending.remove(guildId);
      _notifSettingTimers.remove(guildId);
      if (pending == null) {
        return;
      }
      unawaited(
        client.users.updateGuildSettingsForUser(
          guildId: guildId,
          body: UserGuildSettingsUpdateRequest(
            muted: pending.muted,
            messageNotifications: pending.messageNotifications,
            suppressEveryone: pending.suppressEveryone,
            suppressRoles: pending.suppressRoles,
            mobilePush: pending.mobilePush,
          ),
        ),
      );
    });
  } on Exception catch (e) {
    talker.error('[GuildNavbar] Failed to update notification setting: $e');
  }
}

Future<Map<String, Object?>> _buildGuildDebugJson({
  required FluxerClient client,
  required FluxerDatabase db,
  required String userId,
  required String guildId,
}) async {
  final response = await client.guilds.getGuild(guildId: guildId);
  final json = response.toJson()..remove('permissions');

  final member = await db.memberDao.getMemberByUserId(userId, guildId);
  if (member?.joinedAt != null) {
    json['joined_at'] = member!.joinedAt!.toUtc().toIso8601String();
  }

  final server = await db.guildDao.getServerById(guildId);
  json['unavailable'] = server?.unavailable ?? false;
  json['member_count'] = server?.memberCount ?? 0;

  final roles = await db.roleDao.getRoles(guildId);
  final rolesMap = <String, Object>{};
  for (final role in roles) {
    rolesMap[role.id] = {
      'id': role.id,
      'name': role.name,
      'color': role.color,
      'position': role.position,
      'hoist_position': role.hoist ? role.position : null,
      'permissions': role.permissions,
      'hoist': role.hoist,
    };
  }
  json['roles'] = rolesMap;

  return json;
}

const Map<GuildAction, int> _muteDurations = {
  GuildAction.mute15Min: 15 * 60 * 1000,
  GuildAction.mute30Min: 30 * 60 * 1000,
  GuildAction.mute1Hour: 60 * 60 * 1000,
  GuildAction.mute3Hours: 3 * 60 * 60 * 1000,
  GuildAction.mute4Hours: 4 * 60 * 60 * 1000,
  GuildAction.mute8Hours: 8 * 60 * 60 * 1000,
  GuildAction.mute24Hours: 24 * 60 * 60 * 1000,
  GuildAction.mute3Days: 3 * 24 * 60 * 60 * 1000,
};

Future<void> updateGuildUserSettings(
  GuildAction action,
  String guildId,
  FluxerDatabase db,
  FluxerClient client,
) async {
  final existing = await db.userGuildSettingsDao.getByGuildId(guildId);
  final currentData = existing != null
      ? jsonDecode(existing.data) as Map<String, dynamic>
      : <String, dynamic>{};

  UserGuildSettingsUpdateRequest request;

  switch (action) {
    case GuildAction.hideMutedChannels:
      final current = currentData['hide_muted_channels'] as bool? ?? false;
      currentData['hide_muted_channels'] = !current;
      request = UserGuildSettingsUpdateRequest(hideMutedChannels: !current);

    case GuildAction.unmute:
      currentData['muted'] = false;
      currentData.remove('mute_config');
      request = const UserGuildSettingsUpdateRequest(muted: false);

    case GuildAction.muteForever:
      currentData['muted'] = true;
      currentData.remove('mute_config');
      request = const UserGuildSettingsUpdateRequest(muted: true);

    case GuildAction.mute15Min:
    case GuildAction.mute30Min:
    case GuildAction.mute1Hour:
    case GuildAction.mute3Hours:
    case GuildAction.mute4Hours:
    case GuildAction.mute8Hours:
    case GuildAction.mute24Hours:
    case GuildAction.mute3Days:
      final durationMs = _muteDurations[action]!;
      final endTime = DateTime.now().add(Duration(milliseconds: durationMs));
      final endTimeIso = endTime.toUtc().toIso8601String();
      currentData['muted'] = true;
      currentData['mute_config'] = {
        'end_time': endTimeIso,
        'selected_time_window': durationMs,
      };
      request = UserGuildSettingsUpdateRequest(
        muted: true,
        muteConfig: UserGuildSettingsUpdateRequestMuteConfig(
          selectedTimeWindow: durationMs,
          endTime: endTimeIso,
        ),
      );

    case GuildAction.markAsRead:
    case GuildAction.inviteMembers:
    case GuildAction.createChannel:
    case GuildAction.createCategory:
    case GuildAction.settingsOverview:
    case GuildAction.settingsRoles:
    case GuildAction.settingsEmoji:
    case GuildAction.settingsStickers:
    case GuildAction.settingsSafetyModeration:
    case GuildAction.settingsActivityLog:
    case GuildAction.settingsWebhooks:
    case GuildAction.settingsCustomInviteUrl:
    case GuildAction.settingsDiscovery:
    case GuildAction.settingsMembers:
    case GuildAction.settingsInviteLinks:
    case GuildAction.settingsBans:
    case GuildAction.notificationSettings:
    case GuildAction.privacySettings:
    case GuildAction.editCommunityProfile:
    case GuildAction.leaveGuild:
    case GuildAction.reportCommunity:
    case GuildAction.reportRaid:
    case GuildAction.debugCommunity:
    case GuildAction.copyGuildId:
      return;
  }

  await db.userGuildSettingsDao.upsert(
    UserGuildSettingsTableCompanion(
      guildId: Value(guildId),
      data: Value(jsonEncode(currentData)),
    ),
  );

  unawaited(
    client.users.updateGuildSettingsForUser(guildId: guildId, body: request),
  );
}

class _InviteRecipient {
  const _InviteRecipient({
    required this.id,
    required this.displayName,
    this.secondaryText,
    this.avatarUrl,
    this.status,
    this.channelId,
  });

  final String id;
  final String displayName;
  final String? secondaryText;
  final String? avatarUrl;
  final String? status;
  final String? channelId;
}

double _guildNavbarInitialsFontSize(int initialsLength) {
  if (initialsLength <= 2) {
    return 20;
  }
  if (initialsLength <= kGuildIconInitialsMaxLength) {
    return 16;
  }
  return 12;
}

class _GuildListItem extends StatefulWidget {
  final String label;
  final Guild? guild;
  final bool isSelected;
  final int permissions;
  final bool isOwner;
  final bool isUnavailable;
  final int unavailableCount;
  final bool isMuted;
  final DateTime? muteEndTime;
  final bool hideMutedChannels;
  final VoiceActivityType voiceActivity;
  final List<VoiceParticipantRow> voiceRows;
  final IconData? icon;
  final String? svgAsset;
  final VoidCallback onTap;
  final VoidCallback? onMenuOpened;
  final String? iconUrl;
  final bool hasUnread;
  final int mentionCount;
  final bool guildUnreadReady;
  final bool invitesPaused;
  final bool developerMode;
  final VoidCallback? onMarkAsRead;
  final VoidCallback? onLeaveGuild;
  final void Function(GuildAction)? onGuildSettingsAction;
  final void Function(String name)? onCreateCategory;
  final void Function(ChannelCreateRequest request)? onCreateChannel;
  final Future<({String url, String channelName})?> Function({
    int maxAge,
    int maxUses,
    bool temporary,
  })?
  onCreateInvite;
  final Future<List<_InviteRecipient>> Function()? onGetRecipients;
  final Future<void> Function(
    String? channelId,
    String? recipientId,
    String inviteUrl,
  )?
  onSendInviteTo;
  final Future<({bool isDmsAllowed, bool isBotDmsAllowed})> Function()?
  onGetPrivacyState;
  final void Function({required bool allowed})? onToggleDms;
  final void Function({required bool allowed})? onToggleBotDms;
  final Future<Map<String, Object?>> Function()? onGetGuildDebugJson;
  final void Function(FluxerToast toast)? onShowToast;
  final Future<
    ({
      bool muted,
      int messageNotifications,
      bool suppressEveryone,
      bool suppressRoles,
      bool mobilePush,
      Map<String, ({int messageNotifications, bool muted})> channelOverrides,
    })
  >
  Function()?
  onGetNotificationSettings;
  final void Function({
    bool? muted,
    UserNotificationSettings? messageNotifications,
    bool? suppressEveryone,
    bool? suppressRoles,
    bool? mobilePush,
  })?
  onUpdateNotificationSetting;
  final Future<
    List<({String id, String name, int type, String? parentId, int position})>
  >
  Function()?
  onGetGuildChannels;
  final void Function(
    String channelId,
    int messageNotifications, {
    required bool muted,
  })?
  onUpdateChannelOverride;
  final void Function(String channelId)? onRemoveChannelOverride;

  const _GuildListItem({
    required this.label,
    required this.onTap,
    super.key,
    this.guild,
    this.isSelected = false,
    this.permissions = 0,
    this.isOwner = false,
    this.isUnavailable = false,
    this.unavailableCount = 0,
    this.isMuted = false,
    this.muteEndTime,
    this.hideMutedChannels = false,
    this.voiceActivity = VoiceActivityType.none,
    this.voiceRows = const [],
    this.icon,
    this.svgAsset,
    this.iconUrl,
    this.onMenuOpened,
    this.hasUnread = false,
    this.mentionCount = 0,
    this.guildUnreadReady = true,
    this.invitesPaused = false,
    this.developerMode = false,
    this.onMarkAsRead,
    this.onLeaveGuild,
    this.onGuildSettingsAction,
    this.onCreateCategory,
    this.onCreateChannel,
    this.onCreateInvite,
    this.onGetRecipients,
    this.onSendInviteTo,
    this.onGetPrivacyState,
    this.onToggleDms,
    this.onToggleBotDms,
    this.onGetGuildDebugJson,
    this.onShowToast,
    this.onGetNotificationSettings,
    this.onUpdateNotificationSetting,
    this.onGetGuildChannels,
    this.onUpdateChannelOverride,
    this.onRemoveChannelOverride,
  });

  @override
  State<_GuildListItem> createState() => _GuildListItemState();
}

class _GuildListItemState extends State<_GuildListItem>
    with AutomaticKeepAliveClientMixin {
  var _isHovered = false;
  var _animateUnreadIndicator = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animateUnreadIndicator = widget.guildUnreadReady;
  }

  @override
  void didUpdateWidget(_GuildListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.guildUnreadReady && widget.guildUnreadReady) {
      _animateUnreadIndicator = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _animateUnreadIndicator = true);
        }
      });
    }
  }

  bool get _displayHasUnread => widget.guildUnreadReady && widget.hasUnread;

  int get _displayMentionCount =>
      widget.guildUnreadReady ? widget.mentionCount : 0;

  Duration get _unreadIndicatorDuration {
    if (!widget.guildUnreadReady || !_animateUnreadIndicator) {
      return Duration.zero;
    }
    return const Duration(milliseconds: 200);
  }

  Widget _buildBackupIcon(BuildContext context, {required bool isActive}) {
    final iconColor = isActive
        ? context.colors.textOnBrandPrimary
        : context.colors.textPrimary;
    final initials = abbreviateGuildName(widget.label);
    final initialsLength = guildNameInitialsLength(widget.label);
    return Center(
      child: widget.svgAsset != null
          ? SvgPicture.asset(
              widget.svgAsset!,
              width: 44,
              height: 44,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            )
          : widget.icon != null
          ? PhosphorIcon(widget.icon!, color: iconColor, size: 32)
          : Text(
              initials,
              style: TextStyle(
                color: iconColor,
                fontSize: _guildNavbarInitialsFontSize(initialsLength),
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isActive = widget.isSelected || _isHovered;
    final borderRadius = isActive ? 13.0 : 22.0;
    final hasImage = widget.iconUrl != null && !widget.isUnavailable;
    final bgColor = widget.isUnavailable
        ? context.colors.statusDanger
        : hasImage
        ? Colors.transparent
        : isActive
        ? context.colors.brandPrimary
        : context.colors.serverIconBackground;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          AnimatedContainer(
            duration: _unreadIndicatorDuration,
            curve: const Cubic(0.25, 0.1, 0.25, 1),
            width: 6,
            height: widget.isSelected
                ? 40
                : _isHovered
                ? 20
                : _displayHasUnread
                ? 8
                : 0,
            decoration: BoxDecoration(
              color: context.colors.textPrimary,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(999),
                bottomRight: Radius.circular(999),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _RightTooltip(
                backgroundColor: widget.isUnavailable
                    ? context.colors.statusDanger
                    : null,
                borderColor: widget.isUnavailable
                    ? context.colors.statusDanger
                    : null,
                content: widget.guild != null
                    ? _GuildTooltipContent(
                        guild: widget.guild!,
                        unavailableCount: widget.unavailableCount,
                        permissions: widget.permissions,
                        isMuted: widget.isMuted,
                        muteEndTime: widget.muteEndTime,
                        voiceRows: widget.voiceRows,
                      )
                    : _TooltipLabel(label: widget.label),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: GestureDetector(
                    onTap: widget.onTap,
                    onSecondaryTapUp: widget.guild != null
                        ? (details) => unawaited(
                            _showContextMenu(context, details.globalPosition),
                          )
                        : null,
                    onLongPress: widget.guild != null
                        ? () => unawaited(_showActionSheet(context))
                        : null,
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 70),
                          curve: Curves.easeOut,
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(
                              borderRadius,
                            ),
                            child: widget.isUnavailable
                                ? Center(
                                    child: PhosphorIcon(
                                      PhosphorIconsRegular.exclamationMark,
                                      color: context.colors.textOnBrandPrimary,
                                      size: 32,
                                    ),
                                  )
                                : widget.iconUrl != null
                                ? Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: widget.iconUrl!,
                                        errorBuilder: (context, url, error) =>
                                            _buildBackupIcon(
                                              context,
                                              isActive: isActive,
                                            ),
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                                _buildBackupIcon(
                                                  context,
                                                  isActive: isActive,
                                                ),
                                      ),
                                      if (isActive &&
                                          widget.guild?.animatedIconUrl != null)
                                        CachedNetworkImage(
                                          imageUrl:
                                              widget.guild!.animatedIconUrl!,
                                          fadeInDuration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          errorBuilder: (context, url, error) =>
                                              const SizedBox.shrink(),
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  const SizedBox.shrink(),
                                        ),
                                    ],
                                  )
                                : _buildBackupIcon(context, isActive: isActive),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (!widget.isUnavailable &&
                  !widget.isSelected &&
                  _displayMentionCount > 0)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: FluxerBadge.count(
                    count: _displayMentionCount,
                    cutoutColor: context.colors.backgroundSecondary,
                  ),
                ),
              if (!widget.isUnavailable &&
                  widget.voiceActivity != VoiceActivityType.none)
                Positioned(
                  top: -4,
                  right: -4,
                  child: _VoiceActivityBadge(type: widget.voiceActivity),
                ),
              if (!widget.isUnavailable &&
                  !widget.isSelected &&
                  widget.invitesPaused &&
                  _displayMentionCount == 0 &&
                  widget.voiceActivity == VoiceActivityType.none)
                const Positioned(bottom: -4, right: -4, child: _PauseBadge()),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showContextMenu(BuildContext context, Offset position) async {
    if (widget.guild == null) {
      return;
    }
    widget.onMenuOpened?.call();
    final action = await showGuildContextMenu(
      context,
      position: position,
      guild: widget.guild!,
      hasUnread: widget.hasUnread,
      isMuted: widget.isMuted,
      isOwner: widget.isOwner,
      permissions: widget.permissions,
      muteEndTime: widget.muteEndTime,
      hideMutedChannels: widget.hideMutedChannels,
      developerMode: widget.developerMode,
    );
    if (context.mounted && action != null) {
      _handleAction(context, action);
    }
  }

  Future<void> _showActionSheet(BuildContext context) async {
    if (widget.guild == null) {
      return;
    }
    widget.onMenuOpened?.call();
    final isMobile = MediaQuery.of(context).size.width < Breakpoints.tablet;
    if (!isMobile) {
      return;
    }
    final action = await showGuildBottomSheet(
      context,
      guild: widget.guild!,
      hasUnread: widget.hasUnread,
      isMuted: widget.isMuted,
      isOwner: widget.isOwner,
      permissions: widget.permissions,
      muteEndTime: widget.muteEndTime,
      hideMutedChannels: widget.hideMutedChannels,
      developerMode: widget.developerMode,
    );
    if (context.mounted && action != null) {
      _handleAction(context, action);
    }
  }

  static bool _isValidUrl(String value) {
    final url = value.trim();
    if (url.isEmpty) {
      return false;
    }
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  Future<void> _showCreateChannelModal(BuildContext context) async {
    var currentName = '';
    var currentUrl = '';
    var selectedType = 0; // GUILD_TEXT
    final formValid = ValueNotifier(false);

    void updateValidity() {
      final nameOk = currentName.trim().isNotEmpty;
      final urlOk = selectedType != 998 || _isValidUrl(currentUrl);
      formValid.value = nameOk && urlOk;
    }

    final request = await FluxerModal.show<ChannelCreateRequest>(
      context,
      title: 'Create Channel',
      builder: (dialogContext, close) {
        final layout = dialogContext.layout;
        return StatefulBuilder(
          builder: (stfContext, setModalState) {
            final colors = stfContext.colors;
            final textStyles = stfContext.textStyles;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: layout.s2),
                  child: Text(
                    'Channel Type',
                    style: textStyles.label.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                FluxerRadioGroup<int>(
                  value: selectedType,
                  onChanged: (value) {
                    setModalState(() => selectedType = value);
                    updateValidity();
                  },
                  items: const [
                    FluxerRadioItem(
                      value: 0,
                      label: 'Text Channel',
                      description: 'Send messages, images, GIFs, and emoji',
                    ),
                    FluxerRadioItem(
                      value: 2,
                      label: 'Voice Channel',
                      description:
                          'Hang out together with voice, video, '
                          'and screen share',
                    ),
                    FluxerRadioItem(
                      value: 998,
                      label: 'Link Channel',
                      description:
                          'Quick access to an external website '
                          'or resource',
                    ),
                  ],
                ),
                SizedBox(height: layout.s4),
                FluxerInput(
                  label: 'Name',
                  hint: 'new-channel',
                  maxLength: 100,
                  autofocus: true,
                  onChanged: (value) {
                    currentName = value;
                    updateValidity();
                  },
                ),
                if (selectedType == 998) ...[
                  SizedBox(height: layout.s4),
                  FluxerInput(
                    label: 'URL',
                    hint: 'https://example.com',
                    maxLength: 1024,
                    keyboardType: TextInputType.url,
                    onChanged: (value) {
                      currentUrl = value;
                      updateValidity();
                    },
                  ),
                ],
              ],
            );
          },
        );
      },
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: formValid,
          builder: (_, isValid, _) => FluxerButton.primary(
            onPressed: isValid
                ? () {
                    final name = currentName.trim();
                    final ChannelCreateRequest body = switch (selectedType) {
                      2 => ChannelCreateRequest2(
                        name: name,
                        type: ChannelCreateVoiceRequestTypeType.guildVoice,
                        topic: null,
                        url: null,
                        parentId: null,
                        bitrate: 64000,
                        userLimit: 0,
                        voiceConnectionLimit: null,
                        permissionOverwrites: [],
                        nsfw: false,
                        nsfwOverride: null,
                        contentWarningLevel: null,
                        contentWarningText: null,
                      ),
                      998 => ChannelCreateRequest998(
                        name: name,
                        type: ChannelCreateLinkRequestTypeType.guildLink,
                        topic: null,
                        url: currentUrl.trim(),
                        parentId: null,
                        bitrate: null,
                        userLimit: null,
                        voiceConnectionLimit: null,
                        permissionOverwrites: [],
                        nsfw: false,
                        nsfwOverride: null,
                        contentWarningLevel: null,
                        contentWarningText: null,
                      ),
                      _ => ChannelCreateRequest0(
                        name: name,
                        type: ChannelCreateTextRequestTypeType.guildText,
                        topic: null,
                        url: null,
                        parentId: null,
                        bitrate: null,
                        userLimit: null,
                        voiceConnectionLimit: null,
                        permissionOverwrites: [],
                        nsfw: false,
                        nsfwOverride: null,
                        contentWarningLevel: null,
                        contentWarningText: null,
                      ),
                    };
                    Navigator.of(context).pop(body);
                  }
                : null,
            label: 'Create Channel',
          ),
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(
          onPressed: () => Navigator.of(context).pop(),
          label: 'Cancel',
        ),
      ],
    );
    if (request != null && context.mounted) {
      widget.onCreateChannel?.call(request);
    }
  }

  Future<void> _showCreateCategoryModal(BuildContext context) async {
    var currentName = '';
    final nameValid = ValueNotifier(false);
    final name = await FluxerModal.show<String>(
      context,
      title: 'Create Category',
      builder: (dialogContext, close) {
        return FluxerInput(
          label: 'Name',
          hint: 'New Category',
          maxLength: 100,
          autofocus: true,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            currentName = value;
            nameValid.value = value.trim().isNotEmpty;
          },
          onSubmitted: (_) {
            final value = currentName.trim();
            if (value.isNotEmpty) {
              Navigator.of(context).pop(value);
            }
          },
        );
      },
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: nameValid,
          builder: (_, isValid, _) => FluxerButton.primary(
            onPressed: isValid
                ? () => Navigator.of(context).pop(currentName.trim())
                : null,
            label: 'Create Category',
          ),
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(
          onPressed: () => Navigator.of(context).pop(),
          label: 'Cancel',
        ),
      ],
    );
    if (name != null && name.isNotEmpty && context.mounted) {
      widget.onCreateCategory?.call(name);
    }
  }

  static String _expirationLabel(int maxAge) => switch (maxAge) {
    0 => 'never',
    1800 => '30 minutes',
    3600 => '1 hour',
    21600 => '6 hours',
    43200 => '12 hours',
    86400 => '1 day',
    604800 => '7 days',
    _ => '$maxAge seconds',
  };

  Future<void> _showInviteMembersModal(BuildContext context) async {
    final inviteFuture = widget.onCreateInvite?.call();
    if (inviteFuture == null) {
      return;
    }

    final recipientsFuture = widget.onGetRecipients?.call();
    final inviteState =
        ValueNotifier<({String url, String channelName, int maxAge})?>(null);
    final copied = ValueNotifier(false);
    final sentTo = ValueNotifier<Set<String>>({});
    final sendingTo = ValueNotifier<Set<String>>({});

    unawaited(
      inviteFuture
          .then((r) {
            if (r != null) {
              inviteState.value = (
                url: r.url,
                channelName: r.channelName,
                maxAge: 604800,
              );
            }
          })
          .catchError((_) {}),
    );

    await FluxerModal.show<void>(
      context,
      title: 'Invite friends to ${widget.label}',
      builder: (dialogContext, close) {
        final colors = dialogContext.colors;
        final textStyles = dialogContext.textStyles;
        final layout = dialogContext.layout;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder<
              ({String url, String channelName, int maxAge})?
            >(
              valueListenable: inviteState,
              builder: (_, result, _) {
                if (result == null) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: EdgeInsets.only(bottom: layout.s3),
                  child: Text(
                    'Recipients will be taken to '
                    '#${result.channelName}',
                    style: textStyles.timestamp.copyWith(
                      color: colors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                );
              },
            ),

            FutureBuilder<List<_InviteRecipient>?>(
              future: recipientsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: layout.s8),
                    child: Center(
                      child: FluxerLoadingSpinner(color: colors.brandPrimary),
                    ),
                  );
                }

                final recipients = snapshot.data ?? [];
                var searchQuery = '';

                return StatefulBuilder(
                  builder: (context, setLocalState) {
                    final filtered = recipients.where((r) {
                      if (searchQuery.isEmpty) {
                        return true;
                      }
                      final q = searchQuery.toLowerCase();
                      return r.displayName.toLowerCase().contains(q) ||
                          (r.secondaryText?.toLowerCase().contains(q) ?? false);
                    }).toList();

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FluxerInput(
                          hint: 'Search friends',
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: layout.s3),
                            child: PhosphorIcon(
                              PhosphorIconsBold.magnifyingGlass,
                              size: 20,
                              color: colors.textSecondary,
                            ),
                          ),
                          onChanged: (v) =>
                              setLocalState(() => searchQuery = v),
                        ),
                        SizedBox(height: layout.s2),
                        SizedBox(
                          height: 280,
                          child: filtered.isEmpty
                              ? Center(
                                  child: Text(
                                    recipients.isEmpty
                                        ? 'No friends yet'
                                        : 'No results',
                                    style: textStyles.bodySmall.copyWith(
                                      color: colors.textSecondary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                    vertical: layout.s2,
                                  ),
                                  itemCount: filtered.length,
                                  itemBuilder: (context, index) =>
                                      _buildRecipientItem(
                                        context,
                                        recipient: filtered[index],
                                        inviteState: inviteState,
                                        sentTo: sentTo,
                                        sendingTo: sendingTo,
                                      ),
                                ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
      actions: [
        Builder(
          builder: (actionContext) {
            final colors = actionContext.colors;
            final textStyles = actionContext.textStyles;
            final layout = actionContext.layout;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: layout.s2,
              children: [
                Text(
                  'Or, send an invite link to a friend:',
                  style: textStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colors.textPrimary,
                  ),
                ),
                ValueListenableBuilder<
                  ({String url, String channelName, int maxAge})?
                >(
                  valueListenable: inviteState,
                  builder: (_, state, _) => TextFormField(
                    key: ValueKey(state?.url),
                    initialValue: state?.url ?? '',
                    readOnly: true,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Invite link',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: layout.s1),
                        child: ValueListenableBuilder<bool>(
                          valueListenable: copied,
                          builder: (_, isCopied, _) => FluxerButton.primary(
                            fitContent: true,
                            size: FluxerButtonSize.compact,
                            onPressed: state != null
                                ? () async {
                                    await Clipboard.setData(
                                      ClipboardData(text: state.url),
                                    );
                                    copied.value = true;
                                    unawaited(
                                      Future<void>.delayed(
                                        const Duration(seconds: 3),
                                        () {
                                          if (copied.value) {
                                            copied.value = false;
                                          }
                                        },
                                      ),
                                    );
                                  }
                                : null,
                            label: isCopied ? 'Copied!' : 'Copy',
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(),
                    ),
                  ),
                ),
                ValueListenableBuilder<
                  ({String url, String channelName, int maxAge})?
                >(
                  valueListenable: inviteState,
                  builder: (_, state, _) {
                    final expiryText = state == null || state.maxAge == 604800
                        ? 'Your invite link expires in 7 days.'
                        : state.maxAge == 0
                        ? 'This invite link never expires.'
                        : 'Your invite link expires in '
                              '${_expirationLabel(state.maxAge)}.';
                    return GestureDetector(
                      onTap: () => unawaited(
                        _editInviteLink(actionContext, inviteState, copied),
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '$expiryText '),
                            TextSpan(
                              text: 'Edit invite link',
                              style: textStyles.timestamp.copyWith(
                                color: colors.textLink,
                              ),
                            ),
                          ],
                        ),
                        style: textStyles.timestamp.copyWith(
                          color: colors.textTertiary,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Future<void> _editInviteLink(
    BuildContext context,
    ValueNotifier<({String url, String channelName, int maxAge})?> inviteState,
    ValueNotifier<bool> copied,
  ) async {
    final settings = await _showEditInviteSettings(context);
    if (settings == null || !context.mounted) {
      return;
    }

    final prev = inviteState.value;
    inviteState.value = null;
    copied.value = false;

    try {
      final result = await widget.onCreateInvite?.call(
        maxAge: settings.maxAge,
        maxUses: settings.maxUses,
        temporary: settings.temporary,
      );
      if (result != null) {
        inviteState.value = (
          url: result.url,
          channelName: result.channelName,
          maxAge: settings.maxAge,
        );
      } else {
        inviteState.value = prev;
      }
    } on Exception catch (_) {
      inviteState.value = prev;
    }
  }

  Future<({int maxAge, int maxUses, bool temporary})?> _showEditInviteSettings(
    BuildContext context,
  ) {
    var maxAge = 604800;
    var maxUses = 0;
    var temporary = false;

    return FluxerModal.show<({int maxAge, int maxUses, bool temporary})>(
      context,
      title: 'Invite link settings',
      builder: (dialogContext, close) {
        final colors = dialogContext.colors;
        final textStyles = dialogContext.textStyles;
        final layout = dialogContext.layout;

        return StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            spacing: layout.s4,
            children: [
              FluxerSelect<int>(
                label: 'Expire After',
                value: maxAge,
                items: const [
                  FluxerSelectItem(value: 0, label: 'Never'),
                  FluxerSelectItem(value: 1800, label: '30 minutes'),
                  FluxerSelectItem(value: 3600, label: '1 hour'),
                  FluxerSelectItem(value: 21600, label: '6 hours'),
                  FluxerSelectItem(value: 43200, label: '12 hours'),
                  FluxerSelectItem(value: 86400, label: '1 day'),
                  FluxerSelectItem(value: 604800, label: '7 days'),
                ],
                onChanged: (v) => setState(() => maxAge = v),
              ),
              FluxerSelect<int>(
                label: 'Max Number of Uses',
                value: maxUses,
                items: const [
                  FluxerSelectItem(value: 0, label: 'No limit'),
                  FluxerSelectItem(value: 1, label: '1 use'),
                  FluxerSelectItem(value: 5, label: '5 uses'),
                  FluxerSelectItem(value: 10, label: '10 uses'),
                  FluxerSelectItem(value: 25, label: '25 uses'),
                  FluxerSelectItem(value: 50, label: '50 uses'),
                  FluxerSelectItem(value: 100, label: '100 uses'),
                ],
                onChanged: (v) => setState(() => maxUses = v),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FluxerToggleSwitch(
                    value: temporary,
                    onChanged: (v) => setState(() => temporary = v),
                    label: 'Grant Temporary Membership',
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: layout.s1),
                    child: Text(
                      'Members will be removed when they go '
                      'offline unless a role is assigned',
                      style: textStyles.timestamp.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      actions: [
        FluxerButton.primary(
          onPressed: () => Navigator.of(
            context,
          ).pop((maxAge: maxAge, maxUses: maxUses, temporary: temporary)),
          label: 'Create New Link',
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(
          onPressed: () => Navigator.of(context).pop(),
          label: 'Cancel',
        ),
      ],
    );
  }

  Widget _buildRecipientItem(
    BuildContext context, {
    required _InviteRecipient recipient,
    required ValueNotifier<({String url, String channelName, int maxAge})?>
    inviteState,
    required ValueNotifier<Set<String>> sentTo,
    required ValueNotifier<Set<String>> sendingTo,
  }) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4, vertical: layout.s2),
      child: Row(
        children: [
          FluxerAvatar.user(
            imageUrl: recipient.avatarUrl,
            fallbackText: recipient.displayName,
            status: recipient.status,
            size: 32,
          ),
          SizedBox(width: layout.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  recipient.displayName,
                  style: textStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (recipient.secondaryText != null)
                  Text(
                    recipient.secondaryText!,
                    style: textStyles.timestamp.copyWith(
                      color: colors.textTertiary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
          SizedBox(width: layout.s3),
          ValueListenableBuilder<Set<String>>(
            valueListenable: sentTo,
            builder: (_, sent, _) {
              if (sent.contains(recipient.id)) {
                return const FluxerButton.secondary(
                  fitContent: true,
                  size: FluxerButtonSize.compact,
                  label: 'Sent',
                );
              }
              return ValueListenableBuilder<Set<String>>(
                valueListenable: sendingTo,
                builder: (_, sending, _) {
                  final isSending = sending.contains(recipient.id);
                  return ValueListenableBuilder<
                    ({String url, String channelName, int maxAge})?
                  >(
                    valueListenable: inviteState,
                    builder: (_, result, _) => FluxerButton.secondary(
                      fitContent: true,
                      size: FluxerButtonSize.compact,
                      isLoading: isSending,
                      onPressed: result != null && !isSending
                          ? () => _sendInviteTo(
                              recipient,
                              result.url,
                              sentTo,
                              sendingTo,
                            )
                          : null,
                      label: 'Invite',
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _sendInviteTo(
    _InviteRecipient recipient,
    String inviteUrl,
    ValueNotifier<Set<String>> sentTo,
    ValueNotifier<Set<String>> sendingTo,
  ) async {
    sendingTo.value = {...sendingTo.value, recipient.id};
    try {
      await widget.onSendInviteTo?.call(
        recipient.channelId,
        recipient.channelId != null ? null : recipient.id,
        inviteUrl,
      );
      sentTo.value = {...sentTo.value, recipient.id};
    } finally {
      sendingTo.value = {...sendingTo.value}..remove(recipient.id);
    }
  }

  Future<void> _confirmLeaveGuild(BuildContext context) async {
    final confirmed = await FluxerConfirmModal.show(
      context,
      title: 'Leave Community',
      description:
          'Are you sure you want to leave this community? '
          'You will no longer be able to see any messages.',
      confirmLabel: 'Leave Community',
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !context.mounted) {
      return;
    }
    widget.onLeaveGuild?.call();
    if (context.mounted) {
      context.go(RoutePaths.me);
    }
  }

  Future<void> _showNotificationSettingsSheet(BuildContext context) async {
    if (widget.onGetNotificationSettings == null) {
      return;
    }

    final settings = await widget.onGetNotificationSettings!();
    if (!context.mounted) {
      return;
    }

    final channels = await widget.onGetGuildChannels?.call() ?? [];
    if (!context.mounted) {
      return;
    }

    final channelMap = {for (final c in channels) c.id: c};

    final l10n = FluxerLocalizations.of(context);
    final muted = ValueNotifier<bool>(settings.muted);
    final notifLevel = ValueNotifier<int>(settings.messageNotifications);
    final suppressEveryone = ValueNotifier<bool>(settings.suppressEveryone);
    final suppressRoles = ValueNotifier<bool>(settings.suppressRoles);
    final mobilePush = ValueNotifier<bool>(settings.mobilePush);
    final overrides =
        ValueNotifier<Map<String, ({int messageNotifications, bool muted})>>(
          Map.of(settings.channelOverrides),
        );

    await FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.notificationSettings,
      builder: (sheetContext, scrollController, close) {
        final layout = sheetContext.layout;
        final colors = sheetContext.colors;
        final textStyles = sheetContext.textStyles;

        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.s4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: muted,
                  builder: (_, isMuted, _) => _PrivacySwitchRow(
                    label: l10n.notificationMuteGuild(widget.guild!.name),
                    description: l10n.notificationMuteDescription,
                    value: isMuted,
                    onChanged: (value) {
                      muted.value = value;
                      widget.onUpdateNotificationSetting?.call(muted: value);
                    },
                  ),
                ),

                SizedBox(height: layout.s6),
                Text(
                  l10n.notificationCommunitySettings,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: layout.s3),
                ValueListenableBuilder<int>(
                  valueListenable: notifLevel,
                  builder: (_, level, _) => FluxerRadioGroup<int>(
                    value: level,
                    items: [
                      FluxerRadioItem(
                        value: 0,
                        label: l10n.notificationAllMessages,
                      ),
                      FluxerRadioItem(
                        value: 1,
                        label: l10n.notificationOnlyMentions,
                      ),
                      FluxerRadioItem(
                        value: 2,
                        label: l10n.notificationNothing,
                      ),
                    ],
                    onChanged: (value) {
                      notifLevel.value = value;
                      widget.onUpdateNotificationSetting?.call(
                        messageNotifications: UserNotificationSettings.fromJson(
                          value,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: layout.s6),
                FluxerSwitchGroup(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: suppressEveryone,
                      builder: (_, suppress, _) => FluxerSwitchGroupItem(
                        label: l10n.notificationSuppressEveryone,
                        value: suppress,
                        onChanged: (value) {
                          suppressEveryone.value = value;
                          widget.onUpdateNotificationSetting?.call(
                            suppressEveryone: value,
                          );
                        },
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: suppressRoles,
                      builder: (_, suppress, _) => FluxerSwitchGroupItem(
                        label: l10n.notificationSuppressRoles,
                        value: suppress,
                        onChanged: (value) {
                          suppressRoles.value = value;
                          widget.onUpdateNotificationSetting?.call(
                            suppressRoles: value,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: layout.s6),
                FluxerSwitchGroup(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: mobilePush,
                      builder: (_, push, _) => FluxerSwitchGroupItem(
                        label: l10n.notificationMobilePush,
                        value: push,
                        onChanged: (value) {
                          mobilePush.value = value;
                          widget.onUpdateNotificationSetting?.call(
                            mobilePush: value,
                          );
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: layout.s6),
                Text(
                  l10n.notificationOverrides,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: layout.s3),
                ValueListenableBuilder<
                  Map<String, ({int messageNotifications, bool muted})>
                >(
                  valueListenable: overrides,
                  builder: (_, currentOverrides, _) {
                    final available = channels
                        .where((c) => !currentOverrides.containsKey(c.id))
                        .toList();
                    return FluxerSelect<String>(
                      hint: l10n.notificationSelectChannel,
                      items: [
                        for (final ch in available)
                          FluxerSelectItem(
                            value: ch.id,
                            label: ch.name,
                            icon: ChannelIcon.iconDataFor(
                              channelTypeFromInt(ch.type),
                            ),
                          ),
                      ],
                      onChanged: (channelId) {
                        overrides.value = {
                          ...overrides.value,
                          channelId: (messageNotifications: 3, muted: false),
                        };
                        widget.onUpdateChannelOverride?.call(
                          channelId,
                          3,
                          muted: false,
                        );
                      },
                    );
                  },
                ),
                ValueListenableBuilder<
                  Map<String, ({int messageNotifications, bool muted})>
                >(
                  valueListenable: overrides,
                  builder: (_, currentOverrides, _) {
                    if (currentOverrides.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    final sorted = currentOverrides.entries.toList()
                      ..sort((a, b) {
                        final ca = channelMap[a.key];
                        final cb = channelMap[b.key];
                        if (ca == null && cb == null) {
                          return 0;
                        }
                        if (ca == null) {
                          return 1;
                        }
                        if (cb == null) {
                          return -1;
                        }
                        final cmp = ca.position.compareTo(cb.position);
                        return cmp != 0 ? cmp : a.key.compareTo(b.key);
                      });

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: layout.s3),
                        for (final entry in sorted)
                          _buildOverrideCard(
                            sheetContext,
                            channelId: entry.key,
                            channelOverride: entry.value,
                            channel: channelMap[entry.key],
                            channelMap: channelMap,
                            overrides: overrides,
                            guildNotifLevel: notifLevel.value,
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOverrideCard(
    BuildContext context, {
    required String channelId,
    required ({int messageNotifications, bool muted}) channelOverride,
    required ({
      String id,
      String name,
      int type,
      String? parentId,
      int position,
    })?
    channel,
    required Map<
      String,
      ({String id, String name, int type, String? parentId, int position})
    >
    channelMap,
    required ValueNotifier<
      Map<String, ({int messageNotifications, bool muted})>
    >
    overrides,
    required int guildNotifLevel,
  }) {
    if (channel == null) {
      return const SizedBox.shrink();
    }

    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final isCategory = channel.type == 4;
    final category = channel.parentId != null
        ? channelMap[channel.parentId]
        : null;

    final notifLevel = channelOverride.messageNotifications;
    final isInherit = notifLevel == 3;
    final resolved = isInherit ? guildNotifLevel : notifLevel;

    return Padding(
      padding: EdgeInsets.only(bottom: layout.s3),
      child: Material(
        color: colors.backgroundSecondaryAlt,
        borderRadius: layout.radiusLg,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(layout.s3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _GuildNotificationChannelIcon(
                    channelId: channelId,
                    fallbackType: channelTypeFromInt(channel.type),
                    color: colors.textTertiary,
                  ),
                  SizedBox(width: layout.s2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          channel.name,
                          style: textStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (!isCategory)
                          Text(
                            category?.name ?? l10n.notificationNoCategory,
                            style: textStyles.smallText.copyWith(
                              color: colors.textTertiary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: layout.s2),
                  FluxerTappable(
                    onTap: () {
                      final updated = Map.of(overrides.value)
                        ..remove(channelId);
                      overrides.value = updated;
                      widget.onRemoveChannelOverride?.call(channelId);
                    },
                    semanticLabel: 'Remove override',
                    builder: (_, _) => Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.backgroundTertiary,
                      ),
                      child: Center(
                        child: PhosphorIcon(
                          PhosphorIconsBold.x,
                          size: 14,
                          color: colors.textTertiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: layout.s3),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: colors.backgroundHeaderSecondary.withValues(
                    alpha: 0.3,
                  ),
                ),
              ),

              FluxerToggleSwitch(
                label: l10n.notificationAllMessages,
                value: resolved == 0,
                onChanged: (_) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: 0,
                    muted: channelOverride.muted,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    0,
                    muted: channelOverride.muted,
                  );
                },
              ),
              SizedBox(height: layout.s3),
              FluxerToggleSwitch(
                label: l10n.notificationOnlyAtMentions,
                value: resolved == 1,
                onChanged: (_) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: 1,
                    muted: channelOverride.muted,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    1,
                    muted: channelOverride.muted,
                  );
                },
              ),
              SizedBox(height: layout.s3),
              FluxerToggleSwitch(
                label: l10n.notificationNothing,
                value: resolved == 2,
                onChanged: (_) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: 2,
                    muted: channelOverride.muted,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    2,
                    muted: channelOverride.muted,
                  );
                },
              ),
              SizedBox(height: layout.s3),
              FluxerToggleSwitch(
                label: l10n.notificationMuteChannel,
                value: channelOverride.muted,
                onChanged: (value) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: channelOverride.messageNotifications,
                    muted: value,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    channelOverride.messageNotifications,
                    muted: value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showPrivacySettingsSheet(BuildContext context) async {
    final guild = widget.guild!;
    if (widget.onGetPrivacyState == null) {
      return;
    }

    final privacyState = await widget.onGetPrivacyState!();
    if (!context.mounted) {
      return;
    }

    final l10n = FluxerLocalizations.of(context);
    final isDmsAllowed = ValueNotifier<bool>(privacyState.isDmsAllowed);
    final isBotDmsAllowed = ValueNotifier<bool>(privacyState.isBotDmsAllowed);

    await FluxerBottomSheet.show<void>(
      context,
      title: l10n.privacySettings,
      builder: (sheetContext, close) {
        final layout = sheetContext.layout;

        final isMutualDmsDisabled = guild.features.contains(
          'DISABLE_MUTUAL_DMS',
        );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isMutualDmsDisabled) ...[
                FluxerWarningAlert(message: l10n.privacyMutualDmsDisabled),
                SizedBox(height: layout.s4),
              ],
              ValueListenableBuilder<bool>(
                valueListenable: isDmsAllowed,
                builder: (_, allowed, _) => _PrivacySwitchRow(
                  label: l10n.privacyDirectMessages,
                  description: l10n.privacyDirectMessagesDescription,
                  value: allowed,
                  onChanged: (allowed) {
                    isDmsAllowed.value = allowed;
                    widget.onToggleDms?.call(allowed: allowed);
                  },
                ),
              ),
              SizedBox(height: layout.s4),
              ValueListenableBuilder<bool>(
                valueListenable: isBotDmsAllowed,
                builder: (_, allowed, _) => _PrivacySwitchRow(
                  label: l10n.privacyBotDirectMessages,
                  description: l10n.privacyBotDirectMessagesDescription,
                  value: allowed,
                  onChanged: (allowed) {
                    isBotDmsAllowed.value = allowed;
                    widget.onToggleBotDms?.call(allowed: allowed);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showDebugCommunitySheet(BuildContext context) async {
    if (widget.onGetGuildDebugJson == null) {
      return;
    }

    final Map<String, Object?> guildJson;
    try {
      guildJson = await widget.onGetGuildDebugJson!();
    } on Exception catch (e) {
      talker.error('[GuildNavbar] Failed to load guild debug data: $e');
      return;
    }
    if (!context.mounted) {
      return;
    }

    final l10n = FluxerLocalizations.of(context);
    await showDebugBottomSheet(
      context,
      title: l10n.communityDebug,
      data: guildJson,
      onCopied: (_) => widget.onShowToast?.call(
        FluxerToast(
          message: l10n.copiedToClipboard,
          variant: FluxerToastVariant.success,
        ),
      ),
    );
  }

  void _handleAction(BuildContext context, GuildAction action) {
    final guildId = widget.guild!.id;
    switch (action) {
      case GuildAction.settingsOverview:
        unawaited(
          context.push(RoutePaths.guildSettingsPath(guildId, tab: 'overview')),
        );
      case GuildAction.settingsRoles:
        unawaited(
          context.push(RoutePaths.guildSettingsPath(guildId, tab: 'roles')),
        );
      case GuildAction.settingsEmoji:
        unawaited(
          context.push(RoutePaths.guildSettingsPath(guildId, tab: 'emoji')),
        );
      case GuildAction.settingsStickers:
        unawaited(
          context.push(RoutePaths.guildSettingsPath(guildId, tab: 'stickers')),
        );
      case GuildAction.settingsSafetyModeration:
      case GuildAction.settingsActivityLog:
      case GuildAction.settingsWebhooks:
      case GuildAction.settingsCustomInviteUrl:
      case GuildAction.settingsDiscovery:
      case GuildAction.settingsInviteLinks:
        unawaited(context.push(RoutePaths.guildSettingsPath(guildId)));
      case GuildAction.settingsMembers:
        unawaited(
          context.push(RoutePaths.guildSettingsPath(guildId, tab: 'members')),
        );
      case GuildAction.settingsBans:
        unawaited(
          context.push(RoutePaths.guildSettingsPath(guildId, tab: 'bans')),
        );
      case GuildAction.copyGuildId:
        unawaited(Clipboard.setData(ClipboardData(text: guildId)));
        widget.onShowToast?.call(
          FluxerToast(
            message: FluxerLocalizations.of(context).copiedToClipboard,
            variant: FluxerToastVariant.success,
          ),
        );
      case GuildAction.markAsRead:
        widget.onMarkAsRead?.call();
      case GuildAction.hideMutedChannels:
      case GuildAction.mute15Min:
      case GuildAction.mute30Min:
      case GuildAction.mute1Hour:
      case GuildAction.mute3Hours:
      case GuildAction.mute4Hours:
      case GuildAction.mute8Hours:
      case GuildAction.mute24Hours:
      case GuildAction.mute3Days:
      case GuildAction.muteForever:
      case GuildAction.unmute:
        widget.onGuildSettingsAction?.call(action);
      case GuildAction.leaveGuild:
        unawaited(_confirmLeaveGuild(context));
      case GuildAction.createCategory:
        unawaited(_showCreateCategoryModal(context));
      case GuildAction.createChannel:
        unawaited(_showCreateChannelModal(context));
      case GuildAction.inviteMembers:
        unawaited(_showInviteMembersModal(context));
      case GuildAction.notificationSettings:
        unawaited(_showNotificationSettingsSheet(context));
      case GuildAction.editCommunityProfile:
      case GuildAction.reportCommunity:
      case GuildAction.reportRaid:
        break;
      case GuildAction.privacySettings:
        unawaited(_showPrivacySettingsSheet(context));
      case GuildAction.debugCommunity:
        unawaited(_showDebugCommunitySheet(context));
    }
  }
}

class _HomeDmButton extends ConsumerWidget {
  const _HomeDmButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingFriendCount =
        ref.watch(pendingFriendRequestCountProvider).value ?? 0;
    final (bool collapseDMs, bool expanded) = ref.watch(
      dmFolderProvider.select((s) => (s.collapseDMs, s.expanded)),
    );
    final isCollapsed = collapseDMs && !expanded;
    final isDm = ref.watch(
      currentLocationProvider.select((l) => l.startsWith('/channels/@me')),
    );
    var dmMentionCount = 0;
    var hasCollapsedDmUnread = false;
    if (isCollapsed) {
      final (int mentions, bool anyUnread) = ref.watch(
        unreadDmChannelsProvider.select(
          (s) => (
            s.channels.fold<int>(0, (sum, dm) => sum + dm.unreadCount),
            s.channels.any((dm) => s.hasUnread(dm.id)),
          ),
        ),
      );
      dmMentionCount = mentions;
      hasCollapsedDmUnread = anyUnread;
    }
    return _GuildListItem(
      label: 'Direct Messages',
      isSelected: isDm,
      svgAsset: Assets.fluxerSymbol,
      mentionCount: pendingFriendCount + dmMentionCount,
      hasUnread: hasCollapsedDmUnread,
      onTap: () {
        if (collapseDMs && isDm) {
          ref.read(dmFolderProvider.notifier).toggleExpanded();
          return;
        }
        context.go(RoutePaths.me);
      },
    );
  }
}

class _FavoritesButton extends ConsumerWidget {
  const _FavoritesButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (int mentionCount, bool hasUnread) = ref.watch(
      favoritesUnreadSummaryProvider.select(
        (s) => (s.mentionCount, s.hasUnread),
      ),
    );
    final isFavorites = ref.watch(
      currentLocationProvider.select(
        (l) => l.startsWith('/channels/@favorites'),
      ),
    );
    return _GuildListItem(
      label: 'Favorites',
      isSelected: isFavorites,
      icon: PhosphorIconsFill.star,
      mentionCount: mentionCount,
      hasUnread: hasUnread,
      onTap: () => context.go(RoutePaths.favoritesBase),
    );
  }
}

class _PrivacySwitchRow extends StatelessWidget {
  const _PrivacySwitchRow({
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return FluxerToggleSwitch(
      label: label,
      description: description,
      value: value,
      onChanged: onChanged,
    );
  }
}

class _DashedGuildIcon extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _DashedGuildIcon({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_DashedGuildIcon> createState() => _DashedGuildIconState();
}

class _DashedGuildIconState extends State<_DashedGuildIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _radiusAnim;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 70),
    );
    _radiusAnim = Tween<double>(
      begin: 22,
      end: 13,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorAnim = ColorTween(
      begin: context.colors.interactiveMuted,
      end: context.colors.textPrimary,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter() => _controller.forward();

  void _onExit() => _controller.reverse();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        const SizedBox(width: 12),
        _RightTooltip(
          content: _TooltipLabel(label: widget.label),
          child: MouseRegion(
            onEnter: (_) => _onEnter(),
            onExit: (_) => _onExit(),
            child: GestureDetector(
              onTap: widget.onTap,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: CustomPaint(
                        painter: _DashedBorderPainter(
                          borderRadius: _radiusAnim.value,
                          color:
                              _colorAnim.value ??
                              context.colors.interactiveMuted,
                        ),
                        child: Center(
                          child: PhosphorIcon(
                            widget.icon,
                            color:
                                _colorAnim.value ??
                                context.colors.interactiveMuted,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _DashedBorderPainter extends CustomPainter {
  final double borderRadius;
  final Color color;

  _DashedBorderPainter({required this.borderRadius, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );
    final path = Path()..addRRect(rrect);

    const dashLength = 6.0;
    const gapLength = 4.0;

    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + dashLength).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter oldDelegate) =>
      oldDelegate.borderRadius != borderRadius || oldDelegate.color != color;
}

class _RightTooltip extends StatefulWidget {
  final Widget content;
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;

  const _RightTooltip({
    required this.content,
    required this.child,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  State<_RightTooltip> createState() => _RightTooltipState();
}

class _RightTooltipState extends State<_RightTooltip>
    with SingleTickerProviderStateMixin {
  final _layerLink = LayerLink();
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _scaleAnim;
  OverlayEntry? _entry;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _scaleAnim = Tween<double>(
      begin: 0.98,
      end: 1,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
  }

  void _show() {
    if (_entry != null) {
      return;
    }
    final overlay = Overlay.of(context);
    final bgColor = widget.backgroundColor ?? context.colors.backgroundPrimary;
    final borderColor =
        widget.borderColor ?? context.colors.backgroundHeaderSecondary;

    _entry = OverlayEntry(
      builder: (_) => UnconstrainedBox(
        child: CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: Alignment.centerRight,
          followerAnchor: Alignment.centerLeft,
          offset: const Offset(8, 0),
          showWhenUnlinked: false,
          child: IgnorePointer(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                alignment: Alignment.centerLeft,
                child: Material(
                  color: Colors.transparent,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 350 + _kArrowWidth,
                    ),
                    child: CustomPaint(
                      painter: _TooltipShapePainter(
                        fillColor: bgColor,
                        borderColor: borderColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: _kArrowWidth + 16,
                          right: 16,
                          top: 12,
                          bottom: 12,
                        ),
                        child: widget.content,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_entry!);
    unawaited(_animController.forward());
  }

  void _hide() {
    if (_entry == null) {
      return;
    }
    unawaited(
      _animController.reverse().then((_) {
        _entry?.remove();
        _entry = null;
      }),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    _entry?.remove();
    _entry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: _layerLink,
    child: MouseRegion(
      onEnter: (_) => _show(),
      onExit: (_) => _hide(),
      child: widget.child,
    ),
  );
}

class _UnavailableGuildsIndicator extends StatelessWidget {
  final int count;

  const _UnavailableGuildsIndicator({required this.count});

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          const SizedBox(width: 12),
          _RightTooltip(
            backgroundColor: context.colors.statusDanger,
            borderColor: context.colors.statusDanger,
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                l10n.guildUnavailableOutageTooltip(count),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: context.colors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: context.colors.statusDanger,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                    child: PhosphorIcon(
                      PhosphorIconsRegular.exclamationMark,
                      color: context.colors.textOnBrandPrimary,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarDivider extends StatelessWidget {
  final Color color;

  const _SidebarDivider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Center(
        child: Container(
          width: 32,
          height: 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ),
    );
  }
}

class _TooltipLabel extends StatelessWidget {
  final String label;

  const _TooltipLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: context.colors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _GuildTooltipContent extends StatelessWidget {
  final Guild guild;
  final int unavailableCount;
  final int permissions;
  final bool isMuted;
  final DateTime? muteEndTime;
  final List<VoiceParticipantRow> voiceRows;

  const _GuildTooltipContent({
    required this.guild,
    this.unavailableCount = 0,
    this.permissions = 0,
    this.isMuted = false,
    this.muteEndTime,
    this.voiceRows = const [],
  });

  String get _mutedText {
    if (muteEndTime == null) {
      return 'Muted';
    }
    final month = _monthAbbr(muteEndTime!.month);
    final day = muteEndTime!.day;
    final year = muteEndTime!.year;
    final hour = muteEndTime!.hour > 12
        ? muteEndTime!.hour - 12
        : muteEndTime!.hour == 0
        ? 12
        : muteEndTime!.hour;
    final minute = muteEndTime!.minute.toString().padLeft(2, '0');
    final period = muteEndTime!.hour >= 12 ? 'PM' : 'AM';
    return 'Muted until $month $day, $year $hour:$minute $period';
  }

  static String _monthAbbr(int month) => const [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ][month - 1];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: guild.unavailable
          ? Text(
              '$unavailableCount '
              '${unavailableCount == 1 ? 'community is' : 'communities are'}'
              ' temporarily unavailable\n'
              'due to a flux capacitor malfunction.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.colors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (guild.isPartnered || guild.isVerified) ...[
                      _GuildBadge(isPartnered: guild.isPartnered),
                      const SizedBox(width: 6),
                    ],
                    Flexible(
                      child: Text(
                        guild.name,
                        style: TextStyle(
                          color: context.colors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                if (guild.features.contains(
                  'UNAVAILABLE_FOR_EVERYONE_BUT_STAFF',
                )) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Only accessible to Fluxer staff',
                    style: TextStyle(
                      color: context.colors.statusDanger,
                      fontSize: 14,
                    ),
                  ),
                ],
                if (hasPermission(permissions, Permission.manageGuild) &&
                    guild.features.contains('INVITES_DISABLED')) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Invites are currently paused in this community',
                    style: TextStyle(
                      color: context.colors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
                if (isMuted) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhosphorIcon(
                        PhosphorIconsFill.bellSlash,
                        color: context.colors.textSecondary,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _mutedText,
                        style: TextStyle(
                          color: context.colors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
                for (final row in voiceRows) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhosphorIcon(
                        row.isScreenshare
                            ? PhosphorIconsFill.monitor
                            : PhosphorIconsFill.speakerHigh,
                        color: context.colors.textSecondary,
                        size: 28,
                      ),
                      const SizedBox(width: 6),
                      _AvatarStack(avatarUrls: row.avatarUrls),
                    ],
                  ),
                ],
              ],
            ),
    );
  }
}

class _AvatarStack extends StatelessWidget {
  final List<String> avatarUrls;

  const _AvatarStack({required this.avatarUrls});

  @override
  Widget build(BuildContext context) {
    if (avatarUrls.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: avatarUrls.length * 20.0 + 8,
      height: 28,
      child: Stack(
        children: [
          for (var i = 0; i < avatarUrls.length; i++)
            Positioned(
              left: i * 20.0,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colors.backgroundPrimary,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: avatarUrls[i],
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _GuildBadge extends StatelessWidget {
  final bool isPartnered;

  const _GuildBadge({required this.isPartnered});

  @override
  Widget build(BuildContext context) {
    if (isPartnered) {
      return Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: context.colors.brandPrimary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsBold.infinity,
            color: context.colors.textOnBrandPrimary,
            size: 10,
          ),
        ),
      );
    }
    return PhosphorIcon(
      PhosphorIconsFill.sealCheck,
      color: context.colors.textPrimary,
      size: 16,
    );
  }
}

class _VoiceActivityBadge extends StatelessWidget {
  final VoiceActivityType type;

  const _VoiceActivityBadge({required this.type});

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    switch (type) {
      case VoiceActivityType.video:
        icon = PhosphorIconsFill.videoCamera;
      case VoiceActivityType.screenshare:
        icon = PhosphorIconsFill.monitor;
      case VoiceActivityType.voice:
        icon = PhosphorIconsFill.speakerHigh;
      case VoiceActivityType.none:
        return const SizedBox.shrink();
    }
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: context.colors.statusOnline,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.serverSidebarBackground,
          width: 3,
        ),
      ),
      child: Center(
        child: PhosphorIcon(
          icon,
          color: context.colors.textOnBrandPrimary,
          size: 12,
        ),
      ),
    );
  }
}

class _PauseBadge extends StatelessWidget {
  const _PauseBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: context.colors.interactiveMuted,
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.serverSidebarBackground,
          width: 3,
        ),
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsFill.pause,
          size: 12,
          color: context.colors.textOnBrandPrimary,
        ),
      ),
    );
  }
}

const double _kArrowWidth = 5;
const double _kArrowHeight = 10;
const double _kBorderRadius = 8;

class _GuildNotificationChannelIcon extends ConsumerWidget {
  const _GuildNotificationChannelIcon({
    required this.channelId,
    required this.fallbackType,
    required this.color,
  });

  final String channelId;
  final ChannelType fallbackType;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Channel? full = ref.watch(channelByIdProvider(channelId)).value;
    final int? effectivePermissionBits = ref
        .watch(effectiveGuildChannelPermissionBitsProvider(channelId))
        .value;
    if (full == null) {
      return ChannelIcon(type: fallbackType, color: color);
    }
    return ChannelIcon(
      type: full.type,
      channel: full,
      effectivePermissionBits: effectivePermissionBits,
      color: color,
    );
  }
}

class _TooltipShapePainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;

  _TooltipShapePainter({required this.fillColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    const r = _kBorderRadius;
    const left = _kArrowWidth;
    final centerY = size.height / 2;
    final arrowTop = centerY - _kArrowHeight / 2;
    final arrowBottom = centerY + _kArrowHeight / 2;

    final path = Path()
      // Top-left corner
      ..moveTo(left + r, 0)
      // Top edge → top-right corner
      ..lineTo(size.width - r, 0)
      ..arcToPoint(Offset(size.width, r), radius: const Radius.circular(r))
      // Right edge → bottom-right corner
      ..lineTo(size.width, size.height - r)
      ..arcToPoint(
        Offset(size.width - r, size.height),
        radius: const Radius.circular(r),
      )
      // Bottom edge → bottom-left corner
      ..lineTo(left + r, size.height)
      ..arcToPoint(
        Offset(left, size.height - r),
        radius: const Radius.circular(r),
      )
      // Left edge down to arrow
      ..lineTo(left, arrowBottom)
      // Arrow pointing left
      ..lineTo(0, centerY)
      ..lineTo(left, arrowTop)
      // Left edge up to top-left corner
      ..lineTo(left, r)
      ..arcToPoint(const Offset(left + r, 0), radius: const Radius.circular(r))
      ..close();

    canvas
      ..drawPath(path, Paint()..color = fillColor)
      ..drawPath(
        path,
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1,
      );
  }

  @override
  bool shouldRepaint(_TooltipShapePainter old) =>
      old.fillColor != fillColor || old.borderColor != borderColor;
}
