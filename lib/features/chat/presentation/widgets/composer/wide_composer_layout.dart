import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

abstract final class WideComposerLayout {
  const WideComposerLayout._();
  static const double boxInset = 6;
  static const double boxRadius = 8;
  static const double boxMinHeight = 58;
  static const double densePaddingY = 13;
  static const double denseColumnGap = 12;
  static const double actionButtonExtent = 32;
  static const double statusLineHeight = 18;
  static const double statusSafeGap = 8;
  static const double statusSafeArea =
      statusLineHeight + statusSafeGap + statusSafeGap;
  static const double fadeHeight = statusSafeArea - boxInset;
  static const double mobileFadeHeight = statusSafeArea;
  static const double statusRailPaddingInline = 10;
  static const double mobileStatusRailPaddingInline = 8;
  static const double statusRailGap = 8;
  static const double typingMaxWidth = 384;
  static const double slowmodeMaxWidth = 224;
  static const double actionRowMinHeight = 36;
  static const double messageListTrailingInset = fadeHeight;
  static const double mobileMessageListTrailingInset = mobileFadeHeight;
  static const Duration ringTransition = Duration(milliseconds: 150);

  static double fadeHeightFor({required bool isMobile}) =>
      isMobile ? mobileFadeHeight : fadeHeight;

  static double boxInsetFor({required bool isMobile}) =>
      isMobile ? 0 : boxInset;

  static double statusRailPaddingInlineFor({required bool isMobile}) =>
      isMobile ? mobileStatusRailPaddingInline : statusRailPaddingInline;
}

Color composerStatusSurfaceColor(BuildContext context) {
  return isMobileLayout(context)
      ? context.colors.chatInputBackground
      : context.colors.backgroundSecondaryLighter;
}

Color wideComposerRingColor(BuildContext context, {required bool focused}) {
  final Color accent = context.colors.backgroundModifierAccent;
  return accent.withValues(alpha: accent.a * (focused ? 0.45 : 0.20));
}

Color wideComposerActionStackColor(BuildContext context) {
  return Color.lerp(
    context.colors.backgroundTextarea,
    context.colors.backgroundTertiary,
    0.16,
  )!;
}

class WideComposerFade extends StatelessWidget {
  const WideComposerFade({required this.surfaceColor, super.key});

  final Color surfaceColor;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              surfaceColor.withValues(alpha: 0),
              surfaceColor.withValues(alpha: 0.42),
              surfaceColor.withValues(alpha: 0.82),
              surfaceColor,
            ],
            stops: const <double>[0, 0.34, 0.66, 1],
          ),
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class WideComposerFloatingBox extends StatelessWidget {
  const WideComposerFloatingBox({
    required this.focused,
    required this.child,
    super.key,
  });

  final bool focused;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Color ringColor = wideComposerRingColor(context, focused: focused);
    return AnimatedContainer(
      duration: WideComposerLayout.ringTransition,
      curve: Curves.easeInOut,
      constraints: const BoxConstraints(
        minHeight: WideComposerLayout.boxMinHeight,
      ),
      decoration: BoxDecoration(
        color: context.colors.backgroundTextarea,
        borderRadius: BorderRadius.circular(WideComposerLayout.boxRadius),
        border: Border.all(color: ringColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

List<Shadow> wideComposerStatusTextShadows(Color surfaceColor) {
  return <Shadow>[
    Shadow(color: surfaceColor, blurRadius: 3),
    Shadow(color: surfaceColor, blurRadius: 8),
  ];
}
