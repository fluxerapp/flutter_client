import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';

class LimitEvaluator {
  LimitEvaluator(LimitConfigSnapshot snapshot)
    : _sortedRules = _sortRulesBySpecificity(snapshot.rules);

  final List<LimitRule> _sortedRules;

  Map<String, int> resolveAll(
    LimitMatchContext context, {
    LimitEvaluationContext evaluationContext = LimitEvaluationContext.user,
    Map<String, int>? baseLimits,
  }) {
    final Map<String, int> resolvedLimits = Map<String, int>.from(
      baseLimits ?? kDefaultFreeLimits,
    );
    for (final LimitRule rule in _sortedRules) {
      if (!_ruleMatches(rule.filters, context)) {
        continue;
      }
      _applyRuleToResolvedLimits(resolvedLimits, rule, evaluationContext);
    }
    return resolvedLimits;
  }

  int resolveOne(
    LimitMatchContext context,
    String key, {
    LimitEvaluationContext evaluationContext = LimitEvaluationContext.user,
    Map<String, int>? baseLimits,
  }) {
    return resolveAll(
          context,
          evaluationContext: evaluationContext,
          baseLimits: baseLimits,
        )[key] ??
        0;
  }
}

List<LimitRule> _sortRulesBySpecificity(List<LimitRule> rules) {
  final List<({LimitRule rule, int specificity, int originalIndex})> ranked =
      <({LimitRule rule, int specificity, int originalIndex})>[
        for (int index = 0; index < rules.length; index++)
          (
            rule: rules[index],
            specificity: _calculateSpecificity(rules[index].filters),
            originalIndex: index,
          ),
      ];
  return (ranked..sort((
        ({LimitRule rule, int specificity, int originalIndex}) a,
        ({LimitRule rule, int specificity, int originalIndex}) b,
      ) {
        if (a.specificity != b.specificity) {
          return a.specificity.compareTo(b.specificity);
        }
        return a.originalIndex.compareTo(b.originalIndex);
      }))
      .map((({LimitRule rule, int specificity, int originalIndex}) e) => e.rule)
      .toList();
}

bool _ruleMatches(LimitFilter? filters, LimitMatchContext context) {
  if (filters == null) {
    return true;
  }
  if (!_areRequiredEntriesPresent(filters.traits, context.traits)) {
    return false;
  }
  if (!_areRequiredEntriesPresent(
    filters.guildFeatures,
    context.guildFeatures,
  )) {
    return false;
  }
  return true;
}

bool _areRequiredEntriesPresent(List<String>? required, Set<String> available) {
  if (required == null || required.isEmpty) {
    return true;
  }
  for (final String entry in required) {
    if (!available.contains(entry)) {
      return false;
    }
  }
  return true;
}

int _calculateSpecificity(LimitFilter? filters) {
  if (filters == null) {
    return 0;
  }
  final int traitCount = filters.traits?.length ?? 0;
  final int guildFeatureCount = filters.guildFeatures?.length ?? 0;
  return traitCount + guildFeatureCount;
}

void _applyRuleToResolvedLimits(
  Map<String, int> resolved,
  LimitRule rule,
  LimitEvaluationContext evaluationContext,
) {
  final bool hasGuildFilters = (rule.filters?.guildFeatures?.length ?? 0) > 0;
  final bool hasTraitFilters = (rule.filters?.traits?.length ?? 0) > 0;
  for (final String key in kAllLimitKeys) {
    final int? value = rule.limits[key];
    if (value == null || value < 0) {
      continue;
    }
    final LimitScope scope = kLimitKeyScopes[key] ?? LimitScope.user;
    if (!_shouldApplyLimitForContext(
      scope,
      evaluationContext,
      hasTraitFilters: hasTraitFilters,
      hasGuildFilters: hasGuildFilters,
    )) {
      continue;
    }
    final int currentValue = resolved[key] ?? 0;
    if (value > currentValue) {
      resolved[key] = value;
    }
  }
}

bool _shouldApplyLimitForContext(
  LimitScope scope,
  LimitEvaluationContext evaluationContext, {
  required bool hasTraitFilters,
  required bool hasGuildFilters,
}) {
  if (evaluationContext == LimitEvaluationContext.user) {
    return scope == LimitScope.user || scope == LimitScope.both;
  }
  if (scope == LimitScope.both) {
    return true;
  }
  if (scope == LimitScope.user) {
    return !hasGuildFilters;
  }
  if (hasGuildFilters) {
    return true;
  }
  return !hasTraitFilters;
}
