import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_sync_helpers.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';

EmojiPickerSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(
    Provider<EmojiPickerSyncedField>(EmojiPickerSyncedField.new),
  );
}

void main() {
  group('ExpressionPickerSyncedField', () {
    test('toProtoMessageForPush writes local usage in web wire form', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      final local = ExpressionPickerSyncedLocalState(
        favoriteKeys: const ['unicode:heart'],
        collapsedCategoryIds: const ['people'],
        usage: {'unicode:tada': UsageEntry(count: 2, lastUsedMs: now)},
      );
      final wireBase = pickers_pb.EmojiPickerState();
      wireBase.usage['unicode:thumbsup'] = pickers_pb.UsageStat(
        count: 3,
        lastUsedMs: Int64(1_700_000_000_000),
      );
      final pushed =
          _field().toProtoMessageForPush(local, wireSubMessage: wireBase)
              as pickers_pb.EmojiPickerState;
      expect(pushed.favoriteEmojiIds, ['unicode:heart']);
      expect(pushed.collapsedCategoryIds, ['people']);
      expect(pushed.usage.keys, ['unicode:tada']);
      expect(pushed.usage['unicode:tada']?.count, 2);
      expect(pushed.usage['unicode:tada']?.lastUsedMs, Int64(now));
    });
  });

  group('expression picker sync helpers', () {
    test('normalizeStickerFavoriteKey strips legacy prefix', () {
      expect(
        normalizeStickerFavoriteKey('sticker:guild-1:sticker-1'),
        'guild-1:sticker-1',
      );
      expect(
        normalizeStickerFavoriteKey('guild-1:sticker-1'),
        'guild-1:sticker-1',
      );
    });

    test('three-way list merge keeps both sides of concurrent edits', () {
      expect(
        mergeExpressionPickerListsThreeWay(
          local: ['unicode:heart', 'unicode:local'],
          remote: ['unicode:tada', 'unicode:remote'],
          baseline: ['unicode:heart', 'unicode:tada'],
        ),
        ['unicode:local', 'unicode:remote'],
      );
    });

    test('collapsed guild ids drop the legacy guild- prefix', () {
      expect(normalizeCollapsedPickerCategoryIds(['guild-1', '1', 'people']), [
        '1',
        'people',
      ]);
    });

    test('stickerFavoriteKey matches web wire format', () {
      final key = stickerFavoriteKey(
        const StickerEntry(
          id: 'sticker-1',
          guildId: 'guild-1',
          name: 'wave',
          description: '',
          tags: [],
          animated: false,
        ),
      );
      expect(key, 'guild-1:sticker-1');
      expect(key.startsWith('sticker:'), isFalse);
    });
  });
}
