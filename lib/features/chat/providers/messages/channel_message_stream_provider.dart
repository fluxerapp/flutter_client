import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/utils/messages/channel_message_stream.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/moderation/providers/local_user_spam_override_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_message_stream_provider.g.dart';

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
