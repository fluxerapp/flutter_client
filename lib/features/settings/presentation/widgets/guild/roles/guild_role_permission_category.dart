import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/settings/providers/guild/permission_layout_provider.dart';
import 'package:fluxer_app/features/ui/switch_group/fluxer_switch_group.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildRolePermissionCategory extends ConsumerWidget {
  const GuildRolePermissionCategory({
    required this.spec,
    required this.rolePermissions,
    required this.disabled,
    required this.onPermissionToggle,
    required this.permissionDisabledReason,
    this.isFirst = false,
    super.key,
  });

  final GuildPermissionCategorySpec spec;
  final int rolePermissions;
  final bool disabled;
  final ValueChanged<Permission> onPermissionToggle;
  final String? Function(Permission permission) permissionDisabledReason;
  final bool isFirst;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PermissionLayoutState layout = ref.watch(permissionLayoutProvider);
    final bool isGrid = layout.isGrid;
    final bool isComfy = layout.isComfy;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!isFirst)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: context.colors.borderColor, height: 1),
          ),
        Text(spec.title, style: context.textStyles.categoryName),
        const SizedBox(height: 8),
        if (isGrid)
          _buildGrid(context, isComfy)
        else
          _buildList(context, isComfy),
      ],
    );
  }

  Widget _buildList(BuildContext context, bool isComfy) {
    return Column(
      children: spec.permissions
          .map(
            (GuildPermissionEntry entry) =>
                _buildToggle(context, entry, isComfy),
          )
          .toList(),
    );
  }

  Widget _buildGrid(BuildContext context, bool isComfy) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double itemWidth = (constraints.maxWidth - 12) / 2;
        return Wrap(
          spacing: 12,
          children: spec.permissions
              .map(
                (GuildPermissionEntry entry) => SizedBox(
                  width: itemWidth,
                  child: _buildToggle(context, entry, isComfy),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildToggle(
    BuildContext context,
    GuildPermissionEntry entry,
    bool isComfy,
  ) {
    final bool enabled = hasPermission(rolePermissions, entry.flag);
    final String? disabledReason = permissionDisabledReason(entry.flag);
    final bool isDisabled = disabled || disabledReason != null;
    final Widget switchItem = FluxerSettingsSwitchItem(
      label: entry.title,
      description: isComfy ? entry.description : null,
      value: enabled,
      enabled: !isDisabled,
      onChanged: (_) => onPermissionToggle(entry.flag),
    );
    if (disabledReason != null) {
      return FluxerTooltip(message: disabledReason, child: switchItem);
    }
    return switchItem;
  }
}
