import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/favorite_channels_dao.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/domain/hide_muted_channels_filter.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_channel_context_menu.dart';
import 'package:fluxer_app/features/favorites/presentation/widgets/favorites_list_context_menu.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channel_groups_provider.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/favorites/utils/favorite_entry_subtitle.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FavoritesChannelList extends ConsumerWidget {
  const FavoritesChannelList({
    required this.selectedChannelId,
    required this.onChannelSelected,
    super.key,
  });

  final String? selectedChannelId;
  final ValueChanged<ResolvedFavoriteEntry> onChannelSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final groups = ref.watch(favoriteChannelGroupsProvider);
    final settings = ref.watch(favoriteSettingsProvider).value;
    final collapsedIds = settings == null
        ? const <String>{}
        : favoriteSettingsCollapsedCategoryIds(settings).toSet();
    final hideMuted = settings?.hideMuted ?? false;
    final canReorder =
        layoutModeOf(layoutReferenceExtentOf(MediaQuery.sizeOf(context))) ==
        LayoutMode.desktop;

    if (groups.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(context.layout.s6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsFill.star,
                size: 40,
                color: context.colors.textTertiary,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.favoritesEmptyTitle,
                style: context.textStyles.channelName,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                l10n.favoritesEmptyDescription,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onSecondaryTapUp: (details) {
        unawaited(
          showFavoritesListMenu(context, ref, position: details.globalPosition),
        );
      },
      onLongPress: isMobileLayout(context)
          ? () => unawaited(
              showFavoritesListMenu(context, ref, position: Offset.zero),
            )
          : null,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
        children: [
          for (final group in groups) ...[
            _FavoriteCategoryHeader(
              title: switch (group.title) {
                '__root__' => l10n.favoritesTitle,
                '__other__' => l10n.favoritesOtherCategory,
                _ => group.title,
              },
              categoryId: group.categoryId,
              isCollapsed:
                  group.categoryId != null &&
                  collapsedIds.contains(group.categoryId),
              onToggle: group.categoryId == null
                  ? null
                  : () => _toggleCategory(ref, collapsedIds, group.categoryId!),
            ),
            if (group.categoryId == null ||
                !collapsedIds.contains(group.categoryId))
              _FavoriteGroupEntries(
                group: group,
                hideMuted: hideMuted,
                canReorder: canReorder,
                selectedChannelId: selectedChannelId,
                onChannelSelected: onChannelSelected,
              ),
          ],
        ],
      ),
    );
  }

  static List<ResolvedFavoriteEntry> _visibleEntriesStatic(
    WidgetRef ref,
    List<ResolvedFavoriteEntry> entries,
    bool hideMuted, {
    required String? selectedChannelId,
  }) {
    if (!hideMuted) {
      return entries;
    }
    return [
      for (final entry in entries)
        if (_shouldShowStatic(ref, entry, selectedChannelId: selectedChannelId))
          entry,
    ];
  }

  static bool _shouldShowStatic(
    WidgetRef ref,
    ResolvedFavoriteEntry entry, {
    required String? selectedChannelId,
  }) {
    final guildId = entry.guildId;
    if (guildId == null || guildId.isEmpty) {
      return true;
    }
    final mutedSet =
        ref.watch(mutedChannelIdsProvider(guildId)).value ?? const {};
    return shouldShowChannelWhenHidingMuted(
      channelId: entry.channelId,
      mutedChannelIds: mutedSet,
      selectedChannelId: selectedChannelId,
    );
  }

  static Future<void> _reorderEntriesStatic(
    WidgetRef ref, {
    required FavoriteChannelGroup group,
    required List<ResolvedFavoriteEntry> visibleEntries,
    required int oldIndex,
    required int newIndex,
  }) async {
    var targetIndex = newIndex;
    if (targetIndex > oldIndex) {
      targetIndex -= 1;
    }
    final reordered = List<ResolvedFavoriteEntry>.from(visibleEntries);
    final moved = reordered.removeAt(oldIndex);
    reordered.insert(targetIndex, moved);
    final repository = ref.read(favoriteChannelsRepositoryProvider);
    for (var i = 0; i < reordered.length; i++) {
      await repository.moveChannel(
        channelId: reordered[i].channelId,
        position: i,
        parentId: group.categoryId == '__other__' ? null : group.categoryId,
      );
    }
  }
}

