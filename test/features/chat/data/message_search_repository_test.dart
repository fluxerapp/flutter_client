import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart' as domain;
import 'package:fluxer_dart/export.dart';

void main() {
  group('buildGlobalSearchMessagesRequest', () {
    test('maps default current-channel search request', () {
      final request = buildGlobalSearchMessagesRequest(
        MessageSearchQuery.build(
          channelId: 'channel-1',
          guildId: 'guild-1',
          rawQuery: '  hello  ',
        ),
      );

      expect(request.hitsPerPage, kMessageSearchPageSize);
      expect(request.page, 1);
      expect(request.content, 'hello');
      expect(request.scope, GlobalSearchMessagesRequestScopeScope.current);
      expect(request.contextChannelId, 'channel-1');
      expect(request.contextGuildId, 'guild-1');
      expect(request.sortBy, GlobalSearchMessagesRequestSortBySortBy.timestamp);
      expect(
        request.sortOrder,
        GlobalSearchMessagesRequestSortOrderSortOrder.desc,
      );
      expect(request.authorId, isNull);
      expect(request.has, isNull);
    });

    test('maps author, content types, scope, sort, and page filters', () {
      final request = buildGlobalSearchMessagesRequest(
        MessageSearchQuery.build(
          channelId: 'channel-1',
          guildId: 'guild-1',
          rawQuery: '',
          uiScope: MessageSearchScopeFilter.allGuilds,
          uiSort: MessageSearchSortFilter.oldest,
          chipAuthorId: 'user-1, user-2',
          chipContentTypes: const <MessageSearchContentFilter>{
            MessageSearchContentFilter.image,
            MessageSearchContentFilter.audio,
          },
        ).copyWith(page: 7),
      );

      expect(request.page, 7);
      expect(request.authorId, ['user-1', 'user-2']);
      expect(request.has, [
        GlobalSearchMessagesRequestHasHas.image,
        GlobalSearchMessagesRequestHasHas.sound,
      ]);
      expect(request.scope, GlobalSearchMessagesRequestScopeScope.allGuilds);
      expect(request.contextChannelId, isNull);
      expect(request.contextGuildId, isNull);
      expect(request.sortBy, GlobalSearchMessagesRequestSortBySortBy.timestamp);
      expect(
        request.sortOrder,
        GlobalSearchMessagesRequestSortOrderSortOrder.asc,
      );
    });
  });

  group('message adapters', () {
    test('adapts pinned message responses into domain messages', () {
      final message = domain.Message.fromPinnedMessage(
        ChannelPinResponseMessage(
          id: 'message-1',
          channelId: 'channel-1',
          author: _author(),
          type: ChannelPinResponseMessageTypeType.valueDefault,
          flags: 0,
          content: 'Pinned',
          timestamp: DateTime.utc(2026, 5, 9, 12),
          pinned: true,
          mentionEveryone: false,
          tts: false,
          mentions: const [],
          mentionRoles: const [],
        ),
        currentUserId: 'current-user',
      );

      expect(message.id, 'message-1');
      expect(message.channelId, 'channel-1');
      expect(message.content, 'Pinned');
      expect(message.authorId, 'user-1');
      expect(message.authorName, 'Monty');
      expect(message.isPinned, isTrue);
      expect(message.isMentioned, isFalse);
    });

    test('adapts search result responses into domain messages', () {
      final message = domain.Message.fromSearchResult(
        MessageSearchResultsResponseMessages(
          id: 'message-2',
          channelId: 'channel-2',
          author: _author(id: 'current-user'),
          type: MessageSearchResultsResponseMessagesTypeType.valueDefault,
          flags: 0,
          content: 'Result',
          timestamp: DateTime.utc(2026, 5, 9, 13),
          pinned: false,
          mentionEveryone: false,
          tts: false,
          mentions: const [],
          mentionRoles: const [],
        ),
        currentUserId: 'current-user',
      );

      expect(message.id, 'message-2');
      expect(message.channelId, 'channel-2');
      expect(message.content, 'Result');
      expect(message.authorId, 'current-user');
      expect(message.authorName, 'Monty');
      expect(message.isPinned, isFalse);
      expect(message.isMentioned, isFalse);
    });
  });
}

UserPartialResponse _author({String id = 'user-1'}) {
  return UserPartialResponse(
    id: id,
    username: 'monty',
    discriminator: '0001',
    globalName: 'Monty',
    avatar: null,
    avatarColor: null,
    flags: 0,
  );
}
