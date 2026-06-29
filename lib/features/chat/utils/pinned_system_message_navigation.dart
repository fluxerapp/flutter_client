import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';

Future<void> jumpToPinnedSystemMessage(
  WidgetRef ref, {
  required Message message,
}) {
  final String? pinnedMessageId = message.messageReference?.messageId;
  if (pinnedMessageId == null || pinnedMessageId.isEmpty) {
    return Future<void>.value();
  }
  return ref
      .read(chatViewModelProvider.notifier)
      .goToRepliedMessage(
        channelId: message.channelId,
        messageId: pinnedMessageId,
      );
}
