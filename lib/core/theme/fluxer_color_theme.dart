import 'package:flutter/material.dart';

class FluxerColorTheme extends ThemeExtension<FluxerColorTheme> {
  const FluxerColorTheme({
    // Background
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundSecondaryLighter,
    required this.backgroundSecondaryAlt,
    required this.backgroundTertiary,
    required this.backgroundTextarea,
    required this.backgroundHeaderPrimary,
    required this.backgroundHeaderPrimaryHover,
    required this.backgroundHeaderSecondary,
    required this.backgroundChannelHeader,
    required this.backgroundFloating,
    required this.guildListForeground,
    required this.backgroundModifierHover,
    required this.backgroundModifierSelected,
    required this.backgroundModifierAccent,
    required this.backgroundModifierAccentFocus,
    // Brand
    required this.brandPrimary,
    required this.brandSecondary,
    required this.brandPrimaryLight,
    required this.brandPrimaryFill,
    // Status
    required this.statusOnline,
    required this.statusIdle,
    required this.statusDnd,
    required this.statusOffline,
    required this.statusDanger,
    required this.statusWarning,
    // Text
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textPrimaryMuted,
    required this.textChat,
    required this.textChatMuted,
    required this.textLink,
    required this.textOnBrandPrimary,
    required this.textTertiaryMuted,
    required this.textTertiarySecondary,
    required this.textWarning,
    required this.textDanger,
    required this.textPositive,
    required this.textCode,
    // Border
    required this.borderColor,
    required this.borderColorHover,
    required this.borderColorFocus,
    // Accent
    required this.accentPrimary,
    required this.accentSuccess,
    required this.accentWarning,
    required this.accentDanger,
    required this.accentInfo,
    required this.accentPurple,
    // Alert
    required this.alertNote,
    required this.alertTip,
    required this.alertImportant,
    required this.alertWarning,
    required this.alertCaution,
    // Markup
    required this.markupMentionText,
    required this.markupMentionFill,
    required this.markupMentionBorder,
    required this.markupInteractiveHoverText,
    required this.markupInteractiveHoverFill,
    required this.markupJumpLinkText,
    required this.markupJumpLinkFill,
    required this.markupJumpLinkHoverFill,
    required this.markupEveryoneText,
    required this.markupEveryoneFill,
    required this.markupEveryoneBorder,
    required this.markupHereText,
    required this.markupHereFill,
    required this.markupHereBorder,
    // Button
    required this.buttonPrimaryFill,
    required this.buttonPrimaryActiveFill,
    required this.buttonPrimaryText,
    required this.buttonSecondaryFill,
    required this.buttonSecondaryActiveFill,
    required this.buttonSecondaryText,
    required this.buttonSecondaryActiveText,
    required this.buttonDangerFill,
    required this.buttonDangerActiveFill,
    required this.buttonDangerText,
    required this.buttonDangerOutlineBorder,
    required this.buttonDangerOutlineText,
    required this.buttonDangerOutlineActiveFill,
    required this.buttonGhostText,
    required this.buttonInvertedFill,
    required this.buttonInvertedText,
    required this.buttonOutlineBorder,
    required this.buttonOutlineText,
    required this.buttonOutlineActiveFill,
    // Panel Control
    required this.panelControlBg,
    required this.panelControlBorder,
    required this.panelControlDivider,
    required this.panelControlHighlight,
    // Control Button
    required this.controlButtonNormalBg,
    required this.controlButtonNormalText,
    required this.controlButtonHoverBg,
    required this.controlButtonHoverText,
    required this.controlButtonActiveBg,
    required this.controlButtonActiveText,
    required this.controlButtonDangerText,
    required this.controlButtonDangerHoverBg,
    // Switch
    required this.switchTrackInactive,
    required this.switchThumb,
    required this.switchThumbCheckedIcon,
    required this.switchThumbUncheckedIcon,
    // Menu
    required this.menuDangerText,
    // Content Background
    required this.bgCode,
    required this.bgCodeBlock,
    required this.bgTableHeader,
    required this.bgTableRowOdd,
    required this.bgTableRowEven,
    // Interactive Surface
    required this.surfaceInteractiveHoverBg,
    required this.surfaceInteractiveSelectedBg,
    required this.surfaceInteractiveSelectedColor,
    // Scrollbar
    required this.scrollbarThumbBg,
    required this.scrollbarThumbBgHover,
    required this.scrollbarTrackBg,
    // Text Selection
    required this.textSelection,
    // UI-specific
    required this.chatBackground,
    required this.chatInputBackground,
    required this.serverSidebarBackground,
    required this.serverIconBackground,
    required this.serverIconActive,
    required this.channelSidebarBackground,
    required this.memberListBackground,
    required this.userPanelBackground,
    required this.userAreaDividerColor,
    required this.embedBackground,
    required this.embedBorder,
    required this.mentionBackground,
    required this.spoilerBackground,
    required this.spoilerOverlayHoverColor,
    required this.focusPrimary,
    required this.interactiveActive,
    required this.interactiveNormal,
    required this.interactiveHover,
    required this.interactiveMuted,
  });

