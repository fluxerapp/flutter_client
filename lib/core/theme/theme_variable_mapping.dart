import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/material_ui.dart';

const Map<String, String> kThemeCssVariableToProperty = {
  '--accent-danger': 'accentDanger',
  '--accent-info': 'accentInfo',
  '--accent-primary': 'accentPrimary',
  '--accent-purple': 'accentPurple',
  '--accent-success': 'accentSuccess',
  '--accent-warning': 'accentWarning',
  '--alert-caution': 'alertCaution',
  '--alert-caution-color': 'alertCaution',
  '--alert-important': 'alertImportant',
  '--alert-important-color': 'alertImportant',
  '--alert-note': 'alertNote',
  '--alert-note-color': 'alertNote',
  '--alert-tip': 'alertTip',
  '--alert-tip-color': 'alertTip',
  '--alert-warning': 'alertWarning',
  '--alert-warning-color': 'alertWarning',
  '--background-channel-header': 'backgroundChannelHeader',
  '--background-floating': 'backgroundFloating',
  '--background-header-primary': 'backgroundHeaderPrimary',
  '--background-header-primary-hover': 'backgroundHeaderPrimaryHover',
  '--background-header-secondary': 'backgroundHeaderSecondary',
  '--background-modifier-accent': 'backgroundModifierAccent',
  '--background-modifier-accent-focus': 'backgroundModifierAccentFocus',
  '--background-modifier-hover': 'backgroundModifierHover',
  '--background-modifier-selected': 'backgroundModifierSelected',
  '--background-primary': 'backgroundPrimary',
  '--background-secondary': 'backgroundSecondary',
  '--background-secondary-alt': 'backgroundSecondaryAlt',
  '--background-secondary-lighter': 'backgroundSecondaryLighter',
  '--background-tertiary': 'backgroundTertiary',
  '--background-textarea': 'backgroundTextarea',
  '--bg-code': 'bgCode',
  '--bg-code-block': 'bgCodeBlock',
  '--bg-primary': 'backgroundPrimary',
  '--bg-secondary': 'backgroundSecondary',
  '--bg-table-header': 'bgTableHeader',
  '--bg-table-row-even': 'bgTableRowEven',
  '--bg-table-row-odd': 'bgTableRowOdd',
  '--bg-tertiary': 'backgroundTertiary',
  '--border-color': 'borderColor',
  '--border-color-focus': 'borderColorFocus',
  '--border-color-hover': 'borderColorHover',
  '--brand-primary': 'brandPrimary',
  '--brand-primary-fill': 'brandPrimaryFill',
  '--brand-primary-light': 'brandPrimaryLight',
  '--brand-secondary': 'brandSecondary',
  '--button-danger-active-fill': 'buttonDangerActiveFill',
  '--button-danger-fill': 'buttonDangerFill',
  '--button-danger-outline-active-fill': 'buttonDangerOutlineActiveFill',
  '--button-danger-outline-border': 'buttonDangerOutlineBorder',
  '--button-danger-outline-text': 'buttonDangerOutlineText',
  '--button-danger-text': 'buttonDangerText',
  '--button-ghost-text': 'buttonGhostText',
  '--button-inverted-fill': 'buttonInvertedFill',
  '--button-inverted-text': 'buttonInvertedText',
  '--button-outline-active-fill': 'buttonOutlineActiveFill',
  '--button-outline-border': 'buttonOutlineBorder',
  '--button-outline-text': 'buttonOutlineText',
  '--button-primary-active-fill': 'buttonPrimaryActiveFill',
  '--button-primary-fill': 'buttonPrimaryFill',
  '--button-primary-text': 'buttonPrimaryText',
  '--button-secondary-active-fill': 'buttonSecondaryActiveFill',
  '--button-secondary-active-text': 'buttonSecondaryActiveText',
  '--button-secondary-fill': 'buttonSecondaryFill',
  '--button-secondary-text': 'buttonSecondaryText',
  '--channel-sidebar-background': 'channelSidebarBackground',
  '--chat-background': 'chatBackground',
  '--chat-input-background': 'chatInputBackground',
  '--control-button-active-bg': 'controlButtonActiveBg',
  '--control-button-active-text': 'controlButtonActiveText',
  '--control-button-danger-hover-bg': 'controlButtonDangerHoverBg',
  '--control-button-danger-text': 'controlButtonDangerText',
  '--control-button-hover-bg': 'controlButtonHoverBg',
  '--control-button-hover-text': 'controlButtonHoverText',
  '--control-button-normal-bg': 'controlButtonNormalBg',
  '--control-button-normal-text': 'controlButtonNormalText',
  '--embed-background': 'embedBackground',
  '--embed-border': 'embedBorder',
  '--focus-primary': 'focusPrimary',
  '--form-surface-background': 'buttonSecondaryFill',
  '--guild-banner-gradient': 'guildBannerGradient',
  '--guild-list-foreground': 'guildListForeground',
  '--interactive-active': 'interactiveActive',
  '--interactive-hover': 'interactiveHover',
  '--interactive-muted': 'interactiveMuted',
  '--interactive-normal': 'interactiveNormal',
  '--list-item-selected-bg': 'listItemSelectedBg',
  '--list-item-selected-border': 'listItemSelectedBorder',
  '--list-item-pressed-bg': 'listItemPressedBg',
  '--markup-everyone-border': 'markupEveryoneBorder',
  '--markup-everyone-fill': 'markupEveryoneFill',
  '--markup-everyone-text': 'markupEveryoneText',
  '--markup-here-border': 'markupHereBorder',
  '--markup-here-fill': 'markupHereFill',
  '--markup-here-text': 'markupHereText',
  '--markup-interactive-hover-fill': 'markupInteractiveHoverFill',
  '--markup-interactive-hover-text': 'markupInteractiveHoverText',
  '--markup-jump-link-fill': 'markupJumpLinkFill',
  '--markup-jump-link-hover-fill': 'markupJumpLinkHoverFill',
  '--markup-jump-link-text': 'markupJumpLinkText',
  '--markup-mention-border': 'markupMentionBorder',
  '--markup-mention-fill': 'markupMentionFill',
  '--markup-mention-text': 'markupMentionText',
  '--member-list-background': 'memberListBackground',
  '--mention-background': 'mentionBackground',
  '--menu-danger-text': 'menuDangerText',
  '--modal-scrim': 'modalScrim',
  '--panel-control-bg': 'panelControlBg',
  '--panel-control-border': 'panelControlBorder',
  '--panel-control-divider': 'panelControlDivider',
  '--panel-control-highlight': 'panelControlHighlight',
  '--scrollbar-thumb-bg': 'scrollbarThumbBg',
  '--scrollbar-thumb-bg-hover': 'scrollbarThumbBgHover',
  '--scrollbar-track-bg': 'scrollbarTrackBg',
  '--server-icon-active': 'serverIconActive',
  '--server-icon-background': 'serverIconBackground',
  '--server-sidebar-background': 'serverSidebarBackground',
  '--spoiler-background': 'spoilerBackground',
  '--spoiler-overlay-color': 'spoilerBackground',
  '--spoiler-overlay-hover-color': 'spoilerOverlayHoverColor',
  '--status-danger': 'statusDanger',
  '--status-dnd': 'statusDnd',
  '--status-idle': 'statusIdle',
  '--status-offline': 'statusOffline',
  '--status-online': 'statusOnline',
  '--status-warning': 'statusWarning',
  '--surface-interactive-hover-bg': 'surfaceInteractiveHoverBg',
  '--surface-interactive-selected-bg': 'surfaceInteractiveSelectedBg',
  '--surface-interactive-selected-color': 'surfaceInteractiveSelectedColor',
  '--switch-thumb': 'switchThumb',
  '--switch-thumb-checked-icon': 'switchThumbCheckedIcon',
  '--switch-thumb-unchecked-icon': 'switchThumbUncheckedIcon',
  '--switch-track-inactive': 'switchTrackInactive',
  '--text-chat': 'textChat',
  '--text-chat-muted': 'textChatMuted',
  '--text-code': 'textCode',
  '--text-danger': 'textDanger',
  '--text-link': 'textLink',
  '--text-on-brand-primary': 'textOnBrandPrimary',
  '--text-positive': 'textPositive',
  '--text-primary': 'textPrimary',
  '--text-primary-muted': 'textPrimaryMuted',
  '--text-secondary': 'textSecondary',
  '--text-selection': 'textSelection',
  '--text-tertiary': 'textTertiary',
  '--text-tertiary-muted': 'textTertiaryMuted',
  '--text-tertiary-secondary': 'textTertiarySecondary',
  '--text-warning': 'textWarning',
  '--user-area-divider-color': 'userAreaDividerColor',
  '--user-panel-background': 'userPanelBackground',
};

