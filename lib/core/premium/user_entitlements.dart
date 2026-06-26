import 'package:fluxer_dart/export.dart';

bool computeIsEffectivelyPremium({
  required int? premiumType,
  required List<String> traits,
  required bool premiumPerksDisabled,
}) {
  if (premiumPerksDisabled) {
    return false;
  }
  if (premiumType != null && premiumType > 0) {
    return true;
  }
  return traits.contains('premium');
}

List<String> mergeTraitsWithEffectivePremium({
  required List<String> traits,
  required bool effectiveIsPremium,
}) {
  final Set<String> merged = traits.toSet();
  if (effectiveIsPremium) {
    merged.add('premium');
  } else {
    merged.remove('premium');
  }
  return merged.toList(growable: false)..sort();
}

class UserEntitlements {
  const UserEntitlements({
    required this.traits,
    required this.premiumType,
    required this.premiumPerksDisabled,
    required this.effectiveIsPremium,
  });

  const UserEntitlements.empty()
    : traits = const <String>[],
      premiumType = 0,
      premiumPerksDisabled = false,
      effectiveIsPremium = false;

  final List<String> traits;
  final int premiumType;
  final bool premiumPerksDisabled;
  final bool effectiveIsPremium;

  bool get isEffectivelyPremium => effectiveIsPremium;

  UserEntitlements applyUserProfile(UserPrivateResponse profile) {
    final int type = profile.premiumType?.json ?? 0;
    final List<String> profileTraits = List<String>.from(profile.traits);
    final bool perksDisabled = profile.premiumPerksDisabled;
    return UserEntitlements(
      traits: profileTraits,
      premiumType: type,
      premiumPerksDisabled: perksDisabled,
      effectiveIsPremium: computeIsEffectivelyPremium(
        premiumType: type,
        traits: profileTraits,
        premiumPerksDisabled: perksDisabled,
      ),
    );
  }

  UserEntitlements applyPremiumState(PremiumStateResponse state) {
    final PremiumStateResponseEffective effective = state.effective;
    final int type = effective.premiumType?.json ?? premiumType;
    final bool perksDisabled = effective.premiumPerksDisabled;
    final List<String> mergedTraits = mergeTraitsWithEffectivePremium(
      traits: traits,
      effectiveIsPremium: effective.isPremium,
    );
    return UserEntitlements(
      traits: mergedTraits,
      premiumType: type,
      premiumPerksDisabled: perksDisabled,
      effectiveIsPremium: effective.isPremium,
    );
  }
}
