import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart'
    show fluxerMediaCdn;
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DMList extends ConsumerStatefulWidget {
  const DMList({super.key});

  @override
  ConsumerState<DMList> createState() => _DMListState();
}

class _DMListState extends ConsumerState<DMList> {
  bool _isSearching = false;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _searchQuery = '';
      }
    });
  }

  void personalNote() {
    final userId = ref.read(currentUserIdProvider);
    if (userId != null) {
      navigateToContent(context, RoutePaths.dmChannel(userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(dmViewModelProvider);
    final convos = vm.conversations;
    final location = ref.watch(currentLocationProvider);
    const mePrefix = '${RoutePaths.me}/';
    final selectedId = location.startsWith(mePrefix)
        ? location.substring(mePrefix.length)
        : null;

    final isMobile = isMobileLayout(context);
    final pinnedIds = ref.watch(pinnedDmChannelIdsProvider).value ?? {};
    final pinnedOrder = ref.watch(pinnedDmChannelOrderProvider).value ?? [];
    final mutedIds = ref.watch(mutedDmChannelIdsProvider).value ?? {};

    // Sort pinned DMs first (by pin position), then unpinned by recency.
    final sortedConvos = _sortDmChannels(convos, pinnedIds, pinnedOrder);
    final searchResults = vm.mobileSearchResults(
      _searchQuery,
      conversations: sortedConvos,
    );

    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: context.colors.channelSidebarBackground,
      child: Stack(
        children: [
          Column(
            children: [
              if (isMobile) ...[
                if (_isSearching)
                  _buildSearchHeader(context)
                else
                  _buildMobileHeader(context),
                Divider(color: context.colors.borderColor, height: 1),
              ] else ...[
                _buildQuickSwitcher(context),
                Divider(color: context.colors.borderColor, height: 1),
                Builder(
                  builder: (context) {
                    final location = ref.watch(currentLocationProvider);
                    final userId = ref.watch(currentUserIdProvider);
                    final isFriends = location == RoutePaths.me;
                    final isNotes =
                        userId != null &&
                        location == RoutePaths.dmChannel(userId);

                    return Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Column(
                        children: [
                          _buildNavButton(
                            context,
                            icon: PhosphorIconsFill.users,
                            label: 'Friends',
                            isSelected: isFriends,
                            onTap: () => context.go(RoutePaths.me),
                          ),
                          _buildNavButton(
                            context,
                            icon: PhosphorIconsFill.notePencil,
                            label: 'Personal Notes',
                            isSelected: isNotes,
                            onTap: () {
                              if (userId != null) {
                                navigateToContent(
                                  context,
                                  RoutePaths.dmChannel(userId),
                                );
                              }
                            },
                          ),
                          _buildNavButton(
                            context,
                            icon: PhosphorIconsFill.skull,
                            label: 'Plutonium',
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Divider(color: context.colors.borderColor, height: 1),
                _buildDmHeader(context),
              ],
              Expanded(
                child: isMobile && _isSearching
                    ? _buildMobileSearchResults(
                        context,
                        sortedConvos,
                        searchResults,
                        selectedId,
                        pinnedIds: pinnedIds,
                        mutedIds: mutedIds,
                      )
                    : _buildConvoList(
                        context,
                        sortedConvos,
                        selectedId,
                        isMobile: isMobile,
                        pinnedIds: pinnedIds,
                        mutedIds: mutedIds,
                      ),
              ),
            ],
          ),
          if (isMobile && !_isSearching)
            Positioned(right: 16, bottom: 16, child: _buildComposeFab(context)),
        ],
      ),
    );
  }

  Widget _buildComposeFab(BuildContext context) => SizedBox(
    width: 56,
    height: 56,
    child: FloatingActionButton(
      onPressed: () => context.go(RoutePaths.me),
      backgroundColor: context.colors.brandPrimary,
      elevation: 4,
      shape: const CircleBorder(),
      child: PhosphorIcon(
        PhosphorIconsFill.paperPlaneTilt,
        size: 24,
        color: context.colors.textPrimary,
      ),
    ),
  );

  Widget _buildSearchHeader(BuildContext context) => Container(
    height: 56,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            autofocus: true,
            style: TextStyle(color: context.colors.textPrimary, fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Search conversations and friends...',
              hintStyle: TextStyle(
                color: context.colors.textPrimaryMuted,
                fontSize: 16,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 5,
              ),
              isDense: true,
            ),
            onChanged: (value) => setState(() => _searchQuery = value),
          ),
        ),
        const SizedBox(width: 8),
        _buildCircleButton(
          context,
          icon: PhosphorIconsBold.x,
          onTap: _toggleSearch,
        ),
      ],
    ),
  );

  Widget _buildQuickSwitcher(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {},
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: context.layout.s2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Quick Switcher',
                style: TextStyle(
                  color: context.colors.textPrimaryMuted,
                  fontSize: 13,
                ),
              ),
            ),
            _buildKbdBadge(context, 'CTRL'),
            const SizedBox(width: 3),
            _buildKbdBadge(context, 'K'),
          ],
        ),
      ),
    ),
  );

  Widget _buildKbdBadge(BuildContext context, String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
    decoration: BoxDecoration(
      color: context.colors.backgroundModifierSelected,
      borderRadius: BorderRadius.circular(3),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: context.colors.textPrimaryMuted,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _buildNavButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
  }) => Padding(
    padding: EdgeInsets.symmetric(horizontal: context.layout.s2, vertical: 1),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: context.layout.radiusMd,
        hoverColor: context.colors.surfaceInteractiveHoverBg,
        onTap: onTap,
        child: Container(
          height: 42,
          padding: EdgeInsets.symmetric(horizontal: context.layout.s2),
          decoration: isSelected
              ? BoxDecoration(
                  color: context.colors.surfaceInteractiveSelectedBg.withValues(
                    alpha: 0.35,
                  ),
                  borderRadius: context.layout.radiusMd,
                )
              : null,
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.brandPrimary
                      : context.colors.backgroundModifierAccent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: PhosphorIcon(
                    icon,
                    size: 18,
                    color: isSelected
                        ? context.colors.textPrimary
                        : context.colors.interactiveNormal,
                  ),
                ),
              ),
              SizedBox(width: context.layout.s3),
              Text(
                label,
                style: context.textStyles.username.copyWith(
                  color: isSelected
                      ? context.colors.surfaceInteractiveSelectedColor
                      : context.colors.textPrimaryMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildCircleButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: context.colors.backgroundModifierAccent,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: PhosphorIcon(icon, size: 18, color: context.colors.textPrimary),
    ),
  );

  Widget _buildMobileHeader(BuildContext context) {
    final pendingCount =
        ref.watch(pendingFriendRequestCountProvider).value ?? 0;

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Messages',
              style: TextStyle(
                color: context.colors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildCircleButton(
            context,
            icon: PhosphorIconsBold.magnifyingGlass,
            onTap: _toggleSearch,
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => context.go(RoutePaths.me),
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.backgroundModifierAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PhosphorIcon(
                        PhosphorIconsFill.userPlus,
                        size: 16,
                        color: context.colors.textPrimary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Add Friends',
                        style: TextStyle(
                          color: context.colors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (pendingCount > 0)
                  Positioned(
                    top: -6,
                    right: -6,
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: context.colors.statusDanger,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$pendingCount',
                        style: TextStyle(
                          color: context.colors.textPrimary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileSearchResults(
    BuildContext context,
    List<DmConversation> sortedConvos,
    DmMobileSearchResults results,
    String? selectedId, {
    required Set<String> pinnedIds,
    required Set<String> mutedIds,
  }) {
    if (!results.hasQuery) {
      return _buildConvoList(
        context,
        sortedConvos,
        selectedId,
        isMobile: true,
        pinnedIds: pinnedIds,
        mutedIds: mutedIds,
      );
    }

    if (!results.hasResults) {
      return _buildSearchEmptyState(context);
    }

    return ListView(
      padding: EdgeInsets.only(
        top: context.layout.s2,
        bottom: context.layout.s6,
      ),
      children: [
        if (results.conversations.isNotEmpty) ...[
          _buildSearchSectionHeader(context, 'Conversations'),
          ...results.conversations.map(
            (convo) => _buildConvoTile(
              context,
              convo: convo,
              isSelected: convo.id == selectedId,
              isMobile: true,
              isPinned: pinnedIds.contains(convo.id),
              isMuted: mutedIds.contains(convo.id),
            ),
          ),
        ],
        if (results.friends.isNotEmpty) ...[
          _buildSearchSectionHeader(context, 'Friends'),
          ...results.friends.map(
            (friend) => _buildFriendSearchTile(context, friend),
          ),
        ],
      ],
    );
  }

  Widget _buildSearchSectionHeader(BuildContext context, String title) =>
      Padding(
        padding: EdgeInsets.fromLTRB(
          context.layout.s2,
          context.layout.s2,
          context.layout.s2,
          context.layout.s1,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: context.colors.textPrimaryMuted,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget _buildSearchEmptyState(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.layout.s8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIconsRegular.magnifyingGlass,
            size: 56,
            color: context.colors.textTertiary,
          ),
          SizedBox(height: context.layout.s4),
          Text(
            'No results found',
            style: TextStyle(
              color: context.colors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.layout.s2),
          Text(
            'Try another name or check your spelling.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: context.colors.textTertiary,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildFriendSearchTile(BuildContext context, Friend friend) {
    final subtitle = switch (friend.friendStatus) {
      FriendStatus.accepted => friend.username,
      FriendStatus.pendingIncoming => 'Incoming friend request',
      FriendStatus.pendingOutgoing => 'Outgoing friend request',
      FriendStatus.blocked => friend.username,
    };

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => unawaited(_openFriendConversation(friend)),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.layout.s2,
            vertical: 2,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.layout.s2,
            vertical: 8,
          ),
          child: Row(
            children: [
              FluxerAvatar.user(
                fallbackText: friend.displayName,
                userId: friend.id,
                imageUrl: _friendAvatarUrl(friend),
                avatarColor: friend.avatarColor,
                status: friend.status,
              ),
              SizedBox(width: context.layout.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      friend.displayName,
                      style: context.textStyles.username.copyWith(
                        color: context.colors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: context.colors.textPrimaryMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              PhosphorIcon(
                PhosphorIconsRegular.chatCircle,
                size: 18,
                color: context.colors.textPrimaryMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openFriendConversation(Friend friend) async {
    try {
      final channelId = await ref
          .read(dmRepositoryProvider)
          .ensureDmChannel(friend.id);
      if (!mounted) {
        return;
      }
      navigateToContent(context, RoutePaths.dmChannel(channelId));
    } on Exception {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            const FluxerToast(
              message: 'Failed to open conversation',
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Widget _buildConvoList(
    BuildContext context,
    List<DmConversation> convos,
    String? selectedId, {
    required bool isMobile,
    required Set<String> pinnedIds,
    required Set<String> mutedIds,
  }) {
    final userId = ref.watch(currentUserIdProvider);
    final listPadding = isMobile && !_isSearching
        ? EdgeInsets.only(top: context.layout.s1, bottom: 96)
        : EdgeInsets.zero;

    return ListView.builder(
      padding: listPadding,
      itemCount: convos.length + (isMobile && !_isSearching ? 1 : 0),
      itemBuilder: (context, index) {
        if (isMobile && !_isSearching && index == 0) {
          return _buildMobilePersonalNotes(
            context,
            userId,
            isSelected: selectedId == userId,
          );
        }

        final convoIndex = isMobile && !_isSearching ? index - 1 : index;
        final convo = convos[convoIndex];
        final isSelected = convo.id == selectedId;

        return _buildConvoTile(
          context,
          convo: convo,
          isSelected: isSelected,
          isMobile: isMobile,
          isPinned: pinnedIds.contains(convo.id),
          isMuted: mutedIds.contains(convo.id),
        );
      },
    );
  }

  Widget _buildMobilePersonalNotes(
    BuildContext context,
    String? userId, {
    required bool isSelected,
  }) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        if (userId != null) {
          navigateToContent(context, RoutePaths.dmChannel(userId));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: context.layout.s2,
          vertical: 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.layout.s2,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.surfaceInteractiveSelectedBg.withValues(
                  alpha: 0.35,
                )
              : Colors.transparent,
          borderRadius: context.layout.radiusMd,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.brandPrimary
                    : context.colors.backgroundModifierAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: PhosphorIcon(
                  PhosphorIconsFill.notePencil,
                  size: 20,
                  color: context.colors.interactiveNormal,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Personal Notes',
              style: TextStyle(
                color: isSelected
                    ? context.colors.surfaceInteractiveSelectedColor
                    : context.colors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildDmHeader(BuildContext context) {
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s2, vertical: layout.s2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Direct Messages',
              style: TextStyle(
                color: context.colors.textPrimaryMuted,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          PhosphorIcon(
            PhosphorIconsRegular.plus,
            size: 16,
            color: context.colors.textPrimaryMuted,
          ),
        ],
      ),
    );
  }

  Widget _buildConvoTile(
    BuildContext context, {
    required bool isSelected,
    bool isMobile = false,
    bool isPinned = false,
    bool isMuted = false,
    DmConversation? convo,
    IconData? leadingIcon,
    String? leadingLabel,
    VoidCallback? onCustomTap,
  }) {
    final avatarSize = isMobile ? 40.0 : 32.0;
    final tileHeight = isMobile ? 52.0 : 42.0;

    final isIconTile =
        leadingIcon != null && leadingLabel != null && onCustomTap != null;
    if (isIconTile) {
      return _buildConvoStyleTile(
        context: context,
        leading: _buildCircleIcon(
          context,
          leadingIcon,
          isSelected,
          size: avatarSize,
        ),
        label: leadingLabel,
        isSelected: isSelected,
        onTap: onCustomTap,
      );
    }
    final c = convo!;
    final layout = context.layout;
    final hasUnread = c.unreadCount > 0;
    final currentUserId = ref.watch(currentUserIdProvider);
    final titleColor = isSelected
        ? context.colors.surfaceInteractiveSelectedColor
        : hasUnread
        ? context.colors.textChat
        : context.colors.textPrimaryMuted;
    final secondaryColor = isSelected
        ? context.colors.surfaceInteractiveSelectedColor
        : context.colors.textPrimaryMuted.withValues(alpha: 0.85);
    final timestampColor = isSelected
        ? context.colors.surfaceInteractiveSelectedColor
        : context.colors.textTertiary;

    String lastMessagePreview = c.lastMessage;
    if (c.lastMessage.isNotEmpty && c.lastMessageAuthorName != null) {
      final prefix = c.lastMessageAuthorId == currentUserId
          ? 'You'
          : c.lastMessageAuthorName!;
      lastMessagePreview = '$prefix: ${c.lastMessage}';
    }

    return Opacity(
      opacity: isMuted && !isSelected ? 0.5 : 1.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: layout.radiusMd,
          hoverColor: context.colors.surfaceInteractiveHoverBg,
          onTap: () {
            navigateToContent(context, RoutePaths.dmChannel(c.id));
          },
          onLongPress: isMobile ? () => _showDmContextMenu(context, c) : null,
          child: Container(
            height: tileHeight,
            margin: EdgeInsets.symmetric(
              horizontal: layout.s2,
              vertical: isMobile ? 2 : 1,
            ),
            padding: EdgeInsets.symmetric(horizontal: layout.s2),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colors.surfaceInteractiveSelectedBg.withValues(
                      alpha: 0.35,
                    )
                  : Colors.transparent,
              borderRadius: layout.radiusMd,
            ),
            child: Row(
              children: [
                if (hasUnread && !isSelected)
                  Container(
                    width: 4,
                    height: tileHeight * 0.5,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: context.colors.textPrimary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                if (c.isGroup)
                  FluxerAvatarCluster(
                    channelId: c.id,
                    iconUrl: _groupIconUrl(c),
                    status: c.groupStatus,
                    members: _clusterMembers(c),
                    size: avatarSize,
                  )
                else
                  FluxerAvatar.user(
                    fallbackText: c.recipientName,
                    userId: c.recipientId,
                    imageUrl: _dmAvatarUrl(c),
                    status: c.recipientStatus,
                    size: avatarSize,
                  ),
                SizedBox(width: layout.s3),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (isPinned)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: PhosphorIcon(
                                PhosphorIconsFill.pushPin,
                                size: 12,
                                color: timestampColor,
                              ),
                            ),
                          Flexible(
                            child: Text(
                              c.displayName,
                              style: context.textStyles.username.copyWith(
                                color: titleColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (!c.isGroup && (c.isBot || c.isSystem))
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: _UserTag(
                                label: c.isSystem
                                    ? FluxerLocalizations.of(
                                        context,
                                      ).userTagSystem
                                    : FluxerLocalizations.of(
                                        context,
                                      ).userTagBot,
                              ),
                            ),
                        ],
                      ),
                      if (c.isGroup)
                        Text(
                          FluxerLocalizations.of(
                            context,
                          ).dmGroupMemberCount(c.memberCount),
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 14 / 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      else if (lastMessagePreview.isNotEmpty)
                        Text(
                          lastMessagePreview,
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 16 / 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatRelativeTime(c.lastMessageTime),
                  style: TextStyle(
                    color: timestampColor,
                    fontSize: 12,
                    height: 16 / 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDmContextMenu(
    BuildContext context,
    DmConversation convo,
  ) async {
    final pinnedIds = ref.read(pinnedDmChannelIdsProvider).value ?? {};
    final mutedIds = ref.read(mutedDmChannelIdsProvider).value ?? {};
    final isPinned = pinnedIds.contains(convo.id);
    final isMuted = mutedIds.contains(convo.id);
    final db = ref.read(fluxerDatabaseProvider);
    final rels = await db.relationshipDao.getRelationships();
    final rel = rels.where((r) => r.userId == convo.recipientId).firstOrNull;
    final devMode = ref.read(userSettingsViewModelProvider).developerMode;
    final result = await FluxerBottomSheet.show<Object>(
      context,
      builder: (context, _) => _DmBottomSheet(
        convo: convo,
        isMuted: isMuted,
        isPinned: isPinned,
        relationshipType: rel?.type,
        developerMode: devMode,
      ),
    );

    if (result == null || !mounted) {
      return;
    }

    if (result is _InviteToGuildAction) {
      // TODO(fluxer_app): send invite for guild ${result.guildId} in DM
      return;
    }

    final action = result as _DmAction;
    switch (action) {
      case _DmAction.markAsRead:
        unawaited(ref.read(dmViewModelProvider.notifier).markAsRead(convo.id));
      case _DmAction.viewProfile:
        // TODO(fluxer_app): navigate to user profile sheet
        break;
      case _DmAction.voiceCall:
        unawaited(() async {
          final StartDirectVoiceCallResult r = await startDirectVoiceCall(
            ref,
            context,
            convo.id,
          );
          if (!context.mounted) {
            return;
          }
          if (!r.ok && !r.microphoneDenied) {
            final FluxerLocalizations l10n = FluxerLocalizations.of(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.genericError)),
            );
          }
        }());
      case _DmAction.addNote:
        // TODO(fluxer_app): open add note sheet
        break;
      case _DmAction.changeFriendNickname:
        // TODO(fluxer_app): open change friend nickname sheet
        break;
      case _DmAction.favoriteDm:
        // TODO(fluxer_app): implement favorite DM
        break;
      case _DmAction.mute15Min:
        unawaited(
          ref.read(dmRepositoryProvider).muteDm(convo.id, durationSeconds: 900),
        );
      case _DmAction.mute30Min:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 1800),
        );
      case _DmAction.mute1Hour:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 3600),
        );
      case _DmAction.mute3Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 10800),
        );
      case _DmAction.mute4Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 14400),
        );
      case _DmAction.mute8Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 28800),
        );
      case _DmAction.mute24Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 86400),
        );
      case _DmAction.mute3Days:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 259200),
        );
      case _DmAction.muteForever:
        unawaited(ref.read(dmRepositoryProvider).muteDm(convo.id));
      case _DmAction.unmute:
        unawaited(ref.read(dmRepositoryProvider).unmuteDm(convo.id));
      case _DmAction.pinToggle:
        if (pinnedIds.contains(convo.id)) {
          unawaited(ref.read(dmRepositoryProvider).unpinDm(convo.id));
        } else {
          unawaited(ref.read(dmRepositoryProvider).pinDm(convo.id));
        }
      case _DmAction.editGroup:
        // TODO(fluxer_app): open edit group sheet
        break;
      case _DmAction.removeFriend:
        if (!mounted) break;
        final l10n = FluxerLocalizations.of(context);
        await FluxerConfirmModal.show(
          context,
          title: l10n.dmRemoveFriendConfirmTitle,
          description: l10n.dmRemoveFriendConfirmDescription(convo.displayName),
          confirmLabel: l10n.dmRemoveFriend,
          isDanger: true,
          onConfirm: () {
            unawaited(
              ref
                  .read(friendRepositoryProvider)
                  .removeRelationship(convo.recipientId)
                  .catchError((_) {
                    if (mounted) {
                      ref
                          .read(toastProvider.notifier)
                          .show(
                            FluxerToast(
                              message: l10n.dmRemoveFriendFailed,
                              variant: FluxerToastVariant.danger,
                            ),
                          );
                    }
                  }),
            );
          },
        );
      case _DmAction.addFriend:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .sendFriendRequest(convo.recipientId);
          if (!mounted) break;
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmFriendRequestSentToast,
                  variant: FluxerToastVariant.success,
                ),
              );
        } catch (_) {
          if (!mounted) break;
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmFriendRequestFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      case _DmAction.acceptFriendRequest:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .acceptFriendRequest(convo.recipientId);
        } catch (_) {
          if (!mounted) break;
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmAcceptFriendRequestFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      case _DmAction.ignoreFriendRequest:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .removeRelationship(convo.recipientId);
        } catch (_) {
          if (!mounted) break;
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmIgnoreFriendRequestFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      case _DmAction.block:
        if (!mounted) break;
        final l10n = FluxerLocalizations.of(context);
        await FluxerConfirmModal.show(
          context,
          title: l10n.dmBlockConfirmTitle,
          description: l10n.dmBlockConfirmDescription(convo.displayName),
          confirmLabel: l10n.dmBlock,
          isDanger: true,
          onConfirm: () {
            unawaited(
              ref
                  .read(friendRepositoryProvider)
                  .blockUser(convo.recipientId)
                  .catchError((_) {
                    if (mounted) {
                      ref
                          .read(toastProvider.notifier)
                          .show(
                            FluxerToast(
                              message: l10n.dmBlockFailed,
                              variant: FluxerToastVariant.danger,
                            ),
                          );
                    }
                  }),
            );
          },
        );
      case _DmAction.unblock:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .removeRelationship(convo.recipientId);
        } catch (_) {
          if (!mounted) break;
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmUnblockFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      case _DmAction.closeDm:
        if (!mounted) {
          break;
        }
        final l10n = FluxerLocalizations.of(context);
        final confirmed = await FluxerConfirmModal.show(
          context,
          title: l10n.dmCloseDmConfirmTitle,
          description: l10n.dmCloseDmConfirmDescription(convo.displayName),
          confirmLabel: l10n.dmCloseDm,
          isDanger: true,
          onConfirm: () {
            unawaited(
              ref.read(dmViewModelProvider.notifier).closeDmChannel(convo.id),
            );
          },
        );
        if (confirmed != true && mounted) {
          break;
        }
      case _DmAction.debugUser:
        try {
          final client = ref.read(fluxerClientProvider);
          final user = await client.users.getUserById(
            userId: convo.recipientId,
          );
          if (!mounted) break;
          await showDebugBottomSheet(
            context,
            title: FluxerLocalizations.of(context).dmDebugUser,
            data: user.toJson(),
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
          // API fetch failed — ignore silently.
        }
      case _DmAction.debugChannel:
        try {
          final client = ref.read(fluxerClientProvider);
          final channel = await client.channels.getChannel(channelId: convo.id);
          if (!mounted) break;
          await showDebugBottomSheet(
            context,
            title: FluxerLocalizations.of(context).dmDebugChannel,
            data: channel.toJson(),
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
          // API fetch failed — ignore silently.
        }
      case _DmAction.copyUserId:
        await Clipboard.setData(ClipboardData(text: convo.recipientId));
        if (!mounted) break;
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: FluxerLocalizations.of(context).dmUserIdCopied,
                variant: FluxerToastVariant.success,
              ),
            );
      case _DmAction.copyChannelId:
        await Clipboard.setData(ClipboardData(text: convo.id));
        if (!mounted) break;
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: FluxerLocalizations.of(context).dmChannelIdCopied,
                variant: FluxerToastVariant.success,
              ),
            );
    }
  }

  static List<DmConversation> _sortDmChannels(
    List<DmConversation> convos,
    Set<String> pinnedIds,
    List<String> pinnedOrder,
  ) {
    final pinIndex = {
      for (var i = 0; i < pinnedOrder.length; i++) pinnedOrder[i]: i,
    };
    return [...convos]..sort((a, b) {
      final aPin = pinIndex[a.id];
      final bPin = pinIndex[b.id];
      final aIsPinned = aPin != null;
      final bIsPinned = bPin != null;

      if (aIsPinned && bIsPinned) {
        return aPin.compareTo(bPin);
      }
      if (aIsPinned != bIsPinned) {
        return aIsPinned ? -1 : 1;
      }
      return b.lastMessageTime.compareTo(a.lastMessageTime);
    });
  }

  static String _formatRelativeTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inSeconds < 60) {
      return 'Now';
    }
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours}h';
    }
    if (diff.inDays < 7) {
      return '${diff.inDays}d';
    }
    if (diff.inDays < 30) {
      return '${diff.inDays ~/ 7}w';
    }
    if (diff.inDays < 365) {
      return '${diff.inDays ~/ 30}mo';
    }
    return '${diff.inDays ~/ 365}y';
  }

  Widget _buildCircleIcon(
    BuildContext context,
    IconData icon,
    bool isSelected, {
    double size = 32,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? context.colors.brandPrimary
            : context.colors.backgroundTertiary,
      ),
      alignment: Alignment.center,
      child: PhosphorIcon(
        icon,
        size: size * 0.55,
        color: isSelected
            ? context.colors.textPrimary
            : context.colors.interactiveNormal,
      ),
    );
  }

  Widget _buildConvoStyleTile({
    required BuildContext context,
    required Widget leading,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) => Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: context.layout.radiusMd,
      hoverColor: context.colors.surfaceInteractiveHoverBg,
      onTap: onTap,
      child: Container(
        height: 42,
        margin: EdgeInsets.symmetric(
          horizontal: context.layout.s2,
          vertical: 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: context.layout.s2),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.surfaceInteractiveSelectedBg.withValues(
                  alpha: 0.35,
                )
              : Colors.transparent,
          borderRadius: context.layout.radiusMd,
        ),
        child: Row(
          children: [
            leading,
            SizedBox(width: context.layout.s3),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.username.copyWith(
                  color: isSelected
                      ? context.colors.surfaceInteractiveSelectedColor
                      : context.colors.textPrimaryMuted,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

String? _dmAvatarUrl(DmConversation convo) {
  final avatar = convo.recipientAvatar;
  if (avatar == null) {
    return null;
  }
  return '$fluxerMediaCdn'
      '/avatars/${convo.recipientId}/$avatar.png';
}

String? _friendAvatarUrl(Friend friend) {
  final avatar = friend.avatar;
  if (avatar == null) {
    return null;
  }
  return '$fluxerMediaCdn/avatars/${friend.id}/$avatar.png';
}

String? _groupIconUrl(DmConversation convo) {
  final icon = convo.icon;
  if (icon == null) {
    return null;
  }
  return '$fluxerMediaCdn/icons/${convo.id}/$icon.png';
}

List<AvatarClusterMember> _clusterMembers(DmConversation convo) {
  return convo.groupMembers
      .map(
        (m) => AvatarClusterMember(
          userId: m.id,
          imageUrl: m.avatar != null
              ? '$fluxerMediaCdn/avatars/${m.id}/${m.avatar}.png'
              : null,
          fallbackText: m.name,
        ),
      )
      .toList();
}

enum _DmAction {
  markAsRead,
  viewProfile,
  voiceCall,
  addNote,
  changeFriendNickname,
  favoriteDm,
  mute15Min,
  mute30Min,
  mute1Hour,
  mute3Hours,
  mute4Hours,
  mute8Hours,
  mute24Hours,
  mute3Days,
  muteForever,
  unmute,
  pinToggle,
  editGroup,
  removeFriend,
  addFriend,
  acceptFriendRequest,
  ignoreFriendRequest,
  block,
  unblock,
  closeDm,
  debugUser,
  debugChannel,
  copyUserId,
  copyChannelId,
}

class _InviteToGuildAction {
  final String guildId;
  const _InviteToGuildAction(this.guildId);
}

class _DmBottomSheet extends StatelessWidget {
  final DmConversation convo;
  final bool isMuted;
  final bool isPinned;
  final int? relationshipType;
  final bool developerMode;

  const _DmBottomSheet({
    required this.convo,
    required this.isMuted,
    required this.isPinned,
    required this.relationshipType,
    required this.developerMode,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final hasUnread = convo.unreadCount > 0;

    void pop(Object action) => Navigator.of(context).pop(action);

    final groups = <Widget>[];

    // Relationship constants (match SDK RelationshipTypes values).
    const relFriend = 1;
    const relBlocked = 2;
    const relIncoming = 3;
    const relOutgoing = 4;

    // Group 1: Mark as Read + Pin/Unpin
    groups.add(
      FluxerMenuGroup(
        children: [
          if (hasUnread)
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.eye,
              label: l10n.dmMarkAsRead,
              onTap: () => pop(_DmAction.markAsRead),
            ),
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.pushPin,
            label: convo.isGroup
                ? (isPinned ? l10n.dmUnpinGroupDm : l10n.dmPinGroupDm)
                : (isPinned ? l10n.dmUnpinDm : l10n.dmPinDm),
            onTap: () => pop(_DmAction.pinToggle),
          ),
        ],
      ),
    );

    // Group 2: Profile actions + Close/Leave
    {
      final children = <Widget>[];
      if (convo.isGroup) {
        children.add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.pencilSimple,
            label: l10n.dmEditGroup,
            onTap: () => pop(_DmAction.editGroup),
          ),
        );
      } else {
        children.addAll([
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.user,
            label: l10n.dmViewProfile,
            onTap: () => pop(_DmAction.viewProfile),
          ),
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.phone,
            label: l10n.dmVoiceCall,
            onTap: () => pop(_DmAction.voiceCall),
          ),
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.notePencil,
            label: l10n.dmAddNote,
            onTap: () => pop(_DmAction.addNote),
          ),
          if (relationshipType == relFriend)
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.pencilSimple,
              label: l10n.dmChangeFriendNickname,
              onTap: () => pop(_DmAction.changeFriendNickname),
            ),
        ]);
      }
      children.add(
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.xCircle,
          label: convo.isGroup ? l10n.dmLeaveGroup : l10n.dmCloseDm,
          isDanger: true,
          onTap: () => pop(_DmAction.closeDm),
        ),
      );
      groups.add(FluxerMenuGroup(children: children));
    }

    // Group 3: Relationship actions (1-on-1 DMs only)
    if (!convo.isGroup) {
      final relChildren = <Widget>[
        FluxerBottomSheetSubmenuItem(
          label: l10n.dmInviteToCommunity,
          onTap: () => _openInviteSheet(context),
        ),
      ];

      // Friend actions based on relationship state.
      switch (relationshipType) {
        case relFriend:
          relChildren.add(
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userMinus,
              label: l10n.dmRemoveFriend,
              isDanger: true,
              onTap: () => pop(_DmAction.removeFriend),
            ),
          );
        case relIncoming:
          relChildren.addAll([
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userPlus,
              label: l10n.dmAcceptFriendRequest,
              onTap: () => pop(_DmAction.acceptFriendRequest),
            ),
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userMinus,
              label: l10n.dmIgnoreFriendRequest,
              onTap: () => pop(_DmAction.ignoreFriendRequest),
            ),
          ]);
        case relOutgoing:
          relChildren.add(
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userPlus,
              label: l10n.dmFriendRequestSent,
              onTap: () {},
            ),
          );
        default:
          relChildren.add(
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userPlus,
              label: l10n.dmAddFriend,
              onTap: () => pop(_DmAction.addFriend),
            ),
          );
      }

      // Block / Unblock.
      if (relationshipType == relBlocked) {
        relChildren.add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.prohibit,
            label: l10n.dmUnblock,
            onTap: () => pop(_DmAction.unblock),
          ),
        );
      } else {
        relChildren.add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.prohibit,
            label: l10n.dmBlock,
            isDanger: true,
            onTap: () => pop(_DmAction.block),
          ),
        );
      }

      groups.add(FluxerMenuGroup(children: relChildren));
    }

    // Group 4: Mute/Unmute
    groups.add(
      FluxerMenuGroup(
        children: [
          FluxerBottomSheetSubmenuItem(
            label: isMuted
                ? l10n.dmUnmuteConversation
                : l10n.dmMuteConversation,
            onTap: () => _openMuteSheet(context),
          ),
        ],
      ),
    );

    // Group 5: Debug (developer mode only)
    if (developerMode) {
      groups.add(
        FluxerMenuGroup(
          children: [
            if (!convo.isGroup)
              FluxerBottomSheetMenuItem(
                icon: PhosphorIconsFill.bug,
                label: l10n.dmDebugUser,
                onTap: () => pop(_DmAction.debugUser),
              ),
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.bug,
              label: l10n.dmDebugChannel,
              onTap: () => pop(_DmAction.debugChannel),
            ),
          ],
        ),
      );
    }

    // Group 6: Copy IDs
    groups.add(
      FluxerMenuGroup(
        children: [
          if (!convo.isGroup)
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsRegular.snowflake,
              label: l10n.dmCopyUserId,
              onTap: () => pop(_DmAction.copyUserId),
            ),
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsRegular.snowflake,
            label: l10n.dmCopyChannelId,
            onTap: () => pop(_DmAction.copyChannelId),
          ),
        ],
      ),
    );

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: convo.isGroup ? 0.45 : 0.7,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return SafeArea(
          bottom: Platform.isAndroid,
          child: Column(
            children: [
              FluxerBottomSheetHeader(
                leading: convo.isGroup
                    ? Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.colors.backgroundSecondaryAlt,
                        ),
                        alignment: Alignment.center,
                        child: PhosphorIcon(
                          PhosphorIconsFill.usersThree,
                          size: 26,
                          color: context.colors.interactiveNormal,
                        ),
                      )
                    : FluxerAvatar.user(
                        fallbackText: convo.recipientName,
                        userId: convo.recipientId,
                        imageUrl: _dmAvatarUrl(convo),
                        status: convo.recipientStatus,
                        size: 48,
                      ),
                title: convo.displayName,
                subtitle: convo.isGroup
                    ? Text(
                        l10n.dmGroupMemberCount(convo.memberCount),
                        style: context.textStyles.timestamp.copyWith(
                          color: context.colors.textTertiary,
                        ),
                      )
                    : null,
              ),
              SizedBox(height: layout.s3),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    0,
                    layout.s4,
                    layout.s4,
                  ),
                  children: [FluxerBottomSheetGroupColumn(children: groups)],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openMuteSheet(BuildContext context) {
    final nav = Navigator.of(context);
    unawaited(
      FluxerBottomSheet.show<_DmAction>(
        context,
        builder: (_, _) => _DmMuteSheet(isMuted: isMuted),
      ).then((result) {
        if (result != null) {
          nav.pop(result);
        }
      }),
    );
  }

  void _openInviteSheet(BuildContext context) {
    final nav = Navigator.of(context);
    unawaited(
      FluxerBottomSheet.show<_InviteToGuildAction>(
        context,
        builder: (_, _) => const _DmInviteSheet(),
      ).then((result) {
        if (result != null) {
          nav.pop(result);
        }
      }),
    );
  }
}

