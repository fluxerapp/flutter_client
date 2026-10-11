import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_sync_helpers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expression_picker_preferences_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoriteEmojiKeys extends _$FavoriteEmojiKeys {
  @override
  Future<List<String>> build() async {
    final userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const <String>[];
    }
    return ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .getFavoriteEmojiKeys(userId);
  }

  Future<List<String>> _loadedKeys() async {
    await future;
    return state.value ?? const <String>[];
  }

  Future<void> toggle(String key) async {
    final next = _toggleKey(await _loadedKeys(), key);
    state = AsyncData<List<String>>(next);
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .setFavoriteEmojiKeys(userId, next);
    _markPickerDirty(ref, SyncedPreferenceField.emojiPicker);
  }
}

@Riverpod(keepAlive: true)
class FavoriteStickerKeys extends _$FavoriteStickerKeys {
  @override
  Future<List<String>> build() async {
    final userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const <String>[];
    }
    return normalizeStickerFavoriteKeys(
      await ref
          .read(fluxerDatabaseProvider)
          .userPreferencesDao
          .getFavoriteStickerKeys(userId),
    );
  }

  Future<List<String>> _loadedKeys() async {
    await future;
    return state.value ?? const <String>[];
  }

  Future<void> toggle(String key) async {
    final normalizedKey = normalizeStickerFavoriteKey(key);
    if (normalizedKey.isEmpty) {
      return;
    }
    final next = _toggleKey(
      normalizeStickerFavoriteKeys(await _loadedKeys()),
      normalizedKey,
    );
    state = AsyncData<List<String>>(next);
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .setFavoriteStickerKeys(userId, next);
    _markPickerDirty(ref, SyncedPreferenceField.stickerPicker);
  }
}

@Riverpod(keepAlive: true)
class CollapsedEmojiPickerCategories extends _$CollapsedEmojiPickerCategories {
  @override
  Future<List<String>> build() async {
    final userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const <String>[];
    }
    return normalizeCollapsedPickerCategoryIds(
      await ref
          .read(fluxerDatabaseProvider)
          .userPreferencesDao
          .getCollapsedEmojiPickerCategories(userId),
    );
  }

  Future<List<String>> _loadedKeys() async {
    await future;
    return state.value ?? const <String>[];
  }

  Future<void> toggle(String category) async {
    final next = _toggleKey(
      await _loadedKeys(),
      normalizeCollapsedPickerCategoryId(category),
      maxItems: kMaxSyncedCollapsedPickerCategories,
    );
    state = AsyncData<List<String>>(next);
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .setCollapsedEmojiPickerCategories(userId, next);
    _markPickerDirty(ref, SyncedPreferenceField.emojiPicker);
  }
}

@Riverpod(keepAlive: true)
class CollapsedStickerPickerCategories
    extends _$CollapsedStickerPickerCategories {
  @override
  Future<List<String>> build() async {
    final userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const <String>[];
    }
    return normalizeCollapsedPickerCategoryIds(
      await ref
          .read(fluxerDatabaseProvider)
          .userPreferencesDao
          .getCollapsedStickerPickerCategories(userId),
    );
  }

  Future<List<String>> _loadedKeys() async {
    await future;
    return state.value ?? const <String>[];
  }

  Future<void> toggle(String category) async {
    final next = _toggleKey(
      await _loadedKeys(),
      normalizeCollapsedPickerCategoryId(category),
      maxItems: kMaxSyncedCollapsedPickerCategories,
    );
    state = AsyncData<List<String>>(next);
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    await ref
        .read(fluxerDatabaseProvider)
        .userPreferencesDao
        .setCollapsedStickerPickerCategories(userId, next);
    _markPickerDirty(ref, SyncedPreferenceField.stickerPicker);
  }
}

void _markPickerDirty(Ref ref, SyncedPreferenceField field) {
  ref.markSyncedDirty(field);
}

List<String> _toggleKey(
  List<String> current,
  String key, {
  int maxItems = kMaxSyncedFavoriteExpressionKeys,
}) {
  final normalized = key.trim();
  if (normalized.isEmpty) {
    return current;
  }
  if (current.contains(normalized)) {
    return current.where((entry) => entry != normalized).toList();
  }
  if (current.length >= maxItems) {
    return current;
  }
  return <String>[...current, normalized];
}
