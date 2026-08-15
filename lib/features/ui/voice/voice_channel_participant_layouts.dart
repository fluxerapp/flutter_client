import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_hangout_layout.dart';
import 'package:material_ui/material_ui.dart';

class VoiceGalleryPageDots extends StatelessWidget {
  const VoiceGalleryPageDots({
    required this.pageCount,
    required this.currentPage,
    super.key,
  });

  final int pageCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    if (pageCount <= 1) {
      return const SizedBox.shrink();
    }
    final int safePage = currentPage.clamp(0, pageCount - 1);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(pageCount, (int index) {
          final bool active = index == safePage;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: active ? 8 : 6,
            height: active ? 8 : 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active
                  ? context.colors.textPrimary
                  : context.colors.textSecondary.withValues(alpha: 0.55),
            ),
          );
        }),
      ),
    );
  }
}

List<Rect> voiceHangoutTileRects({
  required int tileCount,
  required double width,
  required double height,
  required bool landscape,
}) {
  if (tileCount <= 0) {
    return <Rect>[];
  }
  if (tileCount == 1) {
    return <Rect>[voiceHangoutCenteredAspectRect(width: width, height: height)];
  }
  if (tileCount == 2) {
    if (landscape) {
      final double tileWidth = (width - 8) / 2;
      return <Rect>[
        Rect.fromLTWH(0, 0, tileWidth, height),
        Rect.fromLTWH(tileWidth + 8, 0, tileWidth, height),
      ];
    }
    final double tileHeight = (height - 8) / 2;
    return <Rect>[
      Rect.fromLTWH(0, 0, width, tileHeight),
      Rect.fromLTWH(0, tileHeight + 8, width, tileHeight),
    ];
  }
  if (tileCount == 3) {
    if (landscape) {
      final double mainWidth = width * 0.62;
      final double sideWidth = width - mainWidth - 8;
      final double sideHeight = (height - 8) / 2;
      return <Rect>[
        Rect.fromLTWH(0, 0, mainWidth, height),
        Rect.fromLTWH(mainWidth + 8, 0, sideWidth, sideHeight),
        Rect.fromLTWH(mainWidth + 8, sideHeight + 8, sideWidth, sideHeight),
      ];
    }
    final double topHeight = height * 0.58;
    final double bottomHeight = height - topHeight - 8;
    final double bottomWidth = (width - 8) / 2;
    return <Rect>[
      Rect.fromLTWH(0, 0, width, topHeight),
      Rect.fromLTWH(0, topHeight + 8, bottomWidth, bottomHeight),
      Rect.fromLTWH(bottomWidth + 8, topHeight + 8, bottomWidth, bottomHeight),
    ];
  }
  final double tileWidth = (width - 8) / 2;
  final double tileHeight = (height - 8) / 2;
  return <Rect>[
    Rect.fromLTWH(0, 0, tileWidth, tileHeight),
    Rect.fromLTWH(tileWidth + 8, 0, tileWidth, tileHeight),
    Rect.fromLTWH(0, tileHeight + 8, tileWidth, tileHeight),
    Rect.fromLTWH(tileWidth + 8, tileHeight + 8, tileWidth, tileHeight),
  ];
}

double voiceFocusFilmstripCrossAxis({
  required bool compact,
  required bool landscape,
}) {
  if (landscape) {
    return voiceHangoutFilmstripCrossAxis(compact: compact);
  }
  return compact ? 76 : 104;
}
