import 'package:fluxer_app/core/theme/css_color_parser.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/theme_token_aliases.dart';
import 'package:fluxer_app/core/theme/theme_variable_mapping.dart';
import 'package:fluxer_app/material_ui.dart';

final RegExp _cssVariablePattern = RegExp(r'--([a-zA-Z0-9_-]+)\s*:\s*([^;]+);');

final RegExp _cssScopeBlockPattern = RegExp(
  r'(:root|\.theme-light|\.theme-coal|\.theme-dark(?:_legacy)?)\s*\{([^}]*)\}',
  caseSensitive: false,
);

String? normalizeCustomThemeCss(String? css) {
  if (css == null) {
    return null;
  }
  final String trimmed = css.trim();
  return trimmed.isEmpty ? null : trimmed;
}

double clampSaturationFactor(double value) => value.clamp(0.0, 1.0);

Map<String, String> extractThemeVariableOverrides(String css) {
  final Map<String, String> overrides = <String, String>{};
  for (final RegExpMatch match in _cssVariablePattern.allMatches(css)) {
    overrides['--${match.group(1)!}'] = match.group(2)!.trim();
  }
  return overrides;
}

Map<String, Map<String, String>> extractScopedThemeVariableOverrides(
  String css,
) {
  final Map<String, Map<String, String>> scoped =
      <String, Map<String, String>>{};
  for (final RegExpMatch match in _cssScopeBlockPattern.allMatches(css)) {
    final String selector = match.group(1)!.toLowerCase();
    final Map<String, String> blockOverrides = extractThemeVariableOverrides(
      match.group(2) ?? '',
    );
    if (blockOverrides.isEmpty) {
      continue;
    }
    final String scopeKey = _scopeKeyForSelector(selector);
    scoped.putIfAbsent(scopeKey, () => <String, String>{});
    scoped[scopeKey]!.addAll(blockOverrides);
  }
  if (scoped.isEmpty) {
    final Map<String, String> flatOverrides = extractThemeVariableOverrides(
      css,
    );
    if (flatOverrides.isNotEmpty) {
      scoped['root'] = flatOverrides;
    }
  }
  return scoped;
}

Map<String, String> resolveScopedOverridesForMode(
  Map<String, Map<String, String>> scopedOverrides,
  FluxerThemeMode mode,
) {
  final String modeScope = switch (mode) {
    FluxerThemeMode.light => 'light',
    FluxerThemeMode.coal => 'coal',
    FluxerThemeMode.dark || FluxerThemeMode.system => 'dark',
  };
  final Map<String, String> merged = <String, String>{}
    ..addAll(scopedOverrides['dark'] ?? const <String, String>{})
    ..addAll(scopedOverrides[modeScope] ?? const <String, String>{})
    ..addAll(scopedOverrides['root'] ?? const <String, String>{});
  return merged;
}

FluxerColorTheme applyCustomThemeCss(
  FluxerColorTheme base, {
  required String? css,
  required double saturationFactor,
  FluxerThemeMode? mode,
}) {
  final String? normalizedCss = normalizeCustomThemeCss(css);
  if (normalizedCss == null) {
    return base;
  }
  final Map<String, String> overrides = mode == null
      ? extractThemeVariableOverrides(normalizedCss)
      : resolveScopedOverridesForMode(
          extractScopedThemeVariableOverrides(normalizedCss),
          mode,
        );
  if (overrides.isEmpty) {
    return base;
  }
  final Map<String, String> resolvedOverrides = resolveCssOverrideValues(
    overrides,
    base,
  );
  final Map<String, Color> propertyOverrides = <String, Color>{};
  final Set<String> explicitProperties = <String>{};
  for (final MapEntry<String, String> entry in resolvedOverrides.entries) {
    if (entry.value.contains('url(')) {
      continue;
    }
    final String? propertyName = kThemeCssVariableToProperty[entry.key];
    if (propertyName == null) {
      continue;
    }
    final Color? parsedColor = parseCssColor(
      entry.value,
      saturationFactor: saturationFactor,
    );
    if (parsedColor == null) {
      continue;
    }
    propertyOverrides[propertyName] = parsedColor;
    explicitProperties.add(propertyName);
  }
  propagateLinkedThemeProperties(propertyOverrides, explicitProperties);
  return base.applyPropertyOverrides(propertyOverrides);
}

String _scopeKeyForSelector(String selector) {
  return switch (selector) {
    ':root' => 'root',
    '.theme-light' => 'light',
    '.theme-coal' => 'coal',
    '.theme-dark' || '.theme-dark_legacy' => 'dark',
    _ => 'root',
  };
}
