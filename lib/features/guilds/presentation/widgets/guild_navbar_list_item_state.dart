part of 'guild_navbar.dart';

class _GuildListItemState extends State<_GuildListItem>
    with AutomaticKeepAliveClientMixin {
  var _isHovered = false;
  var _animateUnreadIndicator = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animateUnreadIndicator = widget.guildUnreadReady;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onMounted?.call();
    });
  }

  @override
  void didUpdateWidget(_GuildListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.guildUnreadReady && widget.guildUnreadReady) {
      _animateUnreadIndicator = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() => _animateUnreadIndicator = true);
        }
      });
    }
  }

  bool get _displayHasUnread => widget.guildUnreadReady && widget.hasUnread;

  int get _displayMentionCount =>
      widget.guildUnreadReady ? widget.mentionCount : 0;

  String _guildSemanticLabel(FluxerLocalizations l10n) {
    final StringBuffer label = StringBuffer(widget.label);
    if (widget.isUnavailable) {
      label.write(', ${l10n.guildNavbarTemporarilyUnavailable}');
    }
    if (widget.isSelected) {
      label.write(', ${l10n.guildNavbarGuildSelected}');
    }
    if (_displayMentionCount > 0) {
      label.write(', ${l10n.guildNavbarGuildMentions(_displayMentionCount)}');
    } else if (_displayHasUnread) {
      label.write(', ${l10n.guildNavbarGuildUnread}');
    }
    return label.toString();
  }

  Duration get _unreadIndicatorDuration {
    if (!widget.guildUnreadReady || !_animateUnreadIndicator) {
      return Duration.zero;
    }
    return context.motion.panel;
  }

  Widget _buildBackupIcon(BuildContext context, {required bool isActive}) {
    final iconColor = isActive
        ? context.colors.textOnBrandPrimary
        : context.colors.textPrimary;
    final initials = abbreviateGuildName(widget.label);
    final initialsLength = guildNameInitialsLength(widget.label);
    return Center(
      child: widget.svgAsset != null
          ? SvgPicture.asset(
              widget.svgAsset!,
              width: 44,
              height: 44,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            )
          : widget.icon != null
          ? PhosphorIcon(widget.icon!, color: iconColor, size: 32)
          : Text(
              initials,
              textScaler: kIconInitialsTextScaler,
              style: context.textStyles.smallText.copyWith(
                color: iconColor,
                fontSize: _guildNavbarInitialsFontSize(initialsLength),
                height: 1,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final isActive = widget.isSelected || _isHovered;
    final activeAnimatedIconUrl = isActive
        ? widget.guild?.animatedIconUrl
        : null;
    final iconUrl = activeAnimatedIconUrl ?? widget.iconUrl;
    final borderRadius = isActive ? 13.0 : 22.0;
    final hasImage = iconUrl != null && !widget.isUnavailable;
    final bgColor = widget.isUnavailable
        ? context.colors.statusDanger
        : hasImage
        ? Colors.transparent
        : isActive
        ? context.colors.brandPrimary
        : context.colors.serverIconBackground;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          const SizedBox(width: 72),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: AnimatedContainer(
                duration: _unreadIndicatorDuration,
                curve: const Cubic(0.25, 0.1, 0.25, 1),
                width: 4,
                height: widget.isSelected
                    ? 40
                    : _isHovered
                    ? 20
                    : _displayHasUnread
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
          _RightTooltip(
            backgroundColor: widget.isUnavailable
                ? context.colors.statusDanger
                : null,
            borderColor: widget.isUnavailable
                ? context.colors.statusDanger
                : null,
            content: widget.guild != null
                ? _GuildTooltipContent(
                    guild: widget.guild!,
                    unavailableCount: widget.unavailableCount,
                    permissions: widget.permissions,
                    isMuted: widget.isMuted,
                    muteEndTime: widget.muteEndTime,
                  )
                : _TooltipLabel(label: widget.label),
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: Semantics(
                button: true,
                selected: widget.isSelected,
                label: _guildSemanticLabel(l10n),
                child: FluxerGestureDetector(
                  behavior: widget.opaqueHitTarget
                      ? HitTestBehavior.opaque
                      : null,
                  onTap: widget.onTap,
                  onSecondaryTapUp: widget.guild != null
                      ? (details) => unawaited(
                          _showContextMenu(context, details.globalPosition),
                        )
                      : null,
                  onLongPress:
                      widget.guild != null && widget.enableLongPressMenu
                      ? () => unawaited(_showActionSheet(context))
                      : null,
                  child: SizedBox(
                    width: widget.opaqueHitTarget ? 72 : 48,
                    height: 48,
                    child: Center(
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: AnimatedContainer(
                                duration: context.motion.hover,
                                curve: Curves.easeOut,
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(
                                    borderRadius,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    borderRadius,
                                  ),
                                  child: widget.isUnavailable
                                      ? Center(
                                          child: PhosphorIcon(
                                            PhosphorIconsBold.exclamationMark,
                                            color: context
                                                .colors
                                                .textOnBrandPrimary,
                                            size: 32,
                                          ),
                                        )
                                      : iconUrl != null
                                      ? CachedNetworkImage(
                                          imageUrl: iconUrl,
                                          memCacheWidth:
                                              _guildNavbarIconMemCache(
                                                context,
                                                44,
                                              ),
                                          memCacheHeight:
                                              _guildNavbarIconMemCache(
                                                context,
                                                44,
                                              ),
                                          fadeInDuration:
                                              activeAnimatedIconUrl != null
                                              ? context.motion.panel
                                              : const Duration(
                                                  milliseconds: 500,
                                                ),
                                          errorBuilder: (context, url, error) =>
                                              _buildBackupIcon(
                                                context,
                                                isActive: isActive,
                                              ),
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  _buildBackupIcon(
                                                    context,
                                                    isActive: isActive,
                                                  ),
                                        )
                                      : _buildBackupIcon(
                                          context,
                                          isActive: isActive,
                                        ),
                                ),
                              ),
                            ),
                            if (!widget.isUnavailable &&
                                !widget.isSelected &&
                                _displayMentionCount > 0)
                              Positioned(
                                bottom: -2,
                                right: -2,
                                child: FluxerBadge.count(
                                  count: _displayMentionCount,
                                  cutoutColor:
                                      context.colors.backgroundSecondary,
                                ),
                              ),
                            if (!widget.isUnavailable &&
                                widget.voiceActivity != VoiceActivityType.none)
                              Positioned(
                                top: -4,
                                right: -4,
                                child: _VoiceActivityBadge(
                                  type: widget.voiceActivity,
                                ),
                              ),
                            if (!widget.isUnavailable &&
                                !widget.isSelected &&
                                widget.invitesPaused &&
                                _displayMentionCount == 0 &&
                                widget.voiceActivity == VoiceActivityType.none)
                              const Positioned(
                                bottom: -4,
                                right: -4,
                                child: _PauseBadge(),
                              ),
                          ],
                        ),
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
  }

  Future<void> _showContextMenu(BuildContext context, Offset position) async {
    if (widget.guild == null) {
      return;
    }
    widget.onMenuOpened?.call();
    final int permissions = widget.resolveMenuPermissions != null
        ? await widget.resolveMenuPermissions!()
        : widget.permissions;
    if (!context.mounted) {
      return;
    }
    final action = await showGuildContextMenu(
      context,
      position: position,
      guild: widget.guild!,
      hasUnread: widget.hasUnread,
      isMuted: widget.isMuted,
      isOwner: widget.isOwner,
      permissions: permissions,
      muteEndTime: widget.muteEndTime,
      hideMutedChannels: widget.hideMutedChannels,
      developerMode: widget.developerMode,
    );
    if (context.mounted && action != null) {
      _handleAction(context, action);
    }
  }

  Future<void> _showActionSheet(BuildContext context) async {
    if (widget.guild == null) {
      return;
    }
    widget.onMenuOpened?.call();
    final isMobile = isMobileLayout(context);
    if (!isMobile) {
      return;
    }
    final int permissions = widget.resolveMenuPermissions != null
        ? await widget.resolveMenuPermissions!()
        : widget.permissions;
    if (!context.mounted) {
      return;
    }
    final action = await showGuildBottomSheet(
      context,
      guild: widget.guild!,
      hasUnread: widget.hasUnread,
      isMuted: widget.isMuted,
      isOwner: widget.isOwner,
      permissions: permissions,
      muteEndTime: widget.muteEndTime,
      hideMutedChannels: widget.hideMutedChannels,
      developerMode: widget.developerMode,
    );
    if (context.mounted && action != null) {
      _handleAction(context, action);
    }
  }

  Future<void> _showCreateChannelModal(BuildContext context) async {
    final ChannelCreateRequest? request = await CreateChannelSheet.show(
      context,
    );
    if (request != null && context.mounted) {
      widget.onCreateChannel?.call(request);
    }
  }

  Future<void> _showCreateCategoryModal(BuildContext context) async {
    final String? name = await CreateCategorySheet.show(context);
    if (name != null && name.isNotEmpty && context.mounted) {
      widget.onCreateCategory?.call(name);
    }
  }

  Future<void> _showInviteMembersModal(BuildContext context) async {
    final Future<({String url, String channelName})?> Function({
      int maxAge,
      int maxUses,
      bool temporary,
    })?
    createInvite = widget.onCreateInvite;
    final Future<List<InvitePeopleRecipient>> Function()? getRecipients =
        widget.onGetRecipients;
    final Future<void> Function(
      String? channelId,
      String? recipientId,
      String inviteUrl,
    )?
    sendInvite = widget.onSendInviteTo;
    if (createInvite == null || getRecipients == null || sendInvite == null) {
      return;
    }
    await InvitePeopleFlow.show(
      context,
      communityName: widget.label,
      createInvite: createInvite,
      getRecipients: getRecipients,
      sendInvite: sendInvite,
    );
  }

  Future<void> _confirmLeaveGuild(BuildContext context) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final confirmed = await FluxerConfirmModal.show(
      context,
      title: l10n.guildNavbarLeaveCommunityTitle,
      description: l10n.guildNavbarLeaveCommunityDescription,
      confirmLabel: l10n.guildNavbarLeaveCommunityConfirm,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !context.mounted) {
      return;
    }
    widget.onLeaveGuild?.call();
    if (context.mounted) {
      context.go(RoutePaths.me);
    }
  }

  Future<void> _confirmDeleteMyMessagesInGuild(BuildContext context) async {
    final String? guildId = widget.guild?.id;
    if (guildId == null || widget.onDeleteMyMessages == null) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final confirmed = await FluxerConfirmModal.show(
      context,
      title: l10n.guildNavbarDeleteMyMessagesTitle,
      description: l10n.guildNavbarDeleteMyMessagesDescription,
      confirmLabel: l10n.guildNavbarDeleteMyMessagesConfirm,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true) {
      return;
    }
    try {
      await widget.onDeleteMyMessages!(guildId);
      widget.onShowToast?.call(
        FluxerToast(
          message: l10n.guildNavbarDeletedYourMessages,
          variant: FluxerToastVariant.success,
        ),
      );
    } on Object catch (error) {
      talker.error('[GuildNavbar] Failed to delete messages in guild: $error');
      widget.onShowToast?.call(
        FluxerToast(
          message: l10n.guildNavbarCouldNotDeleteYourMessages,
          variant: FluxerToastVariant.danger,
        ),
      );
    }
  }

  Future<void> _showNotificationSettingsSheet(BuildContext context) async {
    if (widget.onGetNotificationSettings == null) {
      return;
    }

    final settings = await widget.onGetNotificationSettings!();
    if (!context.mounted) {
      return;
    }

    final channels = await widget.onGetGuildChannels?.call() ?? [];
    if (!context.mounted) {
      return;
    }

    final channelMap = {for (final c in channels) c.id: c};

    final l10n = FluxerLocalizations.of(context);
    final muted = ValueNotifier<bool>(settings.muted);
    final notifLevel = ValueNotifier<int>(settings.messageNotifications);
    final suppressEveryone = ValueNotifier<bool>(settings.suppressEveryone);
    final suppressRoles = ValueNotifier<bool>(settings.suppressRoles);
    final mobilePush = ValueNotifier<bool>(settings.mobilePush);
    final overrides =
        ValueNotifier<Map<String, ({int messageNotifications, bool muted})>>(
          Map.of(settings.channelOverrides),
        );

    await FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.notificationSettings,
      builder: (sheetContext, scrollController, close) {
        final layout = sheetContext.layout;
        final colors = sheetContext.colors;
        final textStyles = sheetContext.textStyles;

        return SingleChildScrollView(
          controller: scrollController,
          padding: FluxerBottomSheet.scrollViewPadding(
            sheetContext,
            padding: EdgeInsets.symmetric(horizontal: layout.s4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: muted,
                builder: (_, isMuted, _) => _PrivacySwitchRow(
                  label: l10n.notificationMuteGuild(widget.guild!.name),
                  description: l10n.notificationMuteDescription,
                  value: isMuted,
                  onChanged: (value) {
                    muted.value = value;
                    widget.onUpdateNotificationSetting?.call(muted: value);
                  },
                ),
              ),

              SizedBox(height: layout.s6),
              Text(
                l10n.notificationCommunitySettings,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: layout.s3),
              ValueListenableBuilder<int>(
                valueListenable: notifLevel,
                builder: (_, level, _) => FluxerRadioGroup<int>(
                  value: level,
                  items: [
                    FluxerRadioItem(
                      value: 0,
                      label: l10n.notificationAllMessages,
                    ),
                    FluxerRadioItem(
                      value: 1,
                      label: l10n.notificationOnlyMentions,
                    ),
                    FluxerRadioItem(value: 2, label: l10n.notificationNothing),
                  ],
                  onChanged: (value) {
                    notifLevel.value = value;
                    widget.onUpdateNotificationSetting?.call(
                      messageNotifications: UserNotificationSettings.fromJson(
                        value,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: layout.s6),
              FluxerSwitchGroup(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: suppressEveryone,
                    builder: (_, suppress, _) => FluxerSwitchGroupItem(
                      label: l10n.notificationSuppressEveryone,
                      value: suppress,
                      onChanged: (value) {
                        suppressEveryone.value = value;
                        widget.onUpdateNotificationSetting?.call(
                          suppressEveryone: value,
                        );
                      },
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: suppressRoles,
                    builder: (_, suppress, _) => FluxerSwitchGroupItem(
                      label: l10n.notificationSuppressRoles,
                      value: suppress,
                      onChanged: (value) {
                        suppressRoles.value = value;
                        widget.onUpdateNotificationSetting?.call(
                          suppressRoles: value,
                        );
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: layout.s6),
              FluxerSwitchGroup(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: mobilePush,
                    builder: (_, push, _) => FluxerSwitchGroupItem(
                      label: l10n.notificationMobilePush,
                      value: push,
                      onChanged: (value) {
                        mobilePush.value = value;
                        widget.onUpdateNotificationSetting?.call(
                          mobilePush: value,
                        );
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: layout.s6),
              Text(
                l10n.notificationOverrides,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: layout.s3),
              ValueListenableBuilder<
                Map<String, ({int messageNotifications, bool muted})>
              >(
                valueListenable: overrides,
                builder: (_, currentOverrides, _) {
                  final available = channels
                      .where((c) => !currentOverrides.containsKey(c.id))
                      .toList();
                  return FluxerSelect<String>(
                    hint: l10n.notificationSelectChannel,
                    items: [
                      for (final ch in available)
                        FluxerSelectItem(
                          value: ch.id,
                          label: ch.name,
                          icon: ChannelIcon.iconDataFor(
                            ChannelType.fromWire(ch.type),
                          ),
                        ),
                    ],
                    onChanged: (channelId) {
                      overrides.value = {
                        ...overrides.value,
                        channelId: (messageNotifications: 3, muted: false),
                      };
                      widget.onUpdateChannelOverride?.call(
                        channelId,
                        3,
                        muted: false,
                      );
                    },
                  );
                },
              ),
              ValueListenableBuilder<
                Map<String, ({int messageNotifications, bool muted})>
              >(
                valueListenable: overrides,
                builder: (_, currentOverrides, _) {
                  if (currentOverrides.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  final sorted = currentOverrides.entries.toList()
                    ..sort((a, b) {
                      final ca = channelMap[a.key];
                      final cb = channelMap[b.key];
                      if (ca == null && cb == null) {
                        return 0;
                      }
                      if (ca == null) {
                        return 1;
                      }
                      if (cb == null) {
                        return -1;
                      }
                      final cmp = ca.position.compareTo(cb.position);
                      return cmp != 0 ? cmp : a.key.compareTo(b.key);
                    });

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: layout.s3),
                      for (final entry in sorted)
                        _buildOverrideCard(
                          sheetContext,
                          channelId: entry.key,
                          channelOverride: entry.value,
                          channel: channelMap[entry.key],
                          channelMap: channelMap,
                          overrides: overrides,
                          guildNotifLevel: notifLevel.value,
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOverrideCard(
    BuildContext context, {
    required String channelId,
    required ({int messageNotifications, bool muted}) channelOverride,
    required ({
      String id,
      String name,
      int type,
      String? parentId,
      int position,
    })?
    channel,
    required Map<
      String,
      ({String id, String name, int type, String? parentId, int position})
    >
    channelMap,
    required ValueNotifier<
      Map<String, ({int messageNotifications, bool muted})>
    >
    overrides,
    required int guildNotifLevel,
  }) {
    if (channel == null) {
      return const SizedBox.shrink();
    }

    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final isCategory = isGuildCategoryChannelType(channel.type);
    final category = channel.parentId != null
        ? channelMap[channel.parentId]
        : null;

    final notifLevel = channelOverride.messageNotifications;
    final isInherit = notifLevel == 3;
    final resolved = isInherit ? guildNotifLevel : notifLevel;

    return Padding(
      padding: EdgeInsets.only(bottom: layout.s3),
      child: Material(
        color: colors.backgroundSecondaryAlt,
        borderRadius: layout.radiusLg,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(layout.s3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _GuildNotificationChannelIcon(
                    channelId: channelId,
                    fallbackType: ChannelType.fromWire(channel.type),
                    color: colors.textTertiary,
                  ),
                  SizedBox(width: layout.s2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          channel.name,
                          style: textStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: colors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (!isCategory)
                          Text(
                            category?.name ?? l10n.notificationNoCategory,
                            style: textStyles.smallText.copyWith(
                              color: colors.textTertiary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: layout.s2),
                  FluxerTappable(
                    onTap: () {
                      final updated = Map.of(overrides.value)
                        ..remove(channelId);
                      overrides.value = updated;
                      widget.onRemoveChannelOverride?.call(channelId);
                    },
                    semanticLabel: l10n.guildNavbarRemoveOverride,
                    builder: (_, _) => Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.backgroundTertiary,
                      ),
                      child: Center(
                        child: PhosphorIcon(
                          PhosphorIconsBold.x,
                          size: 14,
                          color: colors.textTertiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: layout.s3),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: colors.backgroundHeaderSecondary.withValues(
                    alpha: 0.3,
                  ),
                ),
              ),

              FluxerToggleSwitch(
                label: l10n.notificationAllMessages,
                value: resolved == 0,
                onChanged: (_) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: 0,
                    muted: channelOverride.muted,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    0,
                    muted: channelOverride.muted,
                  );
                },
              ),
              SizedBox(height: layout.s3),
              FluxerToggleSwitch(
                label: l10n.notificationOnlyAtMentions,
                value: resolved == 1,
                onChanged: (_) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: 1,
                    muted: channelOverride.muted,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    1,
                    muted: channelOverride.muted,
                  );
                },
              ),
              SizedBox(height: layout.s3),
              FluxerToggleSwitch(
                label: l10n.notificationNothing,
                value: resolved == 2,
                onChanged: (_) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: 2,
                    muted: channelOverride.muted,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    2,
                    muted: channelOverride.muted,
                  );
                },
              ),
              SizedBox(height: layout.s3),
              FluxerToggleSwitch(
                label: l10n.notificationMuteChannel,
                value: channelOverride.muted,
                onChanged: (value) {
                  final updated = Map.of(overrides.value);
                  updated[channelId] = (
                    messageNotifications: channelOverride.messageNotifications,
                    muted: value,
                  );
                  overrides.value = updated;
                  widget.onUpdateChannelOverride?.call(
                    channelId,
                    channelOverride.messageNotifications,
                    muted: value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showPrivacySettingsSheet(BuildContext context) async {
    final guild = widget.guild!;
    if (widget.onGetPrivacyState == null) {
      return;
    }

    final privacyState = await widget.onGetPrivacyState!();
    if (!context.mounted) {
      return;
    }

    final l10n = FluxerLocalizations.of(context);
    final isDmsAllowed = ValueNotifier<bool>(privacyState.isDmsAllowed);
    final isBotDmsAllowed = ValueNotifier<bool>(privacyState.isBotDmsAllowed);

    await FluxerBottomSheet.show<void>(
      context,
      title: l10n.privacySettings,
      builder: (sheetContext, close) {
        final layout = sheetContext.layout;

        final isMutualDmsDisabled = guild.features.contains(
          'DISABLE_MUTUAL_DMS',
        );

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isMutualDmsDisabled) ...[
                FluxerWarningAlert(message: l10n.privacyMutualDmsDisabled),
                SizedBox(height: layout.s4),
              ],
              ValueListenableBuilder<bool>(
                valueListenable: isDmsAllowed,
                builder: (_, allowed, _) => _PrivacySwitchRow(
                  label: l10n.privacyDirectMessages,
                  description: l10n.privacyDirectMessagesDescription,
                  value: allowed,
                  onChanged: (allowed) {
                    isDmsAllowed.value = allowed;
                    widget.onToggleDms?.call(allowed: allowed);
                  },
                ),
              ),
              SizedBox(height: layout.s4),
              ValueListenableBuilder<bool>(
                valueListenable: isBotDmsAllowed,
                builder: (_, allowed, _) => _PrivacySwitchRow(
                  label: l10n.privacyBotDirectMessages,
                  description: l10n.privacyBotDirectMessagesDescription,
                  value: allowed,
                  onChanged: (allowed) {
                    isBotDmsAllowed.value = allowed;
                    widget.onToggleBotDms?.call(allowed: allowed);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showDebugCommunitySheet(BuildContext context) async {
    if (widget.onGetGuildDebugJson == null) {
      return;
    }

    final Map<String, Object?> guildJson;
    try {
      guildJson = await widget.onGetGuildDebugJson!();
    } on Exception catch (e) {
      talker.error('[GuildNavbar] Failed to load guild debug data: $e');
      return;
    }
    if (!context.mounted) {
      return;
    }

    final l10n = FluxerLocalizations.of(context);
    await showDebugBottomSheet(
      context,
      title: l10n.communityDebug,
      data: guildJson,
      onCopied: (_) => widget.onShowToast?.call(
        FluxerToast(
          message: l10n.copiedToClipboard,
          variant: FluxerToastVariant.success,
        ),
      ),
    );
  }

  void handleMenuAction(BuildContext context, GuildAction action) {
    _handleAction(context, action);
  }

  Future<void> handlePeekAction(
    BuildContext context,
    GuildIconPeekAction action,
  ) async {
    if (widget.guild == null) {
      return;
    }
    widget.onMenuOpened?.call();
    switch (action) {
      case GuildIconPeekAction.markAsRead:
        _handleAction(context, GuildAction.markAsRead);
      case GuildIconPeekAction.notifications:
        await _showNotificationSettingsSheet(context);
      case GuildIconPeekAction.moreOptions:
        await _showActionSheet(context);
    }
  }

  void _handleAction(BuildContext context, GuildAction action) {
    final guildId = widget.guild!.id;
    final GuildSettingsTab? settingsTab = guildSettingsTabForAction(action);
    if (settingsTab != null) {
      if (isGuildSettingsTabComingSoon(settingsTab)) {
        final FluxerLocalizations l10n = FluxerLocalizations.of(context);
        widget.onShowToast?.call(FluxerToast(message: l10n.comingSoon));
        return;
      }
      final bool isTouchPrimary = ProviderScope.containerOf(
        context,
      ).read(inputModalityProvider);
      if (!canOpenGuildSettings(
        permissions: widget.permissions,
        guild: widget.guild,
        isTouchPrimary: isTouchPrimary,
      )) {
        return;
      }
      unawaited(
        context.push(
          RoutePaths.guildSettingsPath(
            guildId,
            tab: guildSettingsTabQuery(settingsTab),
          ),
        ),
      );
      return;
    }
    switch (action) {
      case GuildAction.settingsOverview:
      case GuildAction.settingsRoles:
      case GuildAction.settingsEmoji:
      case GuildAction.settingsStickers:
      case GuildAction.settingsSafetyModeration:
      case GuildAction.settingsActivityLog:
      case GuildAction.settingsWebhooks:
      case GuildAction.settingsDiscovery:
      case GuildAction.settingsMembers:
      case GuildAction.settingsInviteLinks:
      case GuildAction.settingsBans:
      case GuildAction.settingsChannels:
        return;
      case GuildAction.copyGuildId:
        unawaited(copyToClipboard(context: context, value: guildId));
      case GuildAction.markAsRead:
        widget.onMarkAsRead?.call();
      case GuildAction.hideMutedChannels:
      case GuildAction.mute15Min:
      case GuildAction.mute30Min:
      case GuildAction.mute1Hour:
      case GuildAction.mute3Hours:
      case GuildAction.mute4Hours:
      case GuildAction.mute8Hours:
      case GuildAction.mute24Hours:
      case GuildAction.mute3Days:
      case GuildAction.muteForever:
      case GuildAction.unmute:
        widget.onGuildSettingsAction?.call(action);
      case GuildAction.leaveGuild:
        unawaited(_confirmLeaveGuild(context));
      case GuildAction.deleteMyMessages:
        unawaited(_confirmDeleteMyMessagesInGuild(context));
      case GuildAction.createCategory:
        unawaited(_showCreateCategoryModal(context));
      case GuildAction.createChannel:
        unawaited(_showCreateChannelModal(context));
      case GuildAction.inviteMembers:
        unawaited(_showInviteMembersModal(context));
      case GuildAction.notificationSettings:
        unawaited(_showNotificationSettingsSheet(context));
      case GuildAction.editCommunityProfile:
        unawaited(
          UserSettingsModal.show(
            context,
            openProfileSection: true,
            guildId: guildId,
          ),
        );
      case GuildAction.reportCommunity:
        unawaited(
          showReportGuildFlow(
            context,
            guildId: guildId,
            guildName: widget.guild!.name,
          ),
        );
      case GuildAction.privacySettings:
        unawaited(_showPrivacySettingsSheet(context));
      case GuildAction.debugCommunity:
        unawaited(_showDebugCommunitySheet(context));
    }
  }
}
