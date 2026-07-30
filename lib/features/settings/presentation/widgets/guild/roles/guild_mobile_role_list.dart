import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_reorderable_list.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildMobileRoleList extends StatelessWidget {
  const GuildMobileRoleList({
    required this.guildId,
    required this.roles,
    required this.hoistedRoles,
    required this.canManageRoles,
    required this.hoistOrderMode,
    required this.hasCustomHoistOrder,
    required this.isRoleLocked,
    required this.onCreateRole,
    required this.isCreatingRole,
    required this.onSelectRole,
    required this.onEnterHoistOrderMode,
    required this.onExitHoistOrderMode,
    required this.onResetHoistOrder,
    required this.onReorder,
    super.key,
  });

  final String guildId;
  final List<MemberRole> roles;
  final List<MemberRole> hoistedRoles;
  final bool canManageRoles;
  final bool hoistOrderMode;
  final bool hasCustomHoistOrder;
  final bool Function(MemberRole role) isRoleLocked;
  final VoidCallback onCreateRole;
  final bool isCreatingRole;
  final ValueChanged<String> onSelectRole;
  final VoidCallback onEnterHoistOrderMode;
  final VoidCallback onExitHoistOrderMode;
  final VoidCallback onResetHoistOrder;
  final void Function(int oldIndex, int newIndex) onReorder;

  @override
  Widget build(BuildContext context) {
    if (hoistOrderMode) {
      return _buildHoistOrderMode(context);
    }
    return _buildRoleListMode(context);
  }

  Widget _buildRoleListMode(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      context.layout.s4,
      context.layout.s4,
      context.layout.s4,
      0,
    );
    return Padding(
      padding: contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  l10n.guildSettingsRolesListTitle,
                  style: context.textStyles.heading,
                ),
              ),
              FluxerButton.secondary(
                onPressed: canManageRoles ? onCreateRole : null,
                label: l10n.guildSettingsCreateRole,
                size: FluxerButtonSize.small,
                icon: PhosphorIconsBold.plus,
                fitContent: true,
                isLoading: isCreatingRole,
              ),
            ],
          ),
          SizedBox(height: context.layout.s3),
          Expanded(
            child: GuildRoleReorderableList(
              guildId: guildId,
              items: roles,
              canManageRoles: canManageRoles,
              isRoleLocked: isRoleLocked,
              onSelectRole: onSelectRole,
              onReorder: onReorder,
              showChevron: true,
              useMobileTileStyle: true,
              horizontalPadding: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoistOrderMode(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      context.layout.s4,
      context.layout.s4,
      context.layout.s4,
      0,
    );
    return Padding(
      padding: contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.guildSettingsRolesHoistOrder,
            style: context.textStyles.heading,
          ),
          SizedBox(height: context.layout.s3),
          Row(
            children: <Widget>[
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: onExitHoistOrderMode,
                  label: l10n.guildSettingsRolesBackToRoles,
                  size: FluxerButtonSize.small,
                ),
              ),
              if (hasCustomHoistOrder) ...<Widget>[
                SizedBox(width: context.layout.s2),
                FluxerButton.secondary(
                  onPressed: canManageRoles ? onResetHoistOrder : null,
                  label: l10n.guildSettingsRolesResetHoistOrder,
                  size: FluxerButtonSize.small,
                  fitContent: true,
                ),
              ],
            ],
          ),
          SizedBox(height: context.layout.s2),
          Text(
            l10n.guildSettingsRolesHoistOrderHelp,
            style: context.textStyles.timestamp,
          ),
          SizedBox(height: context.layout.s3),
          Expanded(
            child: hoistedRoles.isEmpty
                ? Center(
                    child: Text(
                      l10n.guildSettingsRolesNoHoistedRoles,
                      textAlign: TextAlign.center,
                      style: context.textStyles.bodySmall,
                    ),
                  )
                : GuildRoleReorderableList(
                    guildId: guildId,
                    items: hoistedRoles,
                    canManageRoles: canManageRoles,
                    isRoleLocked: isRoleLocked,
                    onSelectRole: onSelectRole,
                    onReorder: onReorder,
                    useMobileTileStyle: true,
                    horizontalPadding: 0,
                  ),
          ),
        ],
      ),
    );
  }
}
