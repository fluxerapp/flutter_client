import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/data/guild_expressions_repository.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_emoji_settings_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_expressions_repository_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:image/image.dart' as img;

const String _guildId = '1';

GuildEmojiSettingsEntry _emoji(String id, String name) {
  return GuildEmojiSettingsEntry(
    id: id,
    name: name,
    animated: false,
    uploader: const GuildExpressionUploader(id: '9', username: 'owner'),
  );
}

class _FakeGuildExpressionsRepository implements GuildExpressionsRepository {
  _FakeGuildExpressionsRepository(this.serverEmojis);

  final List<GuildEmojiSettingsEntry> serverEmojis;

  @override
  Future<List<GuildEmojiSettingsEntry>> listEmojis(String guildId) async {
    return List<GuildEmojiSettingsEntry>.unmodifiable(serverEmojis);
  }

  @override
  Future<GuildEmojiBulkCreateResponse> bulkCreateEmojis({
    required String guildId,
    required List<GuildEmojiCreateRequest> emojis,
  }) async {
    for (final GuildEmojiCreateRequest request in emojis) {
      serverEmojis.add(_emoji('${200 + serverEmojis.length}', request.name));
    }
    return const GuildEmojiBulkCreateResponse(
      success: <GuildEmojiResponse>[],
      failed: <GuildEmojiBulkCreateResponseFailed>[],
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test(
    'uploadFiles keeps the list newest first like the initial load',
    () async {
      final _FakeGuildExpressionsRepository repository =
          _FakeGuildExpressionsRepository(<GuildEmojiSettingsEntry>[
            _emoji('100', 'oldest'),
            _emoji('150', 'middle'),
          ]);
      final ProviderContainer container = ProviderContainer(
        overrides: [
          guildExpressionsRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);
      final GuildEmojiSettingsState loaded = await container.read(
        guildEmojiSettingsProvider(_guildId).future,
      );
      expect(loaded.emojis.map((GuildEmojiSettingsEntry e) => e.name), <String>[
        'middle',
        'oldest',
      ]);

      final Uint8List png = Uint8List.fromList(
        img.encodePng(img.Image(width: 8, height: 8)),
      );
      final GuildEmojiUploadResult result = await container
          .read(guildEmojiSettingsProvider(_guildId).notifier)
          .uploadFiles(
            files: <({String name, Uint8List bytes})>[
              (name: 'newest.png', bytes: png),
            ],
            maxSizeBytes: 256 * 1024,
            maxEmojis: 50,
          );

      expect(result.failureCount, 0);
      final GuildEmojiSettingsState after = container
          .read(guildEmojiSettingsProvider(_guildId))
          .requireValue;
      expect(after.emojis.map((GuildEmojiSettingsEntry e) => e.name), <String>[
        'newest',
        'middle',
        'oldest',
      ]);
      expect(after.filteredIndices, <int>[0, 1, 2]);
    },
  );
}
