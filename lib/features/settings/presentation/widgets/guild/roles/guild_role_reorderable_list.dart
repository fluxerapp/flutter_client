import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_list_item.dart';

class GuildRoleReorderableList extends StatelessWidget {
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

  Widget _buildItem(MemberRole role) {
    return GuildRoleListItem(
      role: role,
      isSelected: role.id == selectedRoleId,
      isLocked: isRoleLocked(role),
      showChevron: showChevron,
      useMobileTileStyle: useMobileTileStyle,
      onTap: () => onSelectRole(role.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!canManageRoles) {
      return ListView.builder(
        padding: _listPadding(context),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: _itemPadding(index),
            child: _buildItem(items[index]),
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
        return ReorderableDragStartListener(
          key: ValueKey<String>(role.id),
          enabled: _canDragRole(role),
          index: index,
          child: Padding(padding: _itemPadding(index), child: _buildItem(role)),
        );
      },
    );
  }
}
