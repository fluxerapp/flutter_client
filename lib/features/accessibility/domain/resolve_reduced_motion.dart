bool resolveReducedMotion({
  required bool syncReducedMotionWithSystem,
  required bool reducedMotionOverride,
  required bool platformReducedMotion,
}) {
  return syncReducedMotionWithSystem
      ? platformReducedMotion
      : reducedMotionOverride;
}

/// Android reduced motion follows animator duration scale, not transition scale.
bool resolvePlatformReducedMotion({
  required bool disableAnimations,
  required bool androidAnimatorDurationDisabled,
  required bool useAndroidAnimatorDuration,
}) {
  if (useAndroidAnimatorDuration) {
    return androidAnimatorDurationDisabled;
  }
  return disableAnimations;
}
