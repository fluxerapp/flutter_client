import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/utils/navigation/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/notifications/presentation/inbox_popout.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/domain/presence_status_labels.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_actions_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/pages/add_friend_page.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';

const _kActiveNowMinPaneWidth = 1100.0;
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

    return ColoredBox(
      color: context.colors.chatBackground,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool showActiveNow =
                showActiveNowPref &&
                constraints.maxWidth >= _kActiveNowMinPaneWidth;
            return Row(
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
                        desktop: usesDesktopPointerUi(context),
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
            );
          },
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
        Text(
          FluxerLocalizations.of(context).friendsPageTitle,
          style: context.textStyles.channelName,
        ),
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
                  _tabLabel(FluxerLocalizations.of(context), FriendsTab.online),
                  FriendsTab.online,
                  activeTab,
                ),
                _tabButton(
                  context,
                  ref,
                  _tabLabel(FluxerLocalizations.of(context), FriendsTab.all),
                  FriendsTab.all,
                  activeTab,
                ),
                _tabButton(
                  context,
                  ref,
                  _tabLabel(
                    FluxerLocalizations.of(context),
                    FriendsTab.pending,
                  ),
                  FriendsTab.pending,
                  activeTab,
                ),
                if (!ref.watch(
                  instanceRuntimeConfigProvider.select(
                    (config) => config.directMessagesDisabled,
                  ),
                ))
                  if (usesDesktopPointerUi(context))
                    _DesktopFriendsTabButton(
                      label: FluxerLocalizations.of(
                        context,
                      ).profileSendFriendRequest,
                      isActive: false,
                      primary: true,
                      onTap: () => AddFriendPage.show(context),
                    )
                  else
                    FluxerButton.primary(
                      label: FluxerLocalizations.of(
                        context,
                      ).profileSendFriendRequest,
                      size: FluxerButtonSize.compact,
                      fitContent: true,
                      onPressed: () => AddFriendPage.show(context),
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
    if (usesDesktopPointerUi(context)) {
      return Padding(
        padding: EdgeInsetsDirectional.only(end: context.layout.s2),
        child: _DesktopFriendsTabButton(
          label: label,
          isActive: isActive,
          onTap: () => ref.read(dmViewModelProvider.notifier).selectTab(tab),
        ),
      );
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(end: context.layout.s2),
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
    child: PickerSearchInput.inline(
      hintText: _searchHint(FluxerLocalizations.of(context), activeTab),
      onChanged: ref.read(dmViewModelProvider.notifier).updateSearch,
    ),
  );

  String _tabLabel(FluxerLocalizations l10n, FriendsTab tab) {
    switch (tab) {
      case FriendsTab.online:
        return l10n.friendsTabOnline;
      case FriendsTab.all:
        return l10n.friendsTabAll;
      case FriendsTab.pending:
        return l10n.friendsTabPending;
      case FriendsTab.blocked:
        return l10n.friendsTabBlocked;
    }
  }

  String _searchHint(FluxerLocalizations l10n, FriendsTab tab) {
    switch (tab) {
      case FriendsTab.online:
        return l10n.friendsSearchOnline;
      case FriendsTab.all:
        return l10n.friendsSearchAll;
      case FriendsTab.pending:
        return l10n.friendsSearchPending;
      case FriendsTab.blocked:
        return l10n.friendsSearchBlocked;
    }
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required FriendsTab activeTab,
    required int friendCount,
    bool desktop = false,
  }) {
    final label = _tabLabel(FluxerLocalizations.of(context), activeTab);
    if (desktop) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            '$label \u2014 $friendCount',
            style: context.textStyles.smallText.copyWith(
              color: context.colors.textPrimaryMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 16 / 12,
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(
        left: context.layout.s4,
        right: context.layout.s4,
        top: context.layout.s4,
        bottom: context.layout.s2,
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
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
      border: BorderDirectional(
        start: BorderSide(color: context.colors.backgroundModifierAccent),
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
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              FluxerLocalizations.of(context).friendsActiveNowTitle,
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
                    FluxerLocalizations.of(context).friendsActiveNowEmptyTitle,
                    style: context.textStyles.channelName.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  SizedBox(height: context.layout.s3),
                  Text(
                    FluxerLocalizations.of(context).friendsActiveNowEmptyBody,
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
                _emptyTitle(
                  FluxerLocalizations.of(context),
                  activeTab: activeTab,
                  searchQuery: searchQuery,
                ),
                style: context.textStyles.heading,
              ),
              SizedBox(height: context.layout.s2),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 448),
                child: Text(
                  _emptySubtitle(
                    FluxerLocalizations.of(context),
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
    if (usesDesktopPointerUi(context)) {
      return _DesktopFriendsListView(
        friends: filteredFriends,
        statusText: (Friend friend) =>
            _statusText(FluxerLocalizations.of(context), friend),
        onOpenProfile: (Friend friend) =>
            unawaited(FluxerUserProfileSheet.show(context, userId: friend.id)),
        onMessage: (Friend friend) =>
            unawaited(_openFriendChat(context, ref, friend)),
        onMore: (BuildContext rowContext, Friend friend) =>
            _openFriendMenu(rowContext, ref, friend),
        onAccept: (Friend friend) => unawaited(
          _runRelationshipAction(
            context,
            ref,
            ApiErrorAction.acceptFriendRequest,
            () => ref
                .read(friendRepositoryProvider)
                .acceptFriendRequest(friend.id),
          ),
        ),
        onIgnore: (Friend friend) =>
            unawaited(_confirmRemoveRelationship(context, ref, friend)),
        onCancel: (Friend friend) =>
            unawaited(_confirmCancelOutgoingRequest(context, ref, friend)),
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

  Widget _buildFriendTile(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) => DecoratedBox(
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
                        _statusText(FluxerLocalizations.of(context), friend),
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
                    _runRelationshipAction(
                      context,
                      ref,
                      ApiErrorAction.acceptFriendRequest,
                      () => ref
                          .read(friendRepositoryProvider)
                          .acceptFriendRequest(friend.id),
                    ),
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

  String _emptyTitle(
    FluxerLocalizations l10n, {
    required FriendsTab activeTab,
    required String searchQuery,
  }) {
    if (searchQuery.isNotEmpty) {
      return l10n.friendsEmptySearchTitle;
    }
    switch (activeTab) {
      case FriendsTab.online:
        return l10n.friendsEmptyOnlineTitle;
      case FriendsTab.all:
        return l10n.friendsEmptyAllTitle;
      case FriendsTab.pending:
        return l10n.friendsEmptyPendingTitle;
      case FriendsTab.blocked:
        return l10n.blockedUsersEmptyTitle;
    }
  }

  String _emptySubtitle(
    FluxerLocalizations l10n, {
    required FriendsTab activeTab,
    required String searchQuery,
  }) {
    if (searchQuery.isNotEmpty) {
      return l10n.friendsEmptySearchBody;
    }
    switch (activeTab) {
      case FriendsTab.online:
        return l10n.friendsEmptyOnlineBody;
      case FriendsTab.all:
        return l10n.friendsEmptyAllBody;
      case FriendsTab.pending:
        return l10n.friendsEmptyPendingBody;
      case FriendsTab.blocked:
        return l10n.friendsEmptyBlockedBody;
    }
  }

  String _statusText(FluxerLocalizations l10n, Friend friend) {
    switch (friend.friendStatus) {
      case FriendStatus.accepted:
        return presenceStatusLabel(friend.status, l10n);
      case FriendStatus.pendingIncoming:
        return l10n.addFriendIncomingStatus;
      case FriendStatus.pendingOutgoing:
        return l10n.friendsOutgoingStatus;
      case FriendStatus.blocked:
        return l10n.friendsBlockedStatus;
    }
  }

  Future<void> _openFriendChat(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) async {
    if (ref.read(instanceRuntimeConfigProvider).directMessagesDisabled) {
      return;
    }
    final String channelId;
    try {
      channelId = await ref
          .read(dmRepositoryProvider)
          .ensureDmChannel(friend.id);
    } on Object catch (e) {
      if (context.mounted) {
        await showApiError(context, ApiErrorAction.openDm, e);
      }
      return;
    }
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
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String title = l10n.addFriendIgnoreTitle;
    final String description = l10n.addFriendIgnoreConfirmDescription(
      friend.displayName,
    );
    final bool? confirmed = isMobileLayout(context)
        ? await FluxerConfirmSheet.show(
            context,
            title: title,
            description: description,
            confirmLabel: l10n.addFriendIgnore,
            isDanger: true,
            onConfirm: () {},
          )
        : await FluxerConfirmModal.show(
            context,
            title: title,
            description: description,
            confirmLabel: l10n.addFriendIgnore,
            isDanger: true,
            onConfirm: () {},
          );
    if (confirmed != true || !context.mounted) {
      return;
    }
    await _runRelationshipAction(
      context,
      ref,
      ApiErrorAction.ignoreFriendRequest,
      () => ref.read(friendRepositoryProvider).removeRelationship(friend.id),
    );
  }

  Future<void> _confirmCancelOutgoingRequest(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String title = l10n.friendsCancelRequest;
    final String description = l10n.friendCancelRequestConfirmDescription(
      friend.displayName,
    );
    final bool? confirmed = isMobileLayout(context)
        ? await FluxerConfirmSheet.show(
            context,
            title: title,
            description: description,
            confirmLabel: l10n.friendsCancelRequest,
            isDanger: true,
            onConfirm: () {},
          )
        : await FluxerConfirmModal.show(
            context,
            title: title,
            description: description,
            confirmLabel: l10n.friendsCancelRequest,
            isDanger: true,
            onConfirm: () {},
          );
    if (confirmed != true || !context.mounted) {
      return;
    }
    await _runRelationshipAction(
      context,
      ref,
      ApiErrorAction.cancelFriendRequest,
      () => ref.read(friendRepositoryProvider).removeRelationship(friend.id),
    );
  }

  Future<void> _runRelationshipAction(
    BuildContext context,
    WidgetRef ref,
    ApiErrorAction errorAction,
    Future<void> Function() call,
  ) async {
    try {
      await call();
    } on Object catch (e) {
      if (!context.mounted) {
        return;
      }
      await showApiError(context, errorAction, e);
    }
  }
}

class _DesktopFriendsTabButton extends StatelessWidget {
  const _DesktopFriendsTabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
    this.primary = false,
  });

  final String label;
  final bool isActive;
  final bool primary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: label,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool hovered = states.contains(WidgetState.hovered);
        final Color background = primary
            ? colors.brandPrimary
            : isActive
            ? colors.backgroundModifierSelected
            : hovered
            ? colors.backgroundModifierHover
            : Colors.transparent;
        final Color foreground = primary
            ? colors.brandPrimaryFill
            : isActive || hovered
            ? colors.textPrimary
            : colors.textPrimaryMuted;
        return Opacity(
          opacity: primary && hovered ? 0.9 : 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: background,
              borderRadius: context.layout.radiusMd,
            ),
            child: Text(
              label,
              style: context.textStyles.channelName.copyWith(
                color: foreground,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 24 / 16,
              ),
              maxLines: 1,
              softWrap: false,
            ),
          ),
        );
      },
    );
  }
}

