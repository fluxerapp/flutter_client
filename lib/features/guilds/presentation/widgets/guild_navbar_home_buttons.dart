part of 'guild_navbar.dart';

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
      label: FluxerLocalizations.of(context).guildNavbarDirectMessages,
      isSelected: isDm,
      icon: PhosphorIconsFill.chatCircle,
      mentionCount: pendingFriendCount + dmMentionCount,
      hasUnread: hasCollapsedDmUnread,
      opaqueHitTarget: true,
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
      onTap: () {
        DrawerNavigationCoordinator.selectFavorites(ref.container);
      },
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
