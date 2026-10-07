import 'dart:ui';

// Preserves the existing color utility API used by profile and theme code.
// ignore: avoid_classes_with_only_static_members
abstract final class ColorUtils {
  static Color bestContrastColor(int colorInt) {
    final r = ((colorInt >> 16) & 0xFF) / 255.0;
    final g = ((colorInt >> 8) & 0xFF) / 255.0;
    final b = (colorInt & 0xFF) / 255.0;
    final luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b;
    return luminance > 0.5 ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
  }

  static Color dim(Color color, double amount) {
    final factor = 1.0 - amount;
    final r = (color.r * 255.0 * factor).round().clamp(0, 255);
    final g = (color.g * 255.0 * factor).round().clamp(0, 255);
    final b = (color.b * 255.0 * factor).round().clamp(0, 255);
    return Color.fromARGB((color.a * 255.0).round().clamp(0, 255), r, g, b);
  }
}
