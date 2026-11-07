class NagbarDismissalsState {
  const NagbarDismissalsState({
    this.pushNotificationDismissed = false,
    this.premiumGracePeriodDismissed = false,
    this.premiumExpiredDismissed = false,
    this.premiumOnboardingDismissed = false,
    this.giftInventoryDismissed = false,
    this.guildMembershipCtaDismissed = false,
    this.visionaryMfaDismissed = false,
    this.guildMfaRequirementDismissed = const <String>{},
  });

  final bool pushNotificationDismissed;
  final bool premiumGracePeriodDismissed;
  final bool premiumExpiredDismissed;
  final bool premiumOnboardingDismissed;
  final bool giftInventoryDismissed;
  final bool guildMembershipCtaDismissed;
  final bool visionaryMfaDismissed;
  final Set<String> guildMfaRequirementDismissed;

  NagbarDismissalsState copyWith({
    bool? pushNotificationDismissed,
    bool? premiumGracePeriodDismissed,
    bool? premiumExpiredDismissed,
    bool? premiumOnboardingDismissed,
    bool? giftInventoryDismissed,
    bool? guildMembershipCtaDismissed,
    bool? visionaryMfaDismissed,
    Set<String>? guildMfaRequirementDismissed,
  }) {
    return NagbarDismissalsState(
      pushNotificationDismissed:
          pushNotificationDismissed ?? this.pushNotificationDismissed,
      premiumGracePeriodDismissed:
          premiumGracePeriodDismissed ?? this.premiumGracePeriodDismissed,
      premiumExpiredDismissed:
          premiumExpiredDismissed ?? this.premiumExpiredDismissed,
      premiumOnboardingDismissed:
          premiumOnboardingDismissed ?? this.premiumOnboardingDismissed,
      giftInventoryDismissed:
          giftInventoryDismissed ?? this.giftInventoryDismissed,
      guildMembershipCtaDismissed:
          guildMembershipCtaDismissed ?? this.guildMembershipCtaDismissed,
      visionaryMfaDismissed:
          visionaryMfaDismissed ?? this.visionaryMfaDismissed,
      guildMfaRequirementDismissed:
          guildMfaRequirementDismissed ?? this.guildMfaRequirementDismissed,
    );
  }
}
