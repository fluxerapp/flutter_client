const double kComfyMessageGroupSpacingDefault = 16;
const double kCompactMessageGroupSpacingDefault = 0;

const List<int> kMessageGroupSpacingOptions = <int>[0, 4, 8, 16, 24];

double defaultMessageGroupSpacing({required bool messageDisplayCompact}) {
  return messageDisplayCompact
      ? kCompactMessageGroupSpacingDefault
      : kComfyMessageGroupSpacingDefault;
}

double messageGroupSpacingForDisplayMode({
  required double messageGroupSpacing,
  required double compactMessageGroupSpacing,
  required bool messageDisplayCompact,
}) {
  return messageDisplayCompact
      ? compactMessageGroupSpacing
      : messageGroupSpacing;
}

int nearestMessageGroupSpacing(double value) {
  int nearest = kMessageGroupSpacingOptions.first;
  double nearestDistance = (value - nearest).abs();
  for (final int option in kMessageGroupSpacingOptions) {
    final double distance = (value - option).abs();
    if (distance < nearestDistance) {
      nearest = option;
      nearestDistance = distance;
    }
  }
  return nearest;
}
