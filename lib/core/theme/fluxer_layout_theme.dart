import 'package:fluxer_app/material_ui.dart';

class FluxerLayoutTheme extends ThemeExtension<FluxerLayoutTheme> {
  const FluxerLayoutTheme({
    required this.scaleFactor,
    required this.s0,
    required this.s1,
    required this.s1_5,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s8,
    required this.s10,
    required this.s12,
    required this.s16,
    required this.s20,
    required this.s24,
    required this.radiusSm,
    required this.radiusMd,
    required this.radiusLg,
    required this.radiusXl,
    required this.radiusXxl,
    required this.radiusFull,
    required this.radiusMedia,
    required this.sidebarWidth,
    required this.headerHeight,
    required this.guildIconSize,
    required this.guildListWidth,
    required this.mobileBottomNavHeight,
    required this.userAreaHeight,
    required this.switchTrackWidth,
    required this.switchTrackHeight,
    required this.switchThumbSize,
    required this.switchThumbInset,
    required this.switchIconSize,
    required this.settingsSwitchRowMinHeight,
    required this.settingsSwitchGroupedRowMinHeight,
    required this.touchTargetMin,
  });

  factory FluxerLayoutTheme.scaled({double scaleFactor = 1.0}) {
    double s(double base) => base * scaleFactor;
    BorderRadius r(double base) =>
        BorderRadius.all(Radius.circular(base * scaleFactor));

    return FluxerLayoutTheme(
      scaleFactor: scaleFactor,
      s0: s(0),
      s1: s(4),
      s1_5: s(6),
      s2: s(8),
      s3: s(12),
      s4: s(16),
      s5: s(20),
      s6: s(24),
      s8: s(32),
      s10: s(40),
      s12: s(48),
      s16: s(64),
      s20: s(80),
      s24: s(96),
      radiusSm: r(4),
      radiusMd: r(6),
      radiusLg: r(8),
      radiusXl: r(12),
      radiusXxl: r(16),
      radiusFull: r(9999),
      radiusMedia: r(4),
      sidebarWidth: s(270),
      headerHeight: s(56),
      guildIconSize: s(44),
      guildListWidth: s(72),
      mobileBottomNavHeight: s(60),
      userAreaHeight: s(72),
      switchTrackWidth: s(44),
      switchTrackHeight: s(24),
      switchThumbSize: s(20),
      switchThumbInset: s(2),
      switchIconSize: s(12),
      settingsSwitchRowMinHeight: s(44),
      settingsSwitchGroupedRowMinHeight: s(68),
      touchTargetMin: s(44),
    );
  }

  final double scaleFactor;

  // Spacing
  final double s0;
  final double s1;
  final double s1_5;
  final double s2;
  final double s3;
  final double s4;
  final double s5;
  final double s6;
  final double s8;
  final double s10;
  final double s12;
  final double s16;
  final double s20;
  final double s24;

  // Radius
  final BorderRadius radiusSm;
  final BorderRadius radiusMd;
  final BorderRadius radiusLg;
  final BorderRadius radiusXl;
  final BorderRadius radiusXxl;
  final BorderRadius radiusFull;
  final BorderRadius radiusMedia;

  // Layout Dimensions
  final double sidebarWidth;
  final double headerHeight;
  final double guildIconSize;
  final double guildListWidth;
  final double mobileBottomNavHeight;
  final double userAreaHeight;

  // Switch dimensions
  final double switchTrackWidth;
  final double switchTrackHeight;
  final double switchThumbSize;
  final double switchThumbInset;
  final double switchIconSize;

  // Settings switch row dimensions
  final double settingsSwitchRowMinHeight;
  final double settingsSwitchGroupedRowMinHeight;

  // Minimum interactive control size
  final double touchTargetMin;

  @override
  FluxerLayoutTheme copyWith({double? scaleFactor}) {
    if (scaleFactor != null && scaleFactor != this.scaleFactor) {
      return FluxerLayoutTheme.scaled(scaleFactor: scaleFactor);
    }
    return this;
  }

  @override
  FluxerLayoutTheme lerp(FluxerLayoutTheme? other, double t) {
    if (other is! FluxerLayoutTheme) {
      return this;
    }

    final lerpedScaleFactor =
        scaleFactor + (other.scaleFactor - scaleFactor) * t;
    return FluxerLayoutTheme.scaled(scaleFactor: lerpedScaleFactor);
  }
}
