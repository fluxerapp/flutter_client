import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';

MatureMediaPolicy resolveMatureMediaPolicy({
  required bool isMatureMedia,
  required ClientSensitiveMediaFilterLevel filterLevel,
  required MatureContentGateReason mediaGateReason,
}) {
  if (!isMatureMedia) {
    return MatureMediaPolicy.none;
  }
  final bool isFilterBlur = filterLevel == ClientSensitiveMediaFilterLevel.blur;
  final bool isFilterBlock =
      filterLevel == ClientSensitiveMediaFilterLevel.block;
  final bool isGateBlur =
      mediaGateReason == MatureContentGateReason.minorBlocked;
  final bool canReveal = isFilterBlur && !isGateBlur;
  final bool shouldBlur = isGateBlur || isFilterBlur;
  return MatureMediaPolicy(
    shouldBlur: shouldBlur,
    shouldBlock: isFilterBlock,
    canReveal: canReveal,
    gateReason: mediaGateReason,
  );
}

MatureContentGateReason resolveMediaGateReason({
  required bool nsfwAllowed,
  required bool effectiveMatureContent,
}) {
  if (!effectiveMatureContent) {
    return MatureContentGateReason.none;
  }
  if (!nsfwAllowed) {
    return MatureContentGateReason.minorBlocked;
  }
  return MatureContentGateReason.none;
}

bool hasMatureContentAgreement({
  required MatureContentAgreementsState agreements,
  required ResolvedMatureGateContext context,
}) {
  switch (context.scope) {
    case MatureContentAgreementScope.guild:
      final String? guildId = context.scopeId ?? context.guildId;
      return guildId != null && agreements.agreedGuildIds.contains(guildId);
    case MatureContentAgreementScope.category:
      final String? categoryId = context.scopeId ?? context.categoryId;
      return categoryId != null &&
          agreements.agreedCategoryIds.contains(categoryId);
    case MatureContentAgreementScope.channel:
      final String? channelId = context.scopeId ?? context.channelId;
      return channelId != null &&
          agreements.agreedChannelIds.contains(channelId);
  }
}

MatureContentGateReason resolveChannelGateReason({
  required ResolvedMatureGateContext context,
  required bool nsfwAllowed,
  required MatureContentAgreementsState agreements,
}) {
  final bool hasWarning =
      context.effectiveWarningLevel == contentWarningLevelContentWarning;
  if (!context.effectiveMatureContent && !hasWarning) {
    return MatureContentGateReason.none;
  }
  if (!agreements.isLoaded) {
    return MatureContentGateReason.none;
  }
  if (context.effectiveMatureContent && !nsfwAllowed) {
    return MatureContentGateReason.minorBlocked;
  }
  if (hasMatureContentAgreement(agreements: agreements, context: context)) {
    return MatureContentGateReason.none;
  }
  return MatureContentGateReason.consentRequired;
}
