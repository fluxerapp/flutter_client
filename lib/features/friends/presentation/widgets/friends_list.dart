import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/notifications/presentation/inbox_popout.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_actions_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_app/shared/sheets/add_friend_sheet.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kActiveNowMinWidth = 1100.0;
const _kActiveNowWidth = 352.0;

class FriendsList extends ConsumerWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab = ref.watch(dmViewModelProvider.select((s) => s.activeTab));
    final filteredFriends = ref.watch(
      dmViewModelProvider.select((s) => s.filteredFriends),
    );
    final searchQuery = ref.watch(
      dmViewModelProvider.select((s) => s.searchQuery),
    );
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
                  _buildSectionHeader(
                    context,
                    activeTab: activeTab,
                    friendCount: filteredFriends.length,
                  ),
                  Expanded(
                    child: _buildFriendsList(
                      context,
                      ref,
                      activeTab: activeTab,
                      filteredFriends: filteredFriends,
                      searchQuery: searchQuery,
                    ),
                  ),
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
    constraints: const BoxConstraints(minHeight: 56),
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
                FluxerButton.primary(
                  label: FluxerLocalizations.of(
                    context,
                  ).profileSendFriendRequest,
                  size: FluxerButtonSize.compact,
                  fitContent: true,
                  onPressed: () => AddFriendSheet.show(context),
                ),
              ],
            ),
          ),
        ),

        if (isWideLayout(context))
          InboxPopoutButton(
            anchorBuilder:
                (
                  BuildContext context, {
                  required bool isOpen,
                  required VoidCallback toggle,
                }) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      hoverColor: context.colors.backgroundModifierHover,
                      onTap: toggle,
                      child: Semantics(
                        button: true,
                        label: FluxerLocalizations.of(context).friendsOpenInbox,
                        child: Padding(
                          padding: EdgeInsets.all(context.layout.s2),
                          child: ExcludeSemantics(
                            child: SvgPicture.asset(
                              'assets/images/inbox-icon.svg',
                              width: 24,
                              height: 24,
                              theme: SvgTheme(
                                currentColor: isOpen
                                    ? context.colors.interactiveActive
                                    : context.colors.interactiveNormal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
          )
        else
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              hoverColor: context.colors.backgroundModifierHover,
              onTap: () =>
                  navigateToContent(context, RoutePaths.notificationsPath),
              child: Semantics(
                button: true,
                label: FluxerLocalizations.of(context).friendsOpenInbox,
                child: Padding(
                  padding: EdgeInsets.all(context.layout.s2),
                  child: ExcludeSemantics(
                    child: SvgPicture.asset(
                      'assets/images/inbox-icon.svg',
                      width: 24,
                      height: 24,
                      theme: SvgTheme(
                        currentColor: context.colors.interactiveNormal,
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
              style: context.textStyles.channelName.copyWith(
                color: isActive
                    ? context.colors.textPrimary
                    : context.colors.textPrimaryMuted,
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
    child: FluxerInput(
      hint: _searchHint(activeTab),
      onChanged: ref.read(dmViewModelProvider.notifier).updateSearch,
      prefixIcon: PhosphorIcon(
        PhosphorIconsBold.magnifyingGlass,
        size: 20,
        color: context.colors.textSecondary,
      ),
      style: context.textStyles.inputText.copyWith(fontSize: 14),
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

  Widget _buildSectionHeader(
    BuildContext context, {
    required FriendsTab activeTab,
    required int friendCount,
  }) {
    final label = _tabLabel(activeTab).toUpperCase();
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
          '$label \u2014 $friendCount',
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
              style: context.textStyles.channelName.copyWith(
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
                    style: context.textStyles.channelName.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  SizedBox(height: context.layout.s3),
                  Text(
                    'When friends are active '
                    'in voice channels, their '
                    'activity will appear '
                    'here.',
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textTertiary,
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

  Widget _buildFriendsList(
    BuildContext context,
    WidgetRef ref, {
    required FriendsTab activeTab,
    required List<Friend> filteredFriends,
    required String searchQuery,
  }) {
    if (filteredFriends.isEmpty) {
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
                _emptyTitle(activeTab: activeTab, searchQuery: searchQuery),
                style: context.textStyles.heading,
              ),
              SizedBox(height: context.layout.s2),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 448),
                child: Text(
                  _emptySubtitle(
                    activeTab: activeTab,
                    searchQuery: searchQuery,
                  ),
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textTertiary,
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
      itemCount: filteredFriends.length,
      itemBuilder: (context, index) {
        final friend = filteredFriends[index];
        return _buildFriendTile(context, ref, friend);
      },
    );
  }

  Widget _buildFriendTile(BuildContext context, WidgetRef ref, Friend friend) =>
      DecoratedBox(
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
            onTap: () => unawaited(
              FluxerUserProfileSheet.show(context, userId: friend.id),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.layout.s3,
                horizontal: context.layout.s4,
              ),
              child: Row(
                children: [
                  FluxerAvatar.userPresence(
                    fallbackText: friend.displayName,
                    userId: friend.id,
                    imageUrl: FluxerMediaUrl.userAvatar(
                      userId: friend.id,
                      hash: friend.avatar,
                    ),
                    avatarColor: friend.avatarColor,
                    size: 36,
                  ),
                  SizedBox(width: context.layout.s3),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          friend.displayName,
                          style: context.textStyles.channelName,
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
                            style: context.textStyles.timestamp.copyWith(
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
                    FluxerButton.circleAlt(
                      icon: PhosphorIconsFill.chatCircle,
                      size: FluxerButtonSize.compact,
                      semanticLabel: FluxerLocalizations.of(
                        context,
                      ).friendsMessageFriend,
                      onPressed: () =>
                          unawaited(_openFriendChat(context, ref, friend)),
                    ),
                    SizedBox(width: context.layout.s2),
                    FluxerButton.circleAlt(
                      icon: PhosphorIconsBold.dotsThreeVertical,
                      size: FluxerButtonSize.compact,
                      semanticLabel: FluxerLocalizations.of(
                        context,
                      ).friendsFriendActions,
                      onPressed: () =>
                          unawaited(_openFriendMenu(context, ref, friend)),
                    ),
                  ],
                  if (friend.friendStatus == FriendStatus.pendingIncoming) ...[
                    FluxerButton.circle(
                      icon: PhosphorIconsBold.check,
                      size: FluxerButtonSize.compact,
                      semanticLabel: FluxerLocalizations.of(
                        context,
                      ).friendsAcceptRequest,
                      onPressed: () => unawaited(
                        ref
                            .read(friendRepositoryProvider)
                            .acceptFriendRequest(friend.id),
                      ),
                    ),
                    SizedBox(width: context.layout.s2),
                    FluxerButton.circle(
                      icon: PhosphorIconsBold.x,
                      variant: FluxerButtonVariant.dangerPrimary,
                      size: FluxerButtonSize.compact,
                      semanticLabel: FluxerLocalizations.of(
                        context,
                      ).friendsDeclineRequest,
                      onPressed: () => unawaited(
                        _confirmRemoveRelationship(context, ref, friend),
                      ),
                    ),
                  ],
                  if (friend.friendStatus == FriendStatus.pendingOutgoing) ...[
                    FluxerButton.circleAlt(
                      icon: PhosphorIconsBold.x,
                      size: FluxerButtonSize.compact,
                      semanticLabel: FluxerLocalizations.of(
                        context,
                      ).friendsCancelRequest,
                      onPressed: () => unawaited(
                        _confirmCancelOutgoingRequest(context, ref, friend),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );

  String _emptyTitle({
    required FriendsTab activeTab,
    required String searchQuery,
  }) {
    if (searchQuery.isNotEmpty) {
      return 'No friends match your search';
    }
    switch (activeTab) {
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

  String _emptySubtitle({
    required FriendsTab activeTab,
    required String searchQuery,
  }) {
    if (searchQuery.isNotEmpty) {
      return 'Try another name or check your '
          'spelling.';
    }
    switch (activeTab) {
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

  Future<void> _openFriendChat(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) async {
    final String channelId = await ref
        .read(dmRepositoryProvider)
        .ensureDmChannel(friend.id);
    if (!context.mounted) {
      return;
    }
    await navigateToDmChannelContent(
      context: context,
      ref: ref,
      channelId: channelId,
    );
  }

  Future<void> _openFriendMenu(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) async {
    final profile = await ref.read(
      userProfileProvider(userId: friend.id).future,
    );
    if (!context.mounted || profile == null) {
      return;
    }
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    final Offset position = box == null
        ? Offset.zero
        : box.localToGlobal(Offset(box.size.width - 48, box.size.height / 2));
    await UserProfileActionsSheet.show(
      context,
      ref,
      relationship: friend,
      user: profile.user,
      isCurrentUser: false,
      position: position,
      displayName: friend.displayName,
    );
  }

  Future<void> _confirmRemoveRelationship(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) async {
    final bool? confirmed = isMobileLayout(context)
        ? await FluxerConfirmSheet.show(
            context,
            title: 'Ignore friend request',
            description:
                'Ignore the friend request from ${friend.displayName}?',
            confirmLabel: 'Ignore',
            onConfirm: () {},
          )
        : await FluxerConfirmModal.show(
            context,
            title: 'Ignore friend request',
            description:
                'Ignore the friend request from ${friend.displayName}?',
            confirmLabel: 'Ignore',
            onConfirm: () {},
          );
    if (confirmed != true || !context.mounted) {
      return;
    }
    await ref.read(friendRepositoryProvider).removeRelationship(friend.id);
  }

  Future<void> _confirmCancelOutgoingRequest(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) async {
    final bool? confirmed = isMobileLayout(context)
        ? await FluxerConfirmSheet.show(
            context,
            title: 'Cancel friend request',
            description: 'Cancel your friend request to ${friend.displayName}?',
            confirmLabel: 'Cancel request',
            onConfirm: () {},
          )
        : await FluxerConfirmModal.show(
            context,
            title: 'Cancel friend request',
            description: 'Cancel your friend request to ${friend.displayName}?',
            confirmLabel: 'Cancel request',
            onConfirm: () {},
          );
    if (confirmed != true || !context.mounted) {
      return;
    }
    await ref.read(friendRepositoryProvider).removeRelationship(friend.id);
  }
}
