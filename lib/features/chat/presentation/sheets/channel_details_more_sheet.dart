part of 'channel_details_sheet.dart';

enum _PinnedMessageAction { jump, unpin, copyMessageId, copyMessageLink }

Future<void> _showDetailsMoreSheet(
  BuildContext context, {
  required WidgetRef ref,
  required Channel? channel,
  required DmConversation? dm,
  required bool showFavorite,
  required bool isFavorite,
  required bool isDmPinned,
  required bool hasUnread,
  required int channelPermissionBits,
  required bool developerMode,
  required Future<void> Function() onMarkRead,
  required Future<void> Function({required bool isFavorite}) onToggleFavorite,
  required Future<void> Function({required bool isPinned}) onToggleDmPin,
  required Future<void> Function(UserNotificationSettings setting)
  onSetNotification,
  required Future<void> Function(String value) onCopy,
  required Future<void> Function() onCloseDm,
  required Future<void> Function() onDeleteMyMessages,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final channelId = channel?.id ?? dm?.id;
  final title = dm == null
      ? l10n.channelDetailsChannelSettingsTitle
      : (dm.isGroup
            ? l10n.channelDetailsGroupSettingsTitle
            : l10n.channelDetailsDmSettingsTitle);
  final isDM = dm != null && !dm.isGroup && !dm.isPersonalNotes;
  final isGroupDM = dm != null && dm.isGroup;
  final String? currentUserId = ref.read(currentUserIdProvider);
  final bool isGroupDmOwner =
      isGroupDM &&
      dm.ownerId != null &&
      currentUserId != null &&
      dm.ownerId == currentUserId;
  final bool isGroupDmFullState =
      isGroupDM &&
      isGroupDmFull(
        memberCount: dm.recipientCount,
        maxGroupDmRecipients: ref.read(
          instanceLimitProvider(LimitKeys.maxGroupDmRecipients),
        ),
      );
  return FluxerBottomSheet.show<void>(
    context,
    title: title,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, close) {
      void run(Future<void> Function() action) {
        close();
        unawaited(action());
      }

      final canManageChannel =
          channel != null &&
          hasPermission(channelPermissionBits, Permission.manageChannels);
      final canCreateInvite =
          channel != null &&
          hasPermission(channelPermissionBits, Permission.createInstantInvite);

      final commonItems = <Widget>[
        if (showFavorite)
          FluxerBottomSheetMenuItem(
            label: isFavorite
                ? l10n.favoritesRemoveFromFavorites
                : l10n.favoritesAddToFavorites,
            icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
            onTap: () => run(() => onToggleFavorite(isFavorite: isFavorite)),
          ),
        if (hasUnread)
          FluxerBottomSheetMenuItem(
            label: l10n.dmMarkAsRead,
            icon: PhosphorIconsBold.checkCircle,
            onTap: () => run(onMarkRead),
          ),
        if (dm != null && !dm.isPersonalNotes)
          FluxerBottomSheetMenuItem(
            label: dm.isGroup
                ? (isDmPinned ? l10n.dmUnpinGroupDm : l10n.dmPinGroupDm)
                : (isDmPinned ? l10n.dmUnpinDm : l10n.dmPinDm),
            icon: PhosphorIconsBold.pushPin,
            onTap: () => run(() => onToggleDmPin(isPinned: isDmPinned)),
          ),
        if (canCreateInvite)
          FluxerBottomSheetMenuItem(
            label: l10n.channelDetailsInvitePeople,
            icon: PhosphorIconsBold.userPlus,
            onTap: () {
              close();
              unawaited(
                showChannelInviteModal(
                  context,
                  ref,
                  channelId: channel.id,
                  channelName: channel.name,
                  guildId: channel.guildId,
                  useVanityUrl: false,
                ),
              );
            },
          ),
        if (channel != null)
          FluxerBottomSheetMenuItem(
            label: l10n.channelDetailsCopyLink,
            icon: PhosphorIconsBold.link,
            onTap: () =>
                run(() => onCopy(channelLink(channel.id, channel.guildId))),
          ),
        if (channel != null)
          FluxerBottomSheetSubmenuItem(
            label: l10n.notificationSettings,
            icon: PhosphorIconsBold.bellRinging,
            onTap: () {
              close();
              unawaited(
                showChannelNotificationSettingsSheet(
                  context,
                  channel: channel,
                  onSetNotification: onSetNotification,
                ),
              );
            },
          ),
      ];

      final miscItems = <Widget>[
        if (developerMode && channelId != null)
          FluxerBottomSheetMenuItem(
            label: l10n.dmDebugChannel,
            icon: PhosphorIconsBold.bug,
            onTap: () {
              close();
              unawaited(
                _showDebugChannelSheet(context, ref: ref, channelId: channelId),
              );
            },
          ),
        if (developerMode && isDM)
          FluxerBottomSheetMenuItem(
            label: l10n.dmDebugUser,
            icon: PhosphorIconsBold.bug,
            onTap: () {
              close();
              unawaited(
                _showDebugUserSheet(context, ref: ref, userId: dm.recipientId),
              );
            },
          ),
        if (isDM)
          FluxerBottomSheetMenuItem(
            label: l10n.dmCopyUserId,
            icon: PhosphorIconsBold.snowflake,
            onTap: () => run(() => onCopy(dm.recipientId)),
          ),
        if (channelId != null)
          FluxerBottomSheetMenuItem(
            label: l10n.dmCopyChannelId,
            icon: PhosphorIconsBold.snowflake,
            onTap: () => run(() => onCopy(channelId)),
          ),
      ];

      final groups = <Widget>[
        if (commonItems.isNotEmpty) FluxerMenuGroup(children: commonItems),
        if (isGroupDM)
          FluxerMenuGroup(
            children: <Widget>[
              FluxerBottomSheetMenuItem(
                label: l10n.dmEditGroup,
                icon: PhosphorIconsBold.pencilSimple,
                onTap: () {
                  close();
                  unawaited(EditGroupDmFlow.show(context, dm: dm));
                },
              ),
              if (!isGroupDmFullState)
                FluxerBottomSheetMenuItem(
                  label: l10n.channelDetailsAddFriendsToGroup,
                  icon: PhosphorIconsBold.userPlus,
                  onTap: () {
                    close();
                    unawaited(AddFriendsToGroupFlow.show(context, ref, dm: dm));
                  },
                ),
              if (isGroupDmOwner)
                FluxerBottomSheetMenuItem(
                  label: l10n.channelDetailsGroupInvites,
                  icon: PhosphorIconsBold.envelope,
                  onTap: () {
                    close();
                    unawaited(GroupDmInvitesFlow.show(context, dm: dm));
                  },
                ),
            ],
          ),
        if (canManageChannel)
          FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: l10n.channelDetailsEditChannel,
                icon: PhosphorIconsBold.pencilSimple,
                onTap: () {
                  close();
                  if (channelId != null) {
                    unawaited(
                      ChannelSettingsFlow.show(context, channelId: channelId),
                    );
                  }
                },
              ),
              FluxerBottomSheetMenuItem(
                label: l10n.channelDetailsDeleteChannel,
                icon: PhosphorIconsBold.trash,
                isDanger: true,
                onTap: () {
                  close();
                  unawaited(
                    DeleteChannelFlow.confirmAndDelete(
                      context,
                      ref,
                      channel: channel,
                    ),
                  );
                },
              ),
            ],
          ),
        if (isDM || isGroupDM)
          FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: l10n.channelMenuDeleteMyMessagesConfirm,
                icon: PhosphorIconsBold.trash,
                isDanger: true,
                onTap: () => run(onDeleteMyMessages),
              ),
              FluxerBottomSheetMenuItem(
                label: isGroupDM ? l10n.dmLeaveGroup : l10n.dmCloseDm,
                icon: PhosphorIconsBold.xCircle,
                isDanger: true,
                onTap: () => run(onCloseDm),
              ),
            ],
          ),
        if (miscItems.isNotEmpty) FluxerMenuGroup(children: miscItems),
      ];

      return FluxerBottomSheetContent(
        child: FluxerBottomSheetGroupColumn(children: groups),
      );
    },
  );
}

