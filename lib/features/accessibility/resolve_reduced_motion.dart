bool resolveReducedMotion({
  required bool syncReducedMotionWithSystem,
  required bool reducedMotionOverride,
  required bool platformReducedMotion,
}) {
  return syncReducedMotionWithSystem
      ? platformReducedMotion
      : reducedMotionOverride;
}
