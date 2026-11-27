import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_keyboard_actions.dart';

const String _me = '1';
const String _other = '2';

Message _message(
  String id, {
  String authorId = _me,
  int type = messageTypeDefault,
  MessageDeliveryState deliveryState = MessageDeliveryState.sent,
}) {
  return Message(
    id: id,
    channelId: 'c',
    authorId: authorId,
    authorName: 'name',
    content: 'content $id',
    timestamp: DateTime.utc(2026),
    type: type,
    deliveryState: deliveryState,
  );
}

void main() {
  group('lastEditableComposerMessage', () {
    test('picks the newest sent message from the current user', () {
      final List<Message> messages = <Message>[
        _message('a'),
        _message('b'),
        _message('c', authorId: _other),
        _message('d', deliveryState: MessageDeliveryState.failed),
        _message('e', deliveryState: MessageDeliveryState.sending),
        _message('f', type: messageTypeClientSystem),
        _message('g', type: messageTypeUserJoin),
      ];
      expect(lastEditableComposerMessage(messages, _me)?.id, 'b');
    });

    test('returns null without a current user or own messages', () {
      expect(
        lastEditableComposerMessage(<Message>[_message('a')], null),
        isNull,
      );
      expect(
        lastEditableComposerMessage(<Message>[
          _message('a', authorId: _other),
        ], _me),
        isNull,
      );
    });
  });

  group('applyComposerCodeIndent', () {
    test('inserts a tab inside code and moves the caret', () {
      final TextEditingValue? next = applyComposerCodeIndent(
        const TextEditingValue(
          text: '```\nfoo\n```',
          selection: TextSelection.collapsed(offset: 7),
        ),
        unindent: false,
      );
      expect(next?.text, '```\nfoo\t\n```');
      expect(next?.selection, const TextSelection.collapsed(offset: 8));
    });

    test('outdents selected lines', () {
      final TextEditingValue? next = applyComposerCodeIndent(
        const TextEditingValue(
          text: '```\n\tfoo\n    bar\n```',
          selection: TextSelection(baseOffset: 5, extentOffset: 16),
        ),
        unindent: true,
      );
      expect(next?.text, '```\nfoo\nbar\n```');
      expect(
        next?.selection,
        const TextSelection(baseOffset: 4, extentOffset: 11),
      );
    });

    test('returns null outside code', () {
      expect(
        applyComposerCodeIndent(
          const TextEditingValue(
            text: 'plain',
            selection: TextSelection.collapsed(offset: 2),
          ),
          unindent: false,
        ),
        isNull,
      );
    });
  });

  test('composerSelectionInCodeBlock follows the caret', () {
    expect(
      composerSelectionInCodeBlock(
        const TextEditingValue(
          text: '```\nfoo',
          selection: TextSelection.collapsed(offset: 7),
        ),
      ),
      isTrue,
    );
    expect(
      composerSelectionInCodeBlock(
        const TextEditingValue(
          text: '```\nfoo\n```\nbar',
          selection: TextSelection.collapsed(offset: 14),
        ),
      ),
      isFalse,
    );
  });
}
