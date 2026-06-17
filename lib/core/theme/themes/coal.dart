import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/color_families.dart';
import 'package:fluxer_app/core/theme/color_generator.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';

/// Builds the coal (pitch-black AMOLED) color theme.
///
/// Coal starts from the dark theme but uses much darker, flatter surfaces.
/// The key characteristic is that backgroundSecondary equals backgroundPrimary,
/// eliminating surface differentiation.
FluxerColorTheme buildCoalColorTheme({double saturationFactor = 1.0}) {
  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  Color tone(
    ColorFamily family,
    double lightness, {
    double alpha = 1.0,
    double? saturation,
  }) {
    final sat = saturation ?? family.saturation;
    final effectiveSat = family.useSaturationFactor
        ? sat * saturationFactor
        : sat;
    return generateTone(
      hue: family.hue,
      saturation: effectiveSat,
      lightness: lightness,
      opacity: alpha,
    );
  }

  Color toneDirect({
    required double hue,
    required double saturation,
    required double lightness,
    double alpha = 1.0,
    bool useSatFactor = true,
  }) {
    final effectiveSat = useSatFactor
        ? saturation * saturationFactor
        : saturation;
    return generateTone(
      hue: hue,
      saturation: effectiveSat,
      lightness: lightness,
      opacity: alpha,
    );
  }

  // ---------------------------------------------------------------------------
  // Scales
  // ---------------------------------------------------------------------------

  // Coal surface: much narrower/darker range (L 1-12%) than dark (L 5-26%)
  final coalSurface = const ColorScale(
    family: FluxerColorFamilies.neutralDark,
    lightnessStart: 1,
    lightnessEnd: 12,
    curve: ScaleCurves.easeOut,
    stops: [
      ScaleStop(name: 'backgroundPrimary', position: 0),
      ScaleStop(name: 'backgroundSecondary', position: 0.16),
      ScaleStop(name: 'backgroundSecondaryLighter', position: 0.22),
      ScaleStop(name: 'backgroundSecondaryAlt', position: 0.28),
      ScaleStop(name: 'backgroundTertiary', position: 0.4),
      ScaleStop(name: 'backgroundChannelHeader', position: 0.34),
      ScaleStop(name: 'guildListForeground', position: 0.38),
      ScaleStop(name: 'backgroundHeaderSecondary', position: 0.5),
      ScaleStop(name: 'backgroundHeaderPrimary', position: 0.5),
      ScaleStop(name: 'backgroundTextarea', position: 0.68),
      ScaleStop(name: 'backgroundHeaderPrimaryHover', position: 0.85),
    ],
  ).build(saturationFactor: saturationFactor);

  // Text scale: same as dark theme
  final darkText = const ColorScale(
    family: FluxerColorFamilies.neutralDark,
    lightnessStart: 52,
    lightnessEnd: 96,
    curve: ScaleCurves.easeInOut,
    stops: [
      ScaleStop(name: 'textTertiarySecondary', position: 0),
      ScaleStop(name: 'textTertiaryMuted', position: 0.2),
      ScaleStop(name: 'textTertiary', position: 0.38),
      ScaleStop(name: 'textPrimaryMuted', position: 0.55),
      ScaleStop(name: 'textChatMuted', position: 0.55),
      ScaleStop(name: 'textSecondary', position: 0.72),
      ScaleStop(name: 'textChat', position: 0.82),
      ScaleStop(name: 'textPrimary', position: 1),
    ],
  ).build(saturationFactor: saturationFactor);

  // ---------------------------------------------------------------------------
  // Individual tone tokens
  // ---------------------------------------------------------------------------

  final brandPrimary = tone(FluxerColorFamilies.brand, 55);
  final statusOnline = tone(FluxerColorFamilies.statusOnline, 40);
  final statusIdle = tone(FluxerColorFamilies.statusIdle, 50);
  final statusDnd = tone(FluxerColorFamilies.statusDnd, 60);
  final textLink = tone(FluxerColorFamilies.link, 70);
  final textSecondary = darkText['textSecondary']!;
  final textPrimary = darkText['textPrimary']!;

  // Coal key characteristic: backgroundSecondary equals backgroundPrimary
  final backgroundPrimary = coalSurface['backgroundPrimary']!;
  final backgroundSecondary = backgroundPrimary;
  final backgroundSecondaryAlt = coalSurface['backgroundSecondaryAlt']!;
  final backgroundTertiary = coalSurface['backgroundTertiary']!;

  final borderColorVal = tone(FluxerColorFamilies.neutralDark, 50, alpha: 0.2);

  // Coal: lower alpha values for modifier backgrounds
  final backgroundModifierHoverVal = toneDirect(
    hue: 220,
    saturation: 13,
    lightness: 100,
    alpha: 0.04,
  );
  final backgroundModifierSelectedVal = toneDirect(
    hue: 220,
    saturation: 13,
    lightness: 100,
    alpha: 0.08,
  );
  final backgroundModifierAccentVal = toneDirect(
    hue: 220,
    saturation: 10,
    lightness: 65,
    alpha: 0.18,
  );

  // ---------------------------------------------------------------------------
  // Assemble theme
  // ---------------------------------------------------------------------------

  return FluxerColorTheme(
    // Background (from coalSurface scale)
    backgroundPrimary: backgroundPrimary,
    backgroundSecondary: backgroundSecondary,
    backgroundSecondaryLighter: backgroundPrimary,
    backgroundSecondaryAlt: backgroundSecondaryAlt,
    backgroundTertiary: backgroundTertiary,
    backgroundTextarea: coalSurface['backgroundTextarea']!,
    backgroundHeaderPrimary: coalSurface['backgroundHeaderPrimary']!,
    backgroundHeaderPrimaryHover: coalSurface['backgroundHeaderPrimaryHover']!,
    backgroundHeaderSecondary: coalSurface['backgroundHeaderSecondary']!,
    backgroundChannelHeader: coalSurface['backgroundChannelHeader']!,
    backgroundFloating: toneDirect(hue: 220, saturation: 13, lightness: 3),
    guildListForeground: coalSurface['guildListForeground']!,
    backgroundModifierHover: backgroundModifierHoverVal,
    backgroundModifierSelected: backgroundModifierSelectedVal,
    backgroundModifierAccent: backgroundModifierAccentVal,
    backgroundModifierAccentFocus: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 70,
      alpha: 0.26,
    ),

    // Brand (same as dark)
    brandPrimary: brandPrimary,
    brandSecondary: tone(FluxerColorFamilies.brand, 49, saturation: 60),
    brandPrimaryLight: toneDirect(hue: 242, saturation: 100, lightness: 84),
    brandPrimaryFill: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),

    // Status (same as dark)
    statusOnline: statusOnline,
    statusIdle: statusIdle,
    statusDnd: statusDnd,
    statusOffline: tone(FluxerColorFamilies.statusOffline, 65),
    statusDanger: tone(FluxerColorFamilies.statusDanger, 55),
    statusWarning: statusIdle,

    // Text (same as dark)
    textPrimary: textPrimary,
    textSecondary: textSecondary,
    textTertiary: darkText['textTertiary']!,
    textPrimaryMuted: darkText['textPrimaryMuted']!,
    textChat: darkText['textChat']!,
    textChatMuted: darkText['textChatMuted']!,
    textLink: textLink,
    textOnBrandPrimary: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 98,
      useSatFactor: false,
    ),
    textTertiaryMuted: darkText['textTertiaryMuted']!,
    textTertiarySecondary: darkText['textTertiarySecondary']!,
    textWarning: tone(FluxerColorFamilies.statusIdle, 55),
    textDanger: tone(FluxerColorFamilies.statusDanger, 55),
    textPositive: statusOnline,
    textCode: tone(FluxerColorFamilies.textCode, 90),

    // Border (same as dark)
    borderColor: borderColorVal,
    borderColorHover: tone(FluxerColorFamilies.neutralDark, 50, alpha: 0.3),
    borderColorFocus: toneDirect(
      hue: 210,
      saturation: 90,
      lightness: 70,
      alpha: 0.45,
    ),

    // Accent (same as dark)
    accentPrimary: brandPrimary,
    accentSuccess: statusOnline,
    accentWarning: statusIdle,
    accentDanger: statusDnd,
    accentInfo: textLink,
    accentPurple: tone(FluxerColorFamilies.accentPurple, 65),

    // Alert (same as dark)
    alertNote: tone(FluxerColorFamilies.link, 70),
    alertTip: tone(FluxerColorFamilies.statusOnline, 45),
    alertImportant: tone(FluxerColorFamilies.accentPurple, 65),
    alertWarning: tone(FluxerColorFamilies.statusIdle, 55),
    alertCaution: toneDirect(hue: 359, saturation: 75, lightness: 60),

    // Markup (same as dark)
    markupMentionText: textLink,
    markupMentionFill: textLink.withValues(alpha: 0.2),
    markupMentionBorder: tone(FluxerColorFamilies.link, 70, alpha: 0.3),
    markupInteractiveHoverText: textLink,
    markupInteractiveHoverFill: textLink.withValues(alpha: 0.3),
    markupJumpLinkText: textLink,
    markupJumpLinkFill: textLink.withValues(alpha: 0.12),
    markupJumpLinkHoverFill: textLink.withValues(alpha: 0.2),
    markupEveryoneText: toneDirect(hue: 250, saturation: 80, lightness: 75),
    markupEveryoneFill: toneDirect(
      hue: 250,
      saturation: 80,
      lightness: 75,
      alpha: 0.18,
    ),
    markupEveryoneBorder: toneDirect(
      hue: 250,
      saturation: 80,
      lightness: 75,
      alpha: 0.3,
    ),
    markupHereText: toneDirect(hue: 45, saturation: 90, lightness: 70),
    markupHereFill: toneDirect(
      hue: 45,
      saturation: 90,
      lightness: 70,
      alpha: 0.18,
    ),
    markupHereBorder: toneDirect(
      hue: 45,
      saturation: 90,
      lightness: 70,
      alpha: 0.3,
    ),

    // Button
    buttonPrimaryFill: toneDirect(hue: 139, saturation: 55, lightness: 44),
    buttonPrimaryActiveFill: toneDirect(
      hue: 136,
      saturation: 60,
      lightness: 38,
    ),
    buttonPrimaryText: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    // Coal: lower alpha for secondary buttons
    buttonSecondaryFill: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      alpha: 0.04,
      useSatFactor: false,
    ),
    buttonSecondaryActiveFill: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      alpha: 0.07,
      useSatFactor: false,
    ),
    // Coal: secondary button text uses textPrimary
    buttonSecondaryText: textPrimary,
    buttonSecondaryActiveText: textPrimary,
    buttonDangerFill: toneDirect(hue: 359, saturation: 70, lightness: 54),
    buttonDangerActiveFill: toneDirect(hue: 359, saturation: 65, lightness: 45),
    buttonDangerText: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    buttonDangerOutlineBorder: toneDirect(
      hue: 359,
      saturation: 70,
      lightness: 54,
    ),
    buttonDangerOutlineText: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    buttonDangerOutlineActiveFill: toneDirect(
      hue: 359,
      saturation: 65,
      lightness: 48,
    ),
    buttonGhostText: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    buttonInvertedFill: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    buttonInvertedText: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 0,
      useSatFactor: false,
    ),
    // Coal: lower alpha for outline buttons
    buttonOutlineBorder: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      alpha: 0.08,
      useSatFactor: false,
    ),
    buttonOutlineText: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    buttonOutlineActiveFill: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      alpha: 0.12,
      useSatFactor: false,
    ),

    // Panel Control
    panelControlBg: Color.alphaBlend(
      backgroundPrimary.withValues(alpha: 0.9),
      toneDirect(hue: 220, saturation: 13, lightness: 0),
    ),
    panelControlBorder: tone(
      FluxerColorFamilies.neutralDark,
      30,
      saturation: 20,
      alpha: 0.35,
    ),
    panelControlDivider: tone(
      FluxerColorFamilies.neutralDark,
      25,
      saturation: 20,
      alpha: 0.28,
    ),
    panelControlHighlight: const Color(0x0FFFFFFF),

    // Control Button
    controlButtonNormalBg: Colors.transparent,
    controlButtonNormalText: darkText['textPrimaryMuted']!,
    controlButtonHoverBg: tone(FluxerColorFamilies.neutralDark, 12),
    controlButtonHoverText: textPrimary,
    controlButtonActiveBg: tone(FluxerColorFamilies.neutralDark, 14),
    controlButtonActiveText: textPrimary,
    controlButtonDangerText: toneDirect(hue: 1, saturation: 77, lightness: 60),
    controlButtonDangerHoverBg: toneDirect(
      hue: 1,
      saturation: 77,
      lightness: 20,
    ),

    // Switch
    switchTrackInactive: toneDirect(hue: 220, saturation: 9, lightness: 46),
    switchThumb: Colors.white,
    switchThumbCheckedIcon: brandPrimary,
    switchThumbUncheckedIcon: darkText['textTertiary']!,

    // Menu
    menuDangerText: toneDirect(hue: 350, saturation: 90, lightness: 65),

    // Content Background (coal overrides)
    bgCode: toneDirect(hue: 220, saturation: 13, lightness: 8),
    bgCodeBlock: backgroundSecondaryAlt,
    bgTableHeader: backgroundTertiary,
    bgTableRowOdd: backgroundPrimary,
    bgTableRowEven: backgroundSecondary,

    // Interactive Surface
    surfaceInteractiveHoverBg: backgroundModifierHoverVal,
    surfaceInteractiveSelectedBg: backgroundModifierSelectedVal,
    surfaceInteractiveSelectedColor: textPrimary,

    // Scrollbar (coal overrides)
    scrollbarThumbBg: const Color(0x59A0A0A0),
    scrollbarThumbBgHover: const Color(0x8CC8C8C8),
    scrollbarTrackBg: const Color(0x73000000),

    // Text Selection
    textSelection: toneDirect(
      hue: 210,
      saturation: 90,
      lightness: 70,
      alpha: 0.35,
    ),

    // UI-specific (derives from coal scale)
    chatBackground: backgroundSecondary,
    chatInputBackground: coalSurface['backgroundSecondaryLighter']!,
    serverSidebarBackground: backgroundSecondary,
    serverIconBackground: backgroundTertiary,
    serverIconActive: brandPrimary,
    channelSidebarBackground: backgroundSecondary,
    memberListBackground: backgroundSecondary,
    userPanelBackground: toneDirect(hue: 220, saturation: 13, lightness: 10),
    userAreaDividerColor: backgroundModifierHoverVal.withValues(
      alpha: backgroundModifierHoverVal.a * 0.7,
    ),
    embedBackground: backgroundSecondaryAlt,
    embedBorder: borderColorVal,
    mentionBackground: backgroundModifierAccentVal,
    spoilerBackground: const Color(0x33000000),
    spoilerOverlayHoverColor: const Color(0x4D000000),
    focusPrimary: const Color(0xFF00B0F4),
    interactiveActive: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    interactiveNormal: textSecondary,
    interactiveHover: textPrimary,
    interactiveMuted: toneDirect(hue: 228, saturation: 10, lightness: 35),
  );
}
