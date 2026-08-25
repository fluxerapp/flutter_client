import 'package:fluxer_app/material_ui.dart';

const double kAppTextScaleMin = 0.8;
const double kAppTextScaleMax = 2;

/// Caps chrome and composer actions at chat font max (24 / 16).
const double kConstrainedUiTextScaleMax = 1.5;

const double kBadgeTextScaleMax = 1;
const double kChatMessageTextScaleMax = 2;

const List<int> kChatFontSizeMarkers = <int>[12, 14, 15, 16, 18, 20, 24];

const int kDefaultChatFontSize = 16;

const double kMinLayoutZoomLevel = 0.5;
const double kMaxLayoutZoomLevel = 2;
const double kDefaultLayoutZoomLevel = 1;

const List<double> kAppZoomLevelMarkerPercents = <double>[
  50,
  75,
  100,
  125,
  150,
  175,
  200,
];

int snapChatFontSize(double value) {
  final double clamped = value.clamp(12, 24);
  int nearest = kChatFontSizeMarkers.first;
  double nearestDistance = (clamped - nearest).abs();
  for (final int marker in kChatFontSizeMarkers) {
    final double distance = (clamped - marker).abs();
    if (distance < nearestDistance) {
      nearest = marker;
      nearestDistance = distance;
    }
  }
  return nearest;
}

double clampLayoutZoomLevel(double value) {
  return value.clamp(kMinLayoutZoomLevel, kMaxLayoutZoomLevel);
}

/// Proto zoom values above 4 are percents (100 = 1.0).
double protoZoomLevelToFactor(double zoomLevel) {
  if (zoomLevel > 4) {
    return zoomLevel / 100;
  }
  return zoomLevel;
}

TextScaler clampAppTextScaler(TextScaler scaler) {
  return scaler.clamp(
    minScaleFactor: kAppTextScaleMin,
    maxScaleFactor: kAppTextScaleMax,
  );
}

TextScaler clampConstrainedUiTextScaler(TextScaler scaler) {
  return scaler.clamp(
    minScaleFactor: kAppTextScaleMin,
    maxScaleFactor: kConstrainedUiTextScaleMax,
  );
}

TextScaler clampBadgeTextScaler(TextScaler scaler) {
  return scaler.clamp(
    minScaleFactor: kAppTextScaleMin,
    maxScaleFactor: kBadgeTextScaleMax,
  );
}

TextScaler chatMessageTextScaler(TextScaler systemScaler, double scaleRatio) {
  final double clampedSystem = clampAppTextScaler(systemScaler).scale(1);
  final double product = clampedSystem * scaleRatio;
  return TextScaler.linear(
    product.clamp(kAppTextScaleMin, kChatMessageTextScaleMax),
  );
}

/// Initials use layout sizes, not reading text scale.
const TextScaler kIconInitialsTextScaler = TextScaler.noScaling;

class FluxerAppTextScale extends StatelessWidget {
  const FluxerAppTextScale({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: clampAppTextScaler(MediaQuery.textScalerOf(context)),
      ),
      child: child,
    );
  }
}

class FluxerConstrainedUiTextScale extends StatelessWidget {
  const FluxerConstrainedUiTextScale({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: clampConstrainedUiTextScaler(
          MediaQuery.textScalerOf(context),
        ),
      ),
      child: child,
    );
  }
}
