import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/favorite_media_utils.dart';

void main() {
  test('findFavoritedMedia matches by content hash before attachment id', () {
    const savedMedia = <FavoriteMeme>[
      FavoriteMeme(
        id: '1',
        userId: 'user',
        name: 'hash match',
        altText: null,
        tags: [],
        attachmentId: 'attachment-a',
        filename: 'a.png',
        contentType: 'image/png',
        contentHash: 'hash-a',
        size: 1,
        width: 1,
        height: 1,
        duration: null,
        isGifv: false,
        url: 'https://example/a.png',
        klipySlug: null,
        tenorSlugId: null,
      ),
    ];

    expect(
      findFavoritedMedia(
        savedMedia,
        contentHash: 'hash-a',
        attachmentId: 'other',
      ),
      savedMedia.first,
    );
  });

  test('deriveDefaultNameFromAttachment prefers title and filename', () {
    expect(
      deriveDefaultNameFromAttachment(
        const Attachment(
          id: '1',
          filename: 'cool-cat.png',
          url: 'https://example/cat.png',
          title: 'Cool Cat',
          contentType: 'image/png',
        ),
      ),
      'Cool Cat',
    );

    expect(
      deriveDefaultNameFromAttachment(
        const Attachment(
          id: '1',
          filename: 'cool-cat.png',
          url: 'https://example/cat.png',
          contentType: 'image/png',
        ),
      ),
      'cool cat',
    );
  });

  test(
    'canSaveMessageMediaToFavorites requires message scope and media target',
    () {
      final scope = MessageMediaActionScope(
        message: _messageForFavoriteScopeTest,
        permissions: const MessageActionPermissions(
          isOwnMessage: true,
          isDmChannel: false,
          canDelete: false,
          canReport: false,
          canAddReactions: false,
          canPinMessage: false,
          canManageMessages: false,
          canSendMessages: true,
          developerMode: false,
        ),
        callbacks: const MessageActionCallbacks(),
      );

      expect(
        canSaveMessageMediaToFavorites(
          actionScope: scope,
          attachmentId: 'attachment',
          embedIndex: null,
          attachment: _messageForFavoriteScopeTest.attachments.first,
        ),
        isFalse,
      );

      expect(
        canSaveMessageMediaToFavorites(
          actionScope: scope,
          attachmentId: null,
          embedIndex: 0,
        ),
        isTrue,
      );
    },
  );
}

final Message _messageForFavoriteScopeTest = Message(
  id: 'message',
  channelId: 'channel',
  authorId: 'author',
  authorName: 'Author',
  content: '',
  timestamp: DateTime(2026),
  attachments: const [
    Attachment(
      id: 'attachment',
      filename: 'notes.pdf',
      url: 'https://example/notes.pdf',
      contentType: 'application/pdf',
    ),
  ],
);