Future<void> _showDebugChannelSheet(
  BuildContext context, {
  required WidgetRef ref,
  required String channelId,
}) => showChannelDebugSheet(
  context,
  ref: ref,
  channelId: channelId,
  title: FluxerLocalizations.of(context).dmDebugChannel,
);

Future<void> _showDebugUserSheet(
  BuildContext context, {
  required WidgetRef ref,
  required String userId,
}) async {
  try {
    final client = ref.read(fluxerClientProvider);
    final user = await client.users.getUserById(userId: userId);
    if (!context.mounted) {
      return;
    }
    await showDebugBottomSheet(
      context,
      title: FluxerLocalizations.of(context).dmDebugUser,
      data: user.toJson(),
      onCopied: (message) => ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(message: message, variant: FluxerToastVariant.success),
          ),
    );
  } on Exception catch (_) {
    // Ignore — failed to fetch user.
  }
}

Future<void> _showPinnedMessageActions(
  BuildContext context,
  WidgetRef ref, {
  required String channelId,
  required String? guildId,
  required PinnedMessageEntry entry,
}) async {
  final canUnpin = await _canUnpinMessage(
    ref,
    channelId: channelId,
    guildId: guildId,
  );
  if (!context.mounted) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final action = await FluxerBottomSheet.show<_PinnedMessageAction>(
    context,
    title: l10n.channelDetailsPinnedMessageTitle,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, _) {
      void pop(_PinnedMessageAction action) {
        Navigator.of(sheetContext).pop(action);
      }

      return FluxerBottomSheetContent(
        child: FluxerMenuGroup(
          children: [
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsJumpToMessage,
              icon: PhosphorIconsBold.arrowSquareOut,
              onTap: () => pop(_PinnedMessageAction.jump),
            ),
            if (canUnpin)
              FluxerBottomSheetMenuItem(
                label: l10n.channelDetailsUnpinMessage,
                icon: PhosphorIconsBold.pushPinSlash,
                isDanger: true,
                onTap: () => pop(_PinnedMessageAction.unpin),
              ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageLink,
              icon: PhosphorIconsBold.link,
              onTap: () => pop(_PinnedMessageAction.copyMessageLink),
            ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageId,
              icon: PhosphorIconsBold.snowflake,
              onTap: () => pop(_PinnedMessageAction.copyMessageId),
            ),
          ],
        ),
      );
    },
  );

  if (action == null || !context.mounted) {
    return;
  }
  switch (action) {
    case _PinnedMessageAction.jump:
      _popWithJumpRequest(context, message: entry.message, guildId: guildId);
    case _PinnedMessageAction.unpin:
      await ref.read(channelPinsProvider(channelId).notifier).unpin(entry);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.channelDetailsMessageUnpinned,
              variant: FluxerToastVariant.success,
            ),
          );
    case _PinnedMessageAction.copyMessageId:
      await copyToClipboard(context: context, value: entry.message.id);
    case _PinnedMessageAction.copyMessageLink:
      await copyToClipboard(
        context: context,
        value: messageLink(
          channelId: entry.message.channelId,
          messageId: entry.message.id,
          guildId: guildId,
        ),
      );
  }
}

