import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:fluxer_app/features/chat/utils/search/channel_search_autocomplete.dart';

TextEditingValue _value(String text, [int? cursor]) => TextEditingValue(
  text: text,
  selection: TextSelection.collapsed(offset: cursor ?? text.length),
);

const ChannelSearchToken _from = ChannelSearchToken(
  kind: ChannelSearchTokenKind.from,
  value: '1130650140000000000',
  label: 'Hampus',
);

void main() {
  group('channelSearchActiveFilter', () {
    test('finds the filter word under the cursor', () {
      final ChannelSearchActiveFilter? active = channelSearchActiveFilter(
        _value('cats from:ham'),
        isGuildChannel: true,
      );
      expect(active?.kind, ChannelSearchTokenKind.from);
      expect(active?.query, 'ham');
      expect(active?.start, 5);
      expect(active?.end, 13);
    });

    test('opens on a bare key and maps on to during', () {
      expect(
        channelSearchActiveFilter(_value('has:'), isGuildChannel: true)?.kind,
        ChannelSearchTokenKind.has,
      );
      expect(
        channelSearchActiveFilter(
          _value('on:2024'),
          isGuildChannel: true,
        )?.kind,
        ChannelSearchTokenKind.during,
      );
    });

    test('ignores plain words, unknown keys and in: outside a guild', () {
      expect(
        channelSearchActiveFilter(_value('hello'), isGuildChannel: true),
        isNull,
      );
      expect(
        channelSearchActiveFilter(_value('link:x.com'), isGuildChannel: true),
        isNull,
      );
      expect(
        channelSearchActiveFilter(_value('in:gen'), isGuildChannel: false),
        isNull,
      );
      expect(
        channelSearchActiveFilter(
          _value('from:ham cats'),
          isGuildChannel: true,
        ),
        isNull,
      );
    });

    test('uses the word at the cursor, not the last word', () {
      final ChannelSearchActiveFilter? active = channelSearchActiveFilter(
        _value('from:ham cats', 7),
        isGuildChannel: true,
      );
      expect(active?.kind, ChannelSearchTokenKind.from);
      expect(active?.query, 'ham');
    });
  });

  group('text edits', () {
    test('removing the filter word keeps the rest of the query', () {
      final TextEditingValue next = channelSearchRemoveRange(
        _value('cats from:ham dogs'),
        5,
        13,
      );
      expect(next.text, 'cats dogs');
      expect(next.selection.baseOffset, 5);
    });

    test('inserting a filter adds a separating space', () {
      final TextEditingValue next = channelSearchInsertFilterPrefix(
        _value('cats'),
        ChannelSearchTokenKind.mentions,
      );
      expect(next.text, 'cats mentions:');
      expect(next.selection.baseOffset, next.text.length);
    });

    test('inserting a filter replaces a half typed one', () {
      final TextEditingValue next = channelSearchInsertFilterPrefix(
        _value('cats from:ha'),
        ChannelSearchTokenKind.has,
      );
      expect(next.text, 'cats has:');
    });
  });

  group('tokens', () {
    test('adding a token dedupes and replaces single value filters', () {
      List<ChannelSearchToken> tokens = channelSearchAddToken(
        const <ChannelSearchToken>[],
        _from,
      );
      tokens = channelSearchAddToken(tokens, _from);
      tokens = channelSearchAddToken(
        tokens,
        const ChannelSearchToken(
          kind: ChannelSearchTokenKind.before,
          value: '2024-01-01',
        ),
      );
      tokens = channelSearchAddToken(
        tokens,
        const ChannelSearchToken(
          kind: ChannelSearchTokenKind.before,
          value: '2024-02-01',
        ),
      );
      tokens = channelSearchAddToken(
        tokens,
        const ChannelSearchToken(
          kind: ChannelSearchTokenKind.after,
          value: '2023-12-01',
        ),
      );

      expect(tokens.map((ChannelSearchToken t) => t.signature), <String>[
        'from:1130650140000000000',
        'before:2024-02-01',
        'after:2023-12-01',
      ]);
    });

    test('tokens and a tab filter build one API query', () {
      final MessageSearchQuery query = MessageSearchQuery.build(
        channelId: 'c1',
        rawQuery: 'cats',
        chipFilters: channelSearchChipFiltersForTokens(
          const <ChannelSearchToken>[
            _from,
            ChannelSearchToken(
              kind: ChannelSearchTokenKind.has,
              value: 'sound',
            ),
            ChannelSearchToken(
              kind: ChannelSearchTokenKind.before,
              value: '2024-02-01',
            ),
            ChannelSearchToken(
              kind: ChannelSearchTokenKind.after,
              value: '2023-12-01',
            ),
          ],
          extra: const <ChannelSearchToken>[
            ChannelSearchToken(
              kind: ChannelSearchTokenKind.pinned,
              value: 'true',
            ),
          ],
        ),
      );

      expect(query.parsed.content, 'cats');
      expect(query.parsed.authorIds, <String>['1130650140000000000']);
      expect(query.parsed.has, <String>['sound']);
      expect(query.parsed.pinned, isTrue);
      expect(query.parsed.minId, isNotNull);
      expect(query.parsed.maxId, isNotNull);
    });

    test('serialises tokens for the text based search field', () {
      expect(
        serializeChannelSearchQuery(
          text: 'cats',
          tokens: const <ChannelSearchToken>[
            _from,
            ChannelSearchToken(
              kind: ChannelSearchTokenKind.channel,
              value: 'c2',
              label: 'off topic',
            ),
          ],
        ),
        'from:Hampus in:"off topic" cats',
      );
    });
  });

  group('suggestions', () {
    test('has suggestions match labels and API values', () {
      List<MessageSearchContentFilter> match(String query) =>
          channelSearchHasSuggestions(
            query,
            (MessageSearchContentFilter filter) => filter.name,
          );
      expect(match('').length, MessageSearchContentFilter.values.length);
      expect(match('sound'), <MessageSearchContentFilter>[
        MessageSearchContentFilter.audio,
      ]);
      expect(match('vid'), <MessageSearchContentFilter>[
        MessageSearchContentFilter.video,
      ]);
    });

    test('value suggestions cover pinned and author type', () {
      expect(
        channelSearchValueSuggestions(ChannelSearchTokenKind.pinned, ''),
        <String>['true', 'false'],
      );
      expect(
        channelSearchValueSuggestions(ChannelSearchTokenKind.authorType, 'bo'),
        <String>['bot'],
      );
    });

    test('dates parse strictly', () {
      expect(channelSearchParseDate('2024-2-9'), DateTime(2024, 2, 9));
      expect(channelSearchParseDate('2024-02-30'), isNull);
      expect(channelSearchParseDate('yesterday'), isNull);
    });
  });
}
