import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_sync_service.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_preference_provider.g.dart';

const _kInflightSentinel = Object();

class ThemePreferenceState {
  ThemePreferenceState({
    this.mode = FluxerThemeMode.dark,
    this.scaleFactor = 1.0,
    this.chatFontSize = 16,
    this.syncAcrossDevices = true,
    this.inflightTheme,
  }) : darkColorTheme = buildDarkColorTheme(),
       lightColorTheme = buildLightColorTheme(),
       coalColorTheme = buildCoalColorTheme(),
       layoutTheme = FluxerLayoutTheme.scaled(scaleFactor: scaleFactor);

  final FluxerThemeMode mode;
  final double scaleFactor;
  final int chatFontSize;
  final bool syncAcrossDevices;

  /// Non-null while a server PATCH for this theme is in flight. UI uses this
  /// to disable swatches and surface a spinner on the targeted swatch.
  final FluxerThemeMode? inflightTheme;

  final FluxerColorTheme darkColorTheme;
  final FluxerColorTheme lightColorTheme;
  final FluxerColorTheme coalColorTheme;
  final FluxerLayoutTheme layoutTheme;

  bool get isSyncing => inflightTheme != null;

  FluxerColorTheme get colorTheme => switch (mode) {
    FluxerThemeMode.dark => darkColorTheme,
    FluxerThemeMode.light => lightColorTheme,
    FluxerThemeMode.coal => coalColorTheme,
    FluxerThemeMode.system => darkColorTheme,
  };

  late final FluxerTextTheme textTheme = FluxerTextTheme.fromColors(colorTheme);
  late final FluxerTextTheme darkTextTheme = FluxerTextTheme.fromColors(
    darkColorTheme,
  );
  late final FluxerTextTheme lightTextTheme = FluxerTextTheme.fromColors(
    lightColorTheme,
  );

  ThemePreferenceState copyWith({
    FluxerThemeMode? mode,
    double? scaleFactor,
    int? chatFontSize,
    bool? syncAcrossDevices,
    Object? inflightTheme = _kInflightSentinel,
  }) {
    return ThemePreferenceState(
      mode: mode ?? this.mode,
      scaleFactor: scaleFactor ?? this.scaleFactor,
      chatFontSize: chatFontSize ?? this.chatFontSize,
      syncAcrossDevices: syncAcrossDevices ?? this.syncAcrossDevices,
      inflightTheme: identical(inflightTheme, _kInflightSentinel)
          ? this.inflightTheme
          : inflightTheme as FluxerThemeMode?,
    );
  }
}

@Riverpod(keepAlive: true)
class ThemePreference extends _$ThemePreference {
  String? _userId;

  @override
  ThemePreferenceState build() => ThemePreferenceState();

  Future<void> load(String userId) async {
    _userId = userId;
    final db = ref.read(fluxerDatabaseProvider);
    final prefs = await db.userPreferencesDao.getPreferences(userId);
    if (prefs != null) {
      final mode = FluxerThemeMode.values.firstWhere(
        (m) => m.name == prefs.theme,
        orElse: () => FluxerThemeMode.dark,
      );
      state = ThemePreferenceState(
        mode: mode,
        scaleFactor: prefs.scaleFactor,
        chatFontSize: prefs.chatFontSize,
        syncAcrossDevices: prefs.syncAcrossDevices,
      );
    } else {
      state = ThemePreferenceState();
    }
    await _hydrateThemeFromApiIfNeeded();
  }

  Future<void> _hydrateThemeFromApiIfNeeded() async {
    if (!state.syncAcrossDevices || state.mode == FluxerThemeMode.system) {
      return;
    }
    try {
      final UserSettingsResponse settings = await ref
          .read(userSettingsSyncProvider)
          .fetchCurrentSettings();
      await applyServerSettings(settings);
    } on Object catch (e, st) {
      talker.warning('[ThemePreference] Server theme fetch failed', e, st);
    }
  }