class _DesktopFriendsListView extends StatefulWidget {
  const _DesktopFriendsListView({
    required this.friends,
    required this.statusText,
    required this.onOpenProfile,
    required this.onMessage,
    required this.onMore,
    required this.onAccept,
    required this.onIgnore,
    required this.onCancel,
  });

  final List<Friend> friends;
  final String Function(Friend friend) statusText;
  final void Function(Friend friend) onOpenProfile;
  final void Function(Friend friend) onMessage;
  final Future<void> Function(BuildContext context, Friend friend) onMore;
  final void Function(Friend friend) onAccept;
  final void Function(Friend friend) onIgnore;
  final void Function(Friend friend) onCancel;

  @override
  State<_DesktopFriendsListView> createState() =>
      _DesktopFriendsListViewState();
}

class _DesktopFriendsListViewState extends State<_DesktopFriendsListView> {
  final ValueNotifier<int?> _hoveredIndex = ValueNotifier<int?>(null);
  int? _menuIndex;

  @override
  void dispose() {
    _hoveredIndex.dispose();
    super.dispose();
  }

  Future<void> _openMore(BuildContext rowContext, int index) async {
    setState(() => _menuIndex = index);
    try {
      await widget.onMore(rowContext, widget.friends[index]);
    } finally {
      if (mounted) {
        setState(() => _menuIndex = null);
      }
    }
  }

