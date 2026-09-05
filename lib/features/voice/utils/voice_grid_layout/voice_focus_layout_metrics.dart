int voiceFocusMiniGridColumnCount(double containerWidth) {
  if (containerWidth >= 1040) {
    return 4;
  }
  if (containerWidth >= 760) {
    return 3;
  }
  if (containerWidth >= 620) {
    return 2;
  }
  return 1;
}

bool voiceFocusShouldUseMiniGrid({
  required bool compact,
  required double containerWidth,
  required int secondaryCount,
}) {
  if (compact || secondaryCount <= 0) {
    return false;
  }
  return containerWidth >= 620;
}