Future<void> _showSearchMessageActions(
  BuildContext context,
  WidgetRef ref, {
  required MessageSearchResultEntry entry,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final action = await FluxerBottomSheet.show<_PinnedMessageAction>(
    context,
    title: l10n.channelDetailsSearchResultTitle,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, _) {
      void pop(_PinnedMessageAction action) {
        Navigator.of(sheetContext).pop(action);
      }

      return FluxerBottomSheetContent(
        child: FluxerMenuGroup(
          children: [
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsJumpToMessage,
              icon: PhosphorIconsBold.arrowSquareOut,
              onTap: () => pop(_PinnedMessageAction.jump),
            ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageLink,
              icon: PhosphorIconsBold.link,
              onTap: () => pop(_PinnedMessageAction.copyMessageLink),
            ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageId,
              icon: PhosphorIconsBold.snowflake,
              onTap: () => pop(_PinnedMessageAction.copyMessageId),
            ),
          ],
        ),
      );
    },
  );

  if (action == null || !context.mounted) {
    return;
  }
  switch (action) {
    case _PinnedMessageAction.jump:
      _popWithJumpRequest(
        context,
        message: entry.message,
        guildId: entry.guildId,
      );
    case _PinnedMessageAction.copyMessageId:
      await copyToClipboard(context: context, value: entry.message.id);
    case _PinnedMessageAction.copyMessageLink:
      await copyToClipboard(
        context: context,
        value: messageLink(
          channelId: entry.message.channelId,
          messageId: entry.message.id,
          guildId: entry.guildId,
        ),
      );
    case _PinnedMessageAction.unpin:
      break;
  }
}

