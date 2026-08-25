import 'package:fluxer_app/material_ui.dart';

/// When source is overridden, dependents
/// receive the same color unless they were explicitly overridden in CSS.
const Map<String, List<String>> kThemePropertyAliases = <String, List<String>>{
  'brandPrimary': <String>[
    'accentPrimary',
    'serverIconActive',
    'switchThumbCheckedIcon',
  ],
  'statusOnline': <String>['accentSuccess'],
  'statusIdle': <String>['accentWarning', 'statusWarning'],
  'statusDnd': <String>['accentDanger'],
  'textLink': <String>[
    'accentInfo',
    'markupMentionText',
    'markupInteractiveHoverText',
    'markupJumpLinkText',
  ],
  'backgroundPrimary': <String>['bgTableRowOdd'],
  'backgroundSecondary': <String>['bgTableRowEven'],
  'backgroundTertiary': <String>['bgTableHeader'],
  'backgroundModifierHover': <String>[],
  'backgroundModifierSelected': <String>[],
  'backgroundSecondaryAlt': <String>[],
};

Color deriveBrandPrimaryLight(Color brandPrimary) {
  final HSLColor hsl = HSLColor.fromColor(brandPrimary);
  return hsl.withSaturation(1).withLightness(0.84).toColor();
}

void propagateLinkedThemeProperties(
  Map<String, Color> overrides,
  Set<String> explicitProperties,
) {
  final Color? accentPrimary = overrides['accentPrimary'];
  if (accentPrimary != null &&
      !explicitProperties.contains('brandPrimary') &&
      !overrides.containsKey('brandPrimary')) {
    overrides['brandPrimary'] = accentPrimary;
  }
  var changed = true;
  while (changed) {
    changed = false;
    for (final MapEntry<String, List<String>> entry
        in kThemePropertyAliases.entries) {
      final Color? source = overrides[entry.key];
      if (source == null) {
        continue;
      }
      for (final String target in entry.value) {
        if (explicitProperties.contains(target) ||
            overrides.containsKey(target)) {
          continue;
        }
        overrides[target] = source;
        changed = true;
      }
    }
  }
  final Color? brandPrimary = overrides['brandPrimary'];
  if (brandPrimary != null &&
      !explicitProperties.contains('brandPrimaryLight') &&
      !overrides.containsKey('brandPrimaryLight')) {
    overrides['brandPrimaryLight'] = deriveBrandPrimaryLight(brandPrimary);
  }
}
