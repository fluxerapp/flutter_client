import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expression_usage_provider.g.dart';

const String kUnicodeEmojiUsageKeyPrefix = 'unicode:';
const String kCustomEmojiUsageKeyPrefix = 'custom:';

bool isEmojiUsageKey(String key) =>
    isValidUsageKey(key) &&
    (key.startsWith(kUnicodeEmojiUsageKeyPrefix) ||
        key.startsWith(kCustomEmojiUsageKeyPrefix));

enum ExpressionUsageKind {
  emoji(SyncedPreferenceField.emojiPicker),
  sticker(SyncedPreferenceField.stickerPicker),
  meme(SyncedPreferenceField.memesPicker);

  const ExpressionUsageKind(this.field);

  final SyncedPreferenceField field;

  bool acceptsKey(String key) => switch (this) {
    ExpressionUsageKind.emoji => isEmojiUsageKey(key),
    ExpressionUsageKind.sticker ||
    ExpressionUsageKind.meme => isValidUsageKey(key),
  };

  Future<Map<String, UsageEntry>> read(UserPreferencesDao dao, String userId) =>
      switch (this) {
        ExpressionUsageKind.emoji => dao.getEmojiUsage(userId),
        ExpressionUsageKind.sticker => dao.getStickerUsage(userId),
        ExpressionUsageKind.meme => dao.getMemeUsage(userId),
      };

  Future<void> write(
    UserPreferencesDao dao,
    String userId,
    Map<String, UsageEntry> usage,
  ) => switch (this) {
    ExpressionUsageKind.emoji => dao.setEmojiUsage(userId, usage),
    ExpressionUsageKind.sticker => dao.setStickerUsage(userId, usage),
    ExpressionUsageKind.meme => dao.setMemeUsage(userId, usage),
  };

  Map<String, UsageEntry> sanitize(Map<String, UsageEntry> usage, int nowMs) =>
      sanitizeUsageMap({
        for (final MapEntry(:key, :value) in usage.entries)
          if (acceptsKey(key)) key: value,
      }, nowMs);
}

@Riverpod(keepAlive: true)
class ExpressionUsage extends _$ExpressionUsage {
  @override
  Future<Map<String, UsageEntry>> build(ExpressionUsageKind kind) async {
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const <String, UsageEntry>{};
    }
    return kind.read(
      ref.read(fluxerDatabaseProvider).userPreferencesDao,
      userId,
    );
  }

  Future<void> track(String key) async {
    if (!kind.acceptsKey(key)) {
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await future;
    final Map<String, UsageEntry> next = trackUsageKey(
      state.value ?? const <String, UsageEntry>{},
      key,
      DateTime.now().millisecondsSinceEpoch,
    );
    state = AsyncData<Map<String, UsageEntry>>(next);
    await kind.write(
      ref.read(fluxerDatabaseProvider).userPreferencesDao,
      userId,
      next,
    );
    ref.markSyncedDirty(kind.field);
  }
}
