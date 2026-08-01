import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

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

Color wideSettingsSidebarBackground(BuildContext context) {
  return context.colors.buttonSecondaryFill;
}

Color wideSettingsContentBackground(BuildContext context) {
  return context.colors.backgroundSecondary;
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

EdgeInsets settingsScrollPadding(
  BuildContext context, {
  double bottom = kSettingsScrollBottomPadding,
}) {
  final layout = context.layout;
  if (isWideLayout(context)) {
    return EdgeInsets.only(top: layout.s4, bottom: bottom);
  }
  return EdgeInsets.fromLTRB(layout.s4, layout.s4, layout.s4, bottom);
}

EdgeInsets settingsScrollPaddingWithSaveBar(BuildContext context) {
  return settingsScrollPadding(
    context,
    bottom: kSettingsScrollBottomPadding + kSettingsSaveBarScrollExtra,
  );
}

EdgeInsets settingsSheetScrollPadding(BuildContext context) {
  final layout = context.layout;
  return EdgeInsets.fromLTRB(
    layout.s4,
    0,
    layout.s4,
    kSettingsScrollBottomPadding,
  );
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
    final double gutter = wideSettingsContentEdgeGutter(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        includeHorizontalGutter ? gutter : 0,
        20,
        includeHorizontalGutter ? gutter : 0,
        kSettingsScrollBottomPadding,
      ),
      child: Align(
        alignment: Alignment.topLeft,
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