  void _setHovered(int index, {required bool hovered}) {
    if (hovered) {
      _hoveredIndex.value = index;
    } else if (_hoveredIndex.value == index) {
      _hoveredIndex.value = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: widget.friends.length,
      itemBuilder: (BuildContext context, int index) {
        final Friend friend = widget.friends[index];
        return ValueListenableBuilder<int?>(
          valueListenable: _hoveredIndex,
          builder: (BuildContext context, int? hoveredIndex, _) {
            bool highlightedAt(int i) => hoveredIndex == i || _menuIndex == i;
            final bool highlighted = highlightedAt(index);
            return _DesktopFriendRow(
              friend: friend,
              statusText: widget.statusText(friend),
              highlighted: highlighted,
              menuOpen: _menuIndex == index,
              showSeparator:
                  !highlighted && !(index > 0 && highlightedAt(index - 1)),
              onHoverChanged: (bool hovered) =>
                  _setHovered(index, hovered: hovered),
              onTap: () => widget.onOpenProfile(friend),
              onMessage: () => widget.onMessage(friend),
              onMore: (BuildContext rowContext) =>
                  unawaited(_openMore(rowContext, index)),
              onAccept: () => widget.onAccept(friend),
              onIgnore: () => widget.onIgnore(friend),
              onCancel: () => widget.onCancel(friend),
            );
          },
        );
      },
    );
  }
}

