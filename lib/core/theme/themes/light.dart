import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/color_families.dart';
import 'package:fluxer_app/core/theme/color_generator.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';

/// Builds the light color theme using the color generator system.
FluxerColorTheme buildLightColorTheme({double saturationFactor = 1.0}) {
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

  final lightSurface = const ColorScale(
    family: FluxerColorFamilies.neutralLight,
    lightnessStart: 86,
    lightnessEnd: 98.5,
    curve: ScaleCurves.easeIn,
    stops: [
      ScaleStop(name: 'backgroundHeaderPrimaryHover', position: 0),
      ScaleStop(name: 'backgroundHeaderPrimary', position: 0.12),
      ScaleStop(name: 'backgroundHeaderSecondary', position: 0.2),
      ScaleStop(name: 'guildListForeground', position: 0.35),
      ScaleStop(name: 'backgroundTertiary', position: 0.42),
      ScaleStop(name: 'backgroundChannelHeader', position: 0.5),
      ScaleStop(name: 'backgroundSecondaryAlt', position: 0.63),
      ScaleStop(name: 'backgroundSecondary', position: 0.74),
      ScaleStop(name: 'backgroundSecondaryLighter', position: 0.83),
      ScaleStop(name: 'backgroundTextarea', position: 0.88),
      ScaleStop(name: 'backgroundPrimary', position: 1),
    ],
  ).build(saturationFactor: saturationFactor);

  final lightText = const ColorScale(
    family: FluxerColorFamilies.neutralLight,
    lightnessStart: 15,
    lightnessEnd: 60,
    curve: ScaleCurves.easeOut,
    stops: [
      ScaleStop(name: 'textPrimary', position: 0),
      ScaleStop(name: 'textChat', position: 0.08),
      ScaleStop(name: 'textSecondary', position: 0.28),
      ScaleStop(name: 'textChatMuted', position: 0.45),
      ScaleStop(name: 'textPrimaryMuted', position: 0.45),
      ScaleStop(name: 'textTertiary', position: 0.6),
      ScaleStop(name: 'textTertiarySecondary', position: 0.75),
      ScaleStop(name: 'textTertiaryMuted', position: 0.85),
    ],
  ).build(saturationFactor: saturationFactor);

  // ---------------------------------------------------------------------------
  // Individual tone tokens
  // ---------------------------------------------------------------------------

  final brandPrimary = tone(FluxerColorFamilies.brand, 55);
  final statusOnline = toneDirect(hue: 142, saturation: 70, lightness: 40);
  final statusIdle = toneDirect(hue: 45, saturation: 90, lightness: 45);
  final statusDnd = toneDirect(hue: 359, saturation: 70, lightness: 50);
  final textLink = toneDirect(hue: 210, saturation: 100, lightness: 45);
  final textSecondary = lightText['textSecondary']!;
  final textPrimary = lightText['textPrimary']!;
  final backgroundSecondary = lightSurface['backgroundSecondary']!;
  final backgroundSecondaryAlt = lightSurface['backgroundSecondaryAlt']!;
  final backgroundTertiary = lightSurface['backgroundTertiary']!;
  final backgroundPrimary = lightSurface['backgroundPrimary']!;
  final borderColorVal = toneDirect(
    hue: 220,
    saturation: 10,
    lightness: 40,
    alpha: 0.15,
  );
  final backgroundModifierHoverVal = toneDirect(
    hue: 220,
    saturation: 10,
    lightness: 10,
    alpha: 0.05,
  );
  final backgroundModifierSelectedVal = toneDirect(
    hue: 220,
    saturation: 10,
    lightness: 10,
    alpha: 0.1,
  );
  final backgroundModifierAccentVal = toneDirect(
    hue: 220,
    saturation: 10,
    lightness: 40,
    alpha: 0.22,
  );

  // ---------------------------------------------------------------------------
  // Assemble theme
  // ---------------------------------------------------------------------------

  return FluxerColorTheme(
    // Background (from lightSurface scale)
    backgroundPrimary: backgroundPrimary,
    backgroundSecondary: backgroundSecondary,
    backgroundSecondaryLighter: lightSurface['backgroundSecondaryLighter']!,
    backgroundSecondaryAlt: backgroundSecondaryAlt,
    backgroundTertiary: backgroundTertiary,
    backgroundTextarea: lightSurface['backgroundTextarea']!,
    backgroundHeaderPrimary: lightSurface['backgroundHeaderPrimary']!,
    backgroundHeaderPrimaryHover: lightSurface['backgroundHeaderPrimaryHover']!,
    backgroundHeaderSecondary: lightSurface['backgroundHeaderSecondary']!,
    backgroundChannelHeader: lightSurface['backgroundChannelHeader']!,
    backgroundFloating: toneDirect(hue: 220, saturation: 10, lightness: 80),
    guildListForeground: lightSurface['guildListForeground']!,
    backgroundModifierHover: backgroundModifierHoverVal,
    backgroundModifierSelected: backgroundModifierSelectedVal,
    backgroundModifierAccent: backgroundModifierAccentVal,
    backgroundModifierAccentFocus: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 40,
      alpha: 0.32,
    ),

    // Brand
    brandPrimary: brandPrimary,
    brandSecondary: tone(FluxerColorFamilies.brand, 49, saturation: 60),
    brandPrimaryLight: toneDirect(hue: 242, saturation: 100, lightness: 84),
    brandPrimaryFill: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),

    // Status
    statusOnline: statusOnline,
    statusIdle: statusIdle,
    statusDnd: statusDnd,
    statusOffline: toneDirect(hue: 210, saturation: 10, lightness: 55),
    statusDanger: tone(FluxerColorFamilies.statusDanger, 55),
    statusWarning: statusIdle,

    // Text (from lightText scale + individual tones)
    textPrimary: textPrimary,
    textSecondary: textSecondary,
    textTertiary: lightText['textTertiary']!,
    textPrimaryMuted: lightText['textPrimaryMuted']!,
    textChat: lightText['textChat']!,
    textChatMuted: lightText['textChatMuted']!,
    textLink: textLink,
    textOnBrandPrimary: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 98,
      useSatFactor: false,
    ),
    textTertiaryMuted: lightText['textTertiaryMuted']!,
    textTertiarySecondary: lightText['textTertiarySecondary']!,
    textWarning: tone(FluxerColorFamilies.statusIdle, 55),
    textDanger: tone(FluxerColorFamilies.statusDanger, 55),
    textPositive: statusOnline,
    textCode: toneDirect(hue: 340, saturation: 50, lightness: 45),

    // Border
    borderColor: borderColorVal,
    borderColorHover: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 40,
      alpha: 0.25,
    ),
    borderColorFocus: toneDirect(
      hue: 210,
      saturation: 90,
      lightness: 50,
      alpha: 0.4,
    ),

    // Accent
    accentPrimary: brandPrimary,
    accentSuccess: statusOnline,
    accentWarning: statusIdle,
    accentDanger: statusDnd,
    accentInfo: textLink,
    accentPurple: tone(FluxerColorFamilies.accentPurple, 65),

    // Alert
    alertNote: toneDirect(hue: 210, saturation: 100, lightness: 45),
    alertTip: toneDirect(hue: 150, saturation: 80, lightness: 35),
    alertImportant: toneDirect(hue: 270, saturation: 80, lightness: 50),
    alertWarning: toneDirect(hue: 45, saturation: 90, lightness: 45),
    alertCaution: toneDirect(hue: 358, saturation: 80, lightness: 50),

    // Markup
    markupMentionText: textLink,
    markupMentionFill: textLink.withValues(alpha: 0.2),
    markupMentionBorder: toneDirect(
      hue: 210,
      saturation: 100,
      lightness: 45,
      alpha: 0.4,
    ),
    markupInteractiveHoverText: textLink,
    markupInteractiveHoverFill: textLink.withValues(alpha: 0.3),
    markupJumpLinkText: textLink,
    markupJumpLinkFill: textLink.withValues(alpha: 0.08),
    markupJumpLinkHoverFill: textLink.withValues(alpha: 0.2),
    markupEveryoneText: toneDirect(hue: 250, saturation: 70, lightness: 45),
    markupEveryoneFill: toneDirect(
      hue: 250,
      saturation: 70,
      lightness: 45,
      alpha: 0.12,
    ),
    markupEveryoneBorder: toneDirect(
      hue: 250,
      saturation: 70,
      lightness: 45,
      alpha: 0.4,
    ),
    markupHereText: toneDirect(hue: 40, saturation: 85, lightness: 40),
    markupHereFill: toneDirect(
      hue: 40,
      saturation: 85,
      lightness: 40,
      alpha: 0.12,
    ),
    markupHereBorder: toneDirect(
      hue: 40,
      saturation: 85,
      lightness: 40,
      alpha: 0.4,
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
    buttonSecondaryFill: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 10,
      alpha: 0.1,
    ),
    buttonSecondaryActiveFill: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 10,
      alpha: 0.15,
    ),
    buttonSecondaryText: toneDirect(hue: 220, saturation: 10, lightness: 15),
    buttonSecondaryActiveText: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 10,
    ),
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
      lightness: 50,
    ),
    buttonDangerOutlineText: toneDirect(
      hue: 359,
      saturation: 70,
      lightness: 45,
    ),
    buttonDangerOutlineActiveFill: toneDirect(
      hue: 359,
      saturation: 70,
      lightness: 50,
    ),
    buttonGhostText: toneDirect(hue: 220, saturation: 10, lightness: 20),
    buttonInvertedFill: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 100,
      useSatFactor: false,
    ),
    buttonInvertedText: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 10,
      useSatFactor: false,
    ),
    buttonOutlineBorder: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 40,
      alpha: 0.3,
    ),
    buttonOutlineText: toneDirect(hue: 220, saturation: 10, lightness: 20),
    buttonOutlineActiveFill: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 10,
      alpha: 0.1,
    ),

    // Panel Control
    panelControlBg: Color.alphaBlend(
      backgroundSecondary.withValues(alpha: 0.65),
      const Color(0xFFFFFFFF),
    ),
    panelControlBorder: toneDirect(
      hue: 220,
      saturation: 25,
      lightness: 45,
      alpha: 0.25,
    ),
    panelControlDivider: toneDirect(
      hue: 220,
      saturation: 30,
      lightness: 35,
      alpha: 0.2,
    ),
    panelControlHighlight: const Color(0xA6FFFFFF),

    // Control Button
    controlButtonNormalBg: Colors.transparent,
    controlButtonNormalText: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 50,
    ),
    controlButtonHoverBg: toneDirect(hue: 220, saturation: 10, lightness: 88),
    controlButtonHoverText: toneDirect(hue: 220, saturation: 10, lightness: 20),
    controlButtonActiveBg: toneDirect(hue: 220, saturation: 10, lightness: 85),
    controlButtonActiveText: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 15,
    ),
    controlButtonDangerText: toneDirect(
      hue: 359,
      saturation: 70,
      lightness: 50,
    ),
    controlButtonDangerHoverBg: toneDirect(
      hue: 359,
      saturation: 70,
      lightness: 95,
    ),

    // Switch
    switchTrackInactive: toneDirect(hue: 220, saturation: 9, lightness: 46),
    switchThumb: Colors.white,
    switchThumbCheckedIcon: brandPrimary,
    switchThumbUncheckedIcon: lightText['textTertiary']!,

    // Menu
    menuDangerText: toneDirect(hue: 350, saturation: 90, lightness: 65),

    // Content Background
    bgCode: toneDirect(hue: 220, saturation: 22, lightness: 90, alpha: 0.9),
    bgCodeBlock: backgroundPrimary,
    bgTableHeader: backgroundTertiary,
    bgTableRowOdd: backgroundPrimary,
    bgTableRowEven: backgroundSecondary,

    // Interactive Surface
    surfaceInteractiveHoverBg: backgroundModifierHoverVal,
    surfaceInteractiveSelectedBg: backgroundModifierSelectedVal,
    surfaceInteractiveSelectedColor: textPrimary,

    // Scrollbar
    scrollbarThumbBg: const Color(0x99797A7C),
    scrollbarThumbBgHover: const Color(0xCC797A7C),
    scrollbarTrackBg: Colors.transparent,

    // Text Selection
    textSelection: toneDirect(
      hue: 210,
      saturation: 90,
      lightness: 50,
      alpha: 0.2,
    ),

    // UI-specific
    chatBackground: backgroundSecondary,
    chatInputBackground: lightSurface['backgroundSecondaryLighter']!,
    serverSidebarBackground: backgroundSecondary,
    serverIconBackground: backgroundTertiary,
    serverIconActive: brandPrimary,
    channelSidebarBackground: backgroundSecondary,
    memberListBackground: backgroundSecondary,
    userPanelBackground: toneDirect(hue: 220, saturation: 10, lightness: 90),
    userAreaDividerColor: toneDirect(
      hue: 220,
      saturation: 10,
      lightness: 40,
      alpha: 0.2,
    ),
    embedBackground: backgroundSecondaryAlt,
    embedBorder: borderColorVal,
    mentionBackground: backgroundModifierAccentVal,
    spoilerBackground: const Color(0x1A000000),
    spoilerOverlayHoverColor: const Color(0x26000000),
    focusPrimary: const Color(0xFF00B0F4),
    interactiveActive: toneDirect(
      hue: 0,
      saturation: 0,
      lightness: 10,
      useSatFactor: false,
    ),
    interactiveNormal: textSecondary,
    interactiveHover: textPrimary,
    interactiveMuted: toneDirect(hue: 220, saturation: 10, lightness: 60),
  );
}
