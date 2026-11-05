import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_connection_item.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

enum UserProfileConnectionsVariant { compact, cards, list }

const double _kCardGap = 8;
const double _kCompactTileGap = 6;

class UserProfileConnectionsSection extends StatelessWidget {
  const UserProfileConnectionsSection({
    required this.connections,
    this.embedded = false,
    this.variant = UserProfileConnectionsVariant.list,
    super.key,
  });

  final List<ConnectionResponse> connections;
  final bool embedded;
  final UserProfileConnectionsVariant variant;

  @override
  Widget build(BuildContext context) {
    if (connections.isEmpty) {
      return const SizedBox.shrink();
    }
    if (variant == UserProfileConnectionsVariant.compact) {
      return _buildCompact(context);
    }
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    final Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.connectionsTitle,
          style: textStyles.label.copyWith(
            color: colors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: layout.s2),
        if (variant == UserProfileConnectionsVariant.cards)
          _buildCardGrid()
        else
          for (int i = 0; i < connections.length; i++) ...<Widget>[
            UserProfileConnectionItem(connection: connections[i]),
            if (i != connections.length - 1) SizedBox(height: layout.s2),
          ],
      ],
    );
    if (embedded) {
      return content;
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: layout.radiusMd,
      ),
      child: Padding(padding: EdgeInsets.all(layout.s4), child: content),
    );
  }

  Widget _buildCompact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 1,
          margin: const EdgeInsets.symmetric(vertical: 4),
          color: context.colors.backgroundModifierHover,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: _kCompactTileGap,
          runSpacing: _kCompactTileGap,
          children: <Widget>[
            for (final ConnectionResponse connection in connections)
              UserProfileConnectionCompactTile(connection: connection),
          ],
        ),
      ],
    );
  }

  Widget _buildCardGrid() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double cardWidth = (constraints.maxWidth - _kCardGap) / 2;
        return Wrap(
          spacing: _kCardGap,
          runSpacing: _kCardGap,
          children: <Widget>[
            for (final ConnectionResponse connection in connections)
              SizedBox(
                width: cardWidth,
                child: UserProfileConnectionItem(
                  connection: connection,
                  outlined: true,
                ),
              ),
          ],
        );
      },
    );
  }
}
