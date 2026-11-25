import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchPageDots extends StatelessWidget {
  const VoiceTouchPageDots({
    required this.pageCount,
    required this.currentPage,
    super.key,
  });

  final int pageCount;
  final int currentPage;

  static const double _kActiveSize = 8;
  static const double _kSize = 6;
  static const double _kGap = 6;
  static const double _kInactiveOpacity = 0.55;
  static const Duration _kDuration = Duration(milliseconds: 180);

  @override
  Widget build(BuildContext context) {
    if (pageCount <= 1) {
      return const SizedBox.shrink();
    }
    final int activePage = currentPage.clamp(0, pageCount - 1);
    return Padding(
      padding: EdgeInsets.only(
        top: context.layout.s2,
        bottom: context.layout.s1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: _kGap,
        children: <Widget>[
          for (int i = 0; i < pageCount; i++)
            AnimatedContainer(
              duration: _kDuration,
              width: i == activePage ? _kActiveSize : _kSize,
              height: i == activePage ? _kActiveSize : _kSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == activePage
                    ? context.colors.textPrimary
                    : context.colors.textSecondary.withValues(
                        alpha: _kInactiveOpacity,
                      ),
              ),
            ),
        ],
      ),
    );
  }
}
