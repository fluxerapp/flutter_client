import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/synced_theme_hydration.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_sync_service.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_preference_provider.g.dart';

const _kInflightSentinel = Object();

class _BuiltColorThemes {
  const _BuiltColorThemes({
    required this.dark,
    required this.light,
    required this.coal,
  });

  final FluxerColorTheme dark;
  final FluxerColorTheme light;
  final FluxerColorTheme coal;
}

FluxerColorTheme _themedColor(
  FluxerThemeMode mode,
  FluxerColorTheme Function({double saturationFactor}) builder, {
  required double saturationFactor,
  required String? customThemeCss,
}) => applyCustomThemeCss(
  builder(saturationFactor: saturationFactor),
  css: customThemeCss,
  saturationFactor: saturationFactor,
  mode: mode,
);

_BuiltColorThemes _buildColorThemes({
  required double saturationFactor,
  required String? customThemeCss,
}) {
  return _BuiltColorThemes(
    dark: _themedColor(
      FluxerThemeMode.dark,
      buildDarkColorTheme,
      saturationFactor: saturationFactor,
      customThemeCss: customThemeCss,
    ),
    light: _themedColor(
      FluxerThemeMode.light,
      buildLightColorTheme,
      saturationFactor: saturationFactor,
      customThemeCss: customThemeCss,
    ),
    coal: _themedColor(
      FluxerThemeMode.coal,
      buildCoalColorTheme,
      saturationFactor: saturationFactor,
      customThemeCss: customThemeCss,
    ),
  );
}

_BuiltColorThemes _buildActiveColorThemes({
  required FluxerThemeMode mode,
  required double saturationFactor,
  required String? customThemeCss,
  required FluxerColorTheme dark,
  required FluxerColorTheme light,
  required FluxerColorTheme coal,
}) {
  switch (mode) {
    case FluxerThemeMode.dark:
      return _BuiltColorThemes(
        dark: _themedColor(
          FluxerThemeMode.dark,
          buildDarkColorTheme,
          saturationFactor: saturationFactor,
          customThemeCss: customThemeCss,
        ),
        light: light,
        coal: coal,
      );
    case FluxerThemeMode.light:
      return _BuiltColorThemes(
        dark: dark,
        light: _themedColor(
          FluxerThemeMode.light,
          buildLightColorTheme,
          saturationFactor: saturationFactor,
          customThemeCss: customThemeCss,
        ),
        coal: coal,
      );
    case FluxerThemeMode.coal:
      return _BuiltColorThemes(
        dark: dark,
        light: light,
        coal: _themedColor(
          FluxerThemeMode.coal,
          buildCoalColorTheme,
          saturationFactor: saturationFactor,
          customThemeCss: customThemeCss,
        ),
      );
    case FluxerThemeMode.system:
      return _BuiltColorThemes(
        dark: _themedColor(
          FluxerThemeMode.dark,
          buildDarkColorTheme,
          saturationFactor: saturationFactor,
          customThemeCss: customThemeCss,
        ),
        light: _themedColor(
          FluxerThemeMode.light,
          buildLightColorTheme,
          saturationFactor: saturationFactor,
          customThemeCss: customThemeCss,
        ),
        coal: coal,
      );
  }
}

class ThemePreferenceState {
  factory ThemePreferenceState({
    FluxerThemeMode mode = FluxerThemeMode.dark,
    double scaleFactor = 1.0,
    int chatFontSize = 16,
    bool syncAcrossDevices = true,
    double saturationFactor = 1.0,
    String? customThemeCss,
    FluxerThemeMode? inflightTheme,
  }) {
    final _BuiltColorThemes themes = _buildColorThemes(
      saturationFactor: clampSaturationFactor(saturationFactor),
      customThemeCss: normalizeCustomThemeCss(customThemeCss),
    );
    return ThemePreferenceState._(
      mode: mode,
      scaleFactor: scaleFactor,
      chatFontSize: chatFontSize,
      syncAcrossDevices: syncAcrossDevices,
      saturationFactor: clampSaturationFactor(saturationFactor),
      customThemeCss: normalizeCustomThemeCss(customThemeCss),
      inflightTheme: inflightTheme,
      darkColorTheme: themes.dark,
      lightColorTheme: themes.light,
      coalColorTheme: themes.coal,
      layoutTheme: FluxerLayoutTheme.scaled(scaleFactor: scaleFactor),
    );
  }

  ThemePreferenceState._({
    required this.mode,
    required this.scaleFactor,
    required this.chatFontSize,
    required this.syncAcrossDevices,
    required this.saturationFactor,
    required this.customThemeCss,
    required this.inflightTheme,
    required this.darkColorTheme,
    required this.lightColorTheme,
    required this.coalColorTheme,
    required this.layoutTheme,
  });

