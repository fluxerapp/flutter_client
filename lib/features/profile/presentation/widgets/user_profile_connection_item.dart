import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_connection_icon.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_dart/export.dart';

String _connectionUrl(ConnectionResponse connection) {
  if (connection.type == ConnectionType.bluesky) {
    return 'https://bsky.app/profile/${connection.name}';
  }
  return 'https://${connection.name}';
}

Widget _connectionStatusIcon(ConnectionResponse connection) {
  final String assetPath = connection.verified
      ? 'assets/images/connections/verified-badge-green.svg'
      : 'assets/images/connections/unverified-connection-green.svg';
  return SvgPicture.asset(assetPath, width: 16, height: 16);
}

const double _kCompactTileSize = 24;

class UserProfileConnectionCompactTile extends StatelessWidget {
  const UserProfileConnectionCompactTile({required this.connection, super.key});

  final ConnectionResponse connection;

  @override
  Widget build(BuildContext context) {
    return FluxerTooltip(
      richMessage: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(child: Text(connection.name)),
          const SizedBox(width: 4),
          _connectionStatusIcon(connection),
        ],
      ),
      child: FluxerTappable(
        onTap: () => handleExternalLinkTap(context, _connectionUrl(connection)),
        semanticLabel: connection.name,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) => Container(
          width: _kCompactTileSize,
          height: _kCompactTileSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: FluxerConnectionIcon(type: connection.type, size: 16),
        ),
      ),
    );
  }
}

class UserProfileConnectionItem extends StatelessWidget {
  const UserProfileConnectionItem({
    required this.connection,
    this.outlined = false,
    super.key,
  });

  final ConnectionResponse connection;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    final String url = _connectionUrl(connection);
    return FluxerTappable(
      onTap: () => handleExternalLinkTap(context, url),
      builder: (context, _) => Container(
        decoration: outlined
            ? BoxDecoration(
                color: colors.backgroundSecondary,
                border: Border.all(color: colors.backgroundModifierAccent),
                borderRadius: BorderRadius.circular(10),
              )
            : BoxDecoration(
                color: colors.backgroundTertiary,
                borderRadius: layout.radiusMd,
              ),
        padding: outlined
            ? const EdgeInsets.all(12)
            : EdgeInsets.symmetric(horizontal: layout.s2, vertical: layout.s2),
        child: Row(
          children: <Widget>[
            FluxerConnectionIconTile(
              type: connection.type,
              borderRadius: layout.radiusSm,
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
                    child: _connectionStatusIcon(connection),
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
