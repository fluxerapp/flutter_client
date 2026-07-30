import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/moderation/providers/local_user_spam_override_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_message_stream_provider.g.dart';

@immutable
class ChannelMessageStreamInput {
  const ChannelMessageStreamInput({
    required this.messages,
    required this.oldestUnreadMessageId,
  });

  final List<Message> messages;
  final String? oldestUnreadMessageId;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ChannelMessageStreamInput &&
            identical(messages, other.messages) &&
            oldestUnreadMessageId == other.oldestUnreadMessageId;
  }

  @override
  int get hashCode => Object.hash(messages, oldestUnreadMessageId);
}

@Riverpod(keepAlive: true)
ChannelCollapseContext channelCollapseContext(Ref ref) {
  ref.watch(localUserSpamOverrideProvider);
  return ChannelCollapseContext(
    treatSpam: true,
    currentUserId: ref.watch(currentUserIdProvider),
    blockedUserIds: ref.watch(blockedUserIdsProvider),
    isUserMarkedAsSpammer: ref
        .read(localUserSpamOverrideProvider.notifier)
        .isUserMarkedAsSpammer,
  );
}

@Riverpod(keepAlive: true)
List<ChannelStreamItem> channelMessageStream(
  Ref ref,
  ChannelMessageStreamInput input,
) {
  final ChannelCollapseContext context = ref.watch(
    channelCollapseContextProvider,
  );
  if (input.messages.isEmpty) {
    return const <ChannelStreamItem>[];
  }
  return createChannelStream(
    messages: input.messages,
    oldestUnreadMessageId: input.oldestUnreadMessageId,
    context: context,
  );
}
