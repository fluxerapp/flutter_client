enum FluxerThemeMode {
  dark,
  darkLegacy,
  light,
  coal,
  system;

  String get apiValue => switch (this) {
    FluxerThemeMode.dark => 'dark',
    FluxerThemeMode.darkLegacy => 'dark_legacy',
    FluxerThemeMode.light => 'light',
    FluxerThemeMode.coal => 'coal',
    FluxerThemeMode.system => 'system',
  };

  static FluxerThemeMode? fromApiValue(String raw) => switch (raw) {
    'dark' => FluxerThemeMode.dark,
    'dark_legacy' || 'darkLegacy' => FluxerThemeMode.darkLegacy,
    'light' => FluxerThemeMode.light,
    'coal' => FluxerThemeMode.coal,
    'system' => FluxerThemeMode.system,
    _ => null,
  };
}