  /// Switches the theme. When sync is active and the target is non-system,
  /// blocks on a server PATCH and only commits on success. Throws on failure
  /// so the caller (UI) can surface a toast.
  Future<void> setTheme(FluxerThemeMode mode) async {
    if (state.inflightTheme != null) {
      return;
    }
    if (state.mode == mode) {
      return;
    }

    final wantsServerPush =
        state.syncAcrossDevices && mode != FluxerThemeMode.system;

    if (!wantsServerPush) {
      state = state.copyWith(mode: mode);
      await _persist();
      return;
    }

    state = state.copyWith(inflightTheme: mode);
    try {
      await ref
          .read(userSettingsSyncProvider)
          .pushTheme(_toSettingsTheme(mode));
      state = state.copyWith(mode: mode, inflightTheme: null);
      await _persist();
    } on Object {
      state = state.copyWith(inflightTheme: null);
      rethrow;
    }
  }

  Future<void> setScaleFactor(double factor) async {
    state = state.copyWith(scaleFactor: factor);
    await _persist();
  }

  Future<void> setChatFontSize(int size) async {
    state = state.copyWith(chatFontSize: size);
    await _persist();
  }

  /// Toggles cross-device theme sync. Toggling ON pushes the current theme
  /// and blocks on the ack — on failure, the toggle reverts. Throws on
  /// failure so the caller can surface a toast.
  Future<void> setSyncAcrossDevices({required bool value}) async {
    if (state.mode == FluxerThemeMode.system) {
      return;
    }
    if (state.inflightTheme != null) {
      return;
    }
    if (state.syncAcrossDevices == value) {
      return;
    }

    if (!value) {
      state = state.copyWith(syncAcrossDevices: false);
      await _persist();
      return;
    }

    state = state.copyWith(syncAcrossDevices: true, inflightTheme: state.mode);
    try {
      await ref
          .read(userSettingsSyncProvider)
          .pushTheme(_toSettingsTheme(state.mode));
      state = state.copyWith(inflightTheme: null);
      await _persist();
    } on Object {
      state = state.copyWith(syncAcrossDevices: false, inflightTheme: null);
      await _persist();
      rethrow;
    }
  }

  /// Apply settings received from the server (READY hydration or
  /// `USER_SETTINGS_UPDATE` echo). No-op when sync is effectively disabled
  /// (raw flag off OR the device is in system mode), or when a local change
  /// is already in flight (we don't want a stale echo to fight it). Persists
  /// locally; never pushes back.
  Future<void> applyServerSettings(UserSettingsResponse settings) async {
    if (_userId == null) {
      talker.warning(
        '[ThemePreference] Hydration dropped: userId not loaded yet',
      );
      return;
    }
    if (!state.syncAcrossDevices || state.mode == FluxerThemeMode.system) {
      return;
    }
    if (state.inflightTheme != null) {
      return;
    }
    final serverMode = _modeFromJson(settings.theme);
    if (serverMode == null || serverMode == state.mode) {
      return;
    }
    state = state.copyWith(mode: serverMode);
    await _persist();
  }

  Future<void> _persist() async {
    final userId = _userId;
    if (userId == null) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    try {
      await db.userPreferencesDao.savePreferences(
        UserPreferencesTableCompanion(
          userId: Value(userId),
          theme: Value(state.mode.name),
          scaleFactor: Value(state.scaleFactor),
          chatFontSize: Value(state.chatFontSize),
          syncAcrossDevices: Value(state.syncAcrossDevices),
        ),
      );
    } on Object catch (e, st) {
      talker.error('[ThemePreference] Persist failed', e, st);
    }
  }

  UserSettingsUpdateRequestThemeTheme _toSettingsTheme(FluxerThemeMode mode) =>
      switch (mode) {
        FluxerThemeMode.dark => UserSettingsUpdateRequestThemeTheme.dark,
        FluxerThemeMode.coal => UserSettingsUpdateRequestThemeTheme.coal,
        FluxerThemeMode.light => UserSettingsUpdateRequestThemeTheme.light,
        FluxerThemeMode.system => UserSettingsUpdateRequestThemeTheme.system,
      };

  FluxerThemeMode? _modeFromJson(String raw) => switch (raw) {
    'dark' => FluxerThemeMode.dark,
    'coal' => FluxerThemeMode.coal,
    'light' => FluxerThemeMode.light,
    'system' => FluxerThemeMode.system,
    _ => null,
  };
}
