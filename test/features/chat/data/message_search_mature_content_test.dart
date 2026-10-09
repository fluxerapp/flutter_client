import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/data/message_search_mature_content.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';

void main() {
  const Guild ageRestrictedGuild = Guild(
    id: 'guild-1',
    name: 'Guild',
    nsfw: true,
  );
  const Guild safeGuild = Guild(id: 'guild-1', name: 'Guild');

  Channel buildChannel({
    bool nsfw = false,
    bool? nsfwOverride,
    int contentWarningLevel = contentWarningLevelInherit,
  }) {
    return Channel(
      id: 'channel-1',
      guildId: 'guild-1',
      name: 'general',
      nsfw: nsfw,
      nsfwOverride: nsfwOverride,
      contentWarningLevel: contentWarningLevel,
    );
  }

  group('isMatureSearchChannel', () {
    test('uses the server-computed channel nsfw flag', () {
      expect(
        isMatureSearchChannel(
          channel: buildChannel(nsfw: true),
          guild: safeGuild,
        ),
        isTrue,
      );
    });

    test('inherits mature content from an age-restricted guild', () {
      expect(
        isMatureSearchChannel(
          channel: buildChannel(),
          guild: ageRestrictedGuild,
        ),
        isTrue,
      );
    });

    test('is false for a safe channel in a safe guild', () {
      expect(
        isMatureSearchChannel(channel: buildChannel(), guild: safeGuild),
        isFalse,
      );
    });
  });

  group('applyMatureContentToSearchQuery', () {
    MessageSearchQuery query({String rawQuery = 'hello'}) {
      return MessageSearchQuery.build(
        channelId: 'channel-1',
        guildId: 'guild-1',
        rawQuery: rawQuery,
      );
    }

    test('sets includeNsfw when searching consented gated content', () {
      expect(
        applyMatureContentToSearchQuery(
          query(),
          includeNsfw: true,
        ).parsed.includeNsfw,
        isTrue,
      );
    });

    test('leaves includeNsfw unset for ungated search', () {
      final MessageSearchQuery original = query();
      final MessageSearchQuery result = applyMatureContentToSearchQuery(
        original,
        includeNsfw: false,
      );

      expect(identical(result, original), isTrue);
      expect(result.parsed.includeNsfw, isNull);
    });

    test('overwrites nsfw:false when searching consented gated content', () {
      final MessageSearchQuery original = query(rawQuery: 'hello nsfw:false');
      expect(original.parsed.includeNsfw, isFalse);
      expect(
        applyMatureContentToSearchQuery(
          original,
          includeNsfw: true,
        ).parsed.includeNsfw,
        isTrue,
      );
    });

    test('maps included nsfw onto the global search request', () {
      final MessageSearchQuery prepared = applyMatureContentToSearchQuery(
        query(),
        includeNsfw: true,
      );

      expect(buildGlobalSearchMessagesRequest(prepared).includeNsfw, isTrue);
    });
  });
}
