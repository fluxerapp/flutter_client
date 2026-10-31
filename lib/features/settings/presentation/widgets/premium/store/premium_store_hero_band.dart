import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_hero_shapes.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreHeroBand extends StatelessWidget {
  const PremiumStoreHeroBand({
    required this.heroArtAsset,
    required this.title,
    this.lead,
    this.footer,
    this.highlights,
    this.scrollController,
    super.key,
  });

  final String heroArtAsset;
  final String title;
  final String? lead;
  final Widget? footer;
  final Widget? highlights;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final textStyles = context.textStyles;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final bool wide = width >= 560;
        final double waveHeight = (width * 0.04).clamp(24.0, 56.0);
        final double artWidth = wide ? 208 : 144;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [style.heroTop, style.heroMid, style.heroBottom],
                  stops: const [0, 0.45, 1],
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: PremiumStoreHeroShapes(
                      scrollController: scrollController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 28, 16, waveHeight + 24),
                    child: Column(
                      children: [
                        Image.asset(
                          heroArtAsset,
                          width: artWidth,
                          fit: BoxFit.contain,
                          excludeFromSemantics: true,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: textStyles.heading.copyWith(
                            fontSize: wide ? 36 : 30,
                            fontWeight: FontWeight.w700,
                            height: 1.06,
                            letterSpacing: -0.4,
                            color: style.ink,
                            shadows: [
                              Shadow(
                                color: style.textLedge,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                        ),
                        if (lead != null) ...[
                          const SizedBox(height: 16),
                          Text(
                            lead!,
                            textAlign: TextAlign.center,
                            style: textStyles.bodyMedium.copyWith(
                              fontSize: 17,
                              height: 1.55,
                              color: style.inkSoft,
                            ),
                          ),
                        ],
                        if (footer != null) ...[
                          SizedBox(height: lead != null ? 12 : 10),
                          footer!,
                        ],
                        if (highlights != null) ...[
                          const SizedBox(height: 20),
                          highlights!,
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: waveHeight,
              child: CustomPaint(
                painter: _HeroWavePainter(pageColor: style.page),
                size: Size(width, waveHeight),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HeroWavePainter extends CustomPainter {
  const _HeroWavePainter({required this.pageColor});

  final Color pageColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Path wave = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.5)
      ..cubicTo(
        size.width * 0.083,
        size.height * 0.1,
        size.width * 0.167,
        size.height * 0.1,
        size.width * 0.25,
        size.height * 0.4,
      )
      ..cubicTo(
        size.width * 0.333,
        size.height * 0.7,
        size.width * 0.417,
        size.height * 0.87,
        size.width * 0.5,
        size.height * 0.6,
      )
      ..cubicTo(
        size.width * 0.583,
        size.height * 0.33,
        size.width * 0.667,
        size.height * 0,
        size.width * 0.75,
        size.height * 0.13,
      )
      ..cubicTo(
        size.width * 0.833,
        size.height * 0.27,
        size.width * 0.917,
        size.height * 0.67,
        size.width,
        size.height * 0.5,
      )
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(wave, Paint()..color = pageColor);
  }

  @override
  bool shouldRepaint(_HeroWavePainter oldDelegate) {
    return oldDelegate.pageColor != pageColor;
  }
}
