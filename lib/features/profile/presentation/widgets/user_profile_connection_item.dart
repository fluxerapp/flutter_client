import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_bluesky_icon.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserProfileConnectionItem extends StatelessWidget {
  const UserProfileConnectionItem({required this.connection, super.key});

  final ConnectionResponse connection;

  String _buildConnectionUrl() {
    if (connection.type == ConnectionResponseTypeType.bsky) {
      return 'https://bsky.app/profile/${connection.name}';
    }
    return 'https://${connection.name}';
  }

  Widget _buildStatusIcon() {
    final String assetPath = connection.verified
        ? 'assets/images/connections/verified-badge-green.svg'
        : 'assets/images/connections/unverified-connection-green.svg';
    return SvgPicture.asset(assetPath, width: 16, height: 16);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    final Widget platformIcon =
        connection.type == ConnectionResponseTypeType.bsky
        ? const FluxerBlueskyIcon()
        : const PhosphorIcon(
            PhosphorIconsBold.globeSimple,
            size: 20,
            color: Colors.black,
          );
    final String url = _buildConnectionUrl();
    return FluxerTappable(
      onTap: () => handleExternalLinkTap(context, url),
      builder: (context, _) => Container(
        decoration: BoxDecoration(
          color: colors.backgroundTertiary,
          borderRadius: layout.radiusMd,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: layout.s2,
          vertical: layout.s2,
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: layout.radiusSm,
              ),
              child: platformIcon,
            ),
            SizedBox(width: layout.s2),
            Expanded(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      connection.name,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: layout.s1),
                  Semantics(
                    label: connection.verified
                        ? l10n.connectionVerifiedLabel
                        : l10n.connectionUnverifiedLabel,
                    child: _buildStatusIcon(),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            PhosphorIcon(
              PhosphorIconsBold.arrowSquareOut,
              size: 16,
              color: colors.textPrimaryMuted,
            ),
          ],
        ),
      ),
    );
  }
}
