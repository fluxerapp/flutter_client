const List<double> kTtsRateOptions = <double>[0.1, 0.5, 1, 1.5, 2];

const double kDefaultTtsRate = 1;
const double kMinTtsRate = 0.1;
const double kMaxTtsRate = 2;

double clampTtsRate(double rate) {
  if (rate < kMinTtsRate) {
    return kMinTtsRate;
  }
  if (rate > kMaxTtsRate) {
    return kMaxTtsRate;
  }
  return rate;
}

double nearestTtsRate(double rate) {
  final double clamped = clampTtsRate(rate);
  double nearest = kTtsRateOptions.first;
  double nearestDistance = double.infinity;
  for (final double option in kTtsRateOptions) {
    final double distance = (option - clamped).abs();
    if (distance < nearestDistance) {
      nearest = option;
      nearestDistance = distance;
    }
  }
  return nearest;
}

String formatTtsRateLabel(double rate) => 'x${rate.toStringAsFixed(1)}';

/// Parses typed combobox input like `1.2` or `x1.2` into a clamped rate.
double? parseTtsRateInput(String input) {
  final Match? match = RegExp(
    r'([0-9]+(?:\.[0-9]+)?)',
  ).firstMatch(input.trim());
  if (match == null) {
    return null;
  }
  final double? parsed = double.tryParse(match.group(1)!);
  if (parsed == null || !parsed.isFinite) {
    return null;
  }
  return clampTtsRate(parsed);
}