class _DmMuteSheet extends StatelessWidget {
  final bool isMuted;

  const _DmMuteSheet({required this.isMuted});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    void pop(_DmAction action) => Navigator.of(context).pop(action);

    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return SafeArea(
          bottom: Platform.isAndroid,
          child: Column(
            children: [
              FluxerBottomSheetSubmenuHeader(
                title: isMuted
                    ? l10n.dmUnmuteConversation
                    : l10n.dmMuteConversation,
                onBack: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: layout.s3),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    0,
                    layout.s4,
                    layout.s4,
                  ),
                  children: [
                    FluxerBottomSheetGroupColumn(
                      children: [
                        FluxerMenuGroup(
                          children: isMuted
                              ? [
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmUnmuteConversation,
                                    onTap: () => pop(_DmAction.unmute),
                                  ),
                                ]
                              : [
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor15Min,
                                    onTap: () => pop(_DmAction.mute15Min),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor30Min,
                                    onTap: () => pop(_DmAction.mute30Min),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor1Hour,
                                    onTap: () => pop(_DmAction.mute1Hour),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor3Hours,
                                    onTap: () => pop(_DmAction.mute3Hours),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor4Hours,
                                    onTap: () => pop(_DmAction.mute4Hours),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor8Hours,
                                    onTap: () => pop(_DmAction.mute8Hours),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor24Hours,
                                    onTap: () => pop(_DmAction.mute24Hours),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteFor3Days,
                                    onTap: () => pop(_DmAction.mute3Days),
                                  ),
                                  FluxerBottomSheetMenuItem(
                                    label: l10n.dmMuteForever,
                                    onTap: () => pop(_DmAction.muteForever),
                                  ),
                                ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DmInviteSheet extends ConsumerWidget {
  const _DmInviteSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);
    final guilds = ref.watch(guildListViewModelProvider).guilds;

    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return SafeArea(
          bottom: Platform.isAndroid,
          child: Column(
            children: [
              FluxerBottomSheetSubmenuHeader(
                title: l10n.dmInviteToCommunity,
                onBack: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: layout.s3),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    0,
                    layout.s4,
                    layout.s4,
                  ),
                  children: [
                    FluxerBottomSheetGroupColumn(
                      children: [
                        FluxerMenuGroup(
                          children: guilds.isEmpty
                              ? [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      l10n.dmNoCommunitiesAvailable,
                                      style: context.textStyles.username
                                          .copyWith(color: colors.textTertiary),
                                    ),
                                  ),
                                ]
                              : [
                                  for (final guild in guilds)
                                    FluxerBottomSheetMenuItem(
                                      label: guild.name,
                                      onTap: () => Navigator.of(
                                        context,
                                      ).pop(_InviteToGuildAction(guild.id)),
                                    ),
                                ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UserTag extends StatelessWidget {
  final String label;

  const _UserTag({required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      constraints: const BoxConstraints(minHeight: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5.5, vertical: 2),
      decoration: BoxDecoration(
        color: colors.brandPrimary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: colors.brandPrimaryFill,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }
}
