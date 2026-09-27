import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kMessagePreviewMinHeight = 160;
const double _kMessagePreviewMaxHeightCap = 320;
const double _kMessagePreviewHeightScreenFraction = 0.35;
const double _kMessagePreviewBottomFadeExtent = 40;

double messagePreviewMaxHeight(BuildContext context) {
  final double screenHeight = MediaQuery.sizeOf(context).height;
  return (screenHeight * _kMessagePreviewHeightScreenFraction).clamp(
    _kMessagePreviewMinHeight,
    _kMessagePreviewMaxHeightCap,
  );
}

/// Bordered card used for message previews in modals and sheets.
class MessagePreviewCard extends StatelessWidget {
  const MessagePreviewCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(
          MediaQuery.textScalerOf(context).scale(1) * 0.875,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: layout.radiusMd,
          border: Border.all(color: colors.backgroundHeaderSecondary),
        ),
        child: ClipRRect(
          borderRadius: layout.radiusMd,
          child: IgnorePointer(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: layout.s2),
              child: _FadedMaxHeightBox(
                maxHeight: messagePreviewMaxHeight(context),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FadedMaxHeightBox extends StatelessWidget {
  const _FadedMaxHeightBox({required this.maxHeight, required this.child});

  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: ShaderMask(
        blendMode: BlendMode.dstIn,
        shaderCallback: (Rect bounds) {
          final bool clipped = bounds.height >= maxHeight - 1;
          if (!clipped) {
            return const LinearGradient(
              colors: <Color>[Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
            ).createShader(bounds);
          }
          final double fadeStart =
              ((bounds.height - _kMessagePreviewBottomFadeExtent) /
                      bounds.height)
                  .clamp(0.0, 1.0);
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const <Color>[
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0x00000000),
            ],
            stops: <double>[0, fadeStart, 1],
          ).createShader(bounds);
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: child,
        ),
      ),
    );
  }
}
