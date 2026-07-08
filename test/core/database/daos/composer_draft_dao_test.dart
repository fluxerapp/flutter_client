import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('upsertDraft stores and reads text with reply id', () async {
    final db = openTestDatabase();

    await db.composerDraftDao.upsertDraft(
      channelId: 'channel-1',
      content: 'Hello draft',
      replyToMessageId: 'msg-reply',
    );

    final draft = await db.composerDraftDao.getDraft('channel-1');
    expect(draft?.content, 'Hello draft');
    expect(draft?.replyToMessageId, 'msg-reply');
  });

  test('upsertDraft updates existing draft for channel', () async {
    final db = openTestDatabase();

    await db.composerDraftDao.upsertDraft(
      channelId: 'channel-1',
      content: 'First',
    );
    await db.composerDraftDao.upsertDraft(
      channelId: 'channel-1',
      content: 'Updated',
      replyToMessageId: 'msg-2',
    );

    final draft = await db.composerDraftDao.getDraft('channel-1');
    expect(draft?.content, 'Updated');
    expect(draft?.replyToMessageId, 'msg-2');
  });

  test('deleteDraft removes draft for channel', () async {
    final db = openTestDatabase();

    await db.composerDraftDao.upsertDraft(
      channelId: 'channel-1',
      content: 'Draft',
    );
    await db.composerDraftDao.deleteDraft('channel-1');

    final draft = await db.composerDraftDao.getDraft('channel-1');
    expect(draft, isNull);
  });

  test('clearAll removes all drafts', () async {
    final db = openTestDatabase();

    await db.composerDraftDao.upsertDraft(
      channelId: 'channel-1',
      content: 'Draft 1',
    );
    await db.composerDraftDao.upsertDraft(
      channelId: 'channel-2',
      content: 'Draft 2',
    );
    await db.composerDraftDao.clearAll();

    expect(await db.composerDraftDao.getDraft('channel-1'), isNull);
    expect(await db.composerDraftDao.getDraft('channel-2'), isNull);
  });
}
