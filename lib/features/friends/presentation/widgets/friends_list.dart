import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kActiveNowMinWidth = 1100.0;
const _kActiveNowWidth = 352.0;

class FriendsList extends ConsumerWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(dmViewModelProvider);
    final activeTab = vm.activeTab;
    final showActiveNowPref = ref.watch(
      appearancePreferencesProvider.select((s) => s.showActiveNow),
    );

    final showActiveNow =
        showActiveNowPref &&
        MediaQuery.sizeOf(context).width >= _kActiveNowMinWidth;

    return ColoredBox(
      color: context.colors.chatBackground,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildTopBar(
                    context,
                    ref,
                    activeTab,
                    showActiveNow: showActiveNow,
                  ),
                  Divider(color: context.colors.borderColor, height: 1),
                  _buildSearchBar(context, ref, activeTab),
                  _buildSectionHeader(context, vm),
                  Expanded(child: _buildFriendsList(context, vm)),
                ],
              ),
            ),
            if (showActiveNow) _buildActiveNowPanel(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(
    BuildContext context,
    WidgetRef ref,
    FriendsTab activeTab, {
    required bool showActiveNow,
  }) => Container(
    height: 56,
    padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
    child: Row(
      children: [
        PhosphorIcon(
          PhosphorIconsFill.usersThree,
          color: context.colors.textPrimaryMuted,
          size: 24,
        ),
        SizedBox(width: context.layout.s2),
        Text('My Friends', style: context.textStyles.channelName),
        SizedBox(width: context.layout.s4),
        VerticalDivider(
          color: context.colors.backgroundModifierAccent,
          width: 1,
          indent: 16,
          endIndent: 16,
        ),
        SizedBox(width: context.layout.s4),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _tabButton(
                  context,
                  ref,
                  'Online',
                  FriendsTab.online,
                  activeTab,
                ),
                _tabButton(context, ref, 'All', FriendsTab.all, activeTab),
                _tabButton(
                  context,
                  ref,
                  'Pending',
                  FriendsTab.pending,
                  activeTab,
                ),
                Material(
                  color: context.colors.brandPrimary,
                  borderRadius: BorderRadius.circular(6),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      child: Text(
                        'Add Friend',
                        style: TextStyle(
                          color: context.colors.brandPrimaryFill,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            hoverColor: context.colors.backgroundModifierHover,
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(context.layout.s2),
              child: SvgPicture.asset(
                'assets/images/inbox-icon.svg',
                width: 24,
                height: 24,
                theme: SvgTheme(currentColor: context.colors.interactiveNormal),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _tabButton(
    BuildContext context,
    WidgetRef ref,
    String label,
    FriendsTab tab,
    FriendsTab activeTab,
  ) {
    final isActive = tab == activeTab;
    return Padding(
      padding: EdgeInsets.only(right: context.layout.s2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          hoverColor: context.colors.backgroundModifierHover,
          onTap: () => ref.read(dmViewModelProvider.notifier).selectTab(tab),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isActive
                  ? context.colors.backgroundModifierSelected
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isActive
                    ? context.colors.textPrimary
                    : context.colors.textPrimaryMuted,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(
    BuildContext context,
    WidgetRef ref,
    FriendsTab activeTab,
  ) => Padding(
    padding: EdgeInsets.only(
      left: context.layout.s4,
      right: context.layout.s4,
      top: context.layout.s3,
    ),
    child: TextField(
      onChanged: ref.read(dmViewModelProvider.notifier).updateSearch,
      style: TextStyle(color: context.colors.textChat, fontSize: 14),
      decoration: InputDecoration(
        hintText: _searchHint(activeTab),
        hintStyle: TextStyle(
          color: context.colors.textPrimaryMuted,
          fontSize: 14,
        ),
        prefixIcon: PhosphorIcon(
          PhosphorIconsRegular.magnifyingGlass,
          size: 20,
          color: context.colors.textSecondary,
        ),
      ),
    ),
  );

  String _tabLabel(FriendsTab tab) {
    switch (tab) {
      case FriendsTab.online:
        return 'Online';
      case FriendsTab.all:
        return 'All';
      case FriendsTab.pending:
        return 'Pending';
      case FriendsTab.blocked:
        return 'Blocked';
    }
  }

  String _searchHint(FriendsTab tab) {
    switch (tab) {
      case FriendsTab.online:
        return 'Search online friends';
      case FriendsTab.all:
        return 'Search friends';
      case FriendsTab.pending:
        return 'Search pending requests';
      case FriendsTab.blocked:
        return 'Search blocked users';
    }
  }

  Widget _buildSectionHeader(BuildContext context, DmViewState vm) {
    final filtered = vm.filteredFriends;
    final label = _tabLabel(vm.activeTab).toUpperCase();
    return Padding(
      padding: EdgeInsets.only(
        left: context.layout.s4,
        right: context.layout.s4,
        top: context.layout.s4,
        bottom: context.layout.s2,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '$label \u2014 ${filtered.length}',
          style: context.textStyles.smallText,
        ),
      ),
    );
  }

  Widget _buildActiveNowPanel(BuildContext context) => Container(
    width: _kActiveNowWidth,
    decoration: BoxDecoration(
      border: Border(
        left: BorderSide(color: context.colors.backgroundModifierAccent),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.layout.s4,
            left: context.layout.s4,
            right: context.layout.s4,
            bottom: context.layout.s3,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Active Now',
              style: TextStyle(
                color: context.colors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: SvgPicture.asset(
                      'assets/images/quiet-zzz.svg',
                      width: 48,
                      height: 48,
                      colorFilter: ColorFilter.mode(
                        context.colors.textTertiary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(height: context.layout.s3),
                  Text(
                    "It's quiet for now...",
                    style: TextStyle(
                      color: context.colors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: context.layout.s3),
                  Text(
                    'When friends are active '
                    'in voice channels, their '
                    'activity will appear '
                    'here.',
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
          ),
        ),
      ],
    ),
  );

  Widget _buildFriendsList(BuildContext context, DmViewState vm) {
    final filtered = vm.filteredFriends;
    if (filtered.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.layout.s8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsFill.usersThree,
                size: 64,
                color: context.colors.textTertiary,
              ),
              SizedBox(height: context.layout.s4),
              Text(
                _emptyTitle(vm),
                style: TextStyle(
                  color: context.colors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.layout.s2),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 448),
                child: Text(
                  _emptySubtitle(vm),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.colors.textTertiary,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.layout.s3),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final friend = filtered[index];
        return _buildFriendTile(context, friend);
      },
    );
  }

  Widget _buildFriendTile(BuildContext context, Friend friend) => DecoratedBox(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: context.colors.borderColor.withValues(alpha: 0.5),
        ),
      ),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        hoverColor: context.colors.backgroundModifierHover,
        onTap: () =>
            unawaited(FluxerUserProfileSheet.show(context, userId: friend.id)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.layout.s3,
            horizontal: context.layout.s4,
          ),
          child: Row(
            children: [
              FluxerAvatar.user(
                fallbackText: friend.displayName,
                userId: friend.id,
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: friend.id,
                  hash: friend.avatar,
                ),
                avatarColor: friend.avatarColor,
                status: friend.status,
                size: 36,
              ),
              SizedBox(width: context.layout.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      friend.displayName,
                      style: TextStyle(
                        color: context.colors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    if (friend.friendStatus == FriendStatus.accepted &&
                        hasVisibleCustomStatus(friend.customStatus))
                      CustomStatusDisplay(
                        stored: friend.customStatus,
                        maxLines: 1,
                        emojiSize: 14,
                      )
                    else
                      Text(
                        _statusText(friend),
                        style: TextStyle(
                          color: friend.status == 'offline'
                              ? context.colors.textTertiary
                              : context.colors.textPrimaryMuted.withValues(
                                  alpha: 0.85,
                                ),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              if (friend.friendStatus == FriendStatus.accepted) ...[
                _actionButton(
                  context,
                  icon: PhosphorIconsFill.chatCircle,
                  color: context.colors.textPrimaryMuted,
                  backgroundColor: context.colors.backgroundModifierHover,
                  onPressed: () {},
                ),
                SizedBox(width: context.layout.s2),
                _actionButton(
                  context,
                  icon: PhosphorIconsRegular.dotsThreeVertical,
                  color: context.colors.textPrimaryMuted,
                  backgroundColor: context.colors.backgroundModifierHover,
                  onPressed: () {},
                ),
              ],
              if (friend.friendStatus == FriendStatus.pendingIncoming) ...[
                _actionButton(
                  context,
                  icon: PhosphorIconsFill.check,
                  color: context.colors.brandPrimaryFill,
                  backgroundColor: context.colors.brandPrimary,
                  onPressed: () {},
                ),
                SizedBox(width: context.layout.s2),
                _actionButton(
                  context,
                  icon: PhosphorIconsFill.x,
                  color: context.colors.textPrimary,
                  backgroundColor: context.colors.statusDanger,
                  onPressed: () {},
                ),
              ],
              if (friend.friendStatus == FriendStatus.pendingOutgoing) ...[
                _actionButton(
                  context,
                  icon: PhosphorIconsFill.x,
                  color: context.colors.textPrimary,
                  backgroundColor: context.colors.backgroundTertiary,
                  onPressed: () {},
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );

  Widget _actionButton(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) => Material(
    color: backgroundColor,
    shape: const CircleBorder(),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 36,
        height: 36,
        child: Center(child: PhosphorIcon(icon, size: 20, color: color)),
      ),
    ),
  );

  String _emptyTitle(DmViewState vm) {
    if (vm.searchQuery.isNotEmpty) {
      return 'No friends match your search';
    }
    switch (vm.activeTab) {
      case FriendsTab.online:
        return 'No friends online';
      case FriendsTab.all:
        return 'No friends yet';
      case FriendsTab.pending:
        return 'No Pending Requests';
      case FriendsTab.blocked:
        return 'No blocked users';
    }
  }

  String _emptySubtitle(DmViewState vm) {
    if (vm.searchQuery.isNotEmpty) {
      return 'Try another name or check your '
          'spelling.';
    }
    switch (vm.activeTab) {
      case FriendsTab.online:
        return 'When your friends come online, '
            "they'll appear right here.";
      case FriendsTab.all:
        return "Where we're going, we need "
            'more friends.';
      case FriendsTab.pending:
        return 'No one has sent you a friend '
            'request yet.';
      case FriendsTab.blocked:
        return "You haven't blocked anyone.";
    }
  }

  String _statusText(Friend friend) {
    switch (friend.friendStatus) {
      case FriendStatus.accepted:
        return friend.status[0].toUpperCase() + friend.status.substring(1);
      case FriendStatus.pendingIncoming:
        return 'Incoming Friend Request';
      case FriendStatus.pendingOutgoing:
        return 'Outgoing Friend Request';
      case FriendStatus.blocked:
        return 'Blocked';
    }
  }
}
