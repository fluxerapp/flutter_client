class LimitFilter {
  const LimitFilter({this.traits, this.guildFeatures});

  final List<String>? traits;
  final List<String>? guildFeatures;
}

class LimitRule {
  const LimitRule({required this.limits, this.filters});

  final Map<String, int> limits;
  final LimitFilter? filters;
}

class LimitConfigSnapshot {
  const LimitConfigSnapshot({required this.rules});

  final List<LimitRule> rules;
}

class LimitMatchContext {
  const LimitMatchContext({required this.traits, required this.guildFeatures});

  final Set<String> traits;
  final Set<String> guildFeatures;
}

enum LimitEvaluationContext { user, guild }
