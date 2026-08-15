import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_connection_item.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

class UserProfileConnectionsSection extends StatelessWidget {
  const UserProfileConnectionsSection({
    required this.connections,
    this.embedded = false,
    super.key,
  });

  final List<ConnectionResponse> connections;
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    if (connections.isEmpty) {
      return const SizedBox.shrink();
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
}