  final FluxerThemeMode mode;
  final double scaleFactor;
  final int chatFontSize;
  final bool syncAcrossDevices;
  final double saturationFactor;
  final String? customThemeCss;

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
    double? saturationFactor,
    String? customThemeCss,
    bool clearCustomThemeCss = false,
    Object? inflightTheme = _kInflightSentinel,
    bool rebuildAllColorThemes = true,
  }) {
    final FluxerThemeMode nextMode = mode ?? this.mode;
    final double nextSaturationFactor = saturationFactor == null
        ? this.saturationFactor
        : clampSaturationFactor(saturationFactor);
    final String? nextCustomThemeCss = clearCustomThemeCss
        ? null
        : normalizeCustomThemeCss(customThemeCss ?? this.customThemeCss);
    final double nextScaleFactor = scaleFactor ?? this.scaleFactor;
    final bool themesChanged =
        nextSaturationFactor != this.saturationFactor ||
        nextCustomThemeCss != this.customThemeCss;
    final _BuiltColorThemes themes;
    if (!themesChanged) {
      themes = _BuiltColorThemes(
        dark: darkColorTheme,
        light: lightColorTheme,
        coal: coalColorTheme,
      );
    } else if (rebuildAllColorThemes) {
      themes = _buildColorThemes(
        saturationFactor: nextSaturationFactor,
        customThemeCss: nextCustomThemeCss,
      );
    } else {
      themes = _buildActiveColorThemes(
        mode: nextMode,
        saturationFactor: nextSaturationFactor,
        customThemeCss: nextCustomThemeCss,
        dark: darkColorTheme,
        light: lightColorTheme,
        coal: coalColorTheme,
      );
    }
    return ThemePreferenceState._(
      mode: nextMode,
      scaleFactor: nextScaleFactor,
      chatFontSize: chatFontSize ?? this.chatFontSize,
      syncAcrossDevices: syncAcrossDevices ?? this.syncAcrossDevices,
      saturationFactor: nextSaturationFactor,
      customThemeCss: nextCustomThemeCss,
      inflightTheme: identical(inflightTheme, _kInflightSentinel)
          ? this.inflightTheme
          : inflightTheme as FluxerThemeMode?,
      darkColorTheme: themes.dark,
      lightColorTheme: themes.light,
      coalColorTheme: themes.coal,
      layoutTheme: nextScaleFactor == this.scaleFactor
          ? layoutTheme
          : FluxerLayoutTheme.scaled(scaleFactor: nextScaleFactor),
    );
  }
}

@Riverpod(keepAlive: true)
class ThemePreference extends _$ThemePreference {
  String? _userId;
  bool _isApplyingRemote = false;

  @override
  ThemePreferenceState build() {
    ref.listen<AsyncValue<UserSettingsResponse?>>(
      userSettingsStatusStreamProvider,
      (
        AsyncValue<UserSettingsResponse?>? previous,
        AsyncValue<UserSettingsResponse?> next,
      ) {
        final UserSettingsResponse? settings = next.value;
        if (settings == null || _userId == null) {
          return;
        }
        unawaited(_applyRemoteUserSettings(settings));
      },
    );
    return ThemePreferenceState();
  }

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
        saturationFactor: prefs.saturationFactor,
        customThemeCss: prefs.customThemeCss.isEmpty
            ? null
            : prefs.customThemeCss,
      );
    } else {
      state = ThemePreferenceState();
    }
    await _applyCachedUserSettings(userId);
    await _hydrateThemeFromServerOnLoad();
  }

  Future<void> _applyCachedUserSettings(String userId) async {
    final row = await ref
        .read(fluxerDatabaseProvider)
        .userSettingsDao
        .getSettings(userId);
    if (row == null) {
      return;
    }
    try {
      final Object? decoded = jsonDecode(row.data);
      if (decoded is! Map<String, dynamic>) {
        return;
      }
      await _applyRemoteUserSettings(UserSettingsResponse.fromJson(decoded));
    } on Object catch (e, st) {
      talker.warning('[ThemePreference] Cached settings apply failed', e, st);
    }
  }

  Future<void> _hydrateThemeFromServerOnLoad() async {
    try {
      final UserSettingsResponse settings = await ref
          .read(userSettingsSyncProvider)
          .fetchCurrentSettings();
      await _applyRemoteUserSettings(settings);
    } on Object catch (e, st) {
      talker.warning('[ThemePreference] Server theme fetch failed', e, st);
    }
  }

  Future<void> _applyRemoteUserSettings(UserSettingsResponse settings) async {
    await ref
        .read(syncedPreferencesStoreProvider)
        .hydrateFromUserSettings(
          settings,
          themeCustomizationApplier: applySyncedThemeCustomization,
        );
    await applySyncedThemeFromUserSettings(
      settings,
      applySyncedThemeCustomization,
    );
    if (state.syncAcrossDevices && state.mode != FluxerThemeMode.system) {
      await applyServerSettings(settings);
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

  void previewSaturationFactor(double value) {
    final double clamped = clampSaturationFactor(value);
    if (state.saturationFactor == clamped) {
      return;
    }
    state = state.copyWith(
      saturationFactor: clamped,
      rebuildAllColorThemes: false,
    );
  }

  Future<void> setSaturationFactor(double value) async {
    final double clamped = clampSaturationFactor(value);
    final ThemePreferenceState current = state;
    state = ThemePreferenceState(
      mode: current.mode,
      scaleFactor: current.scaleFactor,
      chatFontSize: current.chatFontSize,
      syncAcrossDevices: current.syncAcrossDevices,
      saturationFactor: clamped,
      customThemeCss: current.customThemeCss,
      inflightTheme: current.inflightTheme,
    );
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> applySyncedThemeCustomization({
    double? saturationFactor,
    String? customThemeCss,
    bool updateSaturationFactor = true,
    bool updateCustomThemeCss = true,
    bool clearCustomThemeCss = false,
  }) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(
        saturationFactor: updateSaturationFactor ? saturationFactor : null,
        customThemeCss: updateCustomThemeCss ? customThemeCss : null,
        clearCustomThemeCss: updateCustomThemeCss && clearCustomThemeCss,
      );
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
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

  void _markAccessibilityDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.accessibility);
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
          saturationFactor: Value(state.saturationFactor),
          customThemeCss: Value(state.customThemeCss ?? ''),
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
