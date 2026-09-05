part of 'guild_navbar.dart';

class _GuildFolderWidget extends ConsumerStatefulWidget {
  final GuildNavbarFolder folder;
  final String? activeGuildId;
  final int unavailableCount;
  final GlobalKey<_GuildListItemState> Function(String guildId)
  resolveGuildItemKey;

  const _GuildFolderWidget({
    required this.folder,
    required this.activeGuildId,
    required this.unavailableCount,
    required this.resolveGuildItemKey,
    super.key,
  });

  @override
  ConsumerState<_GuildFolderWidget> createState() => _GuildFolderWidgetState();
}

class _GuildFolderWidgetState extends ConsumerState<_GuildFolderWidget> {
  var _isHovered = false;
  var _suppressNextFolderTap = false;
  final GlobalKey _folderMenuAnchorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final folder = widget.folder;
    final isExpanded = ref.watch(
      folderExpandedStateProvider.select((s) => s.contains(folder.id)),
    );
    final DragState dragState = ref.watch(guildDragProvider);
    final bool useLongPressDrag = isTouchPrimaryInput(ref);
    final bool collapseWhileDragging = dragState.shouldCollapseDragSource(
      itemId: folder.id.toString(),
      useLongPressDrag: useLongPressDrag,
    );
    final bool visuallyExpanded = isExpanded && !collapseWhileDragging;

