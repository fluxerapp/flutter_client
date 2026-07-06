import 'dart:convert';

import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/user_preferences.dart';

part 'user_preferences_dao.g.dart';

@DriftAccessor(tables: [UserPreferencesTable])
class UserPreferencesDao extends DatabaseAccessor<FluxerDatabase>
    with _$UserPreferencesDaoMixin {
  UserPreferencesDao(super.attachedDatabase);

  Future<UserPreferencesTableData?> getPreferences(String userId) => (select(
    userPreferencesTable,
  )..where((t) => t.userId.equals(userId))).getSingleOrNull();

  Future<void> savePreferences(UserPreferencesTableCompanion prefs) =>
      into(userPreferencesTable).insertOnConflictUpdate(prefs);

  Future<bool> getPlutoniumUpsellDismissed(String userId) async {
    final prefs = await getPreferences(userId);
    return prefs?.plutoniumUpsellDismissed ?? false;
  }

  Future<void> setPlutoniumUpsellDismissed(
    String userId, {
    required bool dismissed,
  }) => savePreferences(
    UserPreferencesTableCompanion(
      userId: Value(userId),
      plutoniumUpsellDismissed: Value(dismissed),
    ),
  );

  Future<String> getEmojiSkinTone(String userId) async {
    final prefs = await getPreferences(userId);
    return prefs?.emojiSkinTone ?? '';
  }

  Future<void> setEmojiSkinTone(String userId, String skinTone) =>
      savePreferences(
        UserPreferencesTableCompanion(
          userId: Value(userId),
          emojiSkinTone: Value(skinTone),
        ),
      );

  Future<List<String>> getFavoriteEmojiKeys(String userId) async {
    final prefs = await getPreferences(userId);
    return _decodeStringList(prefs?.favoriteEmojiKeysJson);
  }

  Future<void> setFavoriteEmojiKeys(String userId, List<String> keys) =>
      savePreferences(
        UserPreferencesTableCompanion(
          userId: Value(userId),
          favoriteEmojiKeysJson: Value(_encodeStringList(keys)),
        ),
      );

  Future<List<String>> getFavoriteStickerKeys(String userId) async {
    final prefs = await getPreferences(userId);
    return _decodeStringList(prefs?.favoriteStickerKeysJson);
  }

  Future<void> setFavoriteStickerKeys(String userId, List<String> keys) =>
      savePreferences(
        UserPreferencesTableCompanion(
          userId: Value(userId),
          favoriteStickerKeysJson: Value(_encodeStringList(keys)),
        ),
      );

  Future<List<String>> getCollapsedEmojiPickerCategories(String userId) async {
    final prefs = await getPreferences(userId);
    return _decodeStringList(prefs?.collapsedEmojiPickerCategoriesJson);
  }

  Future<void> setCollapsedEmojiPickerCategories(
    String userId,
    List<String> categories,
  ) => savePreferences(
    UserPreferencesTableCompanion(
      userId: Value(userId),
      collapsedEmojiPickerCategoriesJson: Value(_encodeStringList(categories)),
    ),
  );

  Future<List<String>> getCollapsedStickerPickerCategories(
    String userId,
  ) async {
    final prefs = await getPreferences(userId);
    return _decodeStringList(prefs?.collapsedStickerPickerCategoriesJson);
  }

  Future<void> setCollapsedStickerPickerCategories(
    String userId,
    List<String> categories,
  ) => savePreferences(
    UserPreferencesTableCompanion(
      userId: Value(userId),
      collapsedStickerPickerCategoriesJson: Value(
        _encodeStringList(categories),
      ),
    ),
  );

  Future<MatureContentAgreements> getMatureContentAgreements(
    String userId,
  ) async {
    final UserPreferencesTableData? prefs = await getPreferences(userId);
    return MatureContentAgreements(
      agreedChannelIds: _decodeStringList(
        prefs?.matureContentAgreedChannelIdsJson,
      ),
      agreedCategoryIds: _decodeStringList(
        prefs?.matureContentAgreedCategoryIdsJson,
      ),
      agreedGuildIds: _decodeStringList(prefs?.matureContentAgreedGuildIdsJson),
    );
  }

  Future<void> setMatureContentAgreements(
    String userId,
    MatureContentAgreements agreements,
  ) => savePreferences(
    UserPreferencesTableCompanion(
      userId: Value(userId),
      matureContentAgreedChannelIdsJson: Value(
        _encodeStringList(agreements.agreedChannelIds),
      ),
      matureContentAgreedCategoryIdsJson: Value(
        _encodeStringList(agreements.agreedCategoryIds),
      ),
      matureContentAgreedGuildIdsJson: Value(
        _encodeStringList(agreements.agreedGuildIds),
      ),
    ),
  );

  Future<String?> getVoiceSettingsJson(String userId) async {
    final UserPreferencesTableData? prefs = await getPreferences(userId);
    final String? json = prefs?.voiceSettingsJson;
    if (json == null || json.isEmpty) {
      return null;
    }
    return json;
  }

  Future<void> setVoiceSettingsJson(String userId, String json) =>
      savePreferences(
        UserPreferencesTableCompanion(
          userId: Value(userId),
          voiceSettingsJson: Value(json),
        ),
      );

  Future<void> clearAll() => delete(userPreferencesTable).go();
}

List<String> _decodeStringList(String? value) {
  if (value == null || value.isEmpty) {
    return const <String>[];
  }
  try {
    final decoded = jsonDecode(value);
    if (decoded is! List<dynamic>) {
      return const <String>[];
    }
    return _dedupeStrings(decoded.map((entry) => entry.toString()));
  } on Object {
    return const <String>[];
  }
}

String _encodeStringList(Iterable<String> values) =>
    jsonEncode(_dedupeStrings(values));

class MatureContentAgreements {
  const MatureContentAgreements({
    this.agreedChannelIds = const [],
    this.agreedCategoryIds = const [],
    this.agreedGuildIds = const [],
  });

  final List<String> agreedChannelIds;
  final List<String> agreedCategoryIds;
  final List<String> agreedGuildIds;

  MatureContentAgreements copyWith({
    List<String>? agreedChannelIds,
    List<String>? agreedCategoryIds,
    List<String>? agreedGuildIds,
  }) {
    return MatureContentAgreements(
      agreedChannelIds: agreedChannelIds ?? this.agreedChannelIds,
      agreedCategoryIds: agreedCategoryIds ?? this.agreedCategoryIds,
      agreedGuildIds: agreedGuildIds ?? this.agreedGuildIds,
    );
  }
}

List<String> _dedupeStrings(Iterable<String> values) {
  final seen = <String>{};
  final result = <String>[];
  for (final value in values) {
    final normalized = value.trim();
    if (normalized.isEmpty || !seen.add(normalized)) {
      continue;
    }
    result.add(normalized);
  }
  return result;
}
