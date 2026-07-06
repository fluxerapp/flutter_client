import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_engine.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as pb;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_dart/export.dart';

typedef SyncedThemeCustomizationApplier =
    Future<void> Function({
      double? saturationFactor,
      String? customThemeCss,
      bool updateSaturationFactor,
      bool updateCustomThemeCss,
      bool clearCustomThemeCss,
    });

Future<void> applySyncedThemeFromUserSettings(
  UserSettingsResponse settings,
  SyncedThemeCustomizationApplier apply,
) async {
  final String encoded = settings.syncedPreferences;
  if (encoded.isEmpty) {
    return;
  }
  try {
    final synced = SyncedPreferencesEngine.decodeLenient(encoded);
    if (!synced.hasAccessibility()) {
      return;
    }
    await applyThemeCustomizationFromAccessibilityProto(
      synced.accessibility,
      apply,
    );
  } on Object catch (error, stackTrace) {
    talker.warning(
      '[SyncedTheme] Failed to apply theme from user settings',
      error,
      stackTrace,
    );
  }
}

Future<void> applyThemeCustomizationFromAccessibilityProto(
  pb.AccessibilitySettings accessibility,
  SyncedThemeCustomizationApplier apply,
) async {
  final bool hasSaturation = accessibility.hasSaturationFactor();
  final bool hasCustomThemeCssField = accessibility.hasCustomThemeCss();
  final String? normalizedCss = hasCustomThemeCssField
      ? normalizeCustomThemeCss(accessibility.customThemeCss)
      : null;
  final bool hasCustomThemeCss = normalizedCss != null;
  if (!hasSaturation && !hasCustomThemeCss) {
    return;
  }
  await apply(
    saturationFactor: hasSaturation
        ? clampSaturationFactor(accessibility.saturationFactor)
        : null,
    customThemeCss: normalizedCss,
    updateSaturationFactor: hasSaturation,
    updateCustomThemeCss: hasCustomThemeCss,
  );
}
