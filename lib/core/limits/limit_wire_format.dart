import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_dart/export.dart';

LimitConfigSnapshot expandLimitWireFormat(
  WellKnownFluxerResponseLimits wireFormat,
) {
  final Map<String, int> defaults = Map<String, int>.from(kDefaultFreeLimits);
  final List<LimitRule> rules = <LimitRule>[
    for (final WellKnownFluxerResponseLimitsRules rule in wireFormat.rules)
      LimitRule(
        id: rule.id,
        filters: _mapLimitFilter(rule.filters),
        limits: <String, int>{
          ...defaults,
          for (final MapEntry<String, num> entry in rule.overrides.entries)
            entry.key: entry.value.toInt(),
        },
      ),
  ];
  return LimitConfigSnapshot(
    version: wireFormat.version.json,
    traitDefinitions: wireFormat.traitDefinitions.toList(growable: false),
    rules: rules,
  );
}

LimitFilter? _mapLimitFilter(WellKnownFluxerResponseLimitsRulesFilters? filters) {
  if (filters == null) {
    return null;
  }
  final List<String>? traits = filters.traits?.isEmpty ?? true
      ? null
      : filters.traits!.toList(growable: false);
  final List<String>? guildFeatures = filters.guildFeatures?.isEmpty ?? true
      ? null
      : filters.guildFeatures!.toList(growable: false);
  if (traits == null && guildFeatures == null) {
    return null;
  }
  return LimitFilter(traits: traits, guildFeatures: guildFeatures);
}
