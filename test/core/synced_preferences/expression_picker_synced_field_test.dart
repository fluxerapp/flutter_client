import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_sync_helpers.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';

void main() {
  group('ExpressionPickerSyncedField', () {
    test('toProtoForPush preserves usage stats from wire', () {
      const local = ExpressionPickerSyncedLocalState(
        favoriteKeys: ['unicode:heart'],
        collapsedCategoryIds: ['people'],
      );
      final wireBase = pickers_pb.EmojiPickerState();
      wireBase.usage['unicode:thumbsup'] = pickers_pb.UsageStat(
        count: 3,
        lastUsedMs: Int64(1_700_000_000_000),
      );
      final pushed = EmojiPickerSyncedField.toProtoForPush(
        local: local,
        wireBase: wireBase,
      );
      expect(pushed.favoriteEmojiIds, ['unicode:heart']);
      expect(pushed.collapsedCategoryIds, ['people']);
      expect(pushed.usage.length, 1);
      expect(pushed.usage['unicode:thumbsup']?.count, 3);
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

    test('mergeExpressionPickerStringLists unions remote and local', () {
      final merged = mergeExpressionPickerStringLists(
        remote: ['unicode:thumbsup'],
        local: ['unicode:heart'],
      );
      expect(merged, ['unicode:thumbsup', 'unicode:heart']);
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
