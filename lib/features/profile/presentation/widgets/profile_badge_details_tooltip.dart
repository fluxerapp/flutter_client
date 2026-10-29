import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_image.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class ProfileBadgeDetailsTooltip extends StatelessWidget {
  const ProfileBadgeDetailsTooltip({
    required this.badge,
    required this.details,
    super.key,
  });

  final ProfileBadgeResponse badge;
  final ProfileBadgeResponseDetails details;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final String? artUrl = profileBadgeDisplayImageUrl(
      badge,
      displayHeight: 48,
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 280),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (artUrl != null) ...[
            ProfileBadgeImage.fromBadge(badge, height: 48),
            const SizedBox(height: 4),
          ],
          Text(
            details.title,
            textAlign: TextAlign.center,
            style: textStyles.bodySmall.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          for (final String line in details.lines) ...[
            const SizedBox(height: 2),
            Text(
              line,
              textAlign: TextAlign.center,
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ],
        ],
      ),
    );
  }
}
