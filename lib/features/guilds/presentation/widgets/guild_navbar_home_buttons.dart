part of 'guild_navbar.dart';

class _HomeDmButton extends ConsumerWidget {
  const _HomeDmButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingFriendCount =
        ref.watch(pendingFriendRequestCountProvider).value ?? 0;
    final collapseDMs = ref.watch(
      appearancePreferencesProvider.select((s) => s.collapseDMs),
    );
    final expanded = ref.watch(dmFolderProvider.select((s) => s.expanded));
    final (bool showCollapsedBadge, bool showFriendBadge) = ref.watch(
      syncedExtrasPreferencesProvider.select(
        (SyncedExtrasState s) =>
            (s.showCollapsedUnreadDmsBadge, s.showIncomingFriendRequestBadge),
      ),
    );
    final isCollapsed = collapseDMs && !expanded;
    final isDm = ref.watch(
      currentLocationProvider.select((l) => l.startsWith('/channels/@me')),
    );
    var dmMentionCount = 0;
    var hasCollapsedDmUnread = false;
    if (isCollapsed && showCollapsedBadge) {
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
      label: FluxerLocalizations.of(context).guildNavbarDirectMessages,
      isSelected: isDm,
      icon: PhosphorIconsFill.chatCircle,
      mentionCount: (showFriendBadge ? pendingFriendCount : 0) + dmMentionCount,
      hasUnread: hasCollapsedDmUnread,
      opaqueHitTarget: true,
      onContextMenu: (Offset position) =>
          showHomeButtonMenu(context, ref, position: position),
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
      label: FluxerLocalizations.of(context).favoritesTitle,
      isSelected: isFavorites,
      icon: PhosphorIconsFill.star,
      mentionCount: mentionCount,
      hasUnread: hasUnread,
      onContextMenu: (Offset position) =>
          showFavoritesButtonMenu(context, ref, position: position),
      onTap: () {
        DrawerNavigationCoordinator.selectFavorites(ref.container);
      },
    );
  }
}