final RegExp _cssVarReferencePattern = RegExp(
  r'var\(\s*(--[a-zA-Z0-9_-]+)\s*\)',
  caseSensitive: false,
);

final Map<String, Color Function(FluxerColorTheme)> kThemePropertyColorReaders =
    <String, Color Function(FluxerColorTheme)>{
      'backgroundPrimary': (FluxerColorTheme t) => t.backgroundPrimary,
      'backgroundSecondary': (FluxerColorTheme t) => t.backgroundSecondary,
      'backgroundSecondaryLighter': (FluxerColorTheme t) =>
          t.backgroundSecondaryLighter,
      'backgroundSecondaryAlt': (FluxerColorTheme t) =>
          t.backgroundSecondaryAlt,
      'backgroundTertiary': (FluxerColorTheme t) => t.backgroundTertiary,
      'backgroundTextarea': (FluxerColorTheme t) => t.backgroundTextarea,
      'backgroundHeaderPrimary': (FluxerColorTheme t) =>
          t.backgroundHeaderPrimary,
      'backgroundHeaderPrimaryHover': (FluxerColorTheme t) =>
          t.backgroundHeaderPrimaryHover,
      'backgroundHeaderSecondary': (FluxerColorTheme t) =>
          t.backgroundHeaderSecondary,
      'backgroundChannelHeader': (FluxerColorTheme t) =>
          t.backgroundChannelHeader,
      'backgroundFloating': (FluxerColorTheme t) => t.backgroundFloating,
      'guildListForeground': (FluxerColorTheme t) => t.guildListForeground,
      'backgroundModifierHover': (FluxerColorTheme t) =>
          t.backgroundModifierHover,
      'backgroundModifierSelected': (FluxerColorTheme t) =>
          t.backgroundModifierSelected,
      'backgroundModifierAccent': (FluxerColorTheme t) =>
          t.backgroundModifierAccent,
      'backgroundModifierAccentFocus': (FluxerColorTheme t) =>
          t.backgroundModifierAccentFocus,
      'brandPrimary': (FluxerColorTheme t) => t.brandPrimary,
      'brandSecondary': (FluxerColorTheme t) => t.brandSecondary,
      'brandPrimaryLight': (FluxerColorTheme t) => t.brandPrimaryLight,
      'brandPrimaryFill': (FluxerColorTheme t) => t.brandPrimaryFill,
      'statusOnline': (FluxerColorTheme t) => t.statusOnline,
      'statusIdle': (FluxerColorTheme t) => t.statusIdle,
      'statusDnd': (FluxerColorTheme t) => t.statusDnd,
      'statusOffline': (FluxerColorTheme t) => t.statusOffline,
      'statusDanger': (FluxerColorTheme t) => t.statusDanger,
      'statusWarning': (FluxerColorTheme t) => t.statusWarning,
      'textPrimary': (FluxerColorTheme t) => t.textPrimary,
      'textSecondary': (FluxerColorTheme t) => t.textSecondary,
      'textTertiary': (FluxerColorTheme t) => t.textTertiary,
      'textPrimaryMuted': (FluxerColorTheme t) => t.textPrimaryMuted,
      'textChat': (FluxerColorTheme t) => t.textChat,
      'textChatMuted': (FluxerColorTheme t) => t.textChatMuted,
      'textLink': (FluxerColorTheme t) => t.textLink,
      'textOnBrandPrimary': (FluxerColorTheme t) => t.textOnBrandPrimary,
      'textTertiaryMuted': (FluxerColorTheme t) => t.textTertiaryMuted,
      'textTertiarySecondary': (FluxerColorTheme t) => t.textTertiarySecondary,
      'textWarning': (FluxerColorTheme t) => t.textWarning,
      'textDanger': (FluxerColorTheme t) => t.textDanger,
      'textPositive': (FluxerColorTheme t) => t.textPositive,
      'textCode': (FluxerColorTheme t) => t.textCode,
      'borderColor': (FluxerColorTheme t) => t.borderColor,
      'borderColorHover': (FluxerColorTheme t) => t.borderColorHover,
      'borderColorFocus': (FluxerColorTheme t) => t.borderColorFocus,
      'accentPrimary': (FluxerColorTheme t) => t.accentPrimary,
      'accentSuccess': (FluxerColorTheme t) => t.accentSuccess,
      'accentWarning': (FluxerColorTheme t) => t.accentWarning,
      'accentDanger': (FluxerColorTheme t) => t.accentDanger,
      'accentInfo': (FluxerColorTheme t) => t.accentInfo,
      'accentPurple': (FluxerColorTheme t) => t.accentPurple,
      'alertNote': (FluxerColorTheme t) => t.alertNote,
      'alertTip': (FluxerColorTheme t) => t.alertTip,
      'alertImportant': (FluxerColorTheme t) => t.alertImportant,
      'alertWarning': (FluxerColorTheme t) => t.alertWarning,
      'alertCaution': (FluxerColorTheme t) => t.alertCaution,
      'markupMentionText': (FluxerColorTheme t) => t.markupMentionText,
      'markupMentionFill': (FluxerColorTheme t) => t.markupMentionFill,
      'markupMentionBorder': (FluxerColorTheme t) => t.markupMentionBorder,
      'markupInteractiveHoverText': (FluxerColorTheme t) =>
          t.markupInteractiveHoverText,
      'markupInteractiveHoverFill': (FluxerColorTheme t) =>
          t.markupInteractiveHoverFill,
      'markupJumpLinkText': (FluxerColorTheme t) => t.markupJumpLinkText,
      'markupJumpLinkFill': (FluxerColorTheme t) => t.markupJumpLinkFill,
      'markupJumpLinkHoverFill': (FluxerColorTheme t) =>
          t.markupJumpLinkHoverFill,
      'markupEveryoneText': (FluxerColorTheme t) => t.markupEveryoneText,
      'markupEveryoneFill': (FluxerColorTheme t) => t.markupEveryoneFill,
      'markupEveryoneBorder': (FluxerColorTheme t) => t.markupEveryoneBorder,
      'markupHereText': (FluxerColorTheme t) => t.markupHereText,
      'markupHereFill': (FluxerColorTheme t) => t.markupHereFill,
      'markupHereBorder': (FluxerColorTheme t) => t.markupHereBorder,
      'buttonPrimaryFill': (FluxerColorTheme t) => t.buttonPrimaryFill,
      'buttonPrimaryActiveFill': (FluxerColorTheme t) =>
          t.buttonPrimaryActiveFill,
      'buttonPrimaryText': (FluxerColorTheme t) => t.buttonPrimaryText,
      'buttonSecondaryFill': (FluxerColorTheme t) => t.buttonSecondaryFill,
      'buttonSecondaryActiveFill': (FluxerColorTheme t) =>
          t.buttonSecondaryActiveFill,
      'buttonSecondaryText': (FluxerColorTheme t) => t.buttonSecondaryText,
      'buttonSecondaryActiveText': (FluxerColorTheme t) =>
          t.buttonSecondaryActiveText,
      'buttonDangerFill': (FluxerColorTheme t) => t.buttonDangerFill,
      'buttonDangerActiveFill': (FluxerColorTheme t) =>
          t.buttonDangerActiveFill,
      'buttonDangerText': (FluxerColorTheme t) => t.buttonDangerText,
      'buttonDangerOutlineBorder': (FluxerColorTheme t) =>
          t.buttonDangerOutlineBorder,
      'buttonDangerOutlineText': (FluxerColorTheme t) =>
          t.buttonDangerOutlineText,
      'buttonDangerOutlineActiveFill': (FluxerColorTheme t) =>
          t.buttonDangerOutlineActiveFill,
      'buttonGhostText': (FluxerColorTheme t) => t.buttonGhostText,
      'buttonInvertedFill': (FluxerColorTheme t) => t.buttonInvertedFill,
      'buttonInvertedText': (FluxerColorTheme t) => t.buttonInvertedText,
      'buttonOutlineBorder': (FluxerColorTheme t) => t.buttonOutlineBorder,
      'buttonOutlineText': (FluxerColorTheme t) => t.buttonOutlineText,
      'buttonOutlineActiveFill': (FluxerColorTheme t) =>
          t.buttonOutlineActiveFill,
      'panelControlBg': (FluxerColorTheme t) => t.panelControlBg,
      'panelControlBorder': (FluxerColorTheme t) => t.panelControlBorder,
      'panelControlDivider': (FluxerColorTheme t) => t.panelControlDivider,
      'panelControlHighlight': (FluxerColorTheme t) => t.panelControlHighlight,
      'controlButtonNormalBg': (FluxerColorTheme t) => t.controlButtonNormalBg,
      'controlButtonNormalText': (FluxerColorTheme t) =>
          t.controlButtonNormalText,
      'controlButtonHoverBg': (FluxerColorTheme t) => t.controlButtonHoverBg,
      'controlButtonHoverText': (FluxerColorTheme t) =>
          t.controlButtonHoverText,
      'controlButtonActiveBg': (FluxerColorTheme t) => t.controlButtonActiveBg,
      'controlButtonActiveText': (FluxerColorTheme t) =>
          t.controlButtonActiveText,
      'controlButtonDangerText': (FluxerColorTheme t) =>
          t.controlButtonDangerText,
      'controlButtonDangerHoverBg': (FluxerColorTheme t) =>
          t.controlButtonDangerHoverBg,
      'switchTrackInactive': (FluxerColorTheme t) => t.switchTrackInactive,
      'switchThumb': (FluxerColorTheme t) => t.switchThumb,
      'switchThumbCheckedIcon': (FluxerColorTheme t) =>
          t.switchThumbCheckedIcon,
      'switchThumbUncheckedIcon': (FluxerColorTheme t) =>
          t.switchThumbUncheckedIcon,
      'menuDangerText': (FluxerColorTheme t) => t.menuDangerText,
      'bgCode': (FluxerColorTheme t) => t.bgCode,
      'bgCodeBlock': (FluxerColorTheme t) => t.bgCodeBlock,
      'bgTableHeader': (FluxerColorTheme t) => t.bgTableHeader,
      'bgTableRowOdd': (FluxerColorTheme t) => t.bgTableRowOdd,
      'bgTableRowEven': (FluxerColorTheme t) => t.bgTableRowEven,
      'surfaceInteractiveHoverBg': (FluxerColorTheme t) =>
          t.surfaceInteractiveHoverBg,
      'surfaceInteractiveSelectedBg': (FluxerColorTheme t) =>
          t.surfaceInteractiveSelectedBg,
      'surfaceInteractiveSelectedColor': (FluxerColorTheme t) =>
          t.surfaceInteractiveSelectedColor,
      'listItemSelectedBg': (FluxerColorTheme t) => t.listItemSelectedBg,
      'listItemSelectedBorder': (FluxerColorTheme t) =>
          t.listItemSelectedBorder,
      'listItemPressedBg': (FluxerColorTheme t) => t.listItemPressedBg,
      'scrollbarThumbBg': (FluxerColorTheme t) => t.scrollbarThumbBg,
      'scrollbarThumbBgHover': (FluxerColorTheme t) => t.scrollbarThumbBgHover,
      'scrollbarTrackBg': (FluxerColorTheme t) => t.scrollbarTrackBg,
      'textSelection': (FluxerColorTheme t) => t.textSelection,
      'chatBackground': (FluxerColorTheme t) => t.chatBackground,
      'chatInputBackground': (FluxerColorTheme t) => t.chatInputBackground,
      'serverSidebarBackground': (FluxerColorTheme t) =>
          t.serverSidebarBackground,
      'serverIconBackground': (FluxerColorTheme t) => t.serverIconBackground,
      'serverIconActive': (FluxerColorTheme t) => t.serverIconActive,
      'channelSidebarBackground': (FluxerColorTheme t) =>
          t.channelSidebarBackground,
      'memberListBackground': (FluxerColorTheme t) => t.memberListBackground,
      'userPanelBackground': (FluxerColorTheme t) => t.userPanelBackground,
      'userAreaDividerColor': (FluxerColorTheme t) => t.userAreaDividerColor,
      'embedBackground': (FluxerColorTheme t) => t.embedBackground,
      'embedBorder': (FluxerColorTheme t) => t.embedBorder,
      'mentionBackground': (FluxerColorTheme t) => t.mentionBackground,
      'spoilerBackground': (FluxerColorTheme t) => t.spoilerBackground,
      'spoilerOverlayHoverColor': (FluxerColorTheme t) =>
          t.spoilerOverlayHoverColor,
      'modalScrim': (FluxerColorTheme t) => t.modalScrim,
      'guildBannerGradient': (FluxerColorTheme t) => t.guildBannerGradient,
      'focusPrimary': (FluxerColorTheme t) => t.focusPrimary,
      'interactiveActive': (FluxerColorTheme t) => t.interactiveActive,
      'interactiveNormal': (FluxerColorTheme t) => t.interactiveNormal,
      'interactiveHover': (FluxerColorTheme t) => t.interactiveHover,
      'interactiveMuted': (FluxerColorTheme t) => t.interactiveMuted,
    };