class _DesktopFriendRow extends StatelessWidget {
  const _DesktopFriendRow({
    required this.friend,
    required this.statusText,
    required this.highlighted,
    required this.menuOpen,
    required this.showSeparator,
    required this.onHoverChanged,
    required this.onTap,
    required this.onMessage,
    required this.onMore,
    required this.onAccept,
    required this.onIgnore,
    required this.onCancel,
  });

  final Friend friend;
  final String statusText;
  final bool highlighted;
  final bool menuOpen;
  final bool showSeparator;
  final ValueChanged<bool> onHoverChanged;
  final VoidCallback onTap;
  final VoidCallback onMessage;
  final ValueChanged<BuildContext> onMore;
  final VoidCallback onAccept;
  final VoidCallback onIgnore;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool offline = friend.status == 'offline';
    final TextStyle subtextStyle = offline
        ? fluxerDesktopRowSubtextStyle(context).copyWith(
            color: fluxerCssColorMix(
              colors.textTertiary,
              Colors.transparent,
              0.85,
            ),
          )
        : fluxerDesktopRowSubtextStyle(context);
    final List<Widget> actions = <Widget>[
      if (friend.friendStatus == FriendStatus.accepted) ...<Widget>[
        _DesktopFriendActionButton(
          icon: PhosphorIconsFill.chatTeardrop,
          tooltip: l10n.friendsMessageFriend,
          tone: _DesktopFriendActionTone.neutral,
          onTap: onMessage,
        ),
        Builder(
          builder: (BuildContext buttonContext) => _DesktopFriendActionButton(
            icon: PhosphorIconsBold.dotsThreeVertical,
            tooltip: l10n.friendsFriendActions,
            tone: _DesktopFriendActionTone.neutral,
            active: menuOpen,
            onTap: () => onMore(buttonContext),
          ),
        ),
      ],
      if (friend.friendStatus == FriendStatus.pendingIncoming) ...<Widget>[
        _DesktopFriendActionButton(
          icon: PhosphorIconsBold.check,
          tooltip: l10n.friendsAcceptRequest,
          tone: _DesktopFriendActionTone.brand,
          onTap: onAccept,
        ),
        _DesktopFriendActionButton(
          icon: PhosphorIconsBold.x,
          tooltip: l10n.friendsDeclineRequest,
          tone: _DesktopFriendActionTone.ignore,
          onTap: onIgnore,
        ),
      ],
      if (friend.friendStatus == FriendStatus.pendingOutgoing)
        _DesktopFriendActionButton(
          icon: PhosphorIconsBold.x,
          tooltip: l10n.friendsCancelRequest,
          tone: _DesktopFriendActionTone.danger,
          onTap: onCancel,
        ),
    ];
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onHoverChanged(true),
      onExit: (_) => onHoverChanged(false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              start: 8,
              end: 6.4,
              top: 0,
              bottom: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: highlighted
                      ? colors.backgroundModifierHover
                      : Colors.transparent,
                  borderRadius: context.layout.radiusMd,
                  border: showSeparator
                      ? Border(
                          top: BorderSide(
                            color: colors.backgroundModifierAccent,
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: <Widget>[
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
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                friend.displayName,
                                style: context.textStyles.channelName.copyWith(
                                  color: colors.textPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 20 / 16,
                                ),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (highlighted) ...<Widget>[
                              const SizedBox(width: 6),
                              Text(
                                formatUserTag(
                                  friend.username,
                                  friend.discriminator,
                                  uniqueUsernames: true,
                                ),
                                style: context.textStyles.timestamp.copyWith(
                                  color: colors.textTertiary,
                                  fontSize: 12,
                                  height: 16 / 12,
                                ),
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ],
                          ],
                        ),
                        if (friend.friendStatus == FriendStatus.accepted &&
                            hasVisibleCustomStatus(friend.customStatus))
                          CustomStatusDisplay(
                            stored: friend.customStatus,
                            maxLines: 1,
                            emojiSize: 14,
                            textStyle: subtextStyle,
                          )
                        else
                          Text(
                            statusText,
                            style: subtextStyle,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  for (int i = 0; i < actions.length; i++) ...<Widget>[
                    if (i > 0) const SizedBox(width: 8),
                    actions[i],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _DesktopFriendActionTone { neutral, brand, ignore, danger }

class _DesktopFriendActionButton extends StatelessWidget {
  const _DesktopFriendActionButton({
    required this.icon,
    required this.tooltip,
    required this.tone,
    required this.onTap,
    this.active = false,
  });

  final IconData icon;
  final String tooltip;
  final _DesktopFriendActionTone tone;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color hoverBg = colors.backgroundModifierHover;
    final Color selectedBg = colors.backgroundModifierSelected;
    final (
      Color background,
      Color hoverBackground,
      Color foreground,
      Color hoverForeground,
    ) = switch (tone) {
      _DesktopFriendActionTone.neutral => (
        fluxerCssColorMix(hoverBg, colors.textPrimaryMuted, 0.94),
        fluxerCssColorMix(hoverBg, selectedBg, 0.84),
        colors.textPrimaryMuted,
        colors.textPrimary,
      ),
      _DesktopFriendActionTone.brand => (
        fluxerCssColorMix(hoverBg, colors.brandPrimary, 0.86),
        fluxerCssColorMix(selectedBg, colors.brandPrimary, 0.78),
        colors.textPrimary,
        colors.textPrimary,
      ),
      _DesktopFriendActionTone.ignore => (
        fluxerCssColorMix(hoverBg, colors.textPrimaryMuted, 0.9),
        fluxerCssColorMix(hoverBg, selectedBg, 0.8),
        colors.textPrimary,
        colors.textPrimary,
      ),
      _DesktopFriendActionTone.danger => (
        fluxerCssColorMix(hoverBg, colors.statusDanger, 0.86),
        fluxerCssColorMix(selectedBg, colors.statusDanger, 0.76),
        fluxerCssColorMix(colors.statusDanger, colors.textPrimary, 0.82),
        fluxerCssColorMix(colors.statusDanger, colors.textPrimary, 0.88),
      ),
    };
    return FluxerButton.desktop(
      icon: icon,
      semanticLabel: tooltip,
      showTooltip: true,
      onPressed: onTap,
      extent: 36,
      iconSize: 20,
      circle: true,
      active: active,
      background: background,
      hoverBackground: hoverBackground,
      color: foreground,
      hoverColor: hoverForeground,
      shadows: const <BoxShadow>[
        BoxShadow(
          color: Color(0x1F000000),
          offset: Offset(0, 1),
          blurRadius: 2,
        ),
      ],
    );
  }
}
