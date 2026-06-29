abstract final class GuildFeatures {
  static const String animatedIcon = 'ANIMATED_ICON';
  static const String animatedBanner = 'ANIMATED_BANNER';
  static const String banner = 'BANNER';
  static const String detachedBanner = 'DETACHED_BANNER';
  static const String inviteSplash = 'INVITE_SPLASH';
  static const String textChannelFlexibleNames = 'TEXT_CHANNEL_FLEXIBLE_NAMES';
  static const String hideOwnerCrown = 'HIDE_OWNER_CROWN';
}

bool hasGuildFeature(List<String> features, String feature) {
  return features.contains(feature);
}

List<String> setGuildFeatureEnabled({
  required List<String> features,
  required String feature,
  required bool enabled,
}) {
  final List<String> next = List<String>.from(features);
  if (enabled) {
    if (!next.contains(feature)) {
      next.add(feature);
    }
  } else {
    next.remove(feature);
  }
  return next;
}

bool areGuildFeaturesEqual(List<String> left, List<String> right) {
  if (left.length != right.length) {
    return false;
  }
  final Set<String> leftSet = left.toSet();
  return right.every(leftSet.contains);
}

List<String>? buildGuildFeaturesUpdate({
  required List<String> original,
  required List<String> updated,
}) {
  if (areGuildFeaturesEqual(original, updated)) {
    return null;
  }
  return updated;
}
