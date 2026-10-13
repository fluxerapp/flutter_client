bool resolveReducedMotion({
  required bool syncReducedMotionWithSystem,
  required bool reducedMotionOverride,
  required bool platformReducedMotion,
}) {
  return syncReducedMotionWithSystem
      ? platformReducedMotion
      : reducedMotionOverride;
}

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
