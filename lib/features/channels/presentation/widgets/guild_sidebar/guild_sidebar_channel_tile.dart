part of 'guild_sidebar.dart';

class _ChannelTile extends ConsumerWidget {
  const _ChannelTile({
    required this.channel,
    required this.guildId,
    required this.guild,
    this.tileKey,
    super.key,
  });

  static const double _kDragSourceOpacity = 0.3;
  static const double _kVoiceDragDimOpacity = 0.6;

  final Channel channel;
  final String guildId;
  final Guild guild;
  final GlobalKey? tileKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSelected = ref.watch(
      activeChannelIdProvider.select((String? id) => id == channel.id),
    );
    final unread = ref.watch(channelUnreadOrLastKnownProvider(channel.id));
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
      channelPermissionCacheProvider(
        watchAccountUserId(ref),
      ).select((ChannelPermissionCaches caches) => caches[channel.id]),
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
          voiceStatesMapProvider(watchAccountUserId(ref)).select(
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

    final bool desktopPointer = usesDesktopPointerUi(context);
    final bool voiceJoinRequiresDoubleClick =
        isVoice &&
        desktopPointer &&
        ref.watch(
          advancedPreferencesProvider.select(
            (AdvancedPreferencesState state) =>
                state.voiceChannelJoinRequiresDoubleClick,
          ),
        );
    final bool joinsVoiceOnDoubleClick =
        voiceJoinRequiresDoubleClick &&
        !(connectedVoiceGuildId == guildId &&
            connectedVoiceChannelId == channel.id);
    final double rowOpacity = isChannelDirectlyMuted && !isSelected ? 0.5 : 1.0;
    Color faded(Color color) =>
        rowOpacity < 1 ? color.withValues(alpha: color.a * rowOpacity) : color;
    final Color baseTextColor = isSelected || channelUnreadState.isHighlight
        ? context.colors.textPrimary
        : context.colors.textTertiaryMuted;
    final Color textColor = faded(baseTextColor);
    final Color desktopIconColor = faded(
      _desktopSidebarRowTextColor(
        context,
        selected: isSelected,
        unread: channelUnreadState.isHighlight,
      ),
    );
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

    final Object? activeDrag = desktopPointer
        ? SidebarDragScope.activeItemOf(context)
        : null;
    bool hasChannelPermission(Permission permission) =>
        effectivePermissionBits != null &&
        hasPermission(effectivePermissionBits, permission);
    final bool canManageChannels = hasChannelPermission(
      Permission.manageChannels,
    );
    final bool isDragSource =
        activeDrag is ChannelReorderDragItem && activeDrag.id == channel.id;
    final ChannelInviteCapability inviteCapability = desktopPointer
        ? resolveChannelInviteCapability(
            permissionBits: effectivePermissionBits,
            channel: channel,
            guildId: guildId,
            vanityUrlCode: guild.vanityUrlCode,
          )
        : const ChannelInviteCapability(canInvite: false);
    final bool showOpenChatAction =
        desktopPointer && isVoice && !voiceJoinRequiresDoubleClick;
    final bool showEditAction =
        desktopPointer &&
        (canManageChannels ||
            (isVoice && hasChannelPermission(Permission.updateRtcRegion)));
    final bool hasRowActions =
        activeDrag == null &&
        (showOpenChatAction || inviteCapability.canInvite || showEditAction);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool dimForVoiceDrag =
        activeDrag is ChannelReorderDragItem &&
        activeDrag.channelType == ChannelType.guildVoice.wireValue &&
        !isVoice &&
        channel.parentId != null &&
        !isSelected;

    Widget buildTile({required bool isOver}) => Stack(
      key: tileKey,
      clipBehavior: Clip.none,
      children: [
        if (showUnreadIndicator)
          ChannelUnreadIndicator.positioned(
            faded: channelUnreadState.isUnreadIndicatorMuted,
          ),
        FluxerSelectableRow(
          isSelected: isSelected,
          isActive: isOver,
          selectedColor: context.colors.backgroundModifierSelected,
          borderRadius: context.layout.radiusLg,
          margin: EdgeInsets.symmetric(
            horizontal: context.layout.s2,
            vertical: 1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
          desktopSidebar: desktopPointer,
          desktopMargin: const EdgeInsetsDirectional.only(
            start: 8,
            end: 8,
            top: 1,
          ),
          semanticLabel: navigationItemSemanticLabel(
            l10n: l10n,
            name: channel.name,
            isSelected: isSelected,
            hasUnread: showUnreadIndicator,
            mentionCount: showMentionBadge ? mentionCount : 0,
            isMuted: isChannelDirectlyMuted,
          ),
          onContextMenuRequested: (details) => _showChannelActions(
            context,
            ref,
            hasUnread: hasUnread,
            position: details.globalPosition,
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
          onDoubleTap: joinsVoiceOnDoubleClick
              ? () => unawaited(
                  joinGuildVoiceChannelFromList(
                    context: context,
                    ref: ref,
                    guildId: guildId,
                    channel: channel,
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
          childBuilder: (BuildContext context, Set<WidgetState> states) {
            final bool hoverActive =
                desktopPointer &&
                (isSelected ||
                    states.contains(WidgetState.hovered) ||
                    states.contains(WidgetState.focused));
            final bool showRowActions = hasRowActions && hoverActive;
            final bool hideMentionBadge =
                desktopPointer && (hoverActive || activeDrag != null);
            return Row(
              children: [
                ChannelIcon(
                  type: channel.type,
                  channel: channel,
                  effectivePermissionBits: connectPermissionBits,
                  canConnectPermissionBits: connectPermissionBits,
                  color: desktopPointer ? desktopIconColor : textColor,
                  e2eeEncrypted: showE2eeVoiceIcon,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    channel.name,
                    style: context.textStyles.channelName.copyWith(
                      color: !desktopPointer
                          ? textColor
                          : faded(
                              _desktopSidebarRowTextColor(
                                context,
                                hovered: states.contains(WidgetState.hovered),
                                selected: isSelected,
                                unread: channelUnreadState.isHighlight,
                              ),
                            ),
                      fontWeight:
                          channelUnreadState.isHighlight &&
                              !isSelected &&
                              !desktopPointer
                          ? FontWeight.w600
                          : FontWeight.w500,
                      height: 20 / 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ChannelListTypingIndicator(
                  channelId: channel.id,
                  guildId: guildId,
                  isSelected: isSelected,
                ),
                if (showMentionBadge && !hideMentionBadge) ...[
                  const SizedBox(width: 4),
                  FluxerBadgeEntrance(
                    child: FluxerBadge.count(count: mentionCount),
                  ),
                ],
                if (showVoiceUserCount &&
                    activeDrag == null &&
                    !showRowActions) ...[
                  const SizedBox(width: 4),
                  VoiceChannelUserCount(
                    currentUserCount: voiceCurrentCount,
                    userLimit: voiceUserLimit,
                  ),
                ],
                if (showRowActions) ...[
                  if (showOpenChatAction) ...[
                    const SizedBox(width: 4),
                    _SidebarRowAction(
                      icon: PhosphorIconsFill.chatTeardrop,
                      label: l10n.channelMenuOpenChat,
                      selected: isSelected,
                      onPressed: () =>
                          unawaited(_openVoiceChannelChat(context, ref)),
                    ),
                  ],
                  if (inviteCapability.canInvite) ...[
                    const SizedBox(width: 4),
                    _SidebarRowAction(
                      icon: PhosphorIconsFill.userPlus,
                      label: l10n.guildMenuInviteMembers,
                      selected: isSelected,
                      onPressed: () => unawaited(
                        showChannelInviteModal(
                          context,
                          ref,
                          channelId: channel.id,
                          channelName: channel.name,
                          guildId: guildId,
                          useVanityUrl: inviteCapability.useVanityUrl,
                          vanityUrlCode: inviteCapability.vanityUrlCode,
                        ),
                      ),
                    ),
                  ],
                  if (showEditAction) ...[
                    const SizedBox(width: 4),
                    _SidebarRowAction(
                      icon: PhosphorIconsFill.gear,
                      label: l10n.channelDetailsChannelSettingsTitle,
                      selected: isSelected,
                      onPressed: () => unawaited(
                        ChannelSettingsFlow.show(
                          context,
                          channelId: channel.id,
                        ),
                      ),
                    ),
                  ],
                ],
              ],
            );
          },
        ),
      ],
    );

    if (!desktopPointer) {
      return buildTile(isOver: false);
    }
    return SidebarChannelDropTarget(
      target: ChannelReorderTarget(
        id: channel.id,
        channelType: channel.typeWire,
        parentId: channel.parentId,
      ),
      onChannelDrop:
          (ChannelReorderDragItem item, ChannelReorderDropResult result) =>
              unawaited(
                moveChannelFromSidebarDrop(
                  ref,
                  guildId: guildId,
                  item: item,
                  result: result,
                ),
              ),
      onParticipantDrop: isVoice
          ? (VoiceParticipantDragItem item) => unawaited(
              moveVoiceParticipantFromSidebarDrop(
                context,
                ref,
                item: item,
                channel: channel,
              ),
            )
          : null,
      builder: (BuildContext context, bool isOver) =>
          SidebarDraggable<ChannelReorderDragItem>(
            data: ChannelReorderDragItem.fromChannel(channel),
            enabled: canManageChannels,
            child: Opacity(
              opacity: isDragSource
                  ? _kDragSourceOpacity
                  : dimForVoiceDrag
                  ? _kVoiceDragDimOpacity
                  : 1,
              child: buildTile(isOver: isOver),
            ),
          ),
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
