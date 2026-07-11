import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_list_item.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kGuildRoleDragTouchSize = 44;

class GuildRoleReorderableList extends ConsumerWidget {
  const GuildRoleReorderableList({
    required this.guildId,
    required this.items,
    required this.canManageRoles,
    required this.isRoleLocked,
    required this.onSelectRole,
    required this.onReorder,
    this.selectedRoleId,
    this.useMobileTileStyle = false,
    this.showChevron = false,
    this.horizontalPadding = 8,
    super.key,
  });

  final String guildId;
  final List<MemberRole> items;
  final bool canManageRoles;
  final bool Function(MemberRole role) isRoleLocked;
  final ValueChanged<String> onSelectRole;
  final void Function(int oldIndex, int newIndex) onReorder;
  final String? selectedRoleId;
  final bool useMobileTileStyle;
  final bool showChevron;
  final double horizontalPadding;

  bool _canDragRole(MemberRole role) {
    if (!canManageRoles) {
      return false;
    }
    if (role.isEveryoneRole(guildId)) {
      return false;
    }
    return !isRoleLocked(role);
  }

  EdgeInsets _listPadding(BuildContext context) {
    return EdgeInsets.fromLTRB(
      horizontalPadding,
      0,
      horizontalPadding,
      useMobileTileStyle ? context.layout.s6 + 80 : 96,
    );
  }

  EdgeInsets _itemPadding(int index) {
    if (!useMobileTileStyle || index >= items.length - 1) {
      return EdgeInsets.zero;
    }
    return const EdgeInsets.only(bottom: 4);
  }

  Widget _buildDragHandle(BuildContext context, int index, bool enabled) {
    return SizedBox(
      width: kGuildRoleDragTouchSize,
      height: kGuildRoleDragTouchSize,
      child: ReorderableDragStartListener(
        enabled: enabled,
        index: index,
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsRegular.dotsSixVertical,
            size: 18,
            color: enabled
                ? context.colors.textPrimaryMuted
                : context.colors.textTertiaryMuted,
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required MemberRole role,
    required int index,
    required bool useDragHandle,
  }) {
    final bool canDrag = _canDragRole(role);
    return GuildRoleListItem(
      role: role,
      isSelected: role.id == selectedRoleId,
      isLocked: isRoleLocked(role),
      showChevron: showChevron,
      useMobileTileStyle: useMobileTileStyle,
      dragHandle: useDragHandle && canDrag
          ? _buildDragHandle(context, index, true)
          : null,
      onTap: () => onSelectRole(role.id),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool useDragHandle = isTouchPrimaryInput(ref);
    if (!canManageRoles) {
      return ListView.builder(
        padding: _listPadding(context),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: _itemPadding(index),
            child: _buildItem(
              context,
              role: items[index],
              index: index,
              useDragHandle: false,
            ),
          );
        },
      );
    }
    return ReorderableListView.builder(
      padding: _listPadding(context),
      itemCount: items.length,
      onReorderItem: onReorder,
      buildDefaultDragHandles: false,
      itemBuilder: (BuildContext context, int index) {
        final MemberRole role = items[index];
        final Widget item = Padding(
          padding: _itemPadding(index),
          child: _buildItem(
            context,
            role: role,
            index: index,
            useDragHandle: useDragHandle,
          ),
        );
        if (useDragHandle) {
          return KeyedSubtree(key: ValueKey<String>(role.id), child: item);
        }
        return ReorderableDragStartListener(
          key: ValueKey<String>(role.id),
          enabled: _canDragRole(role),
          index: index,
          child: item,
        );
      },
    );
  }
}