    // Aggregate unread/mention/voice across all guilds in folder.
    var anyUnread = false;
    var totalMentions = 0;
    var folderVoiceActivity = VoiceActivityType.none;
    final guildUnreadReady = ref.watch(guildReadStateReadyProvider);
    for (final guild in folder.guilds) {
      final unread = ref.watch(
        guildReadStateProvider.select((s) => s[guild.id]),
      );
      if (guildUnreadReady &&
          !guild.unavailable &&
          (unread?.hasUnread ?? false)) {
        anyUnread = true;
      }
      if (guildUnreadReady && !guild.unavailable) {
        totalMentions += unread?.mentionCount ?? 0;
      }
      final voiceActivity = ref.watch(guildVoiceActivityProvider(guild.id));
      if (voiceActivity.index > folderVoiceActivity.index) {
        folderVoiceActivity = voiceActivity;
      }
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final folderAccent = folder.color != null && folder.color != 0
        ? Color(folder.color! | 0xFF000000)
        : isDark
        ? context.colors.brandPrimaryLight
        : context.colors.brandPrimary;

    final folderSurface = Color.lerp(
      context.colors.backgroundSecondary,
      folderAccent,
      isDark ? 0.2 : 0.15,
    )!;

    // Stack: background panel behind header + animated guild list.
    // Background spans from header through guild items when expanded.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Background panel (behind everything, spans full height).
          if (visuallyExpanded)
            Positioned.fill(
              child: Center(
                child: Container(
                  width: 48,
                  decoration: BoxDecoration(
                    color: folderSurface,
                    borderRadius: BorderRadius.circular(48 * 0.3),
                  ),
                ),
              ),
            ),
          // Content column: header + animated guild list.
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GuildDragWrapper(
                itemId: folder.id.toString(),
                isFolder: true,
                folderMenuAnchorKey: _folderMenuAnchorKey,
                dragFeedback: GuildFolderDragFeedback(
                  guilds: folder.guilds,
                  folderIcon: folder.icon,
                  showIconWhenCollapsed: folder.showIconWhenCollapsed,
                ),
                onFolderLongPressMenu: (Offset position) async {
                  setState(() => _suppressNextFolderTap = true);
                  await _showFolderContextMenu(
                    context,
                    position,
                    verticallyCenterAtPosition: true,
                  );
                },
                child: _buildFolderButton(
                  context,
                  folderAccent: folderAccent,
                  folderSurface: folderSurface,
                  anyUnread: anyUnread,
                  totalMentions: totalMentions,
                  folderVoiceActivity: folderVoiceActivity,
                  isExpanded: visuallyExpanded,
                  guildUnreadReady: guildUnreadReady,
                ),
              ),
              // Animated expand/collapse of guild items.
              AnimatedSize(
                duration: context.motion.panel,
                curve: const Cubic(0.25, 0.1, 0.25, 1),
                alignment: Alignment.topCenter,
                child: visuallyExpanded
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final guild in folder.guilds)
                              _buildGuildItemInFolder(context, guild),
                          ],
                        ),
                      )
                    : const SizedBox(width: 72),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFolderButton(
    BuildContext context, {
    required Color folderAccent,
    required Color folderSurface,
    required bool anyUnread,
    required int totalMentions,
    required VoiceActivityType folderVoiceActivity,
    required bool isExpanded,
    required bool guildUnreadReady,
  }) {
    final folder = widget.folder;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String folderName = folder.name ?? _derivedFolderName;
    return SizedBox(
      key: _folderMenuAnchorKey,
      width: 72,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (!isExpanded)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: AnimatedContainer(
                  duration: guildUnreadReady
                      ? context.motion.panel
                      : Duration.zero,
                  curve: const Cubic(0.25, 0.1, 0.25, 1),
                  width: 4,
                  height: _isHovered
                      ? 20
                      : anyUnread
                      ? 8
                      : 0,
                  decoration: BoxDecoration(
                    color: context.colors.textPrimary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(999),
                      bottomRight: Radius.circular(999),
                    ),
                  ),
                ),
              ),
            ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _RightTooltip(
                content: _TooltipLabel(
                  label: isExpanded
                      ? l10n.guildNavbarCollapseFolder(folderName)
                      : folderName,
                ),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: Semantics(
                    button: true,
                    expanded: isExpanded,
                    label: isExpanded
                        ? l10n.guildNavbarCollapseFolder(folderName)
                        : folderName,
                    child: FluxerGestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (_suppressNextFolderTap) {
                          _suppressNextFolderTap = false;
                          return;
                        }
                        ref
                            .read(folderExpandedStateProvider.notifier)
                            .toggle(folder.id);
                      },
                      onSecondaryTapUp: (TapUpDetails details) {
                        unawaited(
                          _showFolderContextMenu(
                            context,
                            details.globalPosition,
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: isExpanded
                            ? Center(
                                child: PhosphorIcon(
                                  guildFolderIconForName(folder.icon),
                                  color: context.colors.textPrimary,
                                  size: 24,
                                ),
                              )
                            : Center(
                                child: AnimatedContainer(
                                  duration: context.motion.hover,
                                  curve: Curves.easeOut,
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: folderSurface,
                                    borderRadius: BorderRadius.circular(
                                      48 * 0.3,
                                    ),
                                  ),
                                  child: _buildFolderContent(
                                    context,
                                    folderAccent,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              if (!isExpanded && totalMentions > 0)
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: FluxerBadge.count(
                    count: totalMentions,
                    cutoutColor: context.colors.backgroundSecondary,
                  ),
                ),
              if (!isExpanded && folderVoiceActivity != VoiceActivityType.none)
                Positioned(
                  top: -4,
                  right: -4,
                  child: _VoiceActivityBadge(type: folderVoiceActivity),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFolderContent(BuildContext context, Color folderAccent) {
    final folder = widget.folder;
    if (folder.showIconWhenCollapsed) {
      return Center(
        child: PhosphorIcon(
          guildFolderIconForName(folder.icon ?? 'folder'),
          color: context.colors.textPrimary,
          size: 24,
        ),
      );
    }

    // 2x2 mini guild icon grid.
    final gridGuilds = folder.guilds.take(4).toList();
    return LayoutBuilder(
      builder: (context, constraints) {
        const double gridPadding = 4;
        const double gridGap = 2;
        final double cellSize =
            (constraints.maxWidth - gridPadding * 2 - gridGap) / 2;
        return Padding(
          padding: const EdgeInsets.all(gridPadding),
          child: Wrap(
            spacing: gridGap,
            runSpacing: gridGap,
            children: [
              for (final guild in gridGuilds)
                SizedBox.square(
                  dimension: cellSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(cellSize * 0.3),
                    child: guild.iconUrl != null
                        ? CachedNetworkImage(
                            imageUrl: guild.iconUrl!,
                            fit: BoxFit.cover,
                            memCacheWidth: _guildNavbarIconMemCache(
                              context,
                              cellSize,
                            ),
                            memCacheHeight: _guildNavbarIconMemCache(
                              context,
                              cellSize,
                            ),
                          )
                        : ColoredBox(
                            color: context.colors.serverIconBackground,
                            child: Center(
                              child: Text(
                                abbreviateGuildName(guild.name, maxLength: 2),
                                style: context.textStyles.smallText.copyWith(
                                  fontSize: 8,
                                  color: context.colors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGuildItemInFolder(BuildContext context, Guild guild) {
    return Consumer(
      builder: (context, ref, child) {
        final FluxerLocalizations l10n = FluxerLocalizations.of(context);
        final unread = ref.watch(
          guildReadStateProvider.select((s) => s[guild.id]),
        );
        final guildUnreadReady = ref.watch(guildReadStateReadyProvider);
        final muteState = ref.watch(guildMuteProvider(guild.id)).value;
        final voiceActivity = ref.watch(guildVoiceActivityProvider(guild.id));
        final permissions = ref.watch(
          guildPermissionsProvider.select((s) => s[guild.id] ?? 0),
        );
        final invitesPaused =
            guild.features.contains('INVITES_DISABLED') &&
            hasPermission(permissions, Permission.manageGuild);
        final currentUserId = ref.watch(currentUserIdProvider);
        final developerMode = ref.watch(
          userSettingsViewModelProvider.select((s) => s.developerMode),
        );
        final GlobalKey<_GuildListItemState> itemKey = widget
            .resolveGuildItemKey(guild.id);
        final bool hasUnread =
            !guild.unavailable && (unread?.hasUnread ?? false);
        return GuildDragWrapper(
          itemId: guild.id,
          isFolder: false,
          allowCombine: false,
          dragFeedback: GuildDragFeedback(
            label: guild.name,
            iconUrl: guild.iconUrl,
            isUnavailable: guild.unavailable,
          ),
          peekMenu: buildGuildPeekMenuConfig(
            context,
            guild: guild,
            hasUnread: hasUnread,
            onAction:
                (BuildContext actionContext, GuildIconPeekAction action) async {
                  await itemKey.currentState?.handlePeekAction(
                    actionContext,
                    action,
                  );
                },
          ),
          child: _GuildListItem(
            key: itemKey,
            label: guild.name,
            guild: guild,
            isSelected: guild.id == widget.activeGuildId,
            permissions: permissions,
            isOwner: guild.ownerId == currentUserId,
            iconUrl: guild.iconUrl,
            isUnavailable: guild.unavailable,
            unavailableCount: widget.unavailableCount,
            isMuted: muteState?.isMuted ?? false,
            muteEndTime: muteState?.muteEndTime,
            hideMutedChannels: muteState?.hideMutedChannels ?? false,
            voiceActivity: voiceActivity,
            hasUnread: !guild.unavailable && (unread?.hasUnread ?? false),
            mentionCount: guild.unavailable ? 0 : unread?.mentionCount ?? 0,
            guildUnreadReady: guildUnreadReady,
            invitesPaused: invitesPaused,
            developerMode: developerMode,
            enableLongPressMenu: !isMobileLayout(context),
            onTap: () {
              DrawerNavigationCoordinator.selectGuild(ref.container, guild.id);
            },
            onMenuOpened: () {
              ref.read(guildSyncProvider.notifier).syncIfNeeded(guild.id);
            },
            resolveMenuPermissions: () =>
                _resolveGuildMenuPermissions(ref, guild.id),
            onMarkAsRead: () {
              unawaited(
                markGuildAsRead(
                  guild.id,
                  ref.read(fluxerDatabaseProvider),
                  ref.read(fluxerClientProvider),
                ),
              );
            },
            onLeaveGuild: () {
              unawaited(leaveGuildAndCleanup(ref, guild.id));
            },
            onDeleteMyMessages: (guildId) async {
              await ref
                  .read(fluxerClientProvider)
                  .guilds
                  .bulkDeleteMyMessagesInGuild(
                    guildId: guildId,
                    body: const SudoVerificationSchema(),
                  );
            },
            onGuildSettingsAction: (action) {
              unawaited(
                updateGuildUserSettings(
                  action,
                  guild.id,
                  ref.read(fluxerDatabaseProvider),
                  ref.read(fluxerClientProvider),
                ),
              );
            },
            onCreateCategory: (name) {
              unawaited(
                ref
                    .read(fluxerClientProvider)
                    .guilds
                    .createGuildChannel(
                      guildId: guild.id,
                      body: ChannelCreateRequest4(
                        name: name,
                        type: GuildCategoryChannelCreateRequestTypeType
                            .guildCategory,
                        topic: null,
                        url: null,
                        parentId: null,
                        bitrate: null,
                        userLimit: null,
                        voiceConnectionLimit: null,
                        permissionOverwrites: [],
                        rateLimitPerUser: null,
                        nsfw: false,
                        nsfwOverride: null,
                        contentWarningLevel: ContentWarningLevel.inherit,
                        contentWarningText: null,
                      ),
                    ),
              );
            },
            onCreateChannel: (request) {
              unawaited(
                ref
                    .read(fluxerClientProvider)
                    .guilds
                    .createGuildChannel(guildId: guild.id, body: request),
              );
            },
            onCreateInvite:
                ({
                  int maxAge = 604800,
                  int maxUses = 0,
                  bool temporary = false,
                }) async {
                  final db = ref.read(fluxerDatabaseProvider);
                  final client = ref.read(fluxerClientProvider);
                  final channels = await db.channelDao.getChannels(guild.id);
                  final invitable = channels
                      .where((c) => isGuildTextBasedChannel(c.type))
                      .firstOrNull;
                  if (invitable == null) {
                    return null;
                  }
                  final String inviteBase = ref.read(
                    instanceInviteBaseUrlProvider,
                  );
                  final invite = await client.invites.createChannelInvite(
                    channelId: invitable.id,
                    body: ChannelInviteCreateRequest(
                      maxAge: maxAge,
                      maxUses: maxUses,
                      temporary: temporary,
                    ),
                  );
                  final code = GuildInviteMetadataResponse.fromJson(
                    invite.toJson(),
                  ).code;
                  return (
                    url: '$inviteBase/$code',
                    channelName: invitable.name,
                  );
                },
            onGetRecipients: () async {
              final friendRepo = ref.read(friendRepositoryProvider);
              final dmRepo = ref.read(dmRepositoryProvider);
              final friends = await friendRepo.getRelationships();
              final dms = await dmRepo.getDmChannels();
              return _buildRecipientList(friends, dms, l10n);
            },
            onSendInviteTo: (channelId, recipientId, url) async {
              final client = ref.read(fluxerClientProvider);
              var targetId = channelId;
              if (targetId == null && recipientId != null) {
                final ch = await client.users.createPrivateChannel(
                  body: CreatePrivateChannelRequest(recipientId: recipientId),
                );
                targetId = ch.id;
              }
              if (targetId != null) {
                await client.channels.sendMessage(
                  channelId: targetId,
                  content: url,
                );
              }
            },
            onGetPrivacyState: () => getGuildPrivacyState(
              db: ref.read(fluxerDatabaseProvider),
              userId: ref.read(currentUserIdProvider)!,
              guildId: guild.id,
            ),
            onToggleDms: ({required bool allowed}) {
              unawaited(
                updateGuildPrivacySetting(
                  client: ref.read(fluxerClientProvider),
                  db: ref.read(fluxerDatabaseProvider),
                  userId: ref.read(currentUserIdProvider)!,
                  guildId: guild.id,
                  dmsAllowed: allowed,
                ),
              );
            },
            onToggleBotDms: ({required bool allowed}) {
              unawaited(
                updateGuildPrivacySetting(
                  client: ref.read(fluxerClientProvider),
                  db: ref.read(fluxerDatabaseProvider),
                  userId: ref.read(currentUserIdProvider)!,
                  guildId: guild.id,
                  botDmsAllowed: allowed,
                ),
              );
            },
            onGetGuildDebugJson: () => buildGuildDebugJson(
              client: ref.read(fluxerClientProvider),
              db: ref.read(fluxerDatabaseProvider),
              userId: ref.read(currentUserIdProvider)!,
              guildId: guild.id,
            ),
            onShowToast: (toast) {
              ref.read(toastProvider.notifier).show(toast);
            },
            onGetNotificationSettings: () => getGuildNotificationSettings(
              db: ref.read(fluxerDatabaseProvider),
              guildId: guild.id,
            ),
            onUpdateNotificationSetting:
                ({
                  bool? muted,
                  UserNotificationSettings? messageNotifications,
                  bool? suppressEveryone,
                  bool? suppressRoles,
                  bool? mobilePush,
                }) {
                  unawaited(
                    updateGuildNotificationSetting(
                      db: ref.read(fluxerDatabaseProvider),
                      client: ref.read(fluxerClientProvider),
                      guildId: guild.id,
                      muted: muted,
                      messageNotifications: messageNotifications,
                      suppressEveryone: suppressEveryone,
                      suppressRoles: suppressRoles,
                      mobilePush: mobilePush,
                    ),
                  );
                },
            onGetGuildChannels: () => getGuildChannelsForSettings(
              db: ref.read(fluxerDatabaseProvider),
              guildId: guild.id,
            ),
            onUpdateChannelOverride:
                (channelId, messageNotifications, {required muted}) {
                  unawaited(
                    ref
                        .read(guildUserSettingsRepositoryProvider)
                        .updateChannelOverride(
                          guildId: guild.id,
                          channelId: channelId,
                          messageNotifications:
                              UserNotificationSettings.fromJson(
                                messageNotifications,
                              ),
                          muted: muted,
                        ),
                  );
                },
            onRemoveChannelOverride: (channelId) {
              unawaited(
                ref
                    .read(guildUserSettingsRepositoryProvider)
                    .removeChannelOverride(
                      guildId: guild.id,
                      channelId: channelId,
                    ),
              );
            },
          ),
        );
      },
    );
  }

  String get _derivedFolderName {
    final names = widget.folder.guilds.take(3).map((g) => g.name);
    return names.join(', ');
  }

  String get _folderDisplayName => widget.folder.name ?? _derivedFolderName;

  bool _folderHasUnread() {
    final bool guildUnreadReady = ref.read(guildReadStateReadyProvider);
    if (!guildUnreadReady) {
      return false;
    }
    for (final Guild guild in widget.folder.guilds) {
      if (guild.unavailable) {
        continue;
      }
      final unread = ref.read(guildReadStateProvider)[guild.id];
      if (unread?.hasUnread ?? false) {
        return true;
      }
    }
    return false;
  }

  Future<void> _handleFolderMenuAction(FolderMenuAction action) async {
    if (action == FolderMenuAction.folderSettings) {
      await GuildFolderSettingsModal.show(context, folderId: widget.folder.id);
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await handleFolderMenuAction(
      action: action,
      guilds: widget.folder.guilds,
      db: ref.read(fluxerDatabaseProvider),
      client: ref.read(fluxerClientProvider),
      userId: userId,
    );
  }

  Future<void> _showFolderContextMenu(
    BuildContext context,
    Offset position, {
    bool verticallyCenterAtPosition = false,
  }) async {
    final FolderMenuAction? action = await showFolderContextMenu(
      context,
      position: position,
      folderName: _folderDisplayName,
      guilds: widget.folder.guilds,
      hasUnread: _folderHasUnread(),
      verticallyCenterAtPosition: verticallyCenterAtPosition,
    );
    if (action != null && context.mounted) {
      await _handleFolderMenuAction(action);
    }
  }
}

String _inviteExpirationDurationLabel(int maxAge, FluxerLocalizations l10n) {
  return switch (maxAge) {
    0 => l10n.guildNavbarDurationNever,
    1800 => l10n.guildNavbarDuration30Minutes,
    3600 => l10n.guildNavbarDuration1Hour,
    21600 => l10n.guildNavbarDuration6Hours,
    43200 => l10n.guildNavbarDuration12Hours,
    86400 => l10n.guildNavbarDuration1Day,
    604800 => l10n.guildNavbarDuration7Days,
    _ => l10n.guildNavbarDurationSeconds(maxAge),
  };
}

List<_InviteRecipient> _buildRecipientList(
  List<Friend> friends,
  List<DmConversation> dms,
  FluxerLocalizations l10n,
) {
  final accepted = friends.where(
    (f) => f.friendStatus == FriendStatus.accepted,
  );
  final dmByRecipient = <String, DmConversation>{};
  final recipients = <_InviteRecipient>[];

  for (final dm in dms) {
    if (dm.isGroup) {
      recipients.add(
        _InviteRecipient(
          id: dm.id,
          displayName: dm.displayName,
          secondaryText: l10n.guildNavbarGroupDm,
          channelId: dm.id,
        ),
      );
    } else {
      dmByRecipient[dm.recipientId] = dm;
    }
  }

  for (final friend in accepted) {
    final dm = dmByRecipient[friend.id];
    final avatarUrl = friend.avatar != null
        ? FluxerMediaUrl.userAvatar(userId: friend.id, hash: friend.avatar)
        : null;
    recipients.add(
      _InviteRecipient(
        id: friend.id,
        displayName: friend.displayName,
        secondaryText: friend.username,
        avatarUrl: avatarUrl,
        status: friend.status,
        channelId: dm?.id,
      ),
    );
  }

  return recipients;
}

Future<int> _resolveGuildMenuPermissions(WidgetRef ref, String guildId) async {
  await ref.read(guildPermissionsProvider.notifier).refreshPermissions(guildId);
  return ref.read(guildPermissionsProvider)[guildId] ?? 0;
}

Future<void> presentGuildMenuSheet(
  BuildContext context,
  WidgetRef ref, {
  required Guild guild,
}) async {
  final Guild sheetGuild =
      ref
          .read(guildListViewModelProvider)
          .guilds
          .where((Guild g) => g.id == guild.id)
          .firstOrNull ??
      guild;
  final unread = ref.read(guildReadStateProvider)[guild.id];
  final muteState = ref.read(guildMuteProvider(guild.id)).value;
  final int permissions = await _resolveGuildMenuPermissions(ref, guild.id);
  if (!context.mounted) {
    return;
  }
  final String? currentUserId = ref.read(currentUserIdProvider);
  final bool developerMode = ref.read(
    userSettingsViewModelProvider.select((s) => s.developerMode),
  );
  final GuildAction? action = await showGuildBottomSheet(
    context,
    guild: sheetGuild,
    hasUnread: !sheetGuild.unavailable && (unread?.hasUnread ?? false),
    isMuted: muteState?.isMuted ?? false,
    isOwner: sheetGuild.ownerId == currentUserId,
    permissions: permissions,
    muteEndTime: muteState?.muteEndTime,
    hideMutedChannels: muteState?.hideMutedChannels ?? false,
    developerMode: developerMode,
  );
  if (action == null || !context.mounted) {
    return;
  }
  await _runGuildMenuAction(context, ref, guild: guild, action: action);
}

Future<void> _runGuildMenuAction(
  BuildContext context,
  WidgetRef ref, {
  required Guild guild,
  required GuildAction action,
}) async {
  final GlobalKey<_GuildListItemState> menuKey =
      GlobalKey<_GuildListItemState>();
  final OverlayState overlay = Overlay.of(context);
  late final OverlayEntry entry;
  final Completer<void> mounted = Completer<void>();
  entry = OverlayEntry(
    builder: (BuildContext overlayContext) {
      return Offstage(
        child: _buildGuildMenuActionItem(
          context: overlayContext,
          ref: ref,
          guild: guild,
          key: menuKey,
          onMounted: () {
            if (!mounted.isCompleted) {
              mounted.complete();
            }
          },
        ),
      );
    },
  );
  overlay.insert(entry);
  await mounted.future;
  if (context.mounted) {
    menuKey.currentState?.handleMenuAction(context, action);
  }
  entry.remove();
}

Widget _buildGuildMenuActionItem({
  required BuildContext context,
  required WidgetRef ref,
  required Guild guild,
  required GlobalKey<_GuildListItemState> key,
  required VoidCallback onMounted,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final unread = ref.read(guildReadStateProvider)[guild.id];
  final muteState = ref.read(guildMuteProvider(guild.id)).value;
  final permissions = ref.read(guildPermissionsProvider)[guild.id] ?? 0;
  final String? currentUserId = ref.read(currentUserIdProvider);
  final bool developerMode = ref.read(
    userSettingsViewModelProvider.select((s) => s.developerMode),
  );
  return _GuildListItem(
    key: key,
    label: guild.name,
    guild: guild,
    permissions: permissions,
    isOwner: guild.ownerId == currentUserId,
    isMuted: muteState?.isMuted ?? false,
    muteEndTime: muteState?.muteEndTime,
    hideMutedChannels: muteState?.hideMutedChannels ?? false,
    hasUnread: !guild.unavailable && (unread?.hasUnread ?? false),
    developerMode: developerMode,
    onTap: () {},
    onMenuOpened: () {
      ref.read(guildSyncProvider.notifier).syncIfNeeded(guild.id);
    },
    onMarkAsRead: () {
      unawaited(
        markGuildAsRead(
          guild.id,
          ref.read(fluxerDatabaseProvider),
          ref.read(fluxerClientProvider),
        ),
      );
    },
    onLeaveGuild: () {
      unawaited(leaveGuildAndCleanup(ref, guild.id));
    },
    onDeleteMyMessages: (String guildId) async {
      await ref
          .read(fluxerClientProvider)
          .guilds
          .bulkDeleteMyMessagesInGuild(
            guildId: guildId,
            body: const SudoVerificationSchema(),
          );
    },
    onGuildSettingsAction: (GuildAction action) {
      unawaited(
        updateGuildUserSettings(
          action,
          guild.id,
          ref.read(fluxerDatabaseProvider),
          ref.read(fluxerClientProvider),
        ),
      );
    },
    onCreateCategory: (String name) {
      unawaited(
        ref
            .read(fluxerClientProvider)
            .guilds
            .createGuildChannel(
              guildId: guild.id,
              body: ChannelCreateRequest4(
                name: name,
                type: GuildCategoryChannelCreateRequestTypeType.guildCategory,
                topic: null,
                url: null,
                parentId: null,
                bitrate: null,
                userLimit: null,
                voiceConnectionLimit: null,
                permissionOverwrites: const [],
                rateLimitPerUser: null,
                nsfw: false,
                nsfwOverride: null,
                contentWarningLevel: ContentWarningLevel.inherit,
                contentWarningText: null,
              ),
            ),
      );
    },
    onCreateChannel: (ChannelCreateRequest request) {
      unawaited(
        ref
            .read(fluxerClientProvider)
            .guilds
            .createGuildChannel(guildId: guild.id, body: request),
      );
    },
    onCreateInvite:
        ({int maxAge = 604800, int maxUses = 0, bool temporary = false}) async {
          final db = ref.read(fluxerDatabaseProvider);
          final client = ref.read(fluxerClientProvider);
          final channels = await db.channelDao.getChannels(guild.id);
          final invitable = channels
              .where((c) => isGuildTextBasedChannel(c.type))
              .firstOrNull;
          if (invitable == null) {
            return null;
          }
          final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
          final invite = await client.invites.createChannelInvite(
            channelId: invitable.id,
            body: ChannelInviteCreateRequest(
              maxAge: maxAge,
              maxUses: maxUses,
              temporary: temporary,
            ),
          );
          final code = GuildInviteMetadataResponse.fromJson(
            invite.toJson(),
          ).code;
          return (url: '$inviteBase/$code', channelName: invitable.name);
        },
    onGetRecipients: () async {
      final friendRepo = ref.read(friendRepositoryProvider);
      final dmRepo = ref.read(dmRepositoryProvider);
      final friends = await friendRepo.getRelationships();
      final dms = await dmRepo.getDmChannels();
      return _buildRecipientList(friends, dms, l10n);
    },
    onSendInviteTo: (String? channelId, String? recipientId, String url) async {
      final client = ref.read(fluxerClientProvider);
      var targetId = channelId;
      if (targetId == null && recipientId != null) {
        final ch = await client.users.createPrivateChannel(
          body: CreatePrivateChannelRequest(recipientId: recipientId),
        );
        targetId = ch.id;
      }
      if (targetId != null) {
        await client.channels.sendMessage(channelId: targetId, content: url);
      }
    },
    onGetPrivacyState: () => getGuildPrivacyState(
      db: ref.read(fluxerDatabaseProvider),
      userId: ref.read(currentUserIdProvider)!,
      guildId: guild.id,
    ),
    onToggleDms: ({required bool allowed}) {
      unawaited(
        updateGuildPrivacySetting(
          client: ref.read(fluxerClientProvider),
          db: ref.read(fluxerDatabaseProvider),
          userId: ref.read(currentUserIdProvider)!,
          guildId: guild.id,
          dmsAllowed: allowed,
        ),
      );
    },
    onToggleBotDms: ({required bool allowed}) {
      unawaited(
        updateGuildPrivacySetting(
          client: ref.read(fluxerClientProvider),
          db: ref.read(fluxerDatabaseProvider),
          userId: ref.read(currentUserIdProvider)!,
          guildId: guild.id,
          botDmsAllowed: allowed,
        ),
      );
    },
    onGetGuildDebugJson: () => buildGuildDebugJson(
      client: ref.read(fluxerClientProvider),
      db: ref.read(fluxerDatabaseProvider),
      userId: ref.read(currentUserIdProvider)!,
      guildId: guild.id,
    ),
    onShowToast: (FluxerToast toast) {
      ref.read(toastProvider.notifier).show(toast);
    },
    onGetNotificationSettings: () => getGuildNotificationSettings(
      db: ref.read(fluxerDatabaseProvider),
      guildId: guild.id,
    ),
    onUpdateNotificationSetting:
        ({
          bool? muted,
          UserNotificationSettings? messageNotifications,
          bool? suppressEveryone,
          bool? suppressRoles,
          bool? mobilePush,
        }) {
          unawaited(
            updateGuildNotificationSetting(
              db: ref.read(fluxerDatabaseProvider),
              client: ref.read(fluxerClientProvider),
              guildId: guild.id,
              muted: muted,
              messageNotifications: messageNotifications,
              suppressEveryone: suppressEveryone,
              suppressRoles: suppressRoles,
              mobilePush: mobilePush,
            ),
          );
        },
    onGetGuildChannels: () => getGuildChannelsForSettings(
      db: ref.read(fluxerDatabaseProvider),
      guildId: guild.id,
    ),
    onUpdateChannelOverride:
        (String channelId, int messageNotifications, {required bool muted}) {
          unawaited(
            ref
                .read(guildUserSettingsRepositoryProvider)
                .updateChannelOverride(
                  guildId: guild.id,
                  channelId: channelId,
                  messageNotifications: UserNotificationSettings.fromJson(
                    messageNotifications,
                  ),
                  muted: muted,
                ),
          );
        },
    onRemoveChannelOverride: (String channelId) {
      unawaited(
        ref
            .read(guildUserSettingsRepositoryProvider)
            .removeChannelOverride(guildId: guild.id, channelId: channelId),
      );
    },
    onMounted: onMounted,
  );
}

Future<Map<String, Object?>> buildGuildDebugJson({
  required FluxerClient client,
  required FluxerDatabase db,
  required String userId,
  required String guildId,
}) async {
  final response = await client.guilds.getGuild(guildId: guildId);
  final json = response.toJson()..remove('permissions');

  final member = await db.memberDao.getMemberByUserId(userId, guildId);
  if (member?.joinedAt != null) {
    json['joined_at'] = member!.joinedAt!.toUtc().toIso8601String();
  }

  final server = await db.guildDao.getServerById(guildId);
  json['unavailable'] = server?.unavailable ?? false;
  json['member_count'] = server?.memberCount ?? 0;

  final roles = await db.roleDao.getRoles(guildId);
  final rolesMap = <String, Object>{};
  for (final role in roles) {
    rolesMap[role.id] = {
      'id': role.id,
      'name': role.name,
      'color': role.color,
      'position': role.position,
      'hoist_position': role.hoist ? role.position : null,
      'permissions': role.permissions,
      'hoist': role.hoist,
    };
  }
  json['roles'] = rolesMap;

  return json;
}
