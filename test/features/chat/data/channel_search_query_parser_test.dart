import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

void main() {
  group('parseChannelSearchQuery', () {
    test('parses content and has filters', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'hello has:image,video',
      );
      expect(params.content, 'hello');
      expect(params.has, <String>['image', 'video']);
    });

    test('parses from and mentions with hints', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'from:alice mentions:bob',
        hints: const ChannelSearchParseHints(
          usersByTag: <String, String>{'alice': 'user-1', 'bob': 'user-2'},
        ),
      );
      expect(params.authorIds, <String>['user-1']);
      expect(params.mentions, <String>['user-2']);
    });

    test('parses pinned and author-type filters', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'pinned:true author-type:bot,webhook',
      );
      expect(params.pinned, isTrue);
      expect(params.authorTypes, <String>['bot', 'webhook']);
    });

    test('parses link and file filters with aliases', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'link:example.com filename:report.pdf ext:png',
      );
      expect(params.linkHostnames, <String>['example.com']);
      expect(params.attachmentFilenames, <String>['report.pdf']);
      expect(params.attachmentExtensions, <String>['png']);
    });

    test('parses UI link-from file-name and file-type aliases', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'link-from:example.com file-name:report.pdf file-type:png',
      );
      expect(params.linkHostnames, <String>['example.com']);
      expect(params.attachmentFilenames, <String>['report.pdf']);
      expect(params.attachmentExtensions, <String>['png']);
    });

    test('parses from and mentions with user resolver', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'from:alice mentions:bob',
        context: ChannelSearchParseContext(
          resolveUserByTag: (String tag) => switch (tag) {
            'alice' => 'user-1',
            'bob' => 'user-2',
            _ => null,
          },
        ),
      );
      expect(params.authorIds, <String>['user-1']);
      expect(params.mentions, <String>['user-2']);
    });

    test('from without resolver or hints does not invent author id', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'from:alice',
      );
      expect(params.authorIds, isEmpty);
      expect(params.hasSearchTerms, isFalse);
    });

    test('resolves from @me and snowflake ids', () {
      final ParsedChannelSearchParams meParams = parseChannelSearchQuery(
        'from:@me',
        context: const ChannelSearchParseContext(currentUserId: 'me-1'),
      );
      final ParsedChannelSearchParams snowflakeParams = parseChannelSearchQuery(
        'from:123456789012345678 mentions:234567890123456789',
      );

      expect(meParams.authorIds, <String>['me-1']);
      expect(snowflakeParams.authorIds, <String>['123456789012345678']);
      expect(snowflakeParams.mentions, <String>['234567890123456789']);
    });

    test('parses before and after dates into snowflakes', () {
      final ParsedChannelSearchParams beforeParams = parseChannelSearchQuery(
        'before:2024-01-15',
      );
      final ParsedChannelSearchParams afterParams = parseChannelSearchQuery(
        'after:2024-01-15',
      );

      expect(beforeParams.maxId, snowflakeFromDateTime(DateTime(2024, 1, 15)));
      expect(beforeParams.minId, isNull);
      expect(afterParams.minId, snowflakeFromDateTime(DateTime(2024, 1, 15)));
      expect(afterParams.maxId, isNull);
    });

    test('parses sort and scope filters', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'sort:relevance order:asc scope:all_dms',
      );
      expect(params.sortBy, 'relevance');
      expect(params.sortOrder, 'asc');
      expect(params.scope, MessageSearchScopeFilter.allDms);
    });

    test('parses exclude has filter', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        '-has:link',
      );
      expect(params.excludeHas, <String>['link']);
    });

    test('parses in channel filter with resolver', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'in:general',
        context: ChannelSearchParseContext(
          guildId: 'guild-1',
          resolveChannelByName: (String name) =>
              name.toLowerCase() == 'general' ? 'channel-1' : null,
        ),
      );
      expect(params.channelIds, <String>['channel-1']);
    });

    test('parses poll and forward has filters', () {
      final ParsedChannelSearchParams pollParams = parseChannelSearchQuery(
        'has:poll',
      );
      final ParsedChannelSearchParams forwardParams = parseChannelSearchQuery(
        'has:forward',
      );
      final ParsedChannelSearchParams snapshotParams = parseChannelSearchQuery(
        'has:snapshot',
      );

      expect(pollParams.has, contains('poll'));
      expect(forwardParams.has, contains('snapshot'));
      expect(snapshotParams.has, contains('snapshot'));
    });

    test('parses negated from and in filters', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        '-from:alice -in:general',
        hints: const ChannelSearchParseHints(
          usersByTag: <String, String>{'alice': 'user-1'},
        ),
        context: ChannelSearchParseContext(
          guildId: 'guild-1',
          resolveChannelByName: (String name) =>
              name.toLowerCase() == 'general' ? 'channel-1' : null,
        ),
      );

      expect(params.excludeAuthorIds, contains('user-1'));
      expect(params.excludeChannelIds, contains('channel-1'));
    });

    test('incomplete from filter does not invent author id', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery('from:');
      expect(params.authorIds, isEmpty);
    });

    test('extracts from and mentions values for gateway member lookup', () {
      expect(
        channelSearchUserFilterValues(
          'hello from:alice mentions:bob,carol -from:dan in:general',
        ),
        <String>['alice', 'bob', 'carol', 'dan'],
      );
    });

    test('parses mentions everyone and here', () {
      expect(
        parseChannelSearchQuery('mentions:everyone').mentionEveryone,
        isTrue,
      );
      expect(parseChannelSearchQuery('mentions:here').mentionEveryone, isTrue);
    });

    test('parses exclude mentions', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        '-mentions:bob',
        hints: const ChannelSearchParseHints(
          usersByTag: <String, String>{'bob': 'user-2'},
        ),
      );
      expect(params.excludeMentions, <String>['user-2']);
    });

    test('parses on and during dates into min and max ids', () {
      final ParsedChannelSearchParams onParams = parseChannelSearchQuery(
        'on:2024-01-15',
      );
      final ParsedChannelSearchParams duringParams = parseChannelSearchQuery(
        'during:2024-01-15',
      );
      final String minId = snowflakeFromDateTime(DateTime(2024, 1, 15));
      final String maxId = snowflakeFromDateTime(
        DateTime(2024, 1, 15, 23, 59, 59, 999),
      );

      expect(onParams.minId, minId);
      expect(onParams.maxId, maxId);
      expect(duringParams.minId, minId);
      expect(duringParams.maxId, maxId);
    });

    test('parses quoted phrases and any contents', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        '"hello world" any:foo,bar',
      );
      expect(params.exactPhrases, contains('hello world'));
      expect(params.contents, <String>['foo', 'bar']);
    });

    test('parses last duration into min id', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'last:7d',
      );
      expect(params.minId, isNotNull);
      expect(params.hasSearchTerms, isTrue);
    });

    test('parses beforeid and afterid', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'beforeid:111 afterid:222',
      );
      expect(params.maxId, '111');
      expect(params.minId, '222');
    });

    test('parses embed type, embed provider, and nsfw', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        'embed-type:video embed-provider:youtube nsfw:true',
      );
      expect(params.embedTypes, <String>['video']);
      expect(params.embedProviders, <String>['youtube']);
      expect(params.includeNsfw, isTrue);
    });

    test('parses exclude link and file aliases', () {
      final ParsedChannelSearchParams params = parseChannelSearchQuery(
        '-link-from:example.com -file-name:secret -file-type:exe',
      );
      expect(params.excludeLinkHostnames, <String>['example.com']);
      expect(params.excludeAttachmentFilenames, <String>['secret']);
      expect(params.excludeAttachmentExtensions, <String>['exe']);
    });
  });
}