Color readThemeColorProperty(FluxerColorTheme theme, String propertyName) {
  return kThemePropertyColorReaders[propertyName]!(theme);
}

String themeColorToCssHex(Color color) {
  String channel(double component) =>
      (component * 255).round().toRadixString(16).padLeft(2, '0');
  return '#${channel(color.r)}${channel(color.g)}${channel(color.b)}';
}

int themeColorToPickerInt(Color color) =>
    ((color.r * 255).round() << 16) |
    ((color.g * 255).round() << 8) |
    (color.b * 255).round();

Color themeColorFromPickerInt(int value) => Color.fromARGB(
  255,
  (value >> 16) & 0xFF,
  (value >> 8) & 0xFF,
  value & 0xFF,
);

String resolveCssVariableReferences(
  String value,
  Map<String, String> overrides,
  FluxerColorTheme base,
) {
  return value.replaceAllMapped(_cssVarReferencePattern, (Match match) {
    final String varName = match.group(1)!;
    if (overrides.containsKey(varName)) {
      return overrides[varName]!;
    }
    final String? propertyName = kThemeCssVariableToProperty[varName];
    if (propertyName == null) {
      return match.group(0)!;
    }
    return themeColorToCssHex(readThemeColorProperty(base, propertyName));
  });
}

Map<String, String> resolveCssOverrideValues(
  Map<String, String> rawOverrides,
  FluxerColorTheme base,
) {
  final Map<String, String> resolved = Map<String, String>.from(rawOverrides);
  for (var pass = 0; pass < 8; pass++) {
    var changed = false;
    for (final String key in resolved.keys.toList()) {
      final String next = resolveCssVariableReferences(
        resolved[key]!,
        resolved,
        base,
      );
      if (next != resolved[key]) {
        resolved[key] = next;
        changed = true;
      }
    }
    if (!changed) {
      break;
    }
  }
  return resolved;
}

