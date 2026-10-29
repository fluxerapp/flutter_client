import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/android/conversation/history.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  const String tag = 'channel:1';
  const Map<String, String> payload = <String, String>{
    'channel_id': '1',
    'target_user_id': 'user-9',
    'guild_id': '99',
  };

  PushConversationLine line(String id, {String body = 'hi'}) {
    return PushConversationLine(
      messageId: id,
      senderName: 'Alice',
      senderKey: 'alice',
      body: body,
      timestampMs: int.parse(id),
    );
  }

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('fluxer_push_hist_');
    AndroidPushConversationHistoryStore.testRoot = tempDir;
    await AndroidPushConversationHistoryStore.clearAll();
  });

  tearDown(() async {
    AndroidPushConversationHistoryStore.testRoot = null;
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('append and replace by message id', () async {
    final PushConversationState first =
        await AndroidPushConversationHistoryStore.appendLine(
          conversationTag: tag,
          line: line('10', body: 'one'),
          payload: payload,
        );
    expect(first.lines, hasLength(1));
    expect(first.lines.single.body, 'one');
    expect(first.payload['target_user_id'], 'user-9');

    final PushConversationState second =
        await AndroidPushConversationHistoryStore.appendLine(
          conversationTag: tag,
          line: line('10', body: 'updated'),
          payload: payload,
        );
    expect(second.lines, hasLength(1));
    expect(second.lines.single.body, 'updated');
  });

  test('caps history at ten lines', () async {
    for (var i = 1; i <= 12; i++) {
      await AndroidPushConversationHistoryStore.appendLine(
        conversationTag: tag,
        line: line(i.toString()),
        payload: payload,
      );
    }
    final PushConversationState? state =
        await AndroidPushConversationHistoryStore.readState(tag);
    expect(state?.lines, hasLength(kPushConversationHistoryMaxLines));
    expect(state?.lines.first.messageId, '3');
    expect(state?.lines.last.messageId, '12');
  });

  test('reuses a sender avatar when a later download fails', () async {
    await AndroidPushConversationHistoryStore.appendLine(
      conversationTag: tag,
      line: const PushConversationLine(
        messageId: '10',
        senderName: 'Alice',
        senderKey: 'alice',
        body: 'one',
        timestampMs: 10,
        avatarPath: '/cache/alice.png',
      ),
      payload: payload,
    );
    final PushConversationState state =
        await AndroidPushConversationHistoryStore.appendLine(
          conversationTag: tag,
          line: line('11', body: 'two'),
          payload: payload,
        );
    expect(state.lines.last.avatarPath, '/cache/alice.png');
  });

  test('trimAck drops covered lines and keeps newer ones', () async {
    await AndroidPushConversationHistoryStore.appendLine(
      conversationTag: tag,
      line: line('5'),
      payload: payload,
    );
    await AndroidPushConversationHistoryStore.appendLine(
      conversationTag: tag,
      line: line('20'),
      payload: payload,
    );
    final PushConversationState? remaining =
        await AndroidPushConversationHistoryStore.trimAck(
          conversationTag: tag,
          upToMessageId: '10',
        );
    expect(remaining?.lines.map((PushConversationLine l) => l.messageId), [
      '20',
    ]);
    expect(remaining?.payload['target_user_id'], 'user-9');
  });

  test('trimAck with missing id clears the conversation', () async {
    await AndroidPushConversationHistoryStore.appendLine(
      conversationTag: tag,
      line: line('5'),
      payload: payload,
    );
    final PushConversationState? remaining =
        await AndroidPushConversationHistoryStore.trimAck(conversationTag: tag);
    expect(remaining, isNull);
    expect(await AndroidPushConversationHistoryStore.readState(tag), isNull);
  });
}
