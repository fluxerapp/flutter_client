import 'dart:ui';

// Preserves the existing color utility API used by profile and theme code.
// ignore: avoid_classes_with_only_static_members
abstract final class ColorUtils {
  static Color fromInt(int colorInt) {
    final r = (colorInt >> 16) & 0xFF;
    final g = (colorInt >> 8) & 0xFF;
    final b = colorInt & 0xFF;
    return Color.fromARGB(255, r, g, b);
  }

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

// Preserves the existing accent color utility API used by profile code.
// ignore: avoid_classes_with_only_static_members
abstract final class AccentColorUtils {
  static const defaultPalette = [
    Color(0xFF5865F2),
    Color(0xFF57F287),
    Color(0xFFFEE75C),
    Color(0xFFEB459E),
    Color(0xFFED4245),
  ];

  static Color resolve({
    required String userId,
    int? profileAccentColor,
    int? avatarColor,
  }) {
    if (profileAccentColor != null) {
      return ColorUtils.fromInt(profileAccentColor);
    }
    if (avatarColor != null) {
      return ColorUtils.fromInt(avatarColor);
    }
    return defaultPalette[userId.hashCode.abs() % 5];
  }
}
