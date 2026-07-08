import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_permission_category.dart';
import 'package:fluxer_app/features/settings/providers/guild/permission_layout_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/color_picker/fluxer_color_picker_field.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/switch_group/fluxer_switch_group.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildRoleEditor extends ConsumerStatefulWidget {
  const GuildRoleEditor({
    required this.guildId,
    required this.role,
    required this.isLocked,
    required this.canManageRoles,
    required this.mentionEveryonePermissionLabel,
    required this.filteredPermissionSpecs,
    required this.onRoleUpdate,
    required this.onDeleteRole,
    required this.onClearPermissions,
    required this.onPermissionToggle,
    required this.onPermissionSearchQueryChange,
    required this.permissionDisabledReason,
    this.showMobileBack = false,
    this.onMobileBack,
    super.key,
  });

  final String guildId;
  final MemberRole role;
  final bool isLocked;
  final bool canManageRoles;
  final String mentionEveryonePermissionLabel;
  final List<GuildPermissionCategorySpec> filteredPermissionSpecs;
  final void Function({
    String? name,
    int? color,
    bool? hoist,
    bool? mentionable,
    int? permissions,
  })
  onRoleUpdate;
  final VoidCallback onDeleteRole;
  final VoidCallback onClearPermissions;
  final ValueChanged<Permission> onPermissionToggle;
  final ValueChanged<String> onPermissionSearchQueryChange;
  final String? Function(Permission permission) permissionDisabledReason;
  final bool showMobileBack;
  final VoidCallback? onMobileBack;

  @override
  ConsumerState<GuildRoleEditor> createState() => _GuildRoleEditorState();
}

class _GuildRoleEditorState extends ConsumerState<GuildRoleEditor> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.role.name);
  }

  @override
  void didUpdateWidget(covariant GuildRoleEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.role.id != widget.role.id ||
        oldWidget.role.name != widget.role.name) {
      _nameController.text = widget.role.name;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final PermissionLayoutState layout = ref.watch(permissionLayoutProvider);
    final bool isEveryone = widget.role.isEveryoneRole(widget.guildId);
    final bool editorDisabled = widget.isLocked || !widget.canManageRoles;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s4,
        context.layout.s4,
        96,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.showMobileBack && widget.onMobileBack != null) ...<Widget>[
            FluxerButton.secondary(
              onPressed: widget.onMobileBack,
              label: l10n.guildSettingsRolesBackToRoles,
              size: FluxerButtonSize.small,
              fitContent: true,
            ),
            const SizedBox(height: 16),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.guildSettingsRolesEditTitle(widget.role.name),
                      style: context.textStyles.heading,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.guildSettingsRolesEditSubtitle,
                      style: context.textStyles.bodySmall,
                    ),
                  ],
                ),
              ),
              if (!isEveryone)
                FluxerButton.secondary(
                  onPressed: editorDisabled ? null : widget.onDeleteRole,
                  label: l10n.guildSettingsRolesDeleteRole,
                  size: FluxerButtonSize.small,
                  fitContent: true,
                  icon: PhosphorIconsFill.trash,
                ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            l10n.guildSettingsRolesDisplaySection,
            style: context.textStyles.categoryName,
          ),
          const SizedBox(height: 12),
          if (!isEveryone) ...<Widget>[
            FluxerInput(
              controller: _nameController,
              label: l10n.guildSettingsRolesRoleName,
              maxLength: 100,
              enabled: !editorDisabled,
              onChanged: (String value) => widget.onRoleUpdate(name: value),
            ),
            const SizedBox(height: 12),
          ],
          FluxerColorPickerField(
            label: l10n.guildSettingsRolesRoleColor,
            description: l10n.guildSettingsRolesRoleColorHelper,
            value: widget.role.color == 0 ? 0x000000 : widget.role.color,
            disabled: editorDisabled,
            onChanged: (int value) {
              final int clean = value & 0xFFFFFF;
              widget.onRoleUpdate(color: clean == 0 ? 0 : clean);
            },
          ),
          if (!isEveryone) ...<Widget>[
            const SizedBox(height: 12),
            FluxerSettingsSwitchItem(
              label: l10n.guildSettingsRolesShowSeparately,
              description: l10n.guildSettingsRolesShowSeparatelyHelper,
              value: widget.role.hoist,
              enabled: !editorDisabled,
              onChanged: (bool value) => widget.onRoleUpdate(hoist: value),
            ),
            FluxerSettingsSwitchItem(
              label: l10n.guildSettingsRolesAllowMentions,
              description: l10n.guildSettingsRolesAllowMentionsHelper(
                widget.mentionEveryonePermissionLabel,
              ),
              value: widget.role.mentionable,
              enabled: !editorDisabled,
              onChanged: (bool value) =>
                  widget.onRoleUpdate(mentionable: value),
            ),
          ],
          const SizedBox(height: 24),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  l10n.guildSettingsRolesClearPermissionsHelp,
                  style: context.textStyles.bodySmall,
                ),
              ),
              FluxerButton.secondary(
                onPressed: editorDisabled ? null : widget.onClearPermissions,
                label: l10n.guildSettingsRolesClearPermissions,
                size: FluxerButtonSize.small,
                fitContent: true,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            l10n.guildSettingsRolesPermissionsSection,
            style: context.textStyles.categoryName,
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Expanded(
                child: FluxerInput(
                  hint: l10n.guildSettingsRolesSearchPermissions,
                  prefixIcon: const PhosphorIcon(
                    PhosphorIconsBold.magnifyingGlass,
                    size: 16,
                  ),
                  onChanged: widget.onPermissionSearchQueryChange,
                ),
              ),
              const SizedBox(width: 8),
              FluxerTooltip(
                message: layout.isComfy
                    ? l10n.guildSettingsRolesDenseLayout
                    : l10n.guildSettingsRolesComfyLayout,
                child: IconButton(
                  onPressed: () => ref
                      .read(permissionLayoutProvider.notifier)
                      .toggleLayoutMode(),
                  icon: PhosphorIcon(
                    layout.isComfy
                        ? PhosphorIconsBold.rows
                        : PhosphorIconsBold.listBullets,
                  ),
                ),
              ),
              FluxerTooltip(
                message: layout.isGrid
                    ? l10n.guildSettingsRolesSingleColumn
                    : l10n.guildSettingsRolesTwoColumns,
                child: IconButton(
                  onPressed: () => ref
                      .read(permissionLayoutProvider.notifier)
                      .toggleGridMode(),
                  icon: PhosphorIcon(
                    layout.isGrid
                        ? PhosphorIconsBold.list
                        : PhosphorIconsBold.gridFour,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (widget.filteredPermissionSpecs.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  l10n.guildSettingsRolesNoPermissionsFound,
                  style: context.textStyles.bodySmall,
                ),
              ),
            )
          else
            ...widget.filteredPermissionSpecs.asMap().entries.map((
              MapEntry<int, GuildPermissionCategorySpec> entry,
            ) {
              return GuildRolePermissionCategory(
                spec: entry.value,
                rolePermissions: widget.role.permissions,
                disabled: editorDisabled,
                onPermissionToggle: widget.onPermissionToggle,
                permissionDisabledReason: widget.permissionDisabledReason,
                isFirst: entry.key == 0,
              );
            }),
        ],
      ),
    );
  }
}
