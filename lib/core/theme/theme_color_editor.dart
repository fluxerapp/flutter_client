import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/theme_variable_mapping.dart';
import 'package:fluxer_app/core/theme/themes/coal.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/dark_legacy.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/material_ui.dart';

enum ThemeColorEditorGroupId {
  brandButtons,
  chatSurfaces,
  sidebars,
  text,
  headers,
  status,
  embedsMarkup,
  accentsAlerts,
  controls,
}

class ThemeColorTokenDefinition {
  const ThemeColorTokenDefinition({
    required this.cssVariable,
    required this.propertyName,
    required this.groupId,
  });

  final String cssVariable;
  final String propertyName;
  final ThemeColorEditorGroupId groupId;
}

class ThemeColorEditorGroup {
  const ThemeColorEditorGroup({
    required this.id,
    required this.tokenPropertyNames,
  });

  final ThemeColorEditorGroupId id;
  final List<String> tokenPropertyNames;
}

const List<String> kEssentialThemeColorPropertyNames = <String>[
  'brandPrimary',
  'backgroundPrimary',
  'backgroundSecondary',
  'textPrimary',
  'chatBackground',
  'textChat',
];

const Set<String> _skippedThemeColorProperties = <String>{
  'guildBannerGradient',
};

int _canonicalCssVariableScore(String cssVariable) {
  if (cssVariable.endsWith('-color') &&
      cssVariable.contains('alert-') &&
      cssVariable != '--border-color') {
    return 2;
  }
  if (cssVariable.startsWith('--bg-')) {
    return 1;
  }
  if (cssVariable == '--spoiler-overlay-color') {
    return 2;
  }
  if (cssVariable == '--form-surface-background') {
    return 2;
  }
  return 0;
}

Map<String, String> buildCanonicalCssVariableByProperty() {
  final Map<String, String> bestVarByProperty = <String, String>{};
  final Map<String, int> bestScoreByProperty = <String, int>{};
  for (final MapEntry<String, String> entry
      in kThemeCssVariableToProperty.entries) {
    final String property = entry.value;
    if (_skippedThemeColorProperties.contains(property)) {
      continue;
    }
    final int score = _canonicalCssVariableScore(entry.key);
    final int? existingScore = bestScoreByProperty[property];
    if (existingScore == null || score < existingScore) {
      bestVarByProperty[property] = entry.key;
      bestScoreByProperty[property] = score;
    }
  }
  return bestVarByProperty;
}

final Map<String, String> _canonicalCssVariableByProperty =
    buildCanonicalCssVariableByProperty();

final List<ThemeColorTokenDefinition> kEditableThemeColorTokens =
    _buildEditableTokens();

List<ThemeColorTokenDefinition> _buildEditableTokens() {
  final Map<String, ThemeColorEditorGroupId> propertyToGroup =
      <String, ThemeColorEditorGroupId>{};
  for (final ThemeColorEditorGroup group in kThemeColorEditorGroups) {
    for (final String property in group.tokenPropertyNames) {
      propertyToGroup[property] = group.id;
    }
  }
  final List<ThemeColorTokenDefinition> tokens = <ThemeColorTokenDefinition>[];
  for (final MapEntry<String, String> entry
      in _canonicalCssVariableByProperty.entries) {
    final ThemeColorEditorGroupId? groupId = propertyToGroup[entry.key];
    if (groupId == null) {
      continue;
    }
    tokens.add(
      ThemeColorTokenDefinition(
        cssVariable: entry.value,
        propertyName: entry.key,
        groupId: groupId,
      ),
    );
  }
  tokens.sort(
    (ThemeColorTokenDefinition a, ThemeColorTokenDefinition b) =>
        a.propertyName.compareTo(b.propertyName),
  );
  return tokens;
}

