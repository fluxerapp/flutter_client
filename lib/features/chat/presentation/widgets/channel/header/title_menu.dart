import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar/guild_sidebar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/author/message_author_context_menu.dart';
import 'package:fluxer_app/features/chat/utils/messages/delete_my_messages_in_channel_action.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_navbar_context_menu.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

Future<void> showChannelHeaderTitleMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
  Channel? channel,
  DmConversation? dm,
}) async {
  if (channel != null && !channel.isThread) {
    final Guild? guild = ref
        .read(guildListViewModelProvider)
        .guilds
        .where((Guild g) => g.id == channel.guildId)
        .firstOrNull;
    if (guild == null) {
      return;
    }
    await showGuildChannelContextMenu(
      context,
      ref,
      channel: channel,
      guild: guild,
      position: position,
    );
    return;
  }
  if (dm == null || dm.isPersonalNotes) {
    return;
  }
  if (!dm.isGroup) {
    await showMessageAuthorContextMenu(
      context,
      ref,
      position: position,
      target: MessageAuthorMenuTarget(userId: dm.recipientId, channelId: dm.id),
    );
    return;
  }
  await _showGroupDmMenu(context, ref, position: position, dm: dm);
}

Future<void> _showGroupDmMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
  required DmConversation dm,
}) async {
  final bool isMuted =
      ref.read(mutedDmChannelIdsProvider).value?.contains(dm.id) ?? false;
  final bool isPinned =
      ref.read(pinnedDmChannelIdsProvider).value?.contains(dm.id) ?? false;
  final DmNavbarAction? action = await showDmNavbarContextMenu(
    context,
    position: position,
    channelId: dm.id,
    hasUnread: ref.read(unreadDmChannelsProvider).hasUnread(dm.id),
    isMuted: isMuted,
    isPinned: isPinned,
    isCollapsed: false,
    isAllowlisted: false,
    isGroupDm: true,
  );
  if (action == null || !context.mounted) {
    return;
  }
  final repository = ref.read(dmRepositoryProvider);
  switch (action) {
    case DmNavbarAction.markAsRead:
      unawaited(repository.markAsRead(dm.id));
    case DmNavbarAction.mute:
      unawaited(repository.muteDm(dm.id));
    case DmNavbarAction.unmute:
      unawaited(repository.unmuteDm(dm.id));
    case DmNavbarAction.pinDm:
      unawaited(repository.pinDm(dm.id));
    case DmNavbarAction.unpinDm:
      unawaited(repository.unpinDm(dm.id));
    case DmNavbarAction.deleteMyMessages:
      unawaited(
        confirmAndDeleteMyMessagesInChannel(
          context,
          ref,
          channelId: dm.id,
          isPrivateConversation: true,
        ),
      );
    case DmNavbarAction.closeDm:
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      await FluxerConfirmModal.show(
        context,
        title: l10n.dmLeaveGroup,
        description: l10n.channelDetailsLeaveGroupDescription(
          dm.name ?? dm.recipientName,
        ),
        confirmLabel: l10n.dmLeaveGroup,
        isDanger: true,
        onConfirm: () => unawaited(
          ref
              .read(dmViewModelProvider.notifier)
              .closeDmChannel(dm.id, isGroup: true),
        ),
      );
    case DmNavbarAction.copyChannelId:
      unawaited(copyToClipboard(context: context, value: dm.id));
    case DmNavbarAction.copyUserId:
      unawaited(copyToClipboard(context: context, value: dm.recipientId));
    case DmNavbarAction.alwaysShow:
    case DmNavbarAction.removeAlwaysShow:
      return;
  }
}
