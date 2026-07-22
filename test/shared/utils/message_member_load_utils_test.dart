import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/utils/message_member_load_utils.dart';

Message _message({
  required String id,
  String authorId = 'author-1',
  List<String> mentionedUserIds = const <String>[],
  List<String> supplementalUserIds = const <String>[],
  List<MessageSnapshot> snapshots = const <MessageSnapshot>[],
  String? webhookId,
}) {
  return Message(
    id: id,
    channelId: 'channel-1',
    authorId: authorId,
    authorName: 'Author',
    content: 'hello',
    timestamp: DateTime.utc(2026),
    mentionedUserIds: mentionedUserIds,
    supplementalUserIds: supplementalUserIds,
    messageSnapshots: snapshots,
    webhookId: webhookId,
  );
}

void main() {
  test(
    'collectMessageMemberUserIds gathers authors mentions and snapshots',
    () {
      final Set<String> actual = collectMessageMemberUserIds(<Message>[
        _message(
          id: 'm-1',
          mentionedUserIds: <String>['mention-1', 'mention-2'],
          supplementalUserIds: <String>['supplemental-1'],
          snapshots: <MessageSnapshot>[
            MessageSnapshot(
              timestamp: DateTime.utc(2026),
              mentions: <String>['snapshot-1'],
            ),
          ],
        ),
      ], currentUserId: 'self');

      expect(actual, <String>{
        'author-1',
        'mention-1',
        'mention-2',
        'supplemental-1',
        'snapshot-1',
      });
    },
  );

  test(
    'collectMessageMemberUserIds skips webhook authors and current user',
    () {
      final Set<String> actual = collectMessageMemberUserIds(<Message>[
        _message(id: 'm-1', authorId: 'self', webhookId: 'webhook-1'),
        _message(id: 'm-2', authorId: 'other'),
      ], currentUserId: 'self');

      expect(actual, <String>{'other'});
    },
  );

  test('collectMessageMemberUserIds dedupes embedded reply parents', () {
    final Message parent = _message(
      id: 'parent',
      authorId: 'parent-author',
      mentionedUserIds: <String>['shared'],
    );
    final Set<String> actual = collectMessageMemberUserIds(
      <Message>[
        _message(id: 'child', mentionedUserIds: <String>['shared']),
      ],
      embeddedReplyParents: <Message>[parent],
    );

    expect(actual, <String>{'author-1', 'shared', 'parent-author'});
  });
}
