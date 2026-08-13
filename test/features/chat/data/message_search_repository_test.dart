import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
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

    test('maps typed header filters including UI aliases', () {
      final request = buildGlobalSearchMessagesRequest(
        MessageSearchQuery.build(
          channelId: 'channel-1',
          guildId: 'guild-1',
          rawQuery:
              'from:alice in:general has:image pinned:true '
              'link-from:example.com file-name:report.pdf file-type:png '
              'sort:relevance order:asc',
          hints: const ChannelSearchParseHints(
            usersByTag: <String, String>{'alice': 'user-1'},
          ),
          context: ChannelSearchParseContext(
            guildId: 'guild-1',
            resolveChannelByName: (String name) =>
                name == 'general' ? 'channel-9' : null,
          ),
        ),
      );

      expect(request.authorId, <String>['user-1']);
      expect(request.channelId, <String>['channel-9']);
      expect(request.has, <GlobalSearchMessagesRequestHasHas>[
        GlobalSearchMessagesRequestHasHas.image,
      ]);
      expect(request.pinned, isTrue);
      expect(request.linkHostname, <String>['example.com']);
      expect(request.attachmentFilename, <String>['report.pdf']);
      expect(request.attachmentExtension, <String>['png']);
      expect(request.sortBy, GlobalSearchMessagesRequestSortBySortBy.relevance);
      expect(
        request.sortOrder,
        GlobalSearchMessagesRequestSortOrderSortOrder.asc,
      );
    });

    test('maps remaining catalog filters onto the search request', () {
      final request = buildGlobalSearchMessagesRequest(
        MessageSearchQuery.build(
          channelId: 'channel-1',
          guildId: 'guild-1',
          rawQuery:
              'mentions:bob -from:eve -in:offtopic -has:link '
              'author-type:bot before:2024-01-15 after:2024-01-01 '
              'mentions:everyone has:forward "exact phrase"',
          hints: const ChannelSearchParseHints(
            usersByTag: <String, String>{'bob': 'user-2', 'eve': 'user-3'},
          ),
          context: ChannelSearchParseContext(
            guildId: 'guild-1',
            resolveChannelByName: (String name) =>
                name == 'offtopic' ? 'channel-8' : null,
          ),
        ),
      );

      expect(request.mentions, <String>['user-2']);
      expect(request.excludeAuthorId, <String>['user-3']);
      expect(request.excludeChannelId, <String>['channel-8']);
      expect(request.excludeHas, isNotNull);
      expect(request.authorType, isNotNull);
      expect(request.maxId, isNotNull);
      expect(request.minId, isNotNull);
      expect(request.mentionEveryone, isTrue);
      expect(request.has, <GlobalSearchMessagesRequestHasHas>[
        GlobalSearchMessagesRequestHasHas.snapshot,
      ]);
      expect(request.exactPhrases, <String>['exact phrase']);
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