  // Background
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundSecondaryLighter;
  final Color backgroundSecondaryAlt;
  final Color backgroundTertiary;
  final Color backgroundTextarea;
  final Color backgroundHeaderPrimary;
  final Color backgroundHeaderPrimaryHover;
  final Color backgroundHeaderSecondary;
  final Color backgroundChannelHeader;
  final Color backgroundFloating;
  final Color guildListForeground;
  final Color backgroundModifierHover;
  final Color backgroundModifierSelected;
  final Color backgroundModifierAccent;
  final Color backgroundModifierAccentFocus;

  // Brand
  final Color brandPrimary;
  final Color brandSecondary;
  final Color brandPrimaryLight;
  final Color brandPrimaryFill;

  // Status
  final Color statusOnline;
  final Color statusIdle;
  final Color statusDnd;
  final Color statusOffline;
  final Color statusDanger;
  final Color statusWarning;

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textPrimaryMuted;
  final Color textChat;
  final Color textChatMuted;
  final Color textLink;
  final Color textOnBrandPrimary;
  final Color textTertiaryMuted;
  final Color textTertiarySecondary;
  final Color textWarning;
  final Color textDanger;
  final Color textPositive;
  final Color textCode;

  // Border
  final Color borderColor;
  final Color borderColorHover;
  final Color borderColorFocus;

  // Accent
  final Color accentPrimary;
  final Color accentSuccess;
  final Color accentWarning;
  final Color accentDanger;
  final Color accentInfo;
  final Color accentPurple;

  // Alert
  final Color alertNote;
  final Color alertTip;
  final Color alertImportant;
  final Color alertWarning;
  final Color alertCaution;

  // Markup
  final Color markupMentionText;
  final Color markupMentionFill;
  final Color markupMentionBorder;
  final Color markupInteractiveHoverText;
  final Color markupInteractiveHoverFill;
  final Color markupJumpLinkText;
  final Color markupJumpLinkFill;
  final Color markupJumpLinkHoverFill;
  final Color markupEveryoneText;
  final Color markupEveryoneFill;
  final Color markupEveryoneBorder;
  final Color markupHereText;
  final Color markupHereFill;
  final Color markupHereBorder;

  // Button
  final Color buttonPrimaryFill;
  final Color buttonPrimaryActiveFill;
  final Color buttonPrimaryText;
  final Color buttonSecondaryFill;
  final Color buttonSecondaryActiveFill;
  final Color buttonSecondaryText;
  final Color buttonSecondaryActiveText;
  final Color buttonDangerFill;
  final Color buttonDangerActiveFill;
  final Color buttonDangerText;
  final Color buttonDangerOutlineBorder;
  final Color buttonDangerOutlineText;
  final Color buttonDangerOutlineActiveFill;
  final Color buttonGhostText;
  final Color buttonInvertedFill;
  final Color buttonInvertedText;
  final Color buttonOutlineBorder;
  final Color buttonOutlineText;
  final Color buttonOutlineActiveFill;

  // Panel Control
  final Color panelControlBg;
  final Color panelControlBorder;
  final Color panelControlDivider;
  final Color panelControlHighlight;

  // Control Button
  final Color controlButtonNormalBg;
  final Color controlButtonNormalText;
  final Color controlButtonHoverBg;
  final Color controlButtonHoverText;
  final Color controlButtonActiveBg;
  final Color controlButtonActiveText;
  final Color controlButtonDangerText;
  final Color controlButtonDangerHoverBg;

  // Switch
  final Color switchTrackInactive;
  final Color switchThumb;
  final Color switchThumbCheckedIcon;
  final Color switchThumbUncheckedIcon;

  // Menu
  final Color menuDangerText;

  // Content Background
  final Color bgCode;
  final Color bgCodeBlock;
  final Color bgTableHeader;
  final Color bgTableRowOdd;
  final Color bgTableRowEven;

  // Interactive Surface
  final Color surfaceInteractiveHoverBg;
  final Color surfaceInteractiveSelectedBg;
  final Color surfaceInteractiveSelectedColor;

  // Scrollbar
  final Color scrollbarThumbBg;
  final Color scrollbarThumbBgHover;
  final Color scrollbarTrackBg;

  // Text Selection
  final Color textSelection;

  // UI-specific
  final Color chatBackground;
  final Color chatInputBackground;
  final Color serverSidebarBackground;
  final Color serverIconBackground;
  final Color serverIconActive;
  final Color channelSidebarBackground;
  final Color memberListBackground;
  final Color userPanelBackground;
  final Color userAreaDividerColor;
  final Color embedBackground;
  final Color embedBorder;
  final Color mentionBackground;
  final Color spoilerBackground;
  final Color spoilerOverlayHoverColor;
  final Color focusPrimary;
  final Color interactiveActive;
  final Color interactiveNormal;
  final Color interactiveHover;
  final Color interactiveMuted;

