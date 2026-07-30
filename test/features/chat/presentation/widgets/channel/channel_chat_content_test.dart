import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';

void main() {
  const switchRequest = (
    channelId: 'channel-1',
    targetMessageId: null as String?,
    loadMessages: true,
  );

  group('shouldDedupChannelChatSwitchRequest', () {
    test('retries when the channel matches but messages are still empty', () {
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: switchRequest,
          request: switchRequest,
          state: _chatState(channelId: 'channel-1'),
        ),
        isFalse,
      );
    });

    test('dedups when messages are already loaded', () {
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: switchRequest,
          request: switchRequest,
          state: _chatState(
            channelId: 'channel-1',
            messages: <Message>[_message(id: 'msg-1')],
          ),
        ),
        isTrue,
      );
    });

    test('retries target sync until the target message is present', () {
      const targetRequest = (
        channelId: 'channel-1',
        targetMessageId: 'target',
        loadMessages: true,
      );
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: targetRequest,
          request: targetRequest,
          state: _chatState(channelId: 'channel-1'),
        ),
        isFalse,
      );
    });

    test('retries when loading stalled with empty messages', () {
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: switchRequest,
          request: switchRequest,
          state: _chatState(channelId: 'channel-1', isLoading: true),
        ),
        isFalse,
      );
    });

    test(
      'dedups when a load is in progress and messages are already present',
      () {
        expect(
          shouldDedupChannelChatSwitchRequest(
            lastRequest: switchRequest,
            request: switchRequest,
            state: _chatState(
              channelId: 'channel-1',
              isLoading: true,
              messages: <Message>[_message(id: 'msg-1')],
            ),
          ),
          isTrue,
        );
      },
    );
  });

  group('shouldResyncStrandedEmptyChannel', () {
    test('requests resync for matched empty idle channel', () {
      expect(
        shouldResyncStrandedEmptyChannel(
          widgetChannelId: 'channel-1',
          state: _chatState(channelId: 'channel-1'),
          alreadyResyncedChannelId: null,
          canSyncForRoute: true,
        ),
        isTrue,
      );
    });

    test('skips when already resynced once', () {
      expect(
        shouldResyncStrandedEmptyChannel(
          widgetChannelId: 'channel-1',
          state: _chatState(channelId: 'channel-1'),
          alreadyResyncedChannelId: 'channel-1',
          canSyncForRoute: true,
        ),
        isFalse,
      );
    });

    test('skips while loading', () {
      expect(
        shouldResyncStrandedEmptyChannel(
          widgetChannelId: 'channel-1',
          state: _chatState(channelId: 'channel-1', isLoading: true),
          alreadyResyncedChannelId: null,
          canSyncForRoute: true,
        ),
        isFalse,
      );
    });
  });
}

ChatViewState _chatState({
  required String channelId,
  List<Message> messages = const <Message>[],
  bool isLoading = false,
}) {
  return ChatViewState(
    channelId: channelId,
    messages: messages,
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: isLoading,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );
}

Message _message({required String id}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: 'user-1',
    authorName: 'User',
    content: 'hello',
    timestamp: DateTime.utc(2026),
  );
}