Future<void> _toggleCategory(
  WidgetRef ref,
  Set<String> collapsedIds,
  String categoryId,
) async {
  final next = Set<String>.from(collapsedIds);
  if (next.contains(categoryId)) {
    next.remove(categoryId);
  } else {
    next.add(categoryId);
  }
  await ref
      .read(favoriteChannelsRepositoryProvider)
      .setCollapsedCategoryIds(next.toList());
}

class _FavoriteGroupEntries extends ConsumerWidget {
  const _FavoriteGroupEntries({
    required this.group,
    required this.hideMuted,
    required this.canReorder,
    required this.selectedChannelId,
    required this.onChannelSelected,
  });

  final FavoriteChannelGroup group;
  final bool hideMuted;
  final bool canReorder;
  final String? selectedChannelId;
  final ValueChanged<ResolvedFavoriteEntry> onChannelSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = FavoritesChannelList._visibleEntriesStatic(
      ref,
      group.entries,
      hideMuted,
      selectedChannelId: selectedChannelId,
    );

    Widget buildTile(ResolvedFavoriteEntry entry) {
      return _FavoriteChannelTile(
        entry: entry,
        isSelected: selectedChannelId == entry.channelId,
        onTap: () => onChannelSelected(entry),
        onContextMenu: (position) => unawaited(
          showFavoritesChannelMenu(
            context,
            ref,
            entry: entry,
            position: position,
          ),
        ),
      );
    }

    if (!canReorder) {
      return Column(
        children: [
          for (final entry in entries)
            KeyedSubtree(
              key: ValueKey('fav-${entry.channelId}'),
              child: buildTile(entry),
            ),
        ],
      );
    }

    return ReorderableListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      itemCount: entries.length,
      onReorder: (oldIndex, newIndex) {
        unawaited(
          FavoritesChannelList._reorderEntriesStatic(
            ref,
            group: group,
            visibleEntries: entries,
            oldIndex: oldIndex,
            newIndex: newIndex,
          ),
        );
      },
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ReorderableDragStartListener(
          key: ValueKey('fav-${entry.channelId}'),
          index: index,
          child: buildTile(entry),
        );
      },
    );
  }
}

class _FavoriteCategoryHeader extends StatelessWidget {
  const _FavoriteCategoryHeader({
    required this.title,
    required this.categoryId,
    required this.isCollapsed,
    required this.onToggle,
  });

