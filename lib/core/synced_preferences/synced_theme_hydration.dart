import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as pb;
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';

typedef SyncedThemeCustomizationApplier =
    Future<void> Function({
      double? saturationFactor,
      String? customThemeCss,
      int? chatFontSize,
      double? scaleFactor,
      bool updateSaturationFactor,
      bool updateCustomThemeCss,
      bool updateChatFontSize,
      bool updateScaleFactor,
      bool clearCustomThemeCss,
    });

Future<void> applyThemeCustomizationFromAccessibilityProto(
  pb.AccessibilitySettings accessibility,
  SyncedThemeCustomizationApplier apply, {
  bool skipCustomThemeCss = false,
}) async {
  final bool hasSaturation = accessibility.hasSaturationFactor();
  final bool hasCustomThemeCssField = accessibility.hasCustomThemeCss();
  final bool hasFontSize = accessibility.hasFontSize();
  final bool hasZoomLevel = accessibility.hasZoomLevel();
  final String? normalizedCss = hasCustomThemeCssField
      ? normalizeCustomThemeCss(accessibility.customThemeCss)
      : null;
  final bool hasCustomThemeCss = normalizedCss != null;
  if (!hasSaturation && !hasCustomThemeCss && !hasFontSize && !hasZoomLevel) {
    return;
  }
  await apply(
    saturationFactor: hasSaturation
        ? clampSaturationFactor(accessibility.saturationFactor)
        : null,
    customThemeCss: normalizedCss,
    chatFontSize: hasFontSize ? snapChatFontSize(accessibility.fontSize) : null,
    scaleFactor: hasZoomLevel
        ? clampLayoutZoomLevel(protoZoomLevelToFactor(accessibility.zoomLevel))
        : null,
    updateSaturationFactor: hasSaturation,
    updateCustomThemeCss: hasCustomThemeCss && !skipCustomThemeCss,
    updateChatFontSize: hasFontSize,
    updateScaleFactor: hasZoomLevel,
  );
}
