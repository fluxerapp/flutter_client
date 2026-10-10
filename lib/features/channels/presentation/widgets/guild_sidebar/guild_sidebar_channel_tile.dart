part of 'guild_sidebar.dart';

class _ChannelTile extends ConsumerWidget {
  const _ChannelTile({
    required this.channel,
    required this.guildId,
    required this.guild,
    this.tileKey,
    super.key,
  });

  final Channel channel;
  final String guildId;
  final Guild guild;
  final GlobalKey? tileKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSelected = ref.watch(
      activeChannelIdProvider.select((String? id) => id == channel.id),
    );
    final unread = ref.watch(channelUnreadProvider(channel.id)).value;
    final bool hasUnread = unread?.hasUnread ?? false;
    final int mentionCount = unread?.mentionCount ?? 0;
    final bool hasUnreadMessages = unread?.hasUnreadMessages ?? false;
    final bool isChannelDirectlyMuted = ref.watch(
      mutedChannelIdsProvider(
        guildId,
      ).select((a) => (a.value ?? const <String>{}).contains(channel.id)),
    );
    final bool showFadedUnread = ref.watch(
      appearancePreferencesProvider.select(
        (s) => s.showFadedUnreadOnMutedChannels,
      ),
    );
    final channelUnreadState = getChannelUnreadState(
      unreadCount: hasUnreadMessages ? 1 : 0,
      mentionCount: mentionCount,
      isMuted: isChannelDirectlyMuted,
      showFadedUnreadOnMutedChannels: showFadedUnread,
      unreadBadgesLevel: unread?.unreadBadgesLevel,
    );
    final int? cachedPermissionBits = ref.watch(
      channelPermissionCacheProvider.select(
        (ChannelPermissionCaches caches) => caches[channel.id],
      ),
    );
    final int? connectPermissionBits =
        cachedPermissionBits ??
        ref.watch(channelSidebarIconConnectBitsProvider(channel.id)).value;
    final int? effectivePermissionBits = cachedPermissionBits;

    final bool isVoice = channel.type == ChannelType.guildVoice;
    final String? connectedVoiceGuildId = isVoice
        ? ref.watch(
            voiceSessionProvider.select((VoiceSessionState s) => s.guildId),
          )
        : null;
    final String? connectedVoiceChannelId = isVoice
        ? ref.watch(
            voiceSessionProvider.select((VoiceSessionState s) => s.channelId),
          )
        : null;
    final bool showE2eeVoiceIcon =
        isVoice &&
        guild.hasVoiceE2ee &&
        ref.watch(
          voiceStatesMapProvider.select(
            (Map<String, VoiceState> map) => isVoiceChannelE2eeEncryptedForIcon(
              voiceStates: map,
              guildId: guildId,
              channelId: channel.id,
              connectedVoiceGuildId: connectedVoiceGuildId,
              connectedVoiceChannelId: connectedVoiceChannelId,
              guildHasVoiceE2ee: guild.hasVoiceE2ee,
            ),
          ),
        );

    final double rowOpacity = isChannelDirectlyMuted && !isSelected ? 0.5 : 1.0;
    final Color baseTextColor = isSelected
        ? context.colors.textPrimary
        : channelUnreadState.isHighlight
        ? context.colors.textSecondary
        : context.colors.textTertiaryMuted;
    final Color textColor = rowOpacity < 1
        ? baseTextColor.withValues(alpha: baseTextColor.a * rowOpacity)
        : baseTextColor;
    final bool showUnreadOnSelectedChannel = isMobileLayout(context);
    final bool showUnreadIndicator =
        channelUnreadState.shouldShowUnreadIndicator &&
        (showUnreadOnSelectedChannel || !isSelected);
    final bool showMentionBadge =
        mentionCount > 0 &&
        channelUnreadState.hasMentions &&
        (showUnreadOnSelectedChannel || !isSelected);

    final int voiceUserLimit = channel.userLimit ?? 0;
    final bool showVoiceUserCount =
        isVoice && voiceUserLimit > 0 && !isSelected && mentionCount == 0;
    final int voiceCurrentCount = showVoiceUserCount
        ? ref.watch(
            voiceChannelMemberCountProvider(
              voiceChannelParticipantsFamilyKey(guildId, channel.id),
            ),
          )
        : 0;

