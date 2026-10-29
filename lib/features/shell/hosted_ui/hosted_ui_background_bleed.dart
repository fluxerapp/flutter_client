import 'dart:math' as math;

import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/material_ui.dart';

EdgeInsets hostedUiBackgroundBleedInsets(BuildContext context) {
  if (!hasIphoneDuoSideStrip(context)) {
    return EdgeInsets.zero;
  }
  final EdgeInsets padding = MediaQuery.paddingOf(context);
  final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
  return EdgeInsets.only(
    left: math.max(0, viewPadding.left - padding.left),
    right: math.max(0, viewPadding.right - padding.right),
  );
}

class HostedUiBackgroundBleed extends StatelessWidget {
  const HostedUiBackgroundBleed({
    required this.color,
    required this.child,
    super.key,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets bleed = hostedUiBackgroundBleedInsets(context);
    if (bleed.left == 0 && bleed.right == 0) {
      return ColoredBox(color: color, child: child);
    }
    return ColoredBox(
      color: color,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned(
            left: -bleed.left,
            right: -bleed.right,
            top: 0,
            bottom: 0,
            child: ColoredBox(color: color),
          ),
          child,
        ],
      ),
    );
  }
}

class HostedUiSideStripFill extends StatelessWidget {
  const HostedUiSideStripFill({
    required this.color,
    required this.height,
    super.key,
  });

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets bleed = hostedUiBackgroundBleedInsets(context);
    if (height <= 0 || (bleed.left == 0 && bleed.right == 0)) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            if (bleed.left > 0)
              Positioned(
                left: -bleed.left,
                top: 0,
                width: bleed.left,
                height: height,
                child: ColoredBox(color: color),
              ),
            if (bleed.right > 0)
              Positioned(
                right: -bleed.right,
                top: 0,
                width: bleed.right,
                height: height,
                child: ColoredBox(color: color),
              ),
          ],
        ),
      ),
    );
  }
}
