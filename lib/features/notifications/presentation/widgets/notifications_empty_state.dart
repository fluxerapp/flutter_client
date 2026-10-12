import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const double _kEmptyStateBodyMaxWidth = 262;

class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({
    required this.icon,
    required this.title,
    required this.body,
    super.key,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: context.motion.normal,
              builder: (BuildContext _, double opacity, Widget? child) =>
                  Opacity(opacity: opacity, child: child),
              child: Icon(icon, size: 96, color: colors.textPrimaryMuted),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textStyles.heading.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: _kEmptyStateBodyMaxWidth,
              ),
              child: Text(
                body,
                textAlign: TextAlign.center,
                style: textStyles.bodyMedium.copyWith(
                  fontSize: 16,
                  height: 1.25,
                  color: colors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
