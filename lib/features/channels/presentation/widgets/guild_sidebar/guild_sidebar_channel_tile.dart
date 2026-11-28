part of 'guild_sidebar.dart';

Future<void> showGuildChannelContextMenu(
  BuildContext context,
  WidgetRef ref, {
  required Channel channel,
  required Guild guild,
  required Offset position,
}) {
  final bool hasUnread =
      ref.read(channelUnreadOrLastKnownProvider(channel.id))?.hasUnread ??
      false;
  return _ChannelMenuTarget(
    channel: channel,
    guild: guild,
  )._showChannelActions(context, ref, hasUnread: hasUnread, position: position);
}

class _ChannelTile extends ConsumerWidget with _ChannelMenuActions {
  const _ChannelTile({
    required this.channel,
    required this.guildId,
    required this.guild,
    this.tileKey,
    super.key,
  });

  static const double _kDragSourceOpacity = 0.3;
  static const double _kVoiceDragDimOpacity = 0.6;

  @override
  final Channel channel;
  @override
  final String guildId;
  @override
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
                  child: FluxerTruncatedTooltipText(
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
}
