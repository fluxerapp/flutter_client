import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_spec.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/permissions/permission_overwrite_category.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/permissions/permission_state_buttons.dart';
import 'package:fluxer_app/features/settings/providers/guild/permission_layout_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelPermissionEditorPanel extends ConsumerStatefulWidget {
  const ChannelPermissionEditorPanel({
    required this.channel,
    required this.entry,
    required this.canEdit,
    required this.onEntryChanged,
    this.showMobileBack = false,
    this.onMobileBack,
    this.scrollController,
    super.key,
  });

  final Channel channel;
  final ChannelPermissionOverwriteEntry entry;
  final bool canEdit;
  final ValueChanged<ChannelPermissionOverwriteEntry> onEntryChanged;
  final bool showMobileBack;
  final VoidCallback? onMobileBack;
  final ScrollController? scrollController;

  @override
  ConsumerState<ChannelPermissionEditorPanel> createState() =>
      _ChannelPermissionEditorPanelState();
}

class _ChannelPermissionEditorPanelState
    extends ConsumerState<ChannelPermissionEditorPanel> {
  String _searchQuery = '';

  String _subtitle(FluxerLocalizations l10n) {
    if (widget.entry.isEveryone) {
      return l10n.channelSettingsPermissionsConfigureBaseAccess;
    }
    if (widget.entry.type == 0) {
      return l10n.channelSettingsPermissionsConfigureRoleOverrides;
    }
    return l10n.channelSettingsPermissionsConfigureMemberOverrides;
  }

  ChannelPermissionState? _allPermissionsState(
    List<GuildPermissionCategorySpec> specs,
  ) {
    if (specs.isEmpty) {
      return null;
    }
    final List<Permission> permissions = specs
        .expand((GuildPermissionCategorySpec spec) => spec.permissions)
        .map((GuildPermissionEntry entry) => entry.flag)
        .toList();
    if (permissions.isEmpty) {
      return null;
    }
    final ChannelPermissionState firstState = resolvePermissionState(
      permissionBit: BigInt.from(permissions.first.value),
      allow: widget.entry.allow,
      deny: widget.entry.deny,
    );
    final bool allSame = permissions.every(
      (Permission permission) =>
          resolvePermissionState(
            permissionBit: BigInt.from(permission.value),
            allow: widget.entry.allow,
            deny: widget.entry.deny,
          ) ==
          firstState,
    );
    return allSame ? firstState : null;
  }

  void _setAllPermissions(ChannelPermissionState state) {
    ChannelPermissionOverwriteEntry next = widget.entry;
    final List<GuildPermissionCategorySpec> specs =
        generateChannelPermissionSpec(
          FluxerLocalizations.of(context),
          widget.channel.type,
        );
    for (final GuildPermissionCategorySpec spec in specs) {
      for (final GuildPermissionEntry permission in spec.permissions) {
        next = setPermissionState(
          entry: next,
          permissionBit: BigInt.from(permission.flag.value),
          state: state,
        );
      }
    }
    widget.onEntryChanged(next);
  }

  void _onPermissionChanged(
    Permission permission,
    ChannelPermissionState state,
  ) {
    widget.onEntryChanged(
      setPermissionState(
        entry: widget.entry,
        permissionBit: BigInt.from(permission.value),
        state: state,
      ),
    );
  }

  Widget _buildHeader({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required PermissionLayoutState layout,
    required ChannelPermissionState? allPermissionsState,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.showMobileBack && widget.onMobileBack != null) ...<Widget>[
          FluxerButton.secondary(
            onPressed: widget.onMobileBack,
            label: l10n.channelSettingsPermissionsBackToOverrides,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
          SizedBox(height: context.layout.s4),
        ],
        Text(
          l10n.channelSettingsPermissionsEditAccessFor(widget.entry.label),
          style: context.textStyles.heading,
        ),
        SizedBox(height: context.layout.s1),
        Text(
          _subtitle(l10n),
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: context.layout.s6),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                l10n.permissionOverwriteSetAllHelp,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
            PermissionStateButtons(
              currentState:
                  allPermissionsState ?? ChannelPermissionState.inherit,
              disabled: !widget.canEdit,
              onStateChange: _setAllPermissions,
            ),
          ],
        ),
        SizedBox(height: context.layout.s4),
        Row(
          children: <Widget>[
            Expanded(
              child: FluxerInput(
                hint: l10n.channelSettingsPermissionsSearchPlaceholder,
                prefixIcon: const PhosphorIcon(
                  PhosphorIconsBold.magnifyingGlass,
                  size: 16,
                ),
                onChanged: (String value) =>
                    setState(() => _searchQuery = value),
              ),
            ),
            SizedBox(width: context.layout.s2),
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
        SizedBox(height: context.layout.s2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final PermissionLayoutState layout = ref.watch(permissionLayoutProvider);
    final List<GuildPermissionCategorySpec> specs = filterGuildPermissionSpec(
      specs: generateChannelPermissionSpec(l10n, widget.channel.type),
      query: _searchQuery,
    );
    final ChannelPermissionState? allPermissionsState = _allPermissionsState(
      specs,
    );
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      context.layout.s4,
      context.layout.s4,
      context.layout.s4,
      context.layout.s20,
    );
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: <Widget>[
        SliverPadding(
          padding: contentPadding.copyWith(bottom: 0),
          sliver: SliverToBoxAdapter(
            child: _buildHeader(
              context: context,
              l10n: l10n,
              layout: layout,
              allPermissionsState: allPermissionsState,
            ),
          ),
        ),
        if (specs.isEmpty)
          SliverPadding(
            padding: contentPadding.copyWith(top: context.layout.s4),
            sliver: SliverToBoxAdapter(
              child: Text(
                l10n.guildSettingsRolesNoPermissionsFound,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
          )
        else
          SliverPadding(
            padding: contentPadding.copyWith(top: 0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return PermissionOverwriteCategory(
                  spec: specs[index],
                  allow: widget.entry.allow,
                  deny: widget.entry.deny,
                  disabled: !widget.canEdit,
                  isFirst: index == 0,
                  onPermissionChanged: _onPermissionChanged,
                  permissionDisabledReason: (_) => null,
                );
              }, childCount: specs.length),
            ),
          ),
      ],
    );
  }
}