  final String title;
  final String? categoryId;
  final bool isCollapsed;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 14, 8, 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: context.textStyles.categoryName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (onToggle != null) ...[
              const SizedBox(width: 4),
              PhosphorIcon(
                isCollapsed
                    ? PhosphorIconsRegular.caretRight
                    : PhosphorIconsRegular.caretDown,
                size: 12,
                color: context.colors.textPrimaryMuted,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _FavoriteChannelTile extends ConsumerWidget {
  const _FavoriteChannelTile({
    required this.entry,
    required this.isSelected,
    required this.onTap,
    required this.onContextMenu,
  });

  final ResolvedFavoriteEntry entry;
  final bool isSelected;
  final VoidCallback onTap;
  final ValueChanged<Offset> onContextMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final subtitle = favoriteEntrySubtitle(entry, l10n);
    final unreadAsync = ref.watch(channelUnreadProvider(entry.channelId));
    final unread = unreadAsync.value;
    final hasUnreadMessages = unread?.hasUnreadMessages ?? false;
    final mentionCount = unread?.mentionCount ?? 0;
    final guildId = entry.guildId;
    final mutedSet = guildId == null || guildId.isEmpty
        ? const <String>{}
        : ref.watch(mutedChannelIdsProvider(guildId)).value ?? const {};
    final isMuted = mutedSet.contains(entry.channelId);
    final showFadedUnread = ref.watch(
      appearancePreferencesProvider.select(
        (s) => s.showFadedUnreadOnMutedChannels,
      ),
    );
    final unreadState = getChannelUnreadState(
      unreadCount: hasUnreadMessages ? 1 : 0,
      mentionCount: mentionCount,
      isMuted: isMuted,
      showFadedUnreadOnMutedChannels: showFadedUnread,
      unreadBadgesLevel: unread?.unreadBadgesLevel,
    );
    final textColor = isSelected
        ? context.colors.textPrimary
        : unreadState.isHighlight
        ? context.colors.textSecondary
        : context.colors.textTertiaryMuted;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (!isSelected && unreadState.shouldShowUnreadIndicator)
          Positioned(
            left: 1,
            top: 0,
            bottom: 0,
            child: Center(child: ChannelUnreadIndicator(faded: isMuted)),
          ),
        Material(
          color: isSelected
              ? context.colors.backgroundModifierSelected
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: onTap,
            onSecondaryTapUp: (details) =>
                onContextMenu(details.globalPosition),
            onLongPress: isMobileLayout(context)
                ? () => onContextMenu(Offset.zero)
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: [
                  _FavoriteLeadingIcon(entry: entry, isSelected: isSelected),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.displayName,
                          style: context.textStyles.username.copyWith(
                            color: textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle,
                            style: context.textStyles.timestamp.copyWith(
                              color: context.colors.textTertiary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  if (mentionCount > 0) FluxerBadge.count(count: mentionCount),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FavoriteLeadingIcon extends ConsumerWidget {
  const _FavoriteLeadingIcon({required this.entry, required this.isSelected});

  final ResolvedFavoriteEntry entry;
  final bool isSelected;

  static const double _avatarSize = 24;
  static const double _badgeSize = 14;
  static const double _badgeIconSize = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dm = entry.dm;
    if (dm != null && dm.isGroup) {
      return FluxerAvatarCluster(
        channelId: dm.id,
        iconUrl: dm.icon == null
            ? null
            : FluxerMediaUrl.guildIcon(guildId: dm.id, hash: dm.icon),
        members: [
          for (final member in dm.groupMembers.take(3))
            AvatarClusterMember(
              userId: member.id,
              imageUrl: FluxerMediaUrl.userAvatar(
                userId: member.id,
                hash: member.avatar,
              ),
              fallbackText: member.name,
            ),
        ],
        size: _avatarSize,
      );
    }
    if (dm != null) {
      return FluxerAvatar.user(
        fallbackText: dm.displayName,
        userId: dm.recipientId,
        imageUrl: dm.recipientAvatar == null
            ? null
            : FluxerMediaUrl.userAvatar(
                userId: dm.recipientId,
                hash: dm.recipientAvatar,
              ),
        status: dm.recipientStatus,
        size: _avatarSize,
      );
    }

    final channel = entry.channel;
    final guild = entry.guild;
    if (channel != null && guild != null) {
      final int? cachedPermissionBits = ref.watch(
        channelPermissionCacheProvider.select((m) => m[channel.id]),
      );
      return SizedBox.square(
        dimension: _avatarSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            FluxerGuildIconAvatar(
              name: guild.name,
              imageUrl: guild.iconUrl,
              isCircle: true,
              size: _avatarSize,
            ),
            Positioned(
              right: -2,
              bottom: -2,
              child: Container(
                width: _badgeSize,
                height: _badgeSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.backgroundModifierSelected
                      : context.colors.backgroundPrimary,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: ChannelIcon(
                  type: channel.type,
                  channel: channel,
                  effectivePermissionBits: cachedPermissionBits,
                  size: _badgeIconSize,
                  color: isSelected
                      ? context.colors.surfaceInteractiveSelectedColor
                      : context.colors.textPrimaryMuted,
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (channel != null) {
      final int? cachedPermissionBits = ref.watch(
        channelPermissionCacheProvider.select((m) => m[channel.id]),
      );
      return SizedBox.square(
        dimension: _avatarSize,
        child: Center(
          child: ChannelIcon(
            type: channel.type,
            channel: channel,
            effectivePermissionBits: cachedPermissionBits,
            size: _avatarSize,
          ),
        ),
      );
    }

    return const _DmPlaceholderAvatar();
  }
}

class _DmPlaceholderAvatar extends StatelessWidget {
  const _DmPlaceholderAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        'DM',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: context.colors.brandPrimary,
        ),
      ),
    );
  }
}
