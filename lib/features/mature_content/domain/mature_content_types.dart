enum ClientSensitiveMediaFilterLevel {
  show,
  blur,
  block;

  static ClientSensitiveMediaFilterLevel fromInt(int value) => switch (value) {
    1 => ClientSensitiveMediaFilterLevel.blur,
    2 => ClientSensitiveMediaFilterLevel.block,
    _ => ClientSensitiveMediaFilterLevel.show,
  };
}

enum MatureContentGateReason { none, consentRequired, minorBlocked }

enum MatureContentAgreementScope { channel, category, guild }

enum EffectiveMatureSource { none, guild, parent, channel }

const int contentWarningLevelInherit = 0;
const int contentWarningLevelContentWarning = 1;

class MatureContentAgreementsState {
  const MatureContentAgreementsState({
    this.isLoaded = false,
    this.agreedChannelIds = const {},
    this.agreedCategoryIds = const {},
    this.agreedGuildIds = const {},
  });

  final bool isLoaded;
  final Set<String> agreedChannelIds;
  final Set<String> agreedCategoryIds;
  final Set<String> agreedGuildIds;

  MatureContentAgreementsState copyWith({
    bool? isLoaded,
    Set<String>? agreedChannelIds,
    Set<String>? agreedCategoryIds,
    Set<String>? agreedGuildIds,
  }) {
    return MatureContentAgreementsState(
      isLoaded: isLoaded ?? this.isLoaded,
      agreedChannelIds: agreedChannelIds ?? this.agreedChannelIds,
      agreedCategoryIds: agreedCategoryIds ?? this.agreedCategoryIds,
      agreedGuildIds: agreedGuildIds ?? this.agreedGuildIds,
    );
  }
}

class EffectiveMatureContentResult {
  const EffectiveMatureContentResult({
    required this.value,
    required this.source,
  });

  final bool value;
  final EffectiveMatureSource source;
}

class EffectiveContentWarning {
  const EffectiveContentWarning({
    required this.level,
    required this.text,
    required this.source,
  });

  final int level;
  final String? text;
  final EffectiveMatureSource source;
}

class ResolvedMatureGateContext {
  const ResolvedMatureGateContext({
    required this.channelId,
    required this.categoryId,
    required this.guildId,
    required this.effectiveMatureContent,
    required this.effectiveWarningLevel,
    required this.effectiveWarningText,
    required this.scope,
    required this.scopeId,
  });

  final String? channelId;
  final String? categoryId;
  final String? guildId;
  final bool effectiveMatureContent;
  final int effectiveWarningLevel;
  final String? effectiveWarningText;
  final MatureContentAgreementScope scope;
  final String? scopeId;
}

class MatureMediaPolicy {
  const MatureMediaPolicy({
    required this.shouldBlur,
    required this.shouldBlock,
    required this.canReveal,
  });

  static const MatureMediaPolicy none = MatureMediaPolicy(
    shouldBlur: false,
    shouldBlock: false,
    canReveal: false,
  );

  final bool shouldBlur;
  final bool shouldBlock;
  final bool canReveal;
}
