import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';

Message? adjacentMessage({
  required List<Message> messages,
  required String? currentMessageId,
  required int direction,
  required bool Function(Message message) predicate,
}) {
  final List<Message> candidates = messages.where(predicate).toList();
  if (candidates.isEmpty) {
    return null;
  }
  final int index = currentMessageId == null
      ? -1
      : candidates.indexWhere((Message m) => m.id == currentMessageId);
  if (index == -1) {
    return candidates.last;
  }
  if (direction < 0) {
    return candidates[index > 0 ? index - 1 : 0];
  }
  return index + 1 < candidates.length ? candidates[index + 1] : null;
}

bool _isSentUserMessage(Message message) =>
    !message.isSending &&
    !message.hasFailed &&
    message.isUserMessage &&
    !message.isClientSystemMessage;

bool stepAdjacentReply(WidgetRef ref, {required int direction}) {
  final ChatViewState state = ref.read(chatViewModelProvider);
  if (state.channelId.isEmpty) {
    return false;
  }
  final Set<String> blocked = ref.read(blockedUserIdsProvider);
  final Message? target = adjacentMessage(
    messages: state.messages,
    currentMessageId: state.replyingTo?.id,
    direction: direction,
    predicate: (Message message) =>
        _isSentUserMessage(message) && !blocked.contains(message.authorId),
  );
  final ChatViewModel chat = ref.read(chatViewModelProvider.notifier);
  if (target == null) {
    chat.cancelReply();
    return true;
  }
  final bool canSend =
      ref
          .read(channelMessagePermissionsProvider(state.channelId))
          .value
          ?.canSendMessages ??
      true;
  if (!canSend) {
    return false;
  }
  chat
    ..startReply(target)
    ..scrollToMessage(target.id);
  return true;
}

bool stepAdjacentEdit(WidgetRef ref, {required int direction}) {
  final ChatViewState state = ref.read(chatViewModelProvider);
  final String? currentUserId = ref.read(currentUserIdProvider);
  if (state.channelId.isEmpty || currentUserId == null) {
    return false;
  }
  final String? editingId = state.editingMessage?.id;
  final Message? target = adjacentMessage(
    messages: state.messages,
    currentMessageId: editingId,
    direction: direction,
    predicate: (Message message) =>
        _isSentUserMessage(message) &&
        message.authorId == currentUserId &&
        message.messageSnapshots.isEmpty,
  );
  final ChatViewModel chat = ref.read(chatViewModelProvider.notifier);
  if (target == null) {
    if (editingId == null) {
      return false;
    }
    chat.cancelEdit();
    return true;
  }
  chat
    ..startEdit(target)
    ..scrollToMessage(target.id);
  return true;
}

bool canToggleEmbedsFromKeybind(WidgetRef ref, Message message) {
  final bool isDmChannel = ref.read(activeGuildIdProvider) == null;
  final int? bits = ref
      .read(channelPermissionCacheProvider(readAccountUserId(ref)))
      .effective[message.channelId];
  return canSuppressEmbedsOnMessage(
    message: message,
    isOwnMessage: message.authorId == ref.read(currentUserIdProvider),
    isDmChannel: isDmChannel,
    canDelete: canManageMessagesInChannel(
      isDmChannel: isDmChannel,
      channelPermissionBits: bits,
    ),
  );
}
