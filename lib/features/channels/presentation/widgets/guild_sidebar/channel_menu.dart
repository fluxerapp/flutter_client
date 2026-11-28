part of 'guild_sidebar.dart';

class _ChannelMenuTarget with _ChannelMenuActions {
  _ChannelMenuTarget({required this.channel, required this.guild});

  @override
  final Channel channel;
  @override
  final Guild guild;

  @override
  String get guildId => channel.guildId;
}

mixin _ChannelMenuActions {
  Channel get channel;
  String get guildId;
  Guild get guild;

  Future<void> _showChannelActions(
    BuildContext context,
    WidgetRef ref, {
    required bool hasUnread,
    required Offset position,
  }) async {
    final l10n = FluxerLocalizations.of(context);
    final bool showFavorites = ref.read(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    final bool isFavorite =
        showFavorites &&
        await ref
            .read(favoriteChannelsRepositoryProvider)
            .isFavorite(channel.id);
    final int? cachedPermissionBits = ref.read(
      channelPermissionCacheProvider(readAccountUserId(ref)),
    )[channel.id];
    final int? permissionBits =
        cachedPermissionBits ??
        await ref.read(
          effectiveGuildChannelPermissionBitsProvider(channel.id).future,
        );
    final Set<String> mutedIds =
        ref.read(mutedChannelIdsProvider(guildId)).value ?? const <String>{};
    final bool isMuted = mutedIds.contains(channel.id);
    final muteConfig = await _loadChannelMuteConfig(ref, guildId, channel.id);
    final String? mutedHint = isMuted
        ? formatMutedHintText(muteConfig, l10n)
        : null;
    final bool developerMode = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final MatureAccess matureAccess = ref.read(sensitiveContentProvider).access;
    final bool hasAgreedToMatureContent = ref
        .read(matureContentAgreementsProvider)
        .agreedChannelIds
        .contains(channel.id);
    final Channel? parentCategory = await _loadParentCategory(ref, channel);
    final int? forumFlags = channel.isThreadOnly
        ? await _loadChannelOverrideFlags(ref)
        : null;
    if (!context.mounted) {
      return;
    }
    final ChannelMenuState menuState = resolveChannelMenuState(
      channel: channel,
      guild: guild,
      parentCategory: parentCategory,
      permissionBits: permissionBits,
      hasUnread: hasUnread,
      showFavorites: showFavorites,
      isFavorite: isFavorite,
      isMuted: isMuted,
      developerMode: developerMode,
      matureAccess: matureAccess,
      hasAgreedToMatureContent: hasAgreedToMatureContent,
      voiceChannelJoinRequiresDoubleClick: ref.read(
        advancedPreferencesProvider.select(
          (state) => state.voiceChannelJoinRequiresDoubleClick,
        ),
      ),
      mutedHint: mutedHint,
      vanityUrlCode: guild.vanityUrlCode,
      canFollow: canOfferAnnouncementFollow(
        channel,
        ref.read(guildPermissionsProvider(readAccountUserId(ref))),
      ),
      canOfferP2pCall:
          ref.read(voiceP2pEnabledProvider) &&
          ref.read(
                voiceChannelModeForProvider(
                  guildId: guildId,
                  channelId: channel.id,
                ),
              ) ==
              VoiceChannelMode.empty,
      forumNewPostsUnread: channel.isThreadOnly
          ? forumNewPostsUnreadEnabled(forumFlags)
          : null,
    );
    final List<ChannelMenuGroup> groups = buildChannelMenuGroups(
      l10n: l10n,
      state: menuState,
    );
    if (!usesDesktopPointerUi(context)) {
      return await FluxerBottomSheet.showScrollable<void>(
        context,
        title: channel.name,
        initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
        minChildSize: 0.25,
        builder: (sheetContext, scrollController, close) {
          return channelMenuGroupsToBottomSheetContent(
            context: sheetContext,
            scrollController: scrollController,
            groups: groups,
            menuState: menuState,
            onAction: (ChannelMenuAction action) => _handleChannelMenuAction(
              action,
              hostContext: context,
              menuContext: sheetContext,
              ref: ref,
              close: close,
              menuState: menuState,
            ),
          );
        },
      );
    }
    return await FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => channelMenuGroupsToWidgets(
        context: menuContext,
        groups: groups,
        menuState: menuState,
        onMuteFor: (int? durationSeconds) => unawaited(
          _muteChannel(ref, close: close, durationSeconds: durationSeconds),
        ),
        onDuplicateSelect: (FluxerKeyModifiers modifiers) {
          close();
          unawaited(
            modifiers.shift
                ? _duplicateChannelImmediately(context, ref)
                : _duplicateChannel(context, ref),
          );
        },
        onAction: (ChannelMenuAction action) => _handleChannelMenuAction(
          action,
          hostContext: context,
          menuContext: menuContext,
          ref: ref,
          close: close,
          menuState: menuState,
        ),
      ),
    );
  }

  Future<int?> _loadChannelOverrideFlags(WidgetRef ref) async {
    final row = await ref
        .read(fluxerDatabaseProvider)
        .userGuildSettingsDao
        .getByGuildId(guildId);
    if (row == null) {
      return null;
    }
    return decodeUserGuildSettings(
      row.data,
    )?.channelOverrides?[channel.id]?.flags;
  }

  Future<Channel?> _loadParentCategory(WidgetRef ref, Channel channel) async {
    final String? parentId = channel.parentId;
    if (parentId == null) {
      return null;
    }
    final row = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(parentId);
    if (row == null) {
      return null;
    }
    final Channel parent = Channel.fromRow(row);
    return parent.isCategory ? parent : null;
  }

  void _handleChannelMenuAction(
    ChannelMenuAction action, {
    required BuildContext hostContext,
    required BuildContext menuContext,
    required WidgetRef ref,
    required VoidCallback close,
    required ChannelMenuState menuState,
  }) {
    switch (action) {
      case ChannelMenuAction.openChat:
        close();
        unawaited(_openVoiceChannelChat(menuContext, ref));
      case ChannelMenuAction.startP2pCall:
        close();
        unawaited(_startP2pCall(hostContext, ref));
      case ChannelMenuAction.markAsRead:
        close();
        unawaited(_readStateRepository(ref).ackLatest(channel.id));
      case ChannelMenuAction.toggleFavorite:
        close();
        unawaited(
          _toggleFavorite(hostContext, ref, isFavorite: menuState.isFavorite),
        );
      case ChannelMenuAction.follow:
        close();
        unawaited(ChannelFollowSheet.show(hostContext, channel: channel));
      case ChannelMenuAction.invitePeople:
        close();
        unawaited(
          showChannelInviteModal(
            hostContext,
            ref,
            channelId: channel.id,
            channelName: channel.name,
            guildId: guildId,
            useVanityUrl: menuState.useVanityInvite,
            vanityUrlCode: menuState.vanityUrlCode,
          ),
        );
      case ChannelMenuAction.openLink:
        close();
        final url = channel.url;
        if (url != null && url.isNotEmpty) {
          unawaited(handleExternalLinkTap(menuContext, url));
        }
      case ChannelMenuAction.copyLink:
        close();
        unawaited(
          copyToClipboard(
            context: menuContext,
            value: channelLink(channel.id, channel.guildId),
          ),
        );
      case ChannelMenuAction.copyRedirectLink:
        close();
        unawaited(copyToClipboard(context: menuContext, value: channel.url!));
      case ChannelMenuAction.mute:
        unawaited(
          _openChannelMuteSheet(
            menuContext,
            ref,
            close: close,
            isMuted: menuState.isMuted,
          ),
        );
      case ChannelMenuAction.notificationSettings:
        close();
        unawaited(
          showChannelNotificationSettingsSheet(menuContext, channel: channel),
        );
      case ChannelMenuAction.editChannel:
        close();
        unawaited(ChannelSettingsFlow.show(menuContext, channelId: channel.id));
      case ChannelMenuAction.moveToCategory:
        close();
        unawaited(
          showMoveChannelToCategorySheet(
            hostContext,
            ref,
            guildId: guildId,
            channelId: channel.id,
          ),
        );
      case ChannelMenuAction.duplicateChannel:
        close();
        unawaited(_duplicateChannel(hostContext, ref));
      case ChannelMenuAction.debugChannel:
        close();
        unawaited(_showDebugChannelSheet(menuContext, ref));
      case ChannelMenuAction.resetMatureContentAgree:
        close();
        unawaited(
          ref
              .read(matureContentAgreementsProvider.notifier)
              .revokeChannelAgreement(channel.id),
        );
      case ChannelMenuAction.copyChannelId:
        close();
        unawaited(copyToClipboard(context: menuContext, value: channel.id));
      case ChannelMenuAction.deleteChannel:
        close();
        unawaited(_confirmDeleteChannel(menuContext, ref));
      case ChannelMenuAction.deleteMyMessages:
        close();
        unawaited(_confirmDeleteMyMessagesInChannel(menuContext, ref));
      case ChannelMenuAction.toggleForumNewPostsUnread:
        close();
        unawaited(_toggleForumNewPostsUnread(ref, menuState: menuState));
    }
  }

  Future<void> _toggleForumNewPostsUnread(
    WidgetRef ref, {
    required ChannelMenuState menuState,
  }) async {
    final bool? current = menuState.forumNewPostsUnread;
    if (current == null) {
      return;
    }
    final int? flags = await _loadChannelOverrideFlags(ref);
    await ref
        .read(guildUserSettingsRepositoryProvider)
        .updateChannelOverride(
          guildId: guildId,
          channelId: channel.id,
          flags: withForumNewPostsUnread(flags, enabled: !current),
        );
  }

  Future<void> _startP2pCall(BuildContext context, WidgetRef ref) async {
    final VoiceP2pStartChoice? choice = await showVoiceP2pStartSheet(
      context,
      allowStandard: false,
    );
    if (choice != VoiceP2pStartChoice.p2p || !context.mounted) {
      return;
    }
    final VoiceJoinResult result = await joinVoiceChannelWithConfirmation(
      ref: ref,
      context: context,
      guildId: guildId,
      channelId: channel.id,
      channel: channel,
      startP2p: true,
    );
    if (result.shouldOpenChannel && context.mounted) {
      navigateToContent(context, RoutePaths.guildChannel(guildId, channel.id));
    }
  }

  Future<void> _openVoiceChannelChat(
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (isMobileLayout(context)) {
      await showVoiceChannelChatSheet(
        context,
        channelId: channel.id,
        channelName: channel.name,
        useRootNavigator: true,
      );
      return;
    }
    navigateToContent(context, RoutePaths.guildChannel(guildId, channel.id));
  }

  Future<void> _duplicateChannelImmediately(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      await ref
          .read(channelRepositoryProvider)
          .createChannel(
            guildId: guildId,
            body: buildDuplicateChannelRequest(channel, name: channel.name),
          );
    } on Object catch (error) {
      await showApiErrorFromRoot(ApiErrorAction.generic, error);
    }
  }

  Future<void> _duplicateChannel(BuildContext context, WidgetRef ref) async {
    final ChannelRepository repository = ref.read(channelRepositoryProvider);
    final Channel? created = await DuplicateChannelSheet.show(
      context,
      channel: channel,
      onCreate: (ChannelCreateRequest request) =>
          repository.createChannel(guildId: guildId, body: request),
    );
    if (created == null || !context.mounted) {
      return;
    }
    if (isAnnouncementConvertibleChannel(created.type)) {
      navigateToContent(context, RoutePaths.guildChannel(guildId, created.id));
    }
  }

  Future<void> _confirmDeleteMyMessagesInChannel(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await confirmAndDeleteMyMessagesInChannel(
      context,
      ref,
      channelId: channel.id,
      isPrivateConversation: false,
    );
  }

  Future<void> _showDebugChannelSheet(BuildContext context, WidgetRef ref) =>
      showChannelDebugSheet(
        context,
        ref: ref,
        channelId: channel.id,
        title: FluxerLocalizations.of(context).dmDebugChannel,
      );

  Future<void> _confirmDeleteChannel(BuildContext context, WidgetRef ref) {
    return DeleteChannelFlow.confirmAndDelete(context, ref, channel: channel);
  }

  Future<void> _openChannelMuteSheet(
    BuildContext context,
    WidgetRef ref, {
    required VoidCallback close,
    required bool isMuted,
  }) async {
    final String resolvedGuildId = _resolvedGuildId;
    if (resolvedGuildId.isEmpty) {
      close();
      return;
    }
    final repository = ref.read(guildUserSettingsRepositoryProvider);
    if (isMuted) {
      close();
      await repository.updateChannelOverride(
        guildId: resolvedGuildId,
        channelId: channel.id,
        muted: false,
      );
      return;
    }
    final l10n = FluxerLocalizations.of(context);
    final selection = await showMuteDurationSheet(
      context,
      muteTitle: l10n.notificationMuteChannel,
      useRootNavigator: isMobileLayout(context),
    );
    if (selection == null) {
      return;
    }
    await _muteChannel(
      ref,
      close: close,
      durationSeconds: selection.durationSeconds,
    );
  }

  String get _resolvedGuildId => guildId.isNotEmpty ? guildId : channel.guildId;

  Future<void> _muteChannel(
    WidgetRef ref, {
    required VoidCallback close,
    required int? durationSeconds,
  }) async {
    final String resolvedGuildId = _resolvedGuildId;
    final repository = ref.read(guildUserSettingsRepositoryProvider);
    close();
    if (resolvedGuildId.isEmpty) {
      return;
    }
    await repository.updateChannelOverride(
      guildId: resolvedGuildId,
      channelId: channel.id,
      muted: true,
      durationSeconds: durationSeconds,
    );
  }

  Future<void> _toggleFavorite(
    BuildContext context,
    WidgetRef ref, {
    required bool isFavorite,
  }) async {
    final repository = ref.read(favoriteChannelsRepositoryProvider);
    if (isFavorite) {
      await repository.removeChannel(channel.id);
    } else {
      await repository.addChannel(
        channelId: channel.id,
        guildId: channel.guildId,
        nickname: channel.name,
      );
    }
    if (!context.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: isFavorite
                ? l10n.favoritesRemovedToast
                : l10n.favoritesAddedToast,
            variant: FluxerToastVariant.success,
          ),
        );
  }
}
