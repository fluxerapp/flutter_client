import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/settings/domain/default_web_browser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'default_apps_preferences_provider.g.dart';

@Riverpod(keepAlive: true)
class DefaultAppsPreferences extends _$DefaultAppsPreferences {
  String? _userId;

  @override
  DefaultWebBrowser build() => DefaultWebBrowser.inApp;

  Future<void> load(String userId) async {
    _userId = userId;
    final db = ref.read(fluxerDatabaseProvider);
    final prefs = await db.userPreferencesDao.getPreferences(userId);
    if (prefs == null) {
      return;
    }
    final DefaultWebBrowser browser = DefaultWebBrowser.resolveStored(
      prefs.defaultWebBrowser,
    );
    if (browser == state) {
      return;
    }
    state = browser;
    if (browser.name != prefs.defaultWebBrowser) {
      await _persist();
    }
  }

  Future<void> setDefaultWebBrowser(DefaultWebBrowser value) async {
    if (value == state) {
      return;
    }
    state = value;
    await _persist();
  }

  Future<void> _persist() async {
    final userId = _userId;
    if (userId == null) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    await db.userPreferencesDao.savePreferences(
      UserPreferencesTableCompanion(
        userId: Value(userId),
        defaultWebBrowser: Value(state.name),
      ),
    );
  }
}
