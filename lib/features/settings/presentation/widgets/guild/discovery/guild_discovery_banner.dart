import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum GuildDiscoveryBannerVariant { info, warning }

class GuildDiscoveryBanner extends StatelessWidget {
  const GuildDiscoveryBanner({
    required this.message,
    this.title,
    this.variant = GuildDiscoveryBannerVariant.info,
    super.key,
  });

  final String message;
  final String? title;
  final GuildDiscoveryBannerVariant variant;

  @override
  Widget build(BuildContext context) {
    final Color accentColor = switch (variant) {
      GuildDiscoveryBannerVariant.info => context.colors.accentInfo,
      GuildDiscoveryBannerVariant.warning => context.colors.accentWarning,
    };
    final IconData icon = switch (variant) {
      GuildDiscoveryBannerVariant.info => PhosphorIconsFill.info,
      GuildDiscoveryBannerVariant.warning => PhosphorIconsFill.warning,
    };
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.1),
        borderRadius: context.layout.radiusSm,
        border: Border.all(color: accentColor.withValues(alpha: 0.5)),
      ),
      padding: EdgeInsets.all(context.layout.s4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, color: accentColor, size: 20),
          ),
          SizedBox(width: context.layout.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (title != null) ...<Widget>[
                  Text(
                    title!,
                    style: context.textStyles.bodySmall.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: context.layout.s1),
                ],
                Text(
                  message,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textPrimaryMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