    return Stack(
      key: tileKey,
      clipBehavior: Clip.none,
      children: [
        if (showUnreadIndicator)
          ChannelUnreadIndicator.positioned(
            faded: channelUnreadState.isUnreadIndicatorMuted,
          ),
        FluxerSelectableRow(
          isSelected: isSelected,
          selectedColor: context.colors.backgroundModifierSelected,
          borderRadius: BorderRadius.circular(4),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          semanticLabel: navigationItemSemanticLabel(
            l10n: FluxerLocalizations.of(context),
            name: channel.name,
            isSelected: isSelected,
            hasUnread: showUnreadIndicator,
            mentionCount: showMentionBadge ? mentionCount : 0,
            isMuted: isChannelDirectlyMuted,
          ),
          onSecondaryTapUp: (details) => unawaited(
            _showChannelActions(
              context,
              ref,
              hasUnread: hasUnread,
              position: details.globalPosition,
            ),
          ),
          onLongPress: isTouchPrimaryInput(ref)
              ? () => unawaited(
                  _showChannelActions(
                    context,
                    ref,
                    hasUnread: hasUnread,
                    position: contextMenuPositionAtCenter(context),
                  ),
                )
              : null,
          onTap: () async {
            await navigateToGuildChannelContent(
              context: context,
              ref: ref,
              guildId: guildId,
              channel: channel,
              effectivePermissionBits: effectivePermissionBits,
            );
          },
          child: Row(
            children: [
              ChannelIcon(
                type: channel.type,
                channel: channel,
                effectivePermissionBits: connectPermissionBits,
                canConnectPermissionBits: connectPermissionBits,
                color: textColor,
                e2eeEncrypted: showE2eeVoiceIcon,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  channel.name,
                  style: context.textStyles.channelName.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ChannelListTypingIndicator(
                channelId: channel.id,
                guildId: guildId,
                isSelected: isSelected,
              ),
              if (showMentionBadge) ...[
                const SizedBox(width: 4),
                FluxerBadge.count(count: mentionCount),
              ],
              if (showVoiceUserCount) ...[
                const SizedBox(width: 4),
                VoiceChannelUserCount(
                  currentUserCount: voiceCurrentCount,
                  userLimit: voiceUserLimit,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

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
      channelPermissionCacheProvider,
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
    final String? mutedHint = isMuted ? formatMutedHintText(muteConfig) : null;
    final bool developerMode = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final bool nsfwAllowed = ref.read(sensitiveContentProvider).nsfwAllowed;
    final bool hasAgreedToMatureContent = ref
        .read(matureContentAgreementsProvider)
        .agreedChannelIds
        .contains(channel.id);
    final Channel? parentCategory = await _loadParentCategory(ref, channel);
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
      nsfwAllowed: nsfwAllowed,
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
        ref.read(guildPermissionsProvider),
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
    );
    final List<ChannelMenuGroup> groups = buildChannelMenuGroups(
      l10n: l10n,
      state: menuState,
    );
    if (isMobileLayout(context)) {
      return FluxerBottomSheet.showScrollable<void>(
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
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => channelMenuGroupsToWidgets(
        context: menuContext,
        groups: groups,
        menuState: menuState,
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
          showChannelNotificationSettingsSheet(
            menuContext,
            channel: channel,
            onSetNotification: (setting) async {
              await ref
                  .read(guildUserSettingsRepositoryProvider)
                  .updateChannelOverride(
                    guildId: channel.guildId,
                    channelId: channel.id,
                    messageNotifications: setting,
                  );
              ref
                  .read(toastProvider.notifier)
                  .show(
                    const FluxerToast(
                      message: 'Notification settings updated',
                      variant: FluxerToastVariant.success,
                    ),
                  );
            },
          ),
        );
      case ChannelMenuAction.editChannel:
        close();
        unawaited(ChannelSettingsFlow.show(menuContext, channelId: channel.id));
      case ChannelMenuAction.duplicateChannel:
        close();
        _showComingSoon(menuContext, ref);
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
    }
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

  void _showComingSoon(BuildContext context, WidgetRef ref) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: FluxerLocalizations.of(context).comingSoon));
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

  Future<void> _confirmDeleteChannel(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await FluxerConfirmSheet.show(
      context,
      title: 'Delete Channel',
      description:
          'Are you sure you want to delete #${channel.name}? '
          'This action cannot be undone.',
      confirmLabel: 'Delete Channel',
      isDanger: true,
      onConfirm: () => unawaited(_deleteChannel(ref)),
    );
  }

  Future<void> _deleteChannel(WidgetRef ref) async {
    final toast = ref.read(toastProvider.notifier);
    try {
      await ref
          .read(fluxerClientProvider)
          .channels
          .deleteChannel(
            channelId: channel.id,
            body: const SudoVerificationSchema(),
          );
      toast.show(
        const FluxerToast(
          message: 'Channel deleted',
          variant: FluxerToastVariant.success,
        ),
      );
    } on Object {
      toast.show(
        const FluxerToast(
          message: 'Failed to delete channel',
          variant: FluxerToastVariant.danger,
        ),
      );
    }
  }

  Future<void> _openChannelMuteSheet(
    BuildContext context,
    WidgetRef ref, {
    required VoidCallback close,
    required bool isMuted,
  }) async {
    final String resolvedGuildId = guildId.isNotEmpty
        ? guildId
        : channel.guildId;
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
    close();
    await repository.updateChannelOverride(
      guildId: resolvedGuildId,
      channelId: channel.id,
      muted: true,
      durationSeconds: selection.durationSeconds,
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
