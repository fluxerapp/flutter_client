import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_types.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';

class QuickSwitcherResultUnreadState {
  const QuickSwitcherResultUnreadState({
    this.mentionCount = 0,
    this.hasUnread = false,
  });

  final int mentionCount;
  final bool hasUnread;

  bool get shouldHighlight => hasUnread;
}

String? quickSwitcherResultChannelId(QuickSwitcherResult result) =>
    switch (result) {
      QuickSwitcherUserResult(:final dmChannelId) => dmChannelId,
      QuickSwitcherGroupDmResult(:final channelId) => channelId,
      QuickSwitcherTextChannelResult(:final channelId) => channelId,
      QuickSwitcherVoiceChannelResult(:final channelId) => channelId,
      _ => null,
    };

QuickSwitcherResultUnreadState quickSwitcherUnreadStateForResult({
  required QuickSwitcherResult result,
  required Map<String, QuickSwitcherUnreadChannel> unreadByChannelId,
  required bool isActive,
}) {
  final String? channelId = quickSwitcherResultChannelId(result);
  if (channelId == null) {
    return const QuickSwitcherResultUnreadState();
  }
  final QuickSwitcherUnreadChannel? unread = unreadByChannelId[channelId];
  if (unread == null) {
    return const QuickSwitcherResultUnreadState();
  }
  return QuickSwitcherResultUnreadState(
    mentionCount: unread.mentionCount,
    hasUnread: unread.hasUnread && !isActive,
  );
}
