import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';

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
  });
}
