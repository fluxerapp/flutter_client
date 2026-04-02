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

  Future<void> clearAll() => delete(userPreferencesTable).go();
}
