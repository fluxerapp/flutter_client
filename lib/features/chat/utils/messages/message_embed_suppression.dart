import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';

Future<void> toggleMessageEmbedSuppression({
  required WidgetRef ref,
  required Message message,
}) {
  final int nextFlags = message.suppressEmbeds
      ? message.flags & ~messageFlagSuppressEmbeds
      : message.flags | messageFlagSuppressEmbeds;
  return ref
      .read(messageRepositoryProvider)
      .setMessageFlags(
        channelId: message.channelId,
        messageId: message.id,
        flags: nextFlags,
      );
}
