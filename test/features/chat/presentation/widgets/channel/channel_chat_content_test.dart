import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
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
    test('a settled empty channel is the answer, not a retry', () {
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: switchRequest,
          request: switchRequest,
          state: _chatState(channelId: 'channel-1'),
        ),
        isTrue,
      );
    });

    test('retries when the load failed', () {
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: switchRequest,
          request: switchRequest,
          state: _chatState(channelId: 'channel-1', messageLoadFailed: true),
        ),
        isFalse,
      );
    });

    test("retries when the loaded window has another channel's messages", () {
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: switchRequest,
          request: switchRequest,
          state: _chatState(
            channelId: 'channel-1',
            messages: <Message>[_message(id: 'msg-1', channelId: 'channel-2')],
          ),
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

    test('an unsatisfied target sync keeps retrying once the target leaves '
        'the loaded window', () {
      const targetRequest = (
        channelId: 'channel-1',
        targetMessageId: 'target',
        loadMessages: true,
      );
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: targetRequest,
          request: targetRequest,
          state: _chatState(
            channelId: 'channel-1',
            messages: <Message>[_message(id: 'target')],
          ),
        ),
        isTrue,
        reason: 'baseline: a landed jump is deduped',
      );
      expect(
        shouldDedupChannelChatSwitchRequest(
          lastRequest: targetRequest,
          request: targetRequest,
          state: _chatState(
            channelId: 'channel-1',
            messages: <Message>[_message(id: 'newer-1')],
          ),
        ),
        isFalse,
        reason:
            'THE LOOP: identical request, no remount, yet the stale target is '
            'reissued. This assertion must flip to isTrue when C1 is fixed.',
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

  group('shouldConsumeChannelJumpTarget', () {
    const ChannelJumpTargetConsumption open = ChannelJumpTargetConsumption();

    test('consumes on a null to matching signal transition', () {
      expect(
        shouldConsumeChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: open,
          previousSignal: null,
          nextSignal: ('target', 1),
        ),
        isTrue,
      );
    });

    test('does not consume when no signal has been commanded', () {
      expect(
        shouldConsumeChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: open,
          previousSignal: null,
          nextSignal: null,
        ),
        isFalse,
        reason:
            'an interrupted jump commands nothing, so it must stay retryable',
      );
    });

    test('does not consume a stale signal that did not change', () {
      expect(
        shouldConsumeChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: open,
          previousSignal: ('target', 1),
          nextSignal: ('target', 1),
        ),
        isFalse,
        reason:
            'no transition means no new command; consuming here would swallow '
            'a re-tap to the same message',
      );
    });

    test('does not consume a signal for a different message', () {
      expect(
        shouldConsumeChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: open,
          previousSignal: null,
          nextSignal: ('other', 1),
        ),
        isFalse,
      );
    });

    test('does not consume an intent that is already consumed', () {
      expect(
        shouldConsumeChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: ChannelJumpTargetConsumption(
            consumedKeys: <String>{
              ChannelJumpTargetConsumption.keyFor(
                channelId: 'channel-1',
                messageId: 'target',
              ),
            },
          ),
          previousSignal: null,
          nextSignal: ('target', 1),
        ),
        isFalse,
      );
    });

    test('consumes an unregistered target once the jump is commanded', () {
      expect(
        shouldConsumeChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: const ChannelJumpTargetConsumption(),
          previousSignal: null,
          nextSignal: ('target', 1),
        ),
        isTrue,
      );
    });

    test('has nothing to consume without a route target', () {
      expect(
        shouldConsumeChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: null,
          consumption: open,
          previousSignal: null,
          nextSignal: ('target', 1),
        ),
        isFalse,
      );
    });
  });

  group('buildChannelChatSyncRequest', () {
    test(
      'omits a consumed target from the request it hands to switchChannel',
      () {
        expect(
          buildChannelChatSyncRequest(
            channelId: 'channel-1',
            routeTarget: 'target',
            consumption: ChannelJumpTargetConsumption(
              consumedKeys: <String>{
                ChannelJumpTargetConsumption.keyFor(
                  channelId: 'channel-1',
                  messageId: 'target',
                ),
              },
            ),
          ),
          (channelId: 'channel-1', targetMessageId: null, loadMessages: true),
          reason:
              'a targeted request here refetches the window around the stale '
              'search result on every unrelated rebuild',
        );
      },
    );

    test('carries an unconsumed target through', () {
      expect(
        buildChannelChatSyncRequest(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: const ChannelJumpTargetConsumption(),
        ),
        (channelId: 'channel-1', targetMessageId: 'target', loadMessages: true),
      );
    });
  });

  group('resolveEffectiveChannelJumpTarget', () {
    const ChannelJumpTargetConsumption none = ChannelJumpTargetConsumption();

    test('honours a fresh route target', () {
      expect(
        resolveEffectiveChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: none,
        ),
        'target',
      );
    });

    test('drops a target whose jump intent was already consumed', () {
      expect(
        resolveEffectiveChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'target',
          consumption: ChannelJumpTargetConsumption(
            consumedKeys: <String>{
              ChannelJumpTargetConsumption.keyFor(
                channelId: 'channel-1',
                messageId: 'target',
              ),
            },
          ),
        ),
        isNull,
        reason:
            'the route still carries the id, so honouring it again refetches '
            'the window around a stale search result on every rebuild',
      );
    });

    test('still honours a different message in the same channel', () {
      expect(
        resolveEffectiveChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: 'other',
          consumption: ChannelJumpTargetConsumption(
            consumedKeys: <String>{
              ChannelJumpTargetConsumption.keyFor(
                channelId: 'channel-1',
                messageId: 'target',
              ),
            },
          ),
        ),
        'other',
      );
    });

    test('still honours the same id in a different channel', () {
      expect(
        resolveEffectiveChannelJumpTarget(
          channelId: 'channel-2',
          routeTarget: 'target',
          consumption: ChannelJumpTargetConsumption(
            consumedKeys: <String>{
              ChannelJumpTargetConsumption.keyFor(
                channelId: 'channel-1',
                messageId: 'target',
              ),
            },
          ),
        ),
        'target',
      );
    });

    test('has nothing to apply without a route target', () {
      expect(
        resolveEffectiveChannelJumpTarget(
          channelId: 'channel-1',
          routeTarget: null,
          consumption: none,
        ),
        isNull,
      );
    });
  });

  group('shouldResyncMismatchedChatWindow', () {
    test('resyncs when the view model is on another channel', () {
      expect(
        shouldResyncMismatchedChatWindow(
          widgetChannelId: 'channel-1',
          state: _chatState(channelId: 'channel-2'),
        ),
        isTrue,
      );
    });

    test('resyncs when messages belong to another channel', () {
      expect(
        shouldResyncMismatchedChatWindow(
          widgetChannelId: 'channel-1',
          state: _chatState(
            channelId: 'channel-1',
            messages: <Message>[_message(id: 'msg-1', channelId: 'channel-2')],
          ),
        ),
        isTrue,
      );
    });

    test('skips a matching window', () {
      expect(
        shouldResyncMismatchedChatWindow(
          widgetChannelId: 'channel-1',
          state: _chatState(
            channelId: 'channel-1',
            messages: <Message>[_message(id: 'msg-1')],
          ),
        ),
        isFalse,
      );
    });
  });

  group('shouldScheduleMismatchedChatWindowResync', () {
    test('waits while the view model is loading', () {
      expect(
        shouldScheduleMismatchedChatWindowResync(
          state: _chatState(channelId: 'channel-2', isLoading: true),
        ),
        isFalse,
      );
    });

    test('schedules when the view model is idle', () {
      expect(
        shouldScheduleMismatchedChatWindowResync(
          state: _chatState(channelId: 'channel-2'),
        ),
        isTrue,
      );
    });
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
  bool messageLoadFailed = false,
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
    messageLoadFailed: messageLoadFailed,
  );
}

Message _message({required String id, String channelId = 'channel-1'}) {
  return Message(
    id: id,
    channelId: channelId,
    authorId: 'user-1',
    authorName: 'User',
    content: 'hello',
    timestamp: DateTime.utc(2026),
  );
}
