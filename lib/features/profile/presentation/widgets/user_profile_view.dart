import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/permission_resolver.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart' show RoutePaths;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/domain/member_role_management.dart';
import 'package:fluxer_app/features/members/presentation/widgets/user_profile_roles_section.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/profile_tab_menu_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_actions_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_confirmation_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_note_edit_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_action_card_row.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_banner.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_bio_card.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_header.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_loading_skeleton.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_mutuals_section.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_note_card.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_relationship_button.dart';
import 'package:fluxer_app/features/profile/providers/user_note_view_model.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_profile_guild_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_relationship_provider.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kBannerHeight = 184;
const double _kAvatarSize = 80;
const double _kAvatarOverlap = _kAvatarSize / 2;

class UserProfileView extends ConsumerStatefulWidget {
  const UserProfileView({
    required this.userId,
    required this.scrollController,
    required this.autoFocusNote,
    this.guildId,
    this.onCloseRequested,
    this.useCurrentUserCache = false,
    this.showTopHandle = false,
    this.isWebhook = false,
    this.message,
    super.key,
  });

  final String userId;
  final String? guildId;
  final bool autoFocusNote;
  final ScrollController scrollController;
  final VoidCallback? onCloseRequested;
  final bool useCurrentUserCache;
  final bool showTopHandle;
  final bool isWebhook;
  final Message? message;

  @override
  ConsumerState<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
  bool _autoFocusTriggered = false;
  bool _showGlobalProfile = false;