  @override
  FluxerColorTheme copyWith({
    // Background
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? backgroundSecondaryLighter,
    Color? backgroundSecondaryAlt,
    Color? backgroundTertiary,
    Color? backgroundTextarea,
    Color? backgroundHeaderPrimary,
    Color? backgroundHeaderPrimaryHover,
    Color? backgroundHeaderSecondary,
    Color? backgroundChannelHeader,
    Color? backgroundFloating,
    Color? guildListForeground,
    Color? backgroundModifierHover,
    Color? backgroundModifierSelected,
    Color? backgroundModifierAccent,
    Color? backgroundModifierAccentFocus,
    // Brand
    Color? brandPrimary,
    Color? brandSecondary,
    Color? brandPrimaryLight,
    Color? brandPrimaryFill,
    // Status
    Color? statusOnline,
    Color? statusIdle,
    Color? statusDnd,
    Color? statusOffline,
    Color? statusDanger,
    Color? statusWarning,
    // Text
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textPrimaryMuted,
    Color? textChat,
    Color? textChatMuted,
    Color? textLink,
    Color? textOnBrandPrimary,
    Color? textTertiaryMuted,
    Color? textTertiarySecondary,
    Color? textWarning,
    Color? textDanger,
    Color? textPositive,
    Color? textCode,
    // Border
    Color? borderColor,
    Color? borderColorHover,
    Color? borderColorFocus,
    // Accent
    Color? accentPrimary,
    Color? accentSuccess,
    Color? accentWarning,
    Color? accentDanger,
    Color? accentInfo,
    Color? accentPurple,
    // Alert
    Color? alertNote,
    Color? alertTip,
    Color? alertImportant,
    Color? alertWarning,
    Color? alertCaution,
    // Markup
    Color? markupMentionText,
    Color? markupMentionFill,
    Color? markupMentionBorder,
    Color? markupInteractiveHoverText,
    Color? markupInteractiveHoverFill,
    Color? markupJumpLinkText,
    Color? markupJumpLinkFill,
    Color? markupJumpLinkHoverFill,
    Color? markupEveryoneText,
    Color? markupEveryoneFill,
    Color? markupEveryoneBorder,
    Color? markupHereText,
    Color? markupHereFill,
    Color? markupHereBorder,
    // Button
    Color? buttonPrimaryFill,
    Color? buttonPrimaryActiveFill,
    Color? buttonPrimaryText,
    Color? buttonSecondaryFill,
    Color? buttonSecondaryActiveFill,
    Color? buttonSecondaryText,
    Color? buttonSecondaryActiveText,
    Color? buttonDangerFill,
    Color? buttonDangerActiveFill,
    Color? buttonDangerText,
    Color? buttonDangerOutlineBorder,
    Color? buttonDangerOutlineText,
    Color? buttonDangerOutlineActiveFill,
    Color? buttonGhostText,
    Color? buttonInvertedFill,
    Color? buttonInvertedText,
    Color? buttonOutlineBorder,
    Color? buttonOutlineText,
    Color? buttonOutlineActiveFill,
    // Panel Control
    Color? panelControlBg,
    Color? panelControlBorder,
    Color? panelControlDivider,
    Color? panelControlHighlight,
    // Control Button
    Color? controlButtonNormalBg,
    Color? controlButtonNormalText,
    Color? controlButtonHoverBg,
    Color? controlButtonHoverText,
    Color? controlButtonActiveBg,
    Color? controlButtonActiveText,
    Color? controlButtonDangerText,
    Color? controlButtonDangerHoverBg,
    // Switch
    Color? switchTrackInactive,
    Color? switchThumb,
    Color? switchThumbCheckedIcon,
    Color? switchThumbUncheckedIcon,
    // Menu
    Color? menuDangerText,
    // Content Background
    Color? bgCode,
    Color? bgCodeBlock,
    Color? bgTableHeader,
    Color? bgTableRowOdd,
    Color? bgTableRowEven,
    // Interactive Surface
    Color? surfaceInteractiveHoverBg,
    Color? surfaceInteractiveSelectedBg,
    Color? surfaceInteractiveSelectedColor,
    // Scrollbar
    Color? scrollbarThumbBg,
    Color? scrollbarThumbBgHover,
    Color? scrollbarTrackBg,
    // Text Selection
    Color? textSelection,
    // UI-specific
    Color? chatBackground,
    Color? chatInputBackground,
    Color? serverSidebarBackground,
    Color? serverIconBackground,
    Color? serverIconActive,
    Color? channelSidebarBackground,
    Color? memberListBackground,
    Color? userPanelBackground,
    Color? userAreaDividerColor,
    Color? embedBackground,
    Color? embedBorder,
    Color? mentionBackground,
    Color? spoilerBackground,
    Color? spoilerOverlayHoverColor,
    Color? focusPrimary,
    Color? interactiveActive,
    Color? interactiveNormal,
    Color? interactiveHover,
    Color? interactiveMuted,
  }) {
    return FluxerColorTheme(
      // Background
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundSecondaryLighter:
          backgroundSecondaryLighter ?? this.backgroundSecondaryLighter,
      backgroundSecondaryAlt:
          backgroundSecondaryAlt ?? this.backgroundSecondaryAlt,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
      backgroundTextarea: backgroundTextarea ?? this.backgroundTextarea,
      backgroundHeaderPrimary:
          backgroundHeaderPrimary ?? this.backgroundHeaderPrimary,
      backgroundHeaderPrimaryHover:
          backgroundHeaderPrimaryHover ?? this.backgroundHeaderPrimaryHover,
      backgroundHeaderSecondary:
          backgroundHeaderSecondary ?? this.backgroundHeaderSecondary,
      backgroundChannelHeader:
          backgroundChannelHeader ?? this.backgroundChannelHeader,
      backgroundFloating: backgroundFloating ?? this.backgroundFloating,
      guildListForeground: guildListForeground ?? this.guildListForeground,
      backgroundModifierHover:
          backgroundModifierHover ?? this.backgroundModifierHover,
      backgroundModifierSelected:
          backgroundModifierSelected ?? this.backgroundModifierSelected,
      backgroundModifierAccent:
          backgroundModifierAccent ?? this.backgroundModifierAccent,
      backgroundModifierAccentFocus:
          backgroundModifierAccentFocus ?? this.backgroundModifierAccentFocus,
      // Brand
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      brandPrimaryLight: brandPrimaryLight ?? this.brandPrimaryLight,
      brandPrimaryFill: brandPrimaryFill ?? this.brandPrimaryFill,
      // Status
      statusOnline: statusOnline ?? this.statusOnline,
      statusIdle: statusIdle ?? this.statusIdle,
      statusDnd: statusDnd ?? this.statusDnd,
      statusOffline: statusOffline ?? this.statusOffline,
      statusDanger: statusDanger ?? this.statusDanger,
      statusWarning: statusWarning ?? this.statusWarning,
      // Text
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textPrimaryMuted: textPrimaryMuted ?? this.textPrimaryMuted,
      textChat: textChat ?? this.textChat,
      textChatMuted: textChatMuted ?? this.textChatMuted,
      textLink: textLink ?? this.textLink,
      textOnBrandPrimary: textOnBrandPrimary ?? this.textOnBrandPrimary,
      textTertiaryMuted: textTertiaryMuted ?? this.textTertiaryMuted,
      textTertiarySecondary:
          textTertiarySecondary ?? this.textTertiarySecondary,
      textWarning: textWarning ?? this.textWarning,
      textDanger: textDanger ?? this.textDanger,
      textPositive: textPositive ?? this.textPositive,
      textCode: textCode ?? this.textCode,
      // Border
      borderColor: borderColor ?? this.borderColor,
      borderColorHover: borderColorHover ?? this.borderColorHover,
      borderColorFocus: borderColorFocus ?? this.borderColorFocus,
      // Accent
      accentPrimary: accentPrimary ?? this.accentPrimary,
      accentSuccess: accentSuccess ?? this.accentSuccess,
      accentWarning: accentWarning ?? this.accentWarning,
      accentDanger: accentDanger ?? this.accentDanger,
      accentInfo: accentInfo ?? this.accentInfo,
      accentPurple: accentPurple ?? this.accentPurple,
      // Alert
      alertNote: alertNote ?? this.alertNote,
      alertTip: alertTip ?? this.alertTip,
      alertImportant: alertImportant ?? this.alertImportant,
      alertWarning: alertWarning ?? this.alertWarning,
      alertCaution: alertCaution ?? this.alertCaution,
      // Markup
      markupMentionText: markupMentionText ?? this.markupMentionText,
      markupMentionFill: markupMentionFill ?? this.markupMentionFill,
      markupMentionBorder: markupMentionBorder ?? this.markupMentionBorder,
      markupInteractiveHoverText:
          markupInteractiveHoverText ?? this.markupInteractiveHoverText,
      markupInteractiveHoverFill:
          markupInteractiveHoverFill ?? this.markupInteractiveHoverFill,
      markupJumpLinkText: markupJumpLinkText ?? this.markupJumpLinkText,
      markupJumpLinkFill: markupJumpLinkFill ?? this.markupJumpLinkFill,
      markupJumpLinkHoverFill:
          markupJumpLinkHoverFill ?? this.markupJumpLinkHoverFill,
      markupEveryoneText: markupEveryoneText ?? this.markupEveryoneText,
      markupEveryoneFill: markupEveryoneFill ?? this.markupEveryoneFill,
      markupEveryoneBorder: markupEveryoneBorder ?? this.markupEveryoneBorder,
      markupHereText: markupHereText ?? this.markupHereText,
      markupHereFill: markupHereFill ?? this.markupHereFill,
      markupHereBorder: markupHereBorder ?? this.markupHereBorder,
      // Button
      buttonPrimaryFill: buttonPrimaryFill ?? this.buttonPrimaryFill,
      buttonPrimaryActiveFill:
          buttonPrimaryActiveFill ?? this.buttonPrimaryActiveFill,
      buttonPrimaryText: buttonPrimaryText ?? this.buttonPrimaryText,
      buttonSecondaryFill: buttonSecondaryFill ?? this.buttonSecondaryFill,
      buttonSecondaryActiveFill:
          buttonSecondaryActiveFill ?? this.buttonSecondaryActiveFill,
      buttonSecondaryText: buttonSecondaryText ?? this.buttonSecondaryText,
      buttonSecondaryActiveText:
          buttonSecondaryActiveText ?? this.buttonSecondaryActiveText,
      buttonDangerFill: buttonDangerFill ?? this.buttonDangerFill,
      buttonDangerActiveFill:
          buttonDangerActiveFill ?? this.buttonDangerActiveFill,
      buttonDangerText: buttonDangerText ?? this.buttonDangerText,
      buttonDangerOutlineBorder:
          buttonDangerOutlineBorder ?? this.buttonDangerOutlineBorder,
      buttonDangerOutlineText:
          buttonDangerOutlineText ?? this.buttonDangerOutlineText,
      buttonDangerOutlineActiveFill:
          buttonDangerOutlineActiveFill ?? this.buttonDangerOutlineActiveFill,
      buttonGhostText: buttonGhostText ?? this.buttonGhostText,
      buttonInvertedFill: buttonInvertedFill ?? this.buttonInvertedFill,
      buttonInvertedText: buttonInvertedText ?? this.buttonInvertedText,
      buttonOutlineBorder: buttonOutlineBorder ?? this.buttonOutlineBorder,
      buttonOutlineText: buttonOutlineText ?? this.buttonOutlineText,
      buttonOutlineActiveFill:
          buttonOutlineActiveFill ?? this.buttonOutlineActiveFill,
      // Panel Control
      panelControlBg: panelControlBg ?? this.panelControlBg,
      panelControlBorder: panelControlBorder ?? this.panelControlBorder,
      panelControlDivider: panelControlDivider ?? this.panelControlDivider,
      panelControlHighlight:
          panelControlHighlight ?? this.panelControlHighlight,
      // Control Button
      controlButtonNormalBg:
          controlButtonNormalBg ?? this.controlButtonNormalBg,
      controlButtonNormalText:
          controlButtonNormalText ?? this.controlButtonNormalText,
      controlButtonHoverBg: controlButtonHoverBg ?? this.controlButtonHoverBg,
      controlButtonHoverText:
          controlButtonHoverText ?? this.controlButtonHoverText,
      controlButtonActiveBg:
          controlButtonActiveBg ?? this.controlButtonActiveBg,
      controlButtonActiveText:
          controlButtonActiveText ?? this.controlButtonActiveText,
      controlButtonDangerText:
          controlButtonDangerText ?? this.controlButtonDangerText,
      controlButtonDangerHoverBg:
          controlButtonDangerHoverBg ?? this.controlButtonDangerHoverBg,
      // Switch
      switchTrackInactive: switchTrackInactive ?? this.switchTrackInactive,
      switchThumb: switchThumb ?? this.switchThumb,
      switchThumbCheckedIcon:
          switchThumbCheckedIcon ?? this.switchThumbCheckedIcon,
      switchThumbUncheckedIcon:
          switchThumbUncheckedIcon ?? this.switchThumbUncheckedIcon,
      // Menu
      menuDangerText: menuDangerText ?? this.menuDangerText,
      // Content Background
      bgCode: bgCode ?? this.bgCode,
      bgCodeBlock: bgCodeBlock ?? this.bgCodeBlock,
      bgTableHeader: bgTableHeader ?? this.bgTableHeader,
      bgTableRowOdd: bgTableRowOdd ?? this.bgTableRowOdd,
      bgTableRowEven: bgTableRowEven ?? this.bgTableRowEven,
      // Interactive Surface
      surfaceInteractiveHoverBg:
          surfaceInteractiveHoverBg ?? this.surfaceInteractiveHoverBg,
      surfaceInteractiveSelectedBg:
          surfaceInteractiveSelectedBg ?? this.surfaceInteractiveSelectedBg,
      surfaceInteractiveSelectedColor:
          surfaceInteractiveSelectedColor ??
          this.surfaceInteractiveSelectedColor,
      // Scrollbar
      scrollbarThumbBg: scrollbarThumbBg ?? this.scrollbarThumbBg,
      scrollbarThumbBgHover:
          scrollbarThumbBgHover ?? this.scrollbarThumbBgHover,
      scrollbarTrackBg: scrollbarTrackBg ?? this.scrollbarTrackBg,
      // Text Selection
      textSelection: textSelection ?? this.textSelection,
      // UI-specific
      chatBackground: chatBackground ?? this.chatBackground,
      chatInputBackground: chatInputBackground ?? this.chatInputBackground,
      serverSidebarBackground:
          serverSidebarBackground ?? this.serverSidebarBackground,
      serverIconBackground: serverIconBackground ?? this.serverIconBackground,
      serverIconActive: serverIconActive ?? this.serverIconActive,
      channelSidebarBackground:
          channelSidebarBackground ?? this.channelSidebarBackground,
      memberListBackground: memberListBackground ?? this.memberListBackground,
      userPanelBackground: userPanelBackground ?? this.userPanelBackground,
      userAreaDividerColor: userAreaDividerColor ?? this.userAreaDividerColor,
      embedBackground: embedBackground ?? this.embedBackground,
      embedBorder: embedBorder ?? this.embedBorder,
      mentionBackground: mentionBackground ?? this.mentionBackground,
      spoilerBackground: spoilerBackground ?? this.spoilerBackground,
      spoilerOverlayHoverColor:
          spoilerOverlayHoverColor ?? this.spoilerOverlayHoverColor,
      focusPrimary: focusPrimary ?? this.focusPrimary,
      interactiveActive: interactiveActive ?? this.interactiveActive,
      interactiveNormal: interactiveNormal ?? this.interactiveNormal,
      interactiveHover: interactiveHover ?? this.interactiveHover,
      interactiveMuted: interactiveMuted ?? this.interactiveMuted,
    );
  }

