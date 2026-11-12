import 'dart:ui';

Color fluxerCssColorMix(Color a, Color b, double weightA) {
  final double wB = 1 - weightA;
  final double alpha = a.a * weightA + b.a * wB;
  if (alpha <= 0) {
    return const Color(0x00000000);
  }
  double channel(double ca, double cb) =>
      ((ca * a.a * weightA + cb * b.a * wB) / alpha).clamp(0.0, 1.0);
  return Color.from(
    alpha: alpha.clamp(0.0, 1.0),
    red: channel(a.r, b.r),
    green: channel(a.g, b.g),
    blue: channel(a.b, b.b),
  );
}
