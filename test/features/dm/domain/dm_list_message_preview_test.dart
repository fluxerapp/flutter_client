import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/system_message_text.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/dm_list_message_preview.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  group('shouldShowDmMessagePreview', () {
    test('all mode always shows previews', () {
      expect(
        shouldShowDmMessagePreview(
          mode: DmMessagePreviewMode.all,
          hasUnread: false,
        ),
        isTrue,
      );
    });

    test('unread-only mode shows previews only when unread', () {
      expect(
        shouldShowDmMessagePreview(
          mode: DmMessagePreviewMode.unreadOnly,
          hasUnread: true,
        ),
        isTrue,
      );
      expect(
        shouldShowDmMessagePreview(
          mode: DmMessagePreviewMode.unreadOnly,
          hasUnread: false,
        ),
        isFalse,
      );
    });

    test('none mode hides previews', () {
      expect(
        shouldShowDmMessagePreview(
          mode: DmMessagePreviewMode.none,
          hasUnread: true,
        ),
        isFalse,
      );
    });
  });

  group('resolveDmListMessagePreview', () {
    late FluxerLocalizations l10n;

    setUpAll(() async {
      l10n = await FluxerLocalizations.delegate.load(const Locale('en'));
    });

    test('returns markdown preview for user messages with content', () {
      final DmListMessagePreview? preview = resolveDmListMessagePreview(
        l10n: l10n,
        conversation: DmConversation(
          id: '100',
          type: 1,
          recipientId: '200',
          recipientName: 'Monty',
          lastMessage: 'Hello **world**',
          lastMessageAuthorId: '200',
          lastMessageAuthorName: 'Monty',
          lastMessageTime: DateTime(2026),
        ),
        currentUserId: '1',
        authorFriendNickname: null,
      );

      expect(preview, isA<DmListMarkdownMessagePreview>());
      final DmListMarkdownMessagePreview markdown =
          preview! as DmListMarkdownMessagePreview;
      expect(markdown.authorPrefix, 'Monty: ');
      expect(markdown.content, 'Hello **world**');
    });

    test('returns attachment preview when content is empty', () {
      final DmListMessagePreview? preview = resolveDmListMessagePreview(
        l10n: l10n,
        conversation: DmConversation(
          id: '100',
          type: 1,
          recipientId: '200',
          recipientName: 'Monty',
          lastMessage: '',
          lastMessageAuthorId: '200',
          lastMessageAuthorName: 'Monty',
          lastMessageHasAttachments: true,
          lastMessageTime: DateTime(2026),
        ),
        currentUserId: '1',
        authorFriendNickname: null,
      );

      expect(preview, isA<DmListAttachmentMessagePreview>());
      expect(
        (preview! as DmListAttachmentMessagePreview).authorPrefix,
        'Monty: ',
      );
    });

    test('returns null for embed-only messages without content', () {
      final DmListMessagePreview? preview = resolveDmListMessagePreview(
        l10n: l10n,
        conversation: DmConversation(
          id: '100',
          type: 1,
          recipientId: '200',
          recipientName: 'Monty',
          lastMessage: '',
          lastMessageAuthorId: '200',
          lastMessageAuthorName: 'Monty',
          lastMessageTime: DateTime(2026),
        ),
        currentUserId: '1',
        authorFriendNickname: null,
      );

      expect(preview, isNull);
    });

    test('returns system preview for call messages', () {
      final DmListMessagePreview? preview = resolveDmListMessagePreview(
        l10n: l10n,
        conversation: DmConversation(
          id: '100',
          type: 1,
          recipientId: '200',
          recipientName: 'Monty',
          lastMessage: 'raw',
          lastMessageType: messageTypeCall,
          lastMessageAuthorId: '200',
          lastMessageAuthorName: 'Monty',
          lastMessageTime: DateTime(2026),
        ),
        currentUserId: '1',
        authorFriendNickname: null,
      );

      expect(preview, isA<DmListSystemMessagePreview>());
      expect(
        (preview! as DmListSystemMessagePreview).text,
        'Monty started a call',
      );
    });

    test('returns system preview for group DM recipient add', () {
      final DmListMessagePreview? preview = resolveDmListMessagePreview(
        l10n: l10n,
        conversation: DmConversation(
          id: '100',
          type: 3,
          recipientId: '0',
          recipientName: 'Group',
          name: 'Test Group',
          lastMessage: '',
          lastMessageType: messageTypeRecipientAdd,
          lastMessageAuthorId: '200',
          lastMessageAuthorName: 'Monty',
          lastMessageMentionedUserId: '300',
          lastMessageMentionedUserName: 'Alex',
          lastMessageTime: DateTime(2026),
          recipientCount: 3,
        ),
        currentUserId: '1',
        authorFriendNickname: null,
      );

      expect(preview, isA<DmListSystemMessagePreview>());
      expect(
        (preview! as DmListSystemMessagePreview).text,
        'Monty added Alex to the group',
      );
    });
  });

  group('stringifySystemMessageForDmListPreview', () {
    late FluxerLocalizations l10n;

    setUpAll(() async {
      l10n = await FluxerLocalizations.delegate.load(const Locale('en'));
    });

    test('strips trailing period for DM preview', () {
      final String? text = stringifySystemMessageForDmListPreview(
        l10n: l10n,
        messageType: messageTypeCall,
        messageId: '1',
        content: '',
        authorName: 'Monty',
      );
      expect(text, 'Monty started a call');
    });
  });
}