const List<ThemeColorEditorGroup> kThemeColorEditorGroups =
    <ThemeColorEditorGroup>[
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.brandButtons,
        tokenPropertyNames: <String>[
          'brandPrimary',
          'brandSecondary',
          'brandPrimaryLight',
          'brandPrimaryFill',
          'buttonPrimaryFill',
          'buttonPrimaryText',
          'buttonPrimaryActiveFill',
          'buttonSecondaryFill',
          'buttonSecondaryText',
          'buttonSecondaryActiveFill',
          'buttonSecondaryActiveText',
          'buttonOutlineBorder',
          'buttonOutlineText',
          'buttonOutlineActiveFill',
          'buttonGhostText',
          'buttonInvertedFill',
          'buttonInvertedText',
          'buttonDangerFill',
          'buttonDangerText',
          'buttonDangerActiveFill',
          'buttonDangerOutlineBorder',
          'buttonDangerOutlineText',
          'buttonDangerOutlineActiveFill',
          'textOnBrandPrimary',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.chatSurfaces,
        tokenPropertyNames: <String>[
          'chatBackground',
          'chatInputBackground',
          'textChat',
          'textChatMuted',
          'mentionBackground',
          'backgroundTextarea',
          'memberListBackground',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.sidebars,
        tokenPropertyNames: <String>[
          'serverSidebarBackground',
          'channelSidebarBackground',
          'serverIconBackground',
          'serverIconActive',
          'guildListForeground',
          'interactiveNormal',
          'interactiveHover',
          'interactiveActive',
          'interactiveMuted',
          'userPanelBackground',
          'userAreaDividerColor',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.text,
        tokenPropertyNames: <String>[
          'textPrimary',
          'textSecondary',
          'textTertiary',
          'textPrimaryMuted',
          'textTertiaryMuted',
          'textTertiarySecondary',
          'textLink',
          'textDanger',
          'textWarning',
          'textPositive',
          'textCode',
          'textSelection',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.headers,
        tokenPropertyNames: <String>[
          'backgroundHeaderPrimary',
          'backgroundHeaderPrimaryHover',
          'backgroundHeaderSecondary',
          'backgroundChannelHeader',
          'backgroundFloating',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.status,
        tokenPropertyNames: <String>[
          'statusOnline',
          'statusIdle',
          'statusDnd',
          'statusOffline',
          'statusDanger',
          'statusWarning',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.embedsMarkup,
        tokenPropertyNames: <String>[
          'embedBackground',
          'embedBorder',
          'markupMentionFill',
          'markupMentionBorder',
          'markupMentionText',
          'markupEveryoneFill',
          'markupEveryoneBorder',
          'markupEveryoneText',
          'markupHereFill',
          'markupHereBorder',
          'markupHereText',
          'markupJumpLinkFill',
          'markupJumpLinkHoverFill',
          'markupJumpLinkText',
          'markupInteractiveHoverFill',
          'markupInteractiveHoverText',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.accentsAlerts,
        tokenPropertyNames: <String>[
          'accentPrimary',
          'accentSuccess',
          'accentWarning',
          'accentDanger',
          'accentInfo',
          'accentPurple',
          'alertNote',
          'alertTip',
          'alertImportant',
          'alertWarning',
          'alertCaution',
        ],
      ),
      ThemeColorEditorGroup(
        id: ThemeColorEditorGroupId.controls,
        tokenPropertyNames: <String>[
          'backgroundPrimary',
          'backgroundSecondary',
          'backgroundSecondaryAlt',
          'backgroundSecondaryLighter',
          'backgroundTertiary',
          'backgroundModifierHover',
          'backgroundModifierSelected',
          'backgroundModifierAccent',
          'backgroundModifierAccentFocus',
          'borderColor',
          'borderColorHover',
          'borderColorFocus',
          'focusPrimary',
          'panelControlBg',
          'panelControlBorder',
          'panelControlDivider',
          'panelControlHighlight',
          'switchTrackInactive',
          'switchThumb',
          'switchThumbCheckedIcon',
          'switchThumbUncheckedIcon',
          'scrollbarTrackBg',
          'scrollbarThumbBg',
          'scrollbarThumbBgHover',
          'controlButtonNormalBg',
          'controlButtonNormalText',
          'controlButtonHoverBg',
          'controlButtonHoverText',
          'controlButtonActiveBg',
          'controlButtonActiveText',
          'controlButtonDangerHoverBg',
          'controlButtonDangerText',
          'surfaceInteractiveHoverBg',
          'surfaceInteractiveSelectedBg',
          'surfaceInteractiveSelectedColor',
          'bgCode',
          'bgCodeBlock',
          'bgTableHeader',
          'bgTableRowEven',
          'bgTableRowOdd',
          'spoilerBackground',
          'spoilerOverlayHoverColor',
          'menuDangerText',
        ],
      ),
    ];

ThemeColorTokenDefinition? themeColorTokenForProperty(String propertyName) {
  for (final ThemeColorTokenDefinition token in kEditableThemeColorTokens) {
    if (token.propertyName == propertyName) {
      return token;
    }
  }
  return null;
}

List<ThemeColorTokenDefinition> themeColorTokensForGroup(
  ThemeColorEditorGroupId groupId,
) {
  return kEditableThemeColorTokens
      .where((ThemeColorTokenDefinition t) => t.groupId == groupId)
      .toList();
}

FluxerThemeMode themeColorEditingMode(
  FluxerThemeMode preferenceMode, {
  required Brightness platformBrightness,
}) {
  if (preferenceMode != FluxerThemeMode.system) {
    return preferenceMode;
  }
  return platformBrightness == Brightness.dark
      ? FluxerThemeMode.dark
      : FluxerThemeMode.light;
}

String themeScopeSelectorForMode(FluxerThemeMode mode) {
  return switch (mode) {
    FluxerThemeMode.light => '.theme-light',
    FluxerThemeMode.coal => '.theme-coal',
    FluxerThemeMode.darkLegacy => '.theme-dark_legacy',
    FluxerThemeMode.dark || FluxerThemeMode.system => '.theme-dark',
  };
}

String _scopeKeyForEditorMode(FluxerThemeMode mode) {
  return switch (mode) {
    FluxerThemeMode.light => 'light',
    FluxerThemeMode.coal => 'coal',
    FluxerThemeMode.darkLegacy => 'darkLegacy',
    FluxerThemeMode.dark || FluxerThemeMode.system => 'dark',
  };
}

FluxerColorTheme baseColorThemeForMode(
  FluxerThemeMode mode, {
  double saturationFactor = 1,
}) {
  return switch (mode) {
    FluxerThemeMode.light => buildLightColorTheme(
      saturationFactor: saturationFactor,
    ),
    FluxerThemeMode.coal => buildCoalColorTheme(
      saturationFactor: saturationFactor,
    ),
    FluxerThemeMode.darkLegacy => buildDarkLegacyColorTheme(
      saturationFactor: saturationFactor,
    ),
    FluxerThemeMode.dark || FluxerThemeMode.system => buildDarkColorTheme(
      saturationFactor: saturationFactor,
    ),
  };
}

Color defaultThemeColorForProperty(
  String propertyName, {
  required FluxerThemeMode mode,
  double saturationFactor = 1,
}) {
  final FluxerColorTheme base = baseColorThemeForMode(
    mode,
    saturationFactor: saturationFactor,
  );
  return readThemeColorProperty(base, propertyName) ?? base.textPrimary;
}

Color effectiveThemeColorForProperty({
  required String? customThemeCss,
  required String propertyName,
  required FluxerThemeMode editingMode,
  double saturationFactor = 1,
}) {
  final FluxerColorTheme base = baseColorThemeForMode(
    editingMode,
    saturationFactor: saturationFactor,
  );
  final FluxerColorTheme themed = applyCustomThemeCss(
    base,
    css: customThemeCss,
    saturationFactor: saturationFactor,
    mode: editingMode,
  );
  return readThemeColorProperty(themed, propertyName) ??
      readThemeColorProperty(base, propertyName) ??
      base.textPrimary;
}

bool isThemeColorOverriddenForMode({
  required String? customThemeCss,
  required String cssVariable,
  required FluxerThemeMode editingMode,
}) {
  final String? normalized = normalizeCustomThemeCss(customThemeCss);
  if (normalized == null) {
    return false;
  }
  final Map<String, Map<String, String>> scoped =
      extractScopedThemeVariableOverrides(normalized);
  final String scopeKey = _scopeKeyForEditorMode(editingMode);
  return scoped[scopeKey]?.containsKey(cssVariable) ?? false;
}

String _formatScopedCss(Map<String, Map<String, String>> scoped) {
  const List<String> selectors = <String>[
    ':root',
    '.theme-dark',
    '.theme-light',
    '.theme-coal',
    '.theme-dark_legacy',
  ];
  final StringBuffer buffer = StringBuffer();
  for (final String selector in selectors) {
    final String scopeKey = switch (selector) {
      ':root' => 'root',
      '.theme-light' => 'light',
      '.theme-coal' => 'coal',
      '.theme-dark_legacy' => 'darkLegacy',
      _ => 'dark',
    };
    final Map<String, String>? vars = scoped[scopeKey];
    if (vars == null || vars.isEmpty) {
      continue;
    }
    buffer.writeln('$selector {');
    final List<String> keys = vars.keys.toList()..sort();
    for (final String key in keys) {
      buffer.writeln('  $key: ${vars[key]};');
    }
    buffer.writeln('}');
  }
  return buffer.toString().trim();
}

String upsertScopedThemeColor({
  required FluxerThemeMode editingMode,
  required String cssVariable,
  required String hexValue,
  String? customThemeCss,
}) {
  final Map<String, Map<String, String>> scoped =
      normalizeCustomThemeCss(customThemeCss) == null
      ? <String, Map<String, String>>{}
      : extractScopedThemeVariableOverrides(customThemeCss!);
  final String scopeKey = _scopeKeyForEditorMode(editingMode);
  scoped.putIfAbsent(scopeKey, () => <String, String>{});
  scoped[scopeKey]![cssVariable] = hexValue;
  final String built = _formatScopedCss(scoped);
  return built.isEmpty ? '' : built;
}

String clearScopedThemeColor({
  required FluxerThemeMode editingMode,
  required String cssVariable,
  String? customThemeCss,
}) {
  final String? normalized = normalizeCustomThemeCss(customThemeCss);
  if (normalized == null) {
    return '';
  }
  final Map<String, Map<String, String>> scoped =
      extractScopedThemeVariableOverrides(normalized);
  final String scopeKey = _scopeKeyForEditorMode(editingMode);
  scoped[scopeKey]?.remove(cssVariable);
  if (scoped[scopeKey]?.isEmpty ?? false) {
    scoped.remove(scopeKey);
  }
  final String built = _formatScopedCss(scoped);
  return built.isEmpty ? '' : built;
}

String clearScopedThemeColorsForProperties({
  required FluxerThemeMode editingMode,
  required Iterable<String> propertyNames,
  String? customThemeCss,
}) {
  String? css = customThemeCss;
  for (final String propertyName in propertyNames) {
    final ThemeColorTokenDefinition? token = themeColorTokenForProperty(
      propertyName,
    );
    if (token == null) {
      continue;
    }
    css = clearScopedThemeColor(
      customThemeCss: css,
      editingMode: editingMode,
      cssVariable: token.cssVariable,
    );
    if (css.isEmpty) {
      css = null;
    }
  }
  return css ?? '';
}

bool hasThemeColorOverridesForMode({
  required String? customThemeCss,
  required FluxerThemeMode editingMode,
}) {
  final String? normalized = normalizeCustomThemeCss(customThemeCss);
  if (normalized == null) {
    return false;
  }
  final Map<String, Map<String, String>> scoped =
      extractScopedThemeVariableOverrides(normalized);
  final String scopeKey = _scopeKeyForEditorMode(editingMode);
  return scoped[scopeKey]?.isNotEmpty ?? false;
}

String clearAllScopedThemeColorsForMode({
  required FluxerThemeMode editingMode,
  String? customThemeCss,
}) {
  final String? normalized = normalizeCustomThemeCss(customThemeCss);
  if (normalized == null) {
    return '';
  }
  final Map<String, Map<String, String>> scoped =
      extractScopedThemeVariableOverrides(normalized)
        ..remove(_scopeKeyForEditorMode(editingMode));
  final String built = _formatScopedCss(scoped);
  return built.isEmpty ? '' : built;
}
