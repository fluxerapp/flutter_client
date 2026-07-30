import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_reorderable_list.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildRoleSidebar extends StatelessWidget {
  const GuildRoleSidebar({
    required this.guildId,
    required this.roles,
    required this.hoistedRoles,
    required this.selectedRoleId,
    required this.canManageRoles,
    required this.hoistOrderMode,
    required this.hasCustomHoistOrder,
    required this.isRoleLocked,
    required this.onSelectRole,
    required this.onCreateRole,
    required this.isCreatingRole,
    required this.onEnterHoistOrderMode,
    required this.onExitHoistOrderMode,
    required this.onResetHoistOrder,
    required this.onReorder,
    super.key,
  });

  final String guildId;
  final List<MemberRole> roles;
  final List<MemberRole> hoistedRoles;
  final String? selectedRoleId;
  final bool canManageRoles;
  final bool hoistOrderMode;
  final bool hasCustomHoistOrder;
  final bool Function(MemberRole role) isRoleLocked;
  final ValueChanged<String> onSelectRole;
  final VoidCallback onCreateRole;
  final bool isCreatingRole;
  final VoidCallback onEnterHoistOrderMode;
  final VoidCallback onExitHoistOrderMode;
  final VoidCallback onResetHoistOrder;
  final void Function(int oldIndex, int newIndex) onReorder;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (hoistOrderMode) {
      return _buildHoistOrderMode(context, l10n);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
          child: Text(
            l10n.guildSettingsRolesListTitle,
            style: context.textStyles.categoryName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: GuildRolesSidebarActionButton(
            label: l10n.guildSettingsCreateRole,
            icon: PhosphorIconsBold.plus,
            enabled: canManageRoles,
            isLoading: isCreatingRole,
            onPressed: onCreateRole,
          ),
        ),
        Expanded(
          child: GuildRoleReorderableList(
            guildId: guildId,
            items: roles,
            canManageRoles: canManageRoles,
            isRoleLocked: isRoleLocked,
            onSelectRole: onSelectRole,
            onReorder: onReorder,
            selectedRoleId: selectedRoleId,
          ),
        ),
      ],
    );
  }

  Widget _buildHoistOrderMode(BuildContext context, FluxerLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
          child: Text(
            l10n.guildSettingsRolesHoistOrder,
            style: context.textStyles.categoryName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: <Widget>[
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: onExitHoistOrderMode,
                  label: l10n.guildSettingsRolesBackToRoles,
                  size: FluxerButtonSize.small,
                  fitContent: true,
                ),
              ),
              if (hasCustomHoistOrder) ...<Widget>[
                const SizedBox(width: 8),
                FluxerButton.secondary(
                  onPressed: canManageRoles ? onResetHoistOrder : null,
                  label: l10n.guildSettingsRolesResetHoistOrder,
                  size: FluxerButtonSize.small,
                  fitContent: true,
                ),
              ],
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          child: Text(
            l10n.guildSettingsRolesHoistOrderHelp,
            style: context.textStyles.timestamp,
          ),
        ),
        if (hoistedRoles.isEmpty)
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l10n.guildSettingsRolesNoHoistedRoles,
                  textAlign: TextAlign.center,
                  style: context.textStyles.bodySmall,
                ),
              ),
            ),
          )
        else
          Expanded(
            child: GuildRoleReorderableList(
              guildId: guildId,
              items: hoistedRoles,
              canManageRoles: canManageRoles,
              isRoleLocked: isRoleLocked,
              onSelectRole: onSelectRole,
              onReorder: onReorder,
              selectedRoleId: selectedRoleId,
            ),
          ),
      ],
    );
  }
}

class GuildRolesSidebarActionButton extends StatelessWidget {
  const GuildRolesSidebarActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final motion = context.motion;
    final bool isInteractive = enabled && !isLoading;

    return FluxerTappable(
      enabled: isInteractive,
      onTap: onPressed,
      semanticLabel: label,
      excludeChildSemantics: isLoading,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool isHovered = states.contains(WidgetState.hovered);
        return AnimatedContainer(
          duration: motion.fast,
          curve: motion.curve,
          width: double.infinity,
          height: 34,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isHovered
                ? colors.buttonSecondaryActiveFill
                : colors.buttonSecondaryFill,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colors.backgroundModifierAccent),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (isLoading)
                ExcludeSemantics(
                  child: FluxerLoadingSpinner(
                    color: colors.buttonSecondaryText,
                  ),
                )
              else
                PhosphorIcon(icon, size: 18, color: colors.buttonSecondaryText),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: colors.buttonSecondaryText,
                    height: 1.125,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
