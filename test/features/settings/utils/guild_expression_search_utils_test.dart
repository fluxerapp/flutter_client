import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_search_utils.dart';

void main() {
  const GuildExpressionUploader uploader = GuildExpressionUploader(
    id: 'user-1',
    username: 'owner',
  );
  final List<GuildEmojiSettingsEntry> emojis = <GuildEmojiSettingsEntry>[
    const GuildEmojiSettingsEntry(
      id: '10',
      name: 'wave',
      animated: false,
      uploader: uploader,
    ),
    const GuildEmojiSettingsEntry(
      id: '9',
      name: 'party',
      animated: true,
      uploader: uploader,
    ),
  ];
  final List<GuildStickerSettingsEntry> stickers = <GuildStickerSettingsEntry>[
    const GuildStickerSettingsEntry(
      id: '10',
      name: 'wave',
      description: 'hello',
      tags: <String>['greet'],
      animated: false,
      uploader: uploader,
    ),
    const GuildStickerSettingsEntry(
      id: '9',
      name: 'party',
      description: 'celebrate',
      tags: <String>['fun'],
      animated: true,
      uploader: uploader,
    ),
  ];

  test('filterGuildEmojiIndices matches emoji names', () {
    expect(filterGuildEmojiIndices(emojis, ''), <int>[0, 1]);
    expect(filterGuildEmojiIndices(emojis, 'wave'), <int>[0]);
    expect(filterGuildEmojiIndices(emojis, 'missing'), isEmpty);
  });

  test('filterGuildStickerIndices matches name description and tags', () {
    expect(filterGuildStickerIndices(stickers, 'wave'), <int>[0]);
    expect(filterGuildStickerIndices(stickers, 'celebrate'), <int>[1]);
    expect(filterGuildStickerIndices(stickers, 'greet'), <int>[0]);
    expect(filterGuildStickerIndices(stickers, 'missing'), isEmpty);
  });

  test('compareGuildExpressionEntriesByIdDesc sorts snowflake ids', () {
    expect(compareGuildExpressionEntriesByIdDesc('10', '9'), lessThan(0));
    expect(compareGuildExpressionEntriesByIdDesc('9', '10'), greaterThan(0));
  });

  test('optimistic delete removes emoji from filtered results', () {
    final List<GuildEmojiSettingsEntry> remaining = emojis
        .where((GuildEmojiSettingsEntry entry) => entry.id != '10')
        .toList();
    expect(filterGuildEmojiIndices(remaining, 'wave'), isEmpty);
    expect(filterGuildEmojiIndices(remaining, 'party'), <int>[0]);
  });
}