Future<bool> _canUnpinMessage(
  WidgetRef ref, {
  required String channelId,
  required String? guildId,
}) async {
  if (guildId == null) {
    return true;
  }
  try {
    final int bits = await readEffectiveGuildChannelPermissionBits(
      container: ref.container,
      channelId: channelId,
    );
    return hasPermission(bits, Permission.pinMessages) ||
        hasPermission(bits, Permission.manageMessages);
  } on Object {
    return false;
  }
}

String? _detailsSubtitle({
  required FluxerLocalizations l10n,
  required Channel? channel,
  required DmConversation? dm,
}) {
  if (dm != null) {
    if (dm.isPersonalNotes) {
      return l10n.personalNotesPrivateSpace;
    }
    if (dm.isGroup) {
      return l10n.channelDetailsGroupDmSubtitle(dm.memberCount);
    }
    return dm.recipientTag ??
        (dm.isSystem ? l10n.channelDetailsSystemMessage : null);
  }
  if (channel != null) {
    return switch (channel.type) {
      ChannelType.guildText => l10n.channelDetailsTextChannel,
      ChannelType.guildVoice => l10n.channelDetailsVoiceChannel,
      ChannelType.guildCategory => l10n.channelDetailsCategory,
      ChannelType.guildLink => l10n.channelDetailsLinkChannel,
      ChannelType.dm ||
      ChannelType.groupDm ||
      ChannelType.dmPersonalNotes => l10n.channelDetailsGenericChannel,
    };
  }
  return null;
}

/// Pops the current route, handing the picked message back to its opener.
///
/// The sheet must not navigate itself: it is about to be dismissed, so any
/// context or ref it holds dies mid flight, and `close()` only starts the
/// dismissal so navigating here would race the animation.
void _popWithJumpRequest(
  BuildContext context, {
  required Message message,
  String? guildId,
}) {
  Navigator.of(
    context,
  ).pop(ChannelDetailsJumpRequest(message: message, guildId: guildId));
}

String _formatDate(DateTime dateTime) {
  final local = dateTime.toLocal();
  final h = local.hour.toString().padLeft(2, '0');
  final m = local.minute.toString().padLeft(2, '0');
  return '${local.month}/${local.day}/${local.year} $h:$m';
}

String _contentLabel(
  FluxerLocalizations l10n,
  MessageSearchContentFilter value,
) => switch (value) {
  MessageSearchContentFilter.image => l10n.channelDetailsSearchContentImage,
  MessageSearchContentFilter.video => l10n.channelDetailsSearchContentVideo,
  MessageSearchContentFilter.audio => l10n.channelDetailsSearchContentAudio,
  MessageSearchContentFilter.file => l10n.channelDetailsSearchContentFile,
  MessageSearchContentFilter.link => l10n.channelDetailsSearchContentLink,
  MessageSearchContentFilter.embed => l10n.channelDetailsSearchContentEmbed,
  MessageSearchContentFilter.sticker => l10n.channelDetailsSearchContentSticker,
  MessageSearchContentFilter.poll => l10n.channelDetailsSearchContentPoll,
  MessageSearchContentFilter.forward => l10n.channelDetailsSearchContentForward,
};

String _contentDescription(
  FluxerLocalizations l10n,
  MessageSearchContentFilter value,
) => switch (value) {
  MessageSearchContentFilter.image =>
    l10n.channelDetailsSearchContentImageDescription,
  MessageSearchContentFilter.video =>
    l10n.channelDetailsSearchContentVideoDescription,
  MessageSearchContentFilter.audio =>
    l10n.channelDetailsSearchContentAudioDescription,
  MessageSearchContentFilter.file =>
    l10n.channelDetailsSearchContentFileDescription,
  MessageSearchContentFilter.link =>
    l10n.channelDetailsSearchContentLinkDescription,
  MessageSearchContentFilter.embed =>
    l10n.channelDetailsSearchContentEmbedDescription,
  MessageSearchContentFilter.sticker =>
    l10n.channelDetailsSearchContentStickerDescription,
  MessageSearchContentFilter.poll =>
    l10n.channelDetailsSearchContentPollDescription,
  MessageSearchContentFilter.forward =>
    l10n.channelDetailsSearchContentForwardDescription,
};

IconData _contentIcon(MessageSearchContentFilter value) =>
    channelSearchContentIcon(value);
