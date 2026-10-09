import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/utils/voice_grid_layout/voice_hangout_layout.dart';
import 'package:fluxer_app/material_ui.dart';

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

double voiceFocusFilmstripCrossAxis({
  required bool compact,
  required bool landscape,
}) {
  if (landscape) {
    return voiceHangoutFilmstripCrossAxis(compact: compact);
  }
  return compact ? 76 : 104;
}