  @override
  void didUpdateWidget(covariant UserProfileView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userId != widget.userId ||
        oldWidget.guildId != widget.guildId) {
      _showGlobalProfile = false;
    }
  }

  void _requestClose() {
    final VoidCallback? onCloseRequested = widget.onCloseRequested;
    if (onCloseRequested == null) {
      return;
    }
    onCloseRequested();
  }

  void _openProfileTabMenu() {
    FluxerHaptics.medium();
    unawaited(ProfileTabMenuSheet.show(context, ref));
  }

  Future<void> _handleMessage(
    String userId,
    bool isBlocked,
    String username,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (isBlocked) {
      final bool ok = await UserProfileConfirmationSheet.show(
        context,
        title: l10n.userProfileOpenBlockedDmTitle,
        description: l10n.userProfileOpenBlockedDmDescription(username),
        primaryLabel: l10n.userProfileOpenDm,
        primaryVariant: FluxerButtonVariant.primary,
      );
      if (!ok) {
        return;
      }
    }
    try {
      final String channelId = await ref
          .read(dmRepositoryProvider)
          .ensureDmChannel(userId);
      if (!mounted) {
        return;
      }
      _requestClose();
      navigateToContent(context, RoutePaths.dmChannel(channelId));
    } on Object catch (err, st) {
      talker.error('[UserProfileSheet] Failed to open DM: $err', err, st);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.userProfileFailedOpenDm,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<void> _handleOutboundDmCall({
    required String peerUserId,
    required bool isBlocked,
    required String username,
    required bool startWithVideo,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (isBlocked) {
      final bool ok = await UserProfileConfirmationSheet.show(
        context,
        title: l10n.userProfileOpenBlockedDmTitle,
        description: l10n.userProfileOpenBlockedDmDescription(username),
        primaryLabel: l10n.userProfileOpenDm,
        primaryVariant: FluxerButtonVariant.primary,
      );
      if (!ok) {
        return;
      }
    }
    try {
      final String channelId = await ref
          .read(dmRepositoryProvider)
          .ensureDmChannel(peerUserId);
      if (!mounted) {
        return;
      }
      final String? selfId = ref.read(currentUserIdProvider);
      final List<String> ringTargets = <String>[
        peerUserId,
      ].where((String id) => selfId == null || id != selfId).toList();
      final StartDirectVoiceCallResult result = await startDirectVoiceCall(
        ref,
        context,
        channelId,
        outboundRingRecipients: ringTargets.isEmpty ? null : ringTargets,
        startWithVideo: startWithVideo,
      );
      if (!mounted) {
        return;
      }
      if (!result.ok && !result.microphoneDenied && !result.cameraDenied) {
        final String? snackMessage = result.notEligible
            ? l10n.directVoiceCallNotEligible
            : result.joinAttemptFailed
            ? l10n.voiceJoinCallFailed
            : null;
        if (snackMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(snackMessage)));
        }
      }
    } on Object catch (err, st) {
      talker.error('[UserProfileSheet] Failed to start call: $err', err, st);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.userProfileFailedOpenDm,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<void> _showMutualFriendProfile(String userId) {
    return FluxerBottomSheet.showScrollable<void>(
      context,
      useRootNavigator: true,
      initialChildSize: 0.95,
      minChildSize: 0.5,
      showDragHandle: false,
      disableTopPadding: true,
      builder: (sheetContext, scrollController, close) => UserProfileView(
        userId: userId,
        guildId: widget.guildId,
        autoFocusNote: false,
        scrollController: scrollController,
        onCloseRequested: close,
        showTopHandle: true,
      ),
    );
  }

  void _openMutualCommunity(String guildId) {
    _requestClose();
    context.go(RoutePaths.guild(guildId));
  }

  Future<void> _handleRelationshipAction({
    required Future<void> Function() repoCall,
    String? confirmTitle,
    String? confirmDescription,
    String? confirmPrimary,
    FluxerButtonVariant? confirmVariant,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (confirmTitle != null) {
      final bool ok = await UserProfileConfirmationSheet.show(
        context,
        title: confirmTitle,
        description: confirmDescription!,
        primaryLabel: confirmPrimary!,
        primaryVariant: confirmVariant!,
      );
      if (!ok) {
        return;
      }
    }
    try {
      await repoCall();
    } on Object catch (err, st) {
      talker.error(
        '[UserProfileSheet] Relationship action failed: $err',
        err,
        st,
      );
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.userProfileActionFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  void _maybeAutoFocusNote(AsyncValue<String?> noteAsync) {
    if (_autoFocusTriggered || !widget.autoFocusNote || !noteAsync.hasValue) {
      return;
    }
    _autoFocusTriggered = true;
    final String? initial = noteAsync.value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      unawaited(
        UserProfileNoteEditSheet.show(
          context,
          userId: widget.userId,
          initialNote: initial,
        ),
      );
    });
  }

  Widget _buildLoadedView({
    required String userId,
    required String username,
    required String discriminator,
    required String displayName,
    required String? avatarUrl,
    required int? avatarColor,
    required Color bannerColor,
    required String? bannerUrl,
    required String? bio,
    required DateTime? accountMemberSince,
    required DateTime? guildMemberSince,
    required String? guildName,
    required String? guildIconUrl,
    required List<MemberRole> memberRoles,
    required int flags,
    required bool hasPlutonium,
    required bool isLifetimePlutonium,
    required String? premiumSince,
    required int? premiumLifetimeSequence,
    required List<UserPartialResponse> mutualFriends,
    required List<UserProfileFullResponseMutualGuilds> mutualCommunities,
    required UserProfileFullResponseUser? actionUser,
    required List<ConnectionResponse> connections,
    required Friend? relationship,
    required String? pronouns,
    required String? customStatus,
    required AsyncValue<db.User?> presenceAsync,
    required String? note,
    required bool isCurrentUser,
    required bool hasGuildProfile,
    required bool isShowingGlobalProfile,
    int? timezoneOffset,
    ProfileMenuCapabilities menuCaps = ProfileMenuCapabilities.none,
    String? guildMemberNick,
    DateTime? guildMemberTimeoutUntil,
    String? profileGuildId,
    Set<String> memberRoleIds = const <String>{},
    List<MemberRole> allGuildRoles = const <MemberRole>[],
    bool canManageRoles = false,
    bool isGuildOwner = false,
    MemberRole? viewerHighestRole,
    bool isWebhook = false,
    bool isBot = false,
    bool isSystem = false,
    bool canCall = true,
  }) {
    final layout = context.layout;
    final colors = context.colors;
    final bool selfHosted = ref.watch(instanceRuntimeConfigProvider).selfHosted;
    final bool isBlocked = relationship?.friendStatus == FriendStatus.blocked;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        borderRadius: BorderRadius.vertical(top: layout.radiusXxl.topLeft),
      ),
      child: CustomScrollView(
        controller: widget.scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: _kBannerHeight + _kAvatarOverlap,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: _kBannerHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: layout.radiusXxl.topLeft,
                      ),
                      child: UserProfileBanner(
                        bannerUrl: bannerUrl,
                        bannerColor: bannerColor,
                      ),
                    ),
                  ),
                  if (widget.showTopHandle)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(top: layout.s3),
                        child: Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(9999),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    left: layout.s4,
                    top: _kBannerHeight - _kAvatarOverlap,
                    child: _ProfileIdentityAvatar(
                      userId: userId,
                      displayName: displayName,
                      avatarUrl: avatarUrl,
                      avatarColor: avatarColor,
                      showStatus: !isWebhook,
                      onTap: widget.useCurrentUserCache
                          ? _openProfileTabMenu
                          : null,
                    ),
                  ),
                  if (!isWebhook)
                    Positioned(
                      right: layout.s4,
                      top: _kBannerHeight + layout.s2,
                      child: Row(
                        children: <Widget>[
                          UserProfileRelationshipButton(
                            relationshipStatus: relationship?.friendStatus,
                            isCurrentUser: isCurrentUser,
                            allowFriendRequests: !ref.watch(
                              instanceRuntimeConfigProvider.select(
                                (config) => config.directMessagesDisabled,
                              ),
                            ),
                            onUnblock: () => _handleRelationshipAction(
                              repoCall: () => ref
                                  .read(friendRepositoryProvider)
                                  .removeRelationship(userId),
                              confirmTitle: FluxerLocalizations.of(
                                context,
                              ).userProfileUnblockConfirmTitle,
                              confirmDescription: FluxerLocalizations.of(
                                context,
                              ).userProfileUnblockConfirmDescription(username),
                              confirmPrimary: FluxerLocalizations.of(
                                context,
                              ).userProfileUnblockUser,
                              confirmVariant: FluxerButtonVariant.primary,
                            ),
                            onRemoveFriend: () => _handleRelationshipAction(
                              repoCall: () => ref
                                  .read(friendRepositoryProvider)
                                  .removeRelationship(userId),
                              confirmTitle: FluxerLocalizations.of(
                                context,
                              ).userProfileRemoveFriendConfirmTitle,
                              confirmDescription:
                                  FluxerLocalizations.of(
                                    context,
                                  ).userProfileRemoveFriendConfirmDescription(
                                    username,
                                  ),
                              confirmPrimary: FluxerLocalizations.of(
                                context,
                              ).userProfileRemoveFriend,
                              confirmVariant: FluxerButtonVariant.dangerPrimary,
                            ),
                            onAcceptRequest: () => _handleRelationshipAction(
                              repoCall: () => ref
                                  .read(friendRepositoryProvider)
                                  .acceptFriendRequest(userId),
                            ),
                            onCancelRequest: () => _handleRelationshipAction(
                              repoCall: () => ref
                                  .read(friendRepositoryProvider)
                                  .removeRelationship(userId),
                            ),
                            onSendFriendRequest: () =>
                                _handleRelationshipAction(
                                  repoCall: () => ref
                                      .read(friendRepositoryProvider)
                                      .sendFriendRequest(userId),
                                ),
                          ),
                          SizedBox(width: layout.s2),
                          if (actionUser == null)
                            FluxerButton.circleAlt(
                              icon: PhosphorIconsFill.gear,
                              onPressed: () => UserSettingsModal.show(context),
                            )
                          else
                            _MoreButton(
                              onTap: (Offset position) {
                                unawaited(
                                  UserProfileActionsSheet.show(
                                    context,
                                    ref,
                                    relationship: relationship,
                                    user: actionUser,
                                    isCurrentUser: isCurrentUser,
                                    position: position,
                                    hasGuildProfile: hasGuildProfile,
                                    isShowingGlobalProfile:
                                        isShowingGlobalProfile,
                                    onShowGlobalProfile: () {
                                      setState(() => _showGlobalProfile = true);
                                    },
                                    onShowCommunityProfile: () {
                                      setState(
                                        () => _showGlobalProfile = false,
                                      );
                                    },
                                    displayName: displayName,
                                    guildId: widget.guildId,
                                    message: widget.message,
                                    avatarUrl: avatarUrl,
                                    avatarColor: avatarColor,
                                    capabilities: menuCaps,
                                    currentNick: guildMemberNick,
                                    currentTimeoutUntil:
                                        guildMemberTimeoutUntil,
                                    allGuildRoles: allGuildRoles,
                                    memberRoleIds: memberRoleIds,
                                    canManageRoles: canManageRoles,
                                    isGuildOwner: isGuildOwner,
                                    viewerHighestRole: viewerHighestRole,
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              layout.s4,
              layout.s2,
              layout.s4,
              layout.s4 + FluxerBottomSheet.scrollBottomPaddingOf(context),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(<Widget>[
                UserProfileHeader(
                  username: username,
                  discriminator: discriminator,
                  displayName: displayName,
                  flags: flags,
                  hasPlutonium: hasPlutonium && !selfHosted,
                  isLifetimePlutonium: isLifetimePlutonium,
                  premiumSince: premiumSince,
                  premiumLifetimeSequence: premiumLifetimeSequence,
                  customStatus: customStatus,
                  pronouns: pronouns,
                  showUsername: !isWebhook,
                  isBot: isBot || isWebhook,
                  isSystem: isSystem,
                  onDisplayNameTap: widget.useCurrentUserCache
                      ? _openProfileTabMenu
                      : null,
                ),
                if (!isWebhook) ...[
                  SizedBox(height: layout.s4),
                  UserProfileActionCardRow(
                    isCurrentUser: isCurrentUser,
                    isFriend:
                        relationship?.friendStatus == FriendStatus.accepted,
                    isBlocked: isBlocked,
                    canCall:
                        canCall &&
                        !ref.watch(
                          instanceRuntimeConfigProvider.select(
                            (config) =>
                                config.directMessagesDisabled ||
                                !config.voiceEnabled,
                          ),
                        ),
                    showMessage: !ref.watch(
                      instanceRuntimeConfigProvider.select(
                        (config) => config.directMessagesDisabled,
                      ),
                    ),
                    onMessage: () =>
                        _handleMessage(userId, isBlocked, username),
                    onVoiceCall: () => _handleOutboundDmCall(
                      peerUserId: userId,
                      isBlocked: isBlocked,
                      username: username,
                      startWithVideo: false,
                    ),
                    onVideoCall: () => _handleOutboundDmCall(
                      peerUserId: userId,
                      isBlocked: isBlocked,
                      username: username,
                      startWithVideo: true,
                    ),
                    onEditProfile: () => UserSettingsModal.show(
                      context,
                      openProfileSection: true,
                    ),
                  ),
                  SizedBox(height: layout.s4),
                  UserProfileBioCard(
                    bio: bio,
                    userId: userId,
                    guildId: profileGuildId,
                    accountMemberSince: accountMemberSince,
                    guildMemberSince: guildMemberSince,
                    guildName: guildName,
                    guildIconUrl: guildIconUrl,
                    connections: connections,
                    timezoneOffset: timezoneOffset,
                  ),
                  if (profileGuildId != null) ...<Widget>[
                    SizedBox(height: layout.s4),
                    UserProfileRolesSection(
                      guildId: profileGuildId,
                      userId: userId,
                      memberRoles: memberRoles,
                      memberRoleIds: memberRoleIds,
                      allGuildRoles: allGuildRoles,
                      canManageRoles: canManageRoles,
                      isGuildOwner: isGuildOwner,
                      viewerHighestRole: viewerHighestRole,
                    ),
                  ],
                  SizedBox(height: layout.s4),
                  if (!isCurrentUser) ...[
                    UserProfileMutualsSection(
                      friends: mutualFriends,
                      communities: mutualCommunities,
                      onFriendTap: (UserPartialResponse friend) =>
                          _showMutualFriendProfile(friend.id),
                      onCommunityTap:
                          (UserProfileFullResponseMutualGuilds community) =>
                              _openMutualCommunity(community.id),
                    ),
                    SizedBox(height: layout.s4),
                  ],
                  UserProfileNoteCard(
                    note: note,
                    onTap: () => UserProfileNoteEditSheet.show(
                      context,
                      userId: userId,
                      initialNote: note,
                    ),
                  ),
                  SizedBox(height: layout.s4),
                ],
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebhookProfile(BuildContext context) {
    final Message? message = widget.message;
    if (message == null) {
      return const SizedBox.shrink();
    }
    final GuildUserDisplay display = resolveMessageAuthorDisplay(
      message: message,
      guildId: widget.guildId,
    );
    const AsyncValue<db.User?> emptyPresence = AsyncValue<db.User?>.data(null);
    return _buildLoadedView(
      isWebhook: true,
      userId: message.authorId,
      username: message.authorName,
      discriminator: '',
      displayName: display.displayName,
      avatarUrl: display.avatarUrl,
      avatarColor: display.avatarColor,
      bannerColor:
          display.bannerColor ??
          resolveGuildProfileBannerColor(
            bannerColor: null,
            accentColor: null,
            avatarColor: display.avatarColor,
          ),
      bannerUrl: display.bannerUrl,
      bio: display.bio,
      accountMemberSince: dateTimeFromUserSnowflakeOrNull(message.authorId),
      guildMemberSince: null,
      guildName: null,
      guildIconUrl: null,
      memberRoles: const <MemberRole>[],
      flags: 0,
      hasPlutonium: false,
      isLifetimePlutonium: false,
      premiumSince: null,
      premiumLifetimeSequence: null,
      mutualFriends: const <UserPartialResponse>[],
      mutualCommunities: const <UserProfileFullResponseMutualGuilds>[],
      actionUser: null,
      connections: const <ConnectionResponse>[],
      relationship: null,
      pronouns: display.pronouns,
      customStatus: null,
      presenceAsync: emptyPresence,
      note: null,
      isCurrentUser: false,
      hasGuildProfile: false,
      isShowingGlobalProfile: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isWebhook) {
      return _buildWebhookProfile(context);
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<Friend?> relationshipAsync = ref.watch(
      userRelationshipProvider(userId: widget.userId),
    );
    final AsyncValue<db.User?> presenceAsync = ref.watch(
      userPresenceProvider(widget.userId),
    );
    final AsyncValue<String?> noteAsync = ref.watch(
      userNoteViewModelProvider(userId: widget.userId),
    );
    final String ownUserId = ref.watch(userSettingsViewModelProvider).userId;
    final UserSettingsViewState settingsState = ref.watch(
      userSettingsViewModelProvider,
    );
    _maybeAutoFocusNote(noteAsync);
    if (widget.useCurrentUserCache) {
      final AsyncValue<List<ConnectionResponse>> connectionsAsync = ref.watch(
        currentUserProfileConnectionsProvider,
      );
      final AsyncValue<int?> timezoneOffsetAsync = ref.watch(
        currentUserProfileTimezoneOffsetProvider,
      );
      final AsyncValue<CurrentUserCachedProfile?> cachedAsync = ref.watch(
        currentUserCachedProfileProvider,
      );
      return cachedAsync.when(
        loading: () => UserProfileLoadingSkeleton(
          scrollController: widget.scrollController,
          showTopHandle: widget.showTopHandle,
        ),
        error: (_, _) => _ErrorState(
          onRetry: () => ref.invalidate(currentUserCachedProfileProvider),
          message: l10n.userProfileLoadError,
          onClose: widget.onCloseRequested,
        ),
        data: (CurrentUserCachedProfile? profile) {
          if (profile == null) {
            return _ErrorState(
              onRetry: () => ref.invalidate(currentUserCachedProfileProvider),
              message: l10n.userProfileLoadError,
              onClose: widget.onCloseRequested,
            );
          }
          return _buildLoadedView(
            userId: profile.id,
            username: profile.username,
            discriminator: profile.discriminator,
            displayName: profile.globalName ?? profile.username,
            avatarUrl: FluxerMediaUrl.userAvatar(
              userId: profile.id,
              hash: profile.avatar,
              size: MediaProxySizes.avatarProfile,
              animated: true,
            ),
            avatarColor: profile.avatarColor,
            bannerColor: resolveGuildProfileBannerColor(
              bannerColor: null,
              accentColor: profile.accentColor,
              avatarColor: profile.avatarColor,
            ),
            bannerUrl: FluxerMediaUrl.userBanner(
              userId: profile.id,
              hash: profile.banner,
              animated: true,
            ),
            bio: profile.bio,
            accountMemberSince: dateTimeFromUserSnowflakeOrNull(profile.id),
            guildMemberSince: null,
            guildName: null,
            guildIconUrl: null,
            memberRoles: const <MemberRole>[],
            flags: profile.publicFlags,
            hasPlutonium:
                settingsState.isPremium &&
                !settingsState.effectivePremiumBadgeHidden,
            isLifetimePlutonium: settingsState.hasLifetimePremium,
            premiumSince: settingsState.premiumSince,
            premiumLifetimeSequence:
                settingsState.hasLifetimePremium &&
                    !settingsState.effectivePremiumBadgeMasked &&
                    !settingsState.effectivePremiumBadgeSequenceHidden
                ? settingsState.premiumLifetimeSequence
                : null,
            mutualFriends: const <UserPartialResponse>[],
            mutualCommunities: const <UserProfileFullResponseMutualGuilds>[],
            actionUser: null,
            connections: connectionsAsync.value ?? const <ConnectionResponse>[],
            relationship: relationshipAsync.value,
            pronouns: profile.pronouns,
            customStatus: presenceAsync.value?.customStatus,
            presenceAsync: presenceAsync,
            note: noteAsync.value,
            isCurrentUser: ownUserId == profile.id,
            hasGuildProfile: false,
            isShowingGlobalProfile: false,
            timezoneOffset: timezoneOffsetAsync.value,
          );
        },
      );
    }
    final AsyncValue<UserProfileFullResponse?> profileAsync = ref.watch(
      userProfileProvider(userId: widget.userId, guildId: widget.guildId),
    );
    return profileAsync.when(
      loading: () => UserProfileLoadingSkeleton(
        scrollController: widget.scrollController,
        showTopHandle: widget.showTopHandle,
      ),
      error: (_, _) => _ErrorState(
        onRetry: () => ref.invalidate(
          userProfileProvider(userId: widget.userId, guildId: widget.guildId),
        ),
        message: l10n.userProfileLoadError,
        onClose: widget.onCloseRequested,
      ),
      data: (UserProfileFullResponse? response) {
        if (response == null) {
          return _ErrorState(
            onRetry: () => ref.invalidate(
              userProfileProvider(
                userId: widget.userId,
                guildId: widget.guildId,
              ),
            ),
            message: l10n.userProfileLoadError,
            onClose: widget.onCloseRequested,
          );
        }
        final String? guildId = widget.guildId;
        final List<String> guildRoleIds =
            response.guildMember?.roles ?? const <String>[];
        final AsyncValue<db.Server?> guildInfoAsync = guildId == null
            ? const AsyncValue<db.Server?>.data(null)
            : ref.watch(userProfileGuildInfoProvider(guildId));
        final db.Server? guildInfo = guildInfoAsync.value;
        final AsyncValue<List<MemberRole>> allGuildRolesAsync = guildId == null
            ? const AsyncValue<List<MemberRole>>.data(<MemberRole>[])
            : ref.watch(userProfileGuildRolesProvider(guildId));
        final List<MemberRole> allGuildRoles =
            allGuildRolesAsync.value ?? const <MemberRole>[];
        final Map<String, MemberRole> roleById = <String, MemberRole>{
          for (final MemberRole role in allGuildRoles) role.id: role,
        };
        final List<MemberRole> memberRoles = resolveMemberRolesFromIds(
          roleIds: guildRoleIds,
          roleById: roleById,
        );
        final bool isCurrentProfile = ownUserId == response.user.id;
        final DateTime? guildMemberTimeoutUntil =
            response.guildMember?.communicationDisabledUntil;
        ProfileMenuCapabilities menuCaps = ProfileMenuCapabilities.none;
        bool canManageRoles = false;
        bool isGuildOwner = false;
        MemberRole? viewerHighestRole;
        final Set<String> memberRoleIdSet = guildRoleIds.toSet();
        if (guildId != null) {
          final String? ownerId = guildInfo?.ownerId;
          final int everyonePermissions = roleById[guildId]?.permissions ?? 0;
          isGuildOwner = ownerId != null && ownerId == ownUserId;

          final AsyncValue<CurrentUserMemberIdentity?> viewerIdentityAsync = ref
              .watch(currentUserMemberIdentityProvider(guildId));
          final String? viewerRoleIdsJson =
              viewerIdentityAsync.value?.roleIdsJson;
          final List<String> viewerRoleIds =
              (viewerRoleIdsJson != null && viewerRoleIdsJson.isNotEmpty)
              ? List<String>.from(
                  jsonDecode(viewerRoleIdsJson) as List<dynamic>,
                )
              : <String>[];
          final List<MemberRole> viewerRoles = viewerRoleIds
              .where((String id) => id != guildId)
              .map((String id) => roleById[id])
              .whereType<MemberRole>()
              .toList(growable: false);
          viewerHighestRole = highestRole(viewerRoles);

          final int viewerPermissions = resolveGuildPermissions(
            guildOwnerId: ownerId ?? '',
            currentUserId: ownUserId,
            everyonePermissions: everyonePermissions,
            memberRoles: viewerRoles,
          );
          canManageRoles = hasPermission(
            viewerPermissions,
            Permission.manageRoles,
          );

          final List<MemberRole> targetHierarchyRoles = memberRoles
              .where((MemberRole role) => role.id != guildId)
              .toList(growable: false);
          final int targetPermissions = resolveGuildPermissions(
            guildOwnerId: ownerId ?? '',
            currentUserId: response.user.id,
            everyonePermissions: everyonePermissions,
            memberRoles: targetHierarchyRoles,
          );

          menuCaps = resolveProfileMenuCapabilities(
            isCurrentUser: isCurrentProfile,
            hasGuildMember: response.guildMember != null,
            targetIsTimedOut:
                guildMemberTimeoutUntil != null &&
                guildMemberTimeoutUntil.isAfter(DateTime.now()),
            targetIsBot: response.user.bot ?? false,
            viewerIsOwner: isGuildOwner,
            viewerPermissions: viewerPermissions,
            canManageTarget: canManageTarget(
              currentUserId: ownUserId,
              ownerId: ownerId,
              viewerHighest: viewerHighestRole,
              targetHighest: highestRole(targetHierarchyRoles),
              targetIsOwner: ownerId != null && ownerId == response.user.id,
            ),
            targetHasAdministrator: hasPermission(
              targetPermissions,
              Permission.administrator,
            ),
            hasAssignableRoles: guildHasAssignableRoles(
              guildId: guildId,
              allGuildRoles: allGuildRoles,
            ),
          );
        }
        final GuildUserDisplay profileDisplay =
            resolveGuildUserDisplayFromProfile(
              response: response,
              guildId: guildId,
              friendNickname: relationshipAsync.value?.nickname,
              showGlobalProfile: _showGlobalProfile,
            );
        return _buildLoadedView(
          userId: response.user.id,
          username: response.user.username,
          discriminator: response.user.discriminator,
          displayName: profileDisplay.displayName,
          avatarUrl: profileDisplay.avatarUrl,
          avatarColor: response.user.avatarColor,
          bannerColor:
              profileDisplay.bannerColor ??
              resolveGuildProfileBannerColor(
                bannerColor: null,
                accentColor: response.userProfile.accentColor,
                avatarColor: response.user.avatarColor,
              ),
          bannerUrl: profileDisplay.bannerUrl,
          bio: profileDisplay.bio,
          accountMemberSince: dateTimeFromUserSnowflakeOrNull(response.user.id),
          guildMemberSince: response.guildMember?.joinedAt,
          guildName: guildInfo?.name,
          guildIconUrl: guildInfo == null
              ? null
              : FluxerMediaUrl.guildIcon(
                  guildId: guildInfo.id,
                  hash: guildInfo.icon,
                ),
          memberRoles: memberRoles,
          flags: response.user.flags,
          isBot: response.user.bot ?? false,
          isSystem: response.user.system ?? false,
          hasPlutonium:
              response.premiumType != null &&
              response.premiumType != UserPremiumTypes.none,
          isLifetimePlutonium:
              response.premiumType == UserPremiumTypes.lifetime,
          premiumSince: response.premiumSince,
          premiumLifetimeSequence:
              response.premiumType == UserPremiumTypes.lifetime
              ? response.premiumLifetimeSequence
              : null,
          mutualFriends: isCurrentProfile
              ? const <UserPartialResponse>[]
              : response.mutualFriends ?? const <UserPartialResponse>[],
          mutualCommunities: isCurrentProfile
              ? const <UserProfileFullResponseMutualGuilds>[]
              : response.mutualGuilds ??
                    const <UserProfileFullResponseMutualGuilds>[],
          actionUser: response.user,
          connections:
              response.connectedAccounts ?? const <ConnectionResponse>[],
          relationship: relationshipAsync.value,
          pronouns: profileDisplay.pronouns,
          customStatus: presenceAsync.value?.customStatus,
          presenceAsync: presenceAsync,
          note: noteAsync.value,
          isCurrentUser: isCurrentProfile,
          hasGuildProfile: profileDisplay.hasGuildProfile,
          isShowingGlobalProfile: profileDisplay.isShowingGlobalProfile,
          menuCaps: menuCaps,
          guildMemberNick: response.guildMember?.nick,
          guildMemberTimeoutUntil: guildMemberTimeoutUntil,
          profileGuildId: guildId,
          memberRoleIds: memberRoleIdSet,
          allGuildRoles: allGuildRoles,
          canManageRoles: canManageRoles,
          isGuildOwner: isGuildOwner,
          viewerHighestRole: viewerHighestRole,
          canCall: canCallUser(
            isBot: response.user.bot ?? false,
            isSystem: response.user.system ?? false,
          ),
          timezoneOffset: response.timezoneOffset,
        );
      },
    );
  }
}

class _ProfileIdentityAvatar extends StatelessWidget {
  const _ProfileIdentityAvatar({
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.avatarColor,
    required this.showStatus,
    this.onTap,
  });

  final String userId;
  final String displayName;
  final String? avatarUrl;
  final int? avatarColor;
  final bool showStatus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Widget avatar = Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.backgroundPrimary,
      ),
      child: FluxerAvatar.userPresence(
        fallbackText: displayName,
        userId: userId,
        imageUrl: avatarUrl,
        avatarColor: avatarColor,
        showStatus: showStatus,
        size: _kAvatarSize,
      ),
    );
    if (onTap == null) {
      return avatar;
    }
    return FluxerTappable(
      onTap: onTap,
      builder: (BuildContext context, Set<WidgetState> states) => avatar,
    );
  }
}

class _MoreButton extends StatefulWidget {
  const _MoreButton({required this.onTap});
  final ValueChanged<Offset> onTap;
  @override
  State<_MoreButton> createState() => _MoreButtonState();
}

class _MoreButtonState extends State<_MoreButton> {
  final GlobalKey _key = GlobalKey();
  void _emit() {
    final RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    final Offset position = renderBox.localToGlobal(
      Offset(0, renderBox.size.height),
    );
    widget.onTap(position);
  }

  @override
  Widget build(BuildContext context) {
    return FluxerButton.circleAlt(
      key: _key,
      onPressed: _emit,
      icon: PhosphorIconsBold.dotsThree,
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({
    required this.onRetry,
    required this.message,
    this.onClose,
  });
  final VoidCallback onRetry;
  final String message;
  final VoidCallback? onClose;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PhosphorIcon(
                PhosphorIconsFill.prohibit,
                size: 48,
                color: colors.textPrimaryMuted,
              ),
              SizedBox(height: layout.s3),
              Text(
                message,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: layout.s4),
              FluxerButton.primary(
                label: l10n.userProfileRetry,
                onPressed: onRetry,
              ),
            ],
          ),
        ),
        if (onClose != null)
          Positioned(
            top: layout.s2,
            right: layout.s2,
            child: FluxerButton.circleAlt(
              onPressed: onClose,
              icon: PhosphorIconsBold.x,
            ),
          ),
      ],
    );
  }
}