extension FluxerColorThemeOverrideExtension on FluxerColorTheme {
  FluxerColorTheme applyPropertyOverrides(Map<String, Color> overrides) {
    if (overrides.isEmpty) {
      return this;
    }
    return copyWith(
      backgroundPrimary: overrides['backgroundPrimary'] ?? backgroundPrimary,
      backgroundSecondary:
          overrides['backgroundSecondary'] ?? backgroundSecondary,
      backgroundSecondaryLighter:
          overrides['backgroundSecondaryLighter'] ?? backgroundSecondaryLighter,
      backgroundSecondaryAlt:
          overrides['backgroundSecondaryAlt'] ?? backgroundSecondaryAlt,
      backgroundTertiary: overrides['backgroundTertiary'] ?? backgroundTertiary,
      backgroundTextarea: overrides['backgroundTextarea'] ?? backgroundTextarea,
      backgroundHeaderPrimary:
          overrides['backgroundHeaderPrimary'] ?? backgroundHeaderPrimary,
      backgroundHeaderPrimaryHover:
          overrides['backgroundHeaderPrimaryHover'] ??
          backgroundHeaderPrimaryHover,
      backgroundHeaderSecondary:
          overrides['backgroundHeaderSecondary'] ?? backgroundHeaderSecondary,
      backgroundChannelHeader:
          overrides['backgroundChannelHeader'] ?? backgroundChannelHeader,
      backgroundFloating: overrides['backgroundFloating'] ?? backgroundFloating,
      guildListForeground:
          overrides['guildListForeground'] ?? guildListForeground,
      backgroundModifierHover:
          overrides['backgroundModifierHover'] ?? backgroundModifierHover,
      backgroundModifierSelected:
          overrides['backgroundModifierSelected'] ?? backgroundModifierSelected,
      backgroundModifierAccent:
          overrides['backgroundModifierAccent'] ?? backgroundModifierAccent,
      backgroundModifierAccentFocus:
          overrides['backgroundModifierAccentFocus'] ??
          backgroundModifierAccentFocus,
      brandPrimary: overrides['brandPrimary'] ?? brandPrimary,
      brandSecondary: overrides['brandSecondary'] ?? brandSecondary,
      brandPrimaryLight: overrides['brandPrimaryLight'] ?? brandPrimaryLight,
      brandPrimaryFill: overrides['brandPrimaryFill'] ?? brandPrimaryFill,
      statusOnline: overrides['statusOnline'] ?? statusOnline,
      statusIdle: overrides['statusIdle'] ?? statusIdle,
      statusDnd: overrides['statusDnd'] ?? statusDnd,
      statusOffline: overrides['statusOffline'] ?? statusOffline,
      statusDanger: overrides['statusDanger'] ?? statusDanger,
      statusWarning: overrides['statusWarning'] ?? statusWarning,
      textPrimary: overrides['textPrimary'] ?? textPrimary,
      textSecondary: overrides['textSecondary'] ?? textSecondary,
      textTertiary: overrides['textTertiary'] ?? textTertiary,
      textPrimaryMuted: overrides['textPrimaryMuted'] ?? textPrimaryMuted,
      textChat: overrides['textChat'] ?? textChat,
      textChatMuted: overrides['textChatMuted'] ?? textChatMuted,
      textLink: overrides['textLink'] ?? textLink,
      textOnBrandPrimary: overrides['textOnBrandPrimary'] ?? textOnBrandPrimary,
      textTertiaryMuted: overrides['textTertiaryMuted'] ?? textTertiaryMuted,
      textTertiarySecondary:
          overrides['textTertiarySecondary'] ?? textTertiarySecondary,
      textWarning: overrides['textWarning'] ?? textWarning,
      textDanger: overrides['textDanger'] ?? textDanger,
      textPositive: overrides['textPositive'] ?? textPositive,
      textCode: overrides['textCode'] ?? textCode,
      borderColor: overrides['borderColor'] ?? borderColor,
      borderColorHover: overrides['borderColorHover'] ?? borderColorHover,
      borderColorFocus: overrides['borderColorFocus'] ?? borderColorFocus,
      accentPrimary: overrides['accentPrimary'] ?? accentPrimary,
      accentSuccess: overrides['accentSuccess'] ?? accentSuccess,
      accentWarning: overrides['accentWarning'] ?? accentWarning,
      accentDanger: overrides['accentDanger'] ?? accentDanger,
      accentInfo: overrides['accentInfo'] ?? accentInfo,
      accentPurple: overrides['accentPurple'] ?? accentPurple,
      alertNote: overrides['alertNote'] ?? alertNote,
      alertTip: overrides['alertTip'] ?? alertTip,
      alertImportant: overrides['alertImportant'] ?? alertImportant,
      alertWarning: overrides['alertWarning'] ?? alertWarning,
      alertCaution: overrides['alertCaution'] ?? alertCaution,
      markupMentionText: overrides['markupMentionText'] ?? markupMentionText,
      markupMentionFill: overrides['markupMentionFill'] ?? markupMentionFill,
      markupMentionBorder:
          overrides['markupMentionBorder'] ?? markupMentionBorder,
      markupInteractiveHoverText:
          overrides['markupInteractiveHoverText'] ?? markupInteractiveHoverText,
      markupInteractiveHoverFill:
          overrides['markupInteractiveHoverFill'] ?? markupInteractiveHoverFill,
      markupJumpLinkText: overrides['markupJumpLinkText'] ?? markupJumpLinkText,
      markupJumpLinkFill: overrides['markupJumpLinkFill'] ?? markupJumpLinkFill,
      markupJumpLinkHoverFill:
          overrides['markupJumpLinkHoverFill'] ?? markupJumpLinkHoverFill,
      markupEveryoneText: overrides['markupEveryoneText'] ?? markupEveryoneText,
      markupEveryoneFill: overrides['markupEveryoneFill'] ?? markupEveryoneFill,
      markupEveryoneBorder:
          overrides['markupEveryoneBorder'] ?? markupEveryoneBorder,
      markupHereText: overrides['markupHereText'] ?? markupHereText,
      markupHereFill: overrides['markupHereFill'] ?? markupHereFill,
      markupHereBorder: overrides['markupHereBorder'] ?? markupHereBorder,
      buttonPrimaryFill: overrides['buttonPrimaryFill'] ?? buttonPrimaryFill,
      buttonPrimaryActiveFill:
          overrides['buttonPrimaryActiveFill'] ?? buttonPrimaryActiveFill,
      buttonPrimaryText: overrides['buttonPrimaryText'] ?? buttonPrimaryText,
      buttonSecondaryFill:
          overrides['buttonSecondaryFill'] ?? buttonSecondaryFill,
      buttonSecondaryActiveFill:
          overrides['buttonSecondaryActiveFill'] ?? buttonSecondaryActiveFill,
      buttonSecondaryText:
          overrides['buttonSecondaryText'] ?? buttonSecondaryText,
      buttonSecondaryActiveText:
          overrides['buttonSecondaryActiveText'] ?? buttonSecondaryActiveText,
      buttonDangerFill: overrides['buttonDangerFill'] ?? buttonDangerFill,
      buttonDangerActiveFill:
          overrides['buttonDangerActiveFill'] ?? buttonDangerActiveFill,
      buttonDangerText: overrides['buttonDangerText'] ?? buttonDangerText,
      buttonDangerOutlineBorder:
          overrides['buttonDangerOutlineBorder'] ?? buttonDangerOutlineBorder,
      buttonDangerOutlineText:
          overrides['buttonDangerOutlineText'] ?? buttonDangerOutlineText,
      buttonDangerOutlineActiveFill:
          overrides['buttonDangerOutlineActiveFill'] ??
          buttonDangerOutlineActiveFill,
      buttonGhostText: overrides['buttonGhostText'] ?? buttonGhostText,
      buttonInvertedFill: overrides['buttonInvertedFill'] ?? buttonInvertedFill,
      buttonInvertedText: overrides['buttonInvertedText'] ?? buttonInvertedText,
      buttonOutlineBorder:
          overrides['buttonOutlineBorder'] ?? buttonOutlineBorder,
      buttonOutlineText: overrides['buttonOutlineText'] ?? buttonOutlineText,
      buttonOutlineActiveFill:
          overrides['buttonOutlineActiveFill'] ?? buttonOutlineActiveFill,
      panelControlBg: overrides['panelControlBg'] ?? panelControlBg,
      panelControlBorder: overrides['panelControlBorder'] ?? panelControlBorder,
      panelControlDivider:
          overrides['panelControlDivider'] ?? panelControlDivider,
      panelControlHighlight:
          overrides['panelControlHighlight'] ?? panelControlHighlight,
      controlButtonNormalBg:
          overrides['controlButtonNormalBg'] ?? controlButtonNormalBg,
      controlButtonNormalText:
          overrides['controlButtonNormalText'] ?? controlButtonNormalText,
      controlButtonHoverBg:
          overrides['controlButtonHoverBg'] ?? controlButtonHoverBg,
      controlButtonHoverText:
          overrides['controlButtonHoverText'] ?? controlButtonHoverText,
      controlButtonActiveBg:
          overrides['controlButtonActiveBg'] ?? controlButtonActiveBg,
      controlButtonActiveText:
          overrides['controlButtonActiveText'] ?? controlButtonActiveText,
      controlButtonDangerText:
          overrides['controlButtonDangerText'] ?? controlButtonDangerText,
      controlButtonDangerHoverBg:
          overrides['controlButtonDangerHoverBg'] ?? controlButtonDangerHoverBg,
      switchTrackInactive:
          overrides['switchTrackInactive'] ?? switchTrackInactive,
      switchThumb: overrides['switchThumb'] ?? switchThumb,
      switchThumbCheckedIcon:
          overrides['switchThumbCheckedIcon'] ?? switchThumbCheckedIcon,
      switchThumbUncheckedIcon:
          overrides['switchThumbUncheckedIcon'] ?? switchThumbUncheckedIcon,
      menuDangerText: overrides['menuDangerText'] ?? menuDangerText,
      bgCode: overrides['bgCode'] ?? bgCode,
      bgCodeBlock: overrides['bgCodeBlock'] ?? bgCodeBlock,
      bgTableHeader: overrides['bgTableHeader'] ?? bgTableHeader,
      bgTableRowOdd: overrides['bgTableRowOdd'] ?? bgTableRowOdd,
      bgTableRowEven: overrides['bgTableRowEven'] ?? bgTableRowEven,
      surfaceInteractiveHoverBg:
          overrides['surfaceInteractiveHoverBg'] ?? surfaceInteractiveHoverBg,
      surfaceInteractiveSelectedBg:
          overrides['surfaceInteractiveSelectedBg'] ??
          surfaceInteractiveSelectedBg,
      surfaceInteractiveSelectedColor:
          overrides['surfaceInteractiveSelectedColor'] ??
          surfaceInteractiveSelectedColor,
      listItemSelectedBg: overrides['listItemSelectedBg'] ?? listItemSelectedBg,
      listItemSelectedBorder:
          overrides['listItemSelectedBorder'] ?? listItemSelectedBorder,
      listItemPressedBg: overrides['listItemPressedBg'] ?? listItemPressedBg,
      scrollbarThumbBg: overrides['scrollbarThumbBg'] ?? scrollbarThumbBg,
      scrollbarThumbBgHover:
          overrides['scrollbarThumbBgHover'] ?? scrollbarThumbBgHover,
      scrollbarTrackBg: overrides['scrollbarTrackBg'] ?? scrollbarTrackBg,
      textSelection: overrides['textSelection'] ?? textSelection,
      chatBackground: overrides['chatBackground'] ?? chatBackground,
      chatInputBackground:
          overrides['chatInputBackground'] ?? chatInputBackground,
      serverSidebarBackground:
          overrides['serverSidebarBackground'] ?? serverSidebarBackground,
      serverIconBackground:
          overrides['serverIconBackground'] ?? serverIconBackground,
      serverIconActive: overrides['serverIconActive'] ?? serverIconActive,
      channelSidebarBackground:
          overrides['channelSidebarBackground'] ?? channelSidebarBackground,
      memberListBackground:
          overrides['memberListBackground'] ?? memberListBackground,
      userPanelBackground:
          overrides['userPanelBackground'] ?? userPanelBackground,
      userAreaDividerColor:
          overrides['userAreaDividerColor'] ?? userAreaDividerColor,
      embedBackground: overrides['embedBackground'] ?? embedBackground,
      embedBorder: overrides['embedBorder'] ?? embedBorder,
      mentionBackground: overrides['mentionBackground'] ?? mentionBackground,
      spoilerBackground: overrides['spoilerBackground'] ?? spoilerBackground,
      spoilerOverlayHoverColor:
          overrides['spoilerOverlayHoverColor'] ?? spoilerOverlayHoverColor,
      modalScrim: overrides['modalScrim'] ?? modalScrim,
      guildBannerGradient:
          overrides['guildBannerGradient'] ?? guildBannerGradient,
      focusPrimary: overrides['focusPrimary'] ?? focusPrimary,
      interactiveActive: overrides['interactiveActive'] ?? interactiveActive,
      interactiveNormal: overrides['interactiveNormal'] ?? interactiveNormal,
      interactiveHover: overrides['interactiveHover'] ?? interactiveHover,
      interactiveMuted: overrides['interactiveMuted'] ?? interactiveMuted,
    );
  }
}
