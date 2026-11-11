import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const double kWideSettingsModalMaxWidth = 1400;
const double kWideSettingsSidebarWidth = 300;
const Duration kWideSettingsSidebarCrossFadeDuration = Duration(
  milliseconds: 200,
);

double _clampGutter(double width, double minPx, double vw, double maxPx) {
  return (width * vw / 100).clamp(minPx, maxPx);
}

double wideSettingsContentEdgeGutter(BuildContext context) {
  final double width = MediaQuery.sizeOf(context).width;
  if (width >= 2560) {
    return _clampGutter(width, 48, 8, 96);
  }
  if (width >= 1920) {
    return _clampGutter(width, 40, 7, 80);
  }
  if (width >= 1440) {
    return _clampGutter(width, 32, 6, 64);
  }
  if (width >= 1024) {
    return _clampGutter(width, 24, 5, 48);
  }
  if (width >= 768) {
    return _clampGutter(width, 20, 4, 32);
  }
  return _clampGutter(width, 16, 3, 24);
}

double wideSettingsContentMaxWidth(BuildContext context) {
  final double width = MediaQuery.sizeOf(context).width;
  if (width >= 2560) {
    return 1200;
  }
  if (width >= 1920) {
    return 1120;
  }
  if (width >= 1440) {
    return 1040;
  }
  if (width >= 1024) {
    return 960;
  }
  return (width * 0.9).clamp(640, 800);
}

double wideSettingsDesktopContentMaxWidth(
  BuildContext context,
  double availableWidth,
) {
  final double width = MediaQuery.sizeOf(context).width;
  if (width >= 2560) {
    return (availableWidth * 0.7).clamp(1000, 1200);
  }
  if (width >= 1920) {
    return (availableWidth * 0.75).clamp(900, 1120);
  }
  if (width >= 1440) {
    return (availableWidth * 0.8).clamp(820, 1040);
  }
  if (width >= 1024) {
    return (availableWidth * 0.85).clamp(740, 960);
  }
  return (availableWidth * 0.9).clamp(640, 800);
}

EdgeInsets wideSettingsDesktopModalInsets(BuildContext context) {
  final Size size = MediaQuery.sizeOf(context);
  final double horizontal;
  final double vertical;
  if (size.width >= 1024) {
    horizontal = (size.width * 0.06).clamp(32, 96);
    vertical = (size.height * 0.025).clamp(16, 32);
  } else if (size.width >= 768) {
    horizontal = (size.width * 0.04).clamp(24, 64);
    vertical = (size.height * 0.02).clamp(12, 24);
  } else {
    horizontal = (size.width * 0.02).clamp(12, 24);
    vertical = (size.height * 0.015).clamp(8, 16);
  }
  return EdgeInsets.symmetric(
    horizontal: horizontal + 1,
    vertical: vertical + 1,
  );
}

double wideSettingsDesktopModalMaxWidth(BuildContext context) {
  return (MediaQuery.sizeOf(context).width * 0.96).clamp(960, 1400) - 2;
}

double wideSettingsDesktopModalRadius(BuildContext context) {
  return (MediaQuery.sizeOf(context).width * 0.01).clamp(8, 12);
}

double wideSettingsDesktopSidebarWidth(BuildContext context) {
  return (MediaQuery.sizeOf(context).width * 0.24).clamp(252, 320);
}

List<BoxShadow> wideSettingsDesktopModalShadows() => const <BoxShadow>[
  BoxShadow(color: Color(0x142E3138), spreadRadius: 1),
  BoxShadow(
    color: Color(0x40000000),
    offset: Offset(0, 8),
    blurRadius: 24,
    spreadRadius: -4,
  ),
  BoxShadow(
    color: Color(0x33000000),
    offset: Offset(0, 20),
    blurRadius: 48,
    spreadRadius: -8,
  ),
];

Color wideSettingsSidebarBackground(BuildContext context) {
  if (usesDesktopPointerUi(context)) {
    return fluxerFormSurfaceBackground(context);
  }
  return context.colors.buttonSecondaryFill;
}

Color wideSettingsContentBackground(BuildContext context) {
  if (usesDesktopPointerUi(context) &&
      Theme.of(context).brightness == Brightness.light) {
    return context.colors.backgroundPrimary;
  }
  return context.colors.backgroundSecondary;
}

class _DesktopWideSettingsContentScope extends InheritedWidget {
  const _DesktopWideSettingsContentScope({required super.child});

  static bool contains(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<
            _DesktopWideSettingsContentScope
          >() !=
      null;

  @override
  bool updateShouldNotify(_DesktopWideSettingsContentScope oldWidget) => false;
}

Widget wideSettingsSidebarCrossFadeLayout(
  Widget topChild,
  Key topChildKey,
  Widget bottomChild,
  Key bottomChildKey,
) {
  return Stack(
    fit: StackFit.expand,
    clipBehavior: Clip.none,
    children: <Widget>[
      Positioned.fill(key: bottomChildKey, child: bottomChild),
      Positioned.fill(key: topChildKey, child: topChild),
    ],
  );
}

const double kSettingsScrollBottomPadding = 45;
const double kSettingsSaveBarScrollExtra = 52;
const double kDesktopSettingsScrollTopPadding = 20;
const double kDesktopSettingsScrollBottomPadding = 32;

EdgeInsets settingsScrollPadding(
  BuildContext context, {
  double bottom = kSettingsScrollBottomPadding,
}) {
  final layout = context.layout;
  if (_DesktopWideSettingsContentScope.contains(context)) {
    return EdgeInsets.only(
      bottom:
          bottom -
          kSettingsScrollBottomPadding +
          kDesktopSettingsScrollBottomPadding,
    );
  }
  if (isWideLayout(context)) {
    return EdgeInsets.only(top: layout.s4, bottom: bottom);
  }
  return EdgeInsets.fromLTRB(
    layout.pageGutter,
    layout.s4,
    layout.pageGutter,
    bottom,
  );
}

EdgeInsets settingsScrollPaddingWithSaveBar(BuildContext context) {
  return settingsScrollPadding(
    context,
    bottom: kSettingsScrollBottomPadding + kSettingsSaveBarScrollExtra,
  );
}

EdgeInsets settingsSheetScrollPadding(BuildContext context) {
  final layout = context.layout;
  return EdgeInsets.fromLTRB(layout.pageGutter, 0, layout.pageGutter, 0);
}

class WideSettingsContentLayout extends StatelessWidget {
  const WideSettingsContentLayout({
    required this.child,
    this.includeHorizontalGutter = true,
    super.key,
  });

  final Widget child;
  final bool includeHorizontalGutter;

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return child;
    }
    if (usesDesktopPointerUi(context)) {
      if (_DesktopWideSettingsContentScope.contains(context)) {
        return child;
      }
      final double gutter = includeHorizontalGutter
          ? wideSettingsContentEdgeGutter(context)
          : 0;
      return _DesktopWideSettingsContentScope(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double available = constraints.maxWidth;
            final double width = math.min(
              available,
              wideSettingsDesktopContentMaxWidth(context, available),
            );
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: width,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    gutter,
                    kDesktopSettingsScrollTopPadding,
                    gutter,
                    0,
                  ),
                  child: child,
                ),
              ),
            );
          },
        ),
      );
    }
    final double gutter = wideSettingsContentEdgeGutter(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        includeHorizontalGutter ? gutter : 0,
        20,
        includeHorizontalGutter ? gutter : 0,
        kSettingsScrollBottomPadding,
      ),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: wideSettingsContentMaxWidth(context),
          ),
          child: child,
        ),
      ),
    );
  }
}