  @override
  FluxerColorTheme lerp(FluxerColorTheme? other, double t) {
    if (other is! FluxerColorTheme) {
      return this;
    }
    return FluxerColorTheme(
      // Background
      backgroundPrimary: Color.lerp(
        backgroundPrimary,
        other.backgroundPrimary,
        t,
      )!,
      backgroundSecondary: Color.lerp(
        backgroundSecondary,
        other.backgroundSecondary,
        t,
      )!,
      backgroundSecondaryLighter: Color.lerp(
        backgroundSecondaryLighter,
        other.backgroundSecondaryLighter,
        t,
      )!,
      backgroundSecondaryAlt: Color.lerp(
        backgroundSecondaryAlt,
        other.backgroundSecondaryAlt,
        t,
      )!,
      backgroundTertiary: Color.lerp(
        backgroundTertiary,
        other.backgroundTertiary,
        t,
      )!,
      backgroundTextarea: Color.lerp(
        backgroundTextarea,
        other.backgroundTextarea,
        t,
      )!,
      backgroundHeaderPrimary: Color.lerp(
        backgroundHeaderPrimary,
        other.backgroundHeaderPrimary,
        t,
      )!,
      backgroundHeaderPrimaryHover: Color.lerp(
        backgroundHeaderPrimaryHover,
        other.backgroundHeaderPrimaryHover,
        t,
      )!,
      backgroundHeaderSecondary: Color.lerp(
        backgroundHeaderSecondary,
        other.backgroundHeaderSecondary,
        t,
      )!,
      backgroundChannelHeader: Color.lerp(
        backgroundChannelHeader,
        other.backgroundChannelHeader,
        t,
      )!,
      backgroundFloating: Color.lerp(
        backgroundFloating,
        other.backgroundFloating,
        t,
      )!,
      guildListForeground: Color.lerp(
        guildListForeground,
        other.guildListForeground,
        t,
      )!,
      backgroundModifierHover: Color.lerp(
        backgroundModifierHover,
        other.backgroundModifierHover,
        t,
      )!,
      backgroundModifierSelected: Color.lerp(
        backgroundModifierSelected,
        other.backgroundModifierSelected,
        t,
      )!,
      backgroundModifierAccent: Color.lerp(
        backgroundModifierAccent,
        other.backgroundModifierAccent,
        t,
      )!,
      backgroundModifierAccentFocus: Color.lerp(
        backgroundModifierAccentFocus,
        other.backgroundModifierAccentFocus,
        t,
      )!,
      // Brand
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandPrimaryLight: Color.lerp(
        brandPrimaryLight,
        other.brandPrimaryLight,
        t,
      )!,
      brandPrimaryFill: Color.lerp(
        brandPrimaryFill,
        other.brandPrimaryFill,
        t,
      )!,
      // Status
      statusOnline: Color.lerp(statusOnline, other.statusOnline, t)!,
      statusIdle: Color.lerp(statusIdle, other.statusIdle, t)!,
      statusDnd: Color.lerp(statusDnd, other.statusDnd, t)!,
      statusOffline: Color.lerp(statusOffline, other.statusOffline, t)!,
      statusDanger: Color.lerp(statusDanger, other.statusDanger, t)!,
      statusWarning: Color.lerp(statusWarning, other.statusWarning, t)!,
      // Text
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textPrimaryMuted: Color.lerp(
        textPrimaryMuted,
        other.textPrimaryMuted,
        t,
      )!,
      textChat: Color.lerp(textChat, other.textChat, t)!,
      textChatMuted: Color.lerp(textChatMuted, other.textChatMuted, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,
      textOnBrandPrimary: Color.lerp(
        textOnBrandPrimary,
        other.textOnBrandPrimary,
        t,
      )!,
      textTertiaryMuted: Color.lerp(
        textTertiaryMuted,
        other.textTertiaryMuted,
        t,
      )!,
      textTertiarySecondary: Color.lerp(
        textTertiarySecondary,
        other.textTertiarySecondary,
        t,
      )!,
      textWarning: Color.lerp(textWarning, other.textWarning, t)!,
      textDanger: Color.lerp(textDanger, other.textDanger, t)!,
      textPositive: Color.lerp(textPositive, other.textPositive, t)!,
      textCode: Color.lerp(textCode, other.textCode, t)!,
      // Border
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      borderColorHover: Color.lerp(
        borderColorHover,
        other.borderColorHover,
        t,
      )!,
      borderColorFocus: Color.lerp(
        borderColorFocus,
        other.borderColorFocus,
        t,
      )!,
      // Accent
      accentPrimary: Color.lerp(accentPrimary, other.accentPrimary, t)!,
      accentSuccess: Color.lerp(accentSuccess, other.accentSuccess, t)!,
      accentWarning: Color.lerp(accentWarning, other.accentWarning, t)!,
      accentDanger: Color.lerp(accentDanger, other.accentDanger, t)!,
      accentInfo: Color.lerp(accentInfo, other.accentInfo, t)!,
      accentPurple: Color.lerp(accentPurple, other.accentPurple, t)!,
      // Alert
      alertNote: Color.lerp(alertNote, other.alertNote, t)!,
      alertTip: Color.lerp(alertTip, other.alertTip, t)!,
      alertImportant: Color.lerp(alertImportant, other.alertImportant, t)!,
      alertWarning: Color.lerp(alertWarning, other.alertWarning, t)!,
      alertCaution: Color.lerp(alertCaution, other.alertCaution, t)!,
      // Markup
      markupMentionText: Color.lerp(
        markupMentionText,
        other.markupMentionText,
        t,
      )!,
      markupMentionFill: Color.lerp(
        markupMentionFill,
        other.markupMentionFill,
        t,
      )!,
      markupMentionBorder: Color.lerp(
        markupMentionBorder,
        other.markupMentionBorder,
        t,
      )!,
      markupInteractiveHoverText: Color.lerp(
        markupInteractiveHoverText,
        other.markupInteractiveHoverText,
        t,
      )!,
      markupInteractiveHoverFill: Color.lerp(
        markupInteractiveHoverFill,
        other.markupInteractiveHoverFill,
        t,
      )!,
      markupJumpLinkText: Color.lerp(
        markupJumpLinkText,
        other.markupJumpLinkText,
        t,
      )!,
      markupJumpLinkFill: Color.lerp(
        markupJumpLinkFill,
        other.markupJumpLinkFill,
        t,
      )!,
      markupJumpLinkHoverFill: Color.lerp(
        markupJumpLinkHoverFill,
        other.markupJumpLinkHoverFill,
        t,
      )!,
      markupEveryoneText: Color.lerp(
        markupEveryoneText,
        other.markupEveryoneText,
        t,
      )!,
      markupEveryoneFill: Color.lerp(
        markupEveryoneFill,
        other.markupEveryoneFill,
        t,
      )!,
      markupEveryoneBorder: Color.lerp(
        markupEveryoneBorder,
        other.markupEveryoneBorder,
        t,
      )!,
      markupHereText: Color.lerp(markupHereText, other.markupHereText, t)!,
      markupHereFill: Color.lerp(markupHereFill, other.markupHereFill, t)!,
      markupHereBorder: Color.lerp(
        markupHereBorder,
        other.markupHereBorder,
        t,
      )!,
      // Button
      buttonPrimaryFill: Color.lerp(
        buttonPrimaryFill,
        other.buttonPrimaryFill,
        t,
      )!,
      buttonPrimaryActiveFill: Color.lerp(
        buttonPrimaryActiveFill,
        other.buttonPrimaryActiveFill,
        t,
      )!,
      buttonPrimaryText: Color.lerp(
        buttonPrimaryText,
        other.buttonPrimaryText,
        t,
      )!,
      buttonSecondaryFill: Color.lerp(
        buttonSecondaryFill,
        other.buttonSecondaryFill,
        t,
      )!,
      buttonSecondaryActiveFill: Color.lerp(
        buttonSecondaryActiveFill,
        other.buttonSecondaryActiveFill,
        t,
      )!,
      buttonSecondaryText: Color.lerp(
        buttonSecondaryText,
        other.buttonSecondaryText,
        t,
      )!,
      buttonSecondaryActiveText: Color.lerp(
        buttonSecondaryActiveText,
        other.buttonSecondaryActiveText,
        t,
      )!,
      buttonDangerFill: Color.lerp(
        buttonDangerFill,
        other.buttonDangerFill,
        t,
      )!,
      buttonDangerActiveFill: Color.lerp(
        buttonDangerActiveFill,
        other.buttonDangerActiveFill,
        t,
      )!,
      buttonDangerText: Color.lerp(
        buttonDangerText,
        other.buttonDangerText,
        t,
      )!,
      buttonDangerOutlineBorder: Color.lerp(
        buttonDangerOutlineBorder,
        other.buttonDangerOutlineBorder,
        t,
      )!,
      buttonDangerOutlineText: Color.lerp(
        buttonDangerOutlineText,
        other.buttonDangerOutlineText,
        t,
      )!,
      buttonDangerOutlineActiveFill: Color.lerp(
        buttonDangerOutlineActiveFill,
        other.buttonDangerOutlineActiveFill,
        t,
      )!,
      buttonGhostText: Color.lerp(buttonGhostText, other.buttonGhostText, t)!,
      buttonInvertedFill: Color.lerp(
        buttonInvertedFill,
        other.buttonInvertedFill,
        t,
      )!,
      buttonInvertedText: Color.lerp(
        buttonInvertedText,
        other.buttonInvertedText,
        t,
      )!,
      buttonOutlineBorder: Color.lerp(
        buttonOutlineBorder,
        other.buttonOutlineBorder,
        t,
      )!,
      buttonOutlineText: Color.lerp(
        buttonOutlineText,
        other.buttonOutlineText,
        t,
      )!,
      buttonOutlineActiveFill: Color.lerp(
        buttonOutlineActiveFill,
        other.buttonOutlineActiveFill,
        t,
      )!,
      // Panel Control
      panelControlBg: Color.lerp(panelControlBg, other.panelControlBg, t)!,
      panelControlBorder: Color.lerp(
        panelControlBorder,
        other.panelControlBorder,
        t,
      )!,
      panelControlDivider: Color.lerp(
        panelControlDivider,
        other.panelControlDivider,
        t,
      )!,
      panelControlHighlight: Color.lerp(
        panelControlHighlight,
        other.panelControlHighlight,
        t,
      )!,
      // Control Button
      controlButtonNormalBg: Color.lerp(
        controlButtonNormalBg,
        other.controlButtonNormalBg,
        t,
      )!,
      controlButtonNormalText: Color.lerp(
        controlButtonNormalText,
        other.controlButtonNormalText,
        t,
      )!,
      controlButtonHoverBg: Color.lerp(
        controlButtonHoverBg,
        other.controlButtonHoverBg,
        t,
      )!,
      controlButtonHoverText: Color.lerp(
        controlButtonHoverText,
        other.controlButtonHoverText,
        t,
      )!,
      controlButtonActiveBg: Color.lerp(
        controlButtonActiveBg,
        other.controlButtonActiveBg,
        t,
      )!,
      controlButtonActiveText: Color.lerp(
        controlButtonActiveText,
        other.controlButtonActiveText,
        t,
      )!,
      controlButtonDangerText: Color.lerp(
        controlButtonDangerText,
        other.controlButtonDangerText,
        t,
      )!,
      controlButtonDangerHoverBg: Color.lerp(
        controlButtonDangerHoverBg,
        other.controlButtonDangerHoverBg,
        t,
      )!,
      // Switch
      switchTrackInactive: Color.lerp(
        switchTrackInactive,
        other.switchTrackInactive,
        t,
      )!,
      switchThumb: Color.lerp(switchThumb, other.switchThumb, t)!,
      switchThumbCheckedIcon: Color.lerp(
        switchThumbCheckedIcon,
        other.switchThumbCheckedIcon,
        t,
      )!,
      switchThumbUncheckedIcon: Color.lerp(
        switchThumbUncheckedIcon,
        other.switchThumbUncheckedIcon,
        t,
      )!,
      // Menu
      menuDangerText: Color.lerp(menuDangerText, other.menuDangerText, t)!,
      // Content Background
      bgCode: Color.lerp(bgCode, other.bgCode, t)!,
      bgCodeBlock: Color.lerp(bgCodeBlock, other.bgCodeBlock, t)!,
      bgTableHeader: Color.lerp(bgTableHeader, other.bgTableHeader, t)!,
      bgTableRowOdd: Color.lerp(bgTableRowOdd, other.bgTableRowOdd, t)!,
      bgTableRowEven: Color.lerp(bgTableRowEven, other.bgTableRowEven, t)!,
      // Interactive Surface
      surfaceInteractiveHoverBg: Color.lerp(
        surfaceInteractiveHoverBg,
        other.surfaceInteractiveHoverBg,
        t,
      )!,
      surfaceInteractiveSelectedBg: Color.lerp(
        surfaceInteractiveSelectedBg,
        other.surfaceInteractiveSelectedBg,
        t,
      )!,
      surfaceInteractiveSelectedColor: Color.lerp(
        surfaceInteractiveSelectedColor,
        other.surfaceInteractiveSelectedColor,
        t,
      )!,
      // Scrollbar
      scrollbarThumbBg: Color.lerp(
        scrollbarThumbBg,
        other.scrollbarThumbBg,
        t,
      )!,
      scrollbarThumbBgHover: Color.lerp(
        scrollbarThumbBgHover,
        other.scrollbarThumbBgHover,
        t,
      )!,
      scrollbarTrackBg: Color.lerp(
        scrollbarTrackBg,
        other.scrollbarTrackBg,
        t,
      )!,
      // Text Selection
      textSelection: Color.lerp(textSelection, other.textSelection, t)!,
      // UI-specific
      chatBackground: Color.lerp(chatBackground, other.chatBackground, t)!,
      chatInputBackground: Color.lerp(
        chatInputBackground,
        other.chatInputBackground,
        t,
      )!,
      serverSidebarBackground: Color.lerp(
        serverSidebarBackground,
        other.serverSidebarBackground,
        t,
      )!,
      serverIconBackground: Color.lerp(
        serverIconBackground,
        other.serverIconBackground,
        t,
      )!,
      serverIconActive: Color.lerp(
        serverIconActive,
        other.serverIconActive,
        t,
      )!,
      channelSidebarBackground: Color.lerp(
        channelSidebarBackground,
        other.channelSidebarBackground,
        t,
      )!,
      memberListBackground: Color.lerp(
        memberListBackground,
        other.memberListBackground,
        t,
      )!,
      userPanelBackground: Color.lerp(
        userPanelBackground,
        other.userPanelBackground,
        t,
      )!,
      userAreaDividerColor: Color.lerp(
        userAreaDividerColor,
        other.userAreaDividerColor,
        t,
      )!,
      embedBackground: Color.lerp(embedBackground, other.embedBackground, t)!,
      embedBorder: Color.lerp(embedBorder, other.embedBorder, t)!,
      mentionBackground: Color.lerp(
        mentionBackground,
        other.mentionBackground,
        t,
      )!,
      spoilerBackground: Color.lerp(
        spoilerBackground,
        other.spoilerBackground,
        t,
      )!,
      spoilerOverlayHoverColor: Color.lerp(
        spoilerOverlayHoverColor,
        other.spoilerOverlayHoverColor,
        t,
      )!,
      focusPrimary: Color.lerp(focusPrimary, other.focusPrimary, t)!,
      interactiveActive: Color.lerp(
        interactiveActive,
        other.interactiveActive,
        t,
      )!,
      interactiveNormal: Color.lerp(
        interactiveNormal,
        other.interactiveNormal,
        t,
      )!,
      interactiveHover: Color.lerp(
        interactiveHover,
        other.interactiveHover,
        t,
      )!,
      interactiveMuted: Color.lerp(
        interactiveMuted,
        other.interactiveMuted,
        t,
      )!,
    );
  }
}
