import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/permissions/permission_state_buttons.dart';
import 'package:fluxer_app/features/settings/providers/guild/permission_layout_provider.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';

class PermissionOverwriteToggle extends ConsumerWidget {
  const PermissionOverwriteToggle({
    required this.title,
    required this.description,
    required this.permission,
    required this.allow,
    required this.deny,
    required this.disabled,
    required this.onChanged,
    this.disabledReason,
    super.key,
  });

  final String title;
  final String? description;
  final Permission permission;
  final BigInt allow;
  final BigInt deny;
  final bool disabled;
  final ValueChanged<ChannelPermissionState> onChanged;
  final String? disabledReason;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PermissionLayoutState layout = ref.watch(permissionLayoutProvider);
    final bool isDense = layout.isDense;
    final bool showDescription = layout.isComfy && description != null;
    final ChannelPermissionState state = resolvePermissionState(
      permissionBit: BigInt.from(permission.value),
      allow: allow,
      deny: deny,
    );
    final bool isDisabled = disabled || disabledReason != null;
    final Widget buttons = PermissionStateButtons(
      currentState: state,
      disabled: isDisabled,
      onStateChange: onChanged,
    );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isDense ? 4 : 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: isDisabled
                        ? context.colors.textTertiary
                        : context.colors.textPrimary,
                  ),
                ),
                if (showDescription) ...<Widget>[
                  const SizedBox(height: 4),
                  Text(
                    description!,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (disabledReason != null)
            FluxerTooltip(message: disabledReason, child: buttons)
          else
            buttons,
        ],
      ),
    );
  }
}

class PermissionOverwriteCategory extends ConsumerWidget {
  const PermissionOverwriteCategory({
    required this.spec,
    required this.allow,
    required this.deny,
    required this.disabled,
    required this.onPermissionChanged,
    required this.permissionDisabledReason,
    this.isFirst = false,
    super.key,
  });

  final GuildPermissionCategorySpec spec;
  final BigInt allow;
  final BigInt deny;
  final bool disabled;
  final void Function(Permission permission, ChannelPermissionState state)
  onPermissionChanged;
  final String? Function(Permission permission) permissionDisabledReason;
  final bool isFirst;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PermissionLayoutState layout = ref.watch(permissionLayoutProvider);
    final bool isGrid = layout.isGrid;
    final bool isDense = layout.isDense;
    final List<Widget> toggles = spec.permissions
        .map(
          (GuildPermissionEntry entry) => PermissionOverwriteToggle(
            title: entry.title,
            description: entry.description,
            permission: entry.flag,
            allow: allow,
            deny: deny,
            disabled: disabled,
            disabledReason: permissionDisabledReason(entry.flag),
            onChanged: (ChannelPermissionState state) {
              onPermissionChanged(entry.flag, state);
            },
          ),
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!isFirst)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: context.colors.borderColor, height: 1),
          ),
        Text(spec.title, style: context.textStyles.categoryName),
        SizedBox(height: isDense ? 4 : 8),
        if (isGrid)
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double itemWidth = (constraints.maxWidth - 12) / 2;
              return Wrap(
                spacing: 12,
                children: toggles
                    .map(
                      (Widget toggle) =>
                          SizedBox(width: itemWidth, child: toggle),
                    )
                    .toList(),
              );
            },
          )
        else
          Column(children: toggles),
      ],
    );
  }
}
