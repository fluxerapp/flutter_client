import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

List<Widget> buildFolderContextMenuItems({
  required List<FolderMenuGroup> groups,
  required ValueChanged<FolderMenuAction> onAction,
}) {
  final List<Widget> items = <Widget>[];
  for (final FolderMenuGroup group in groups) {
    if (group.isEmpty) {
      continue;
    }
    if (items.isNotEmpty) {
      items.add(const FluxerMenuDivider());
    }
    for (final FolderMenuEntry entry in group) {
      items.add(folderContextMenuItem(entry, onAction: onAction));
    }
  }
  return items;
}

Widget folderContextMenuItem(
  FolderMenuEntry entry, {
  required ValueChanged<FolderMenuAction> onAction,
}) {
  return switch (entry) {
    FolderMenuActionEntry() => FluxerMenuItem(
      label: entry.label,
      icon: _phosphor(entry.icon),
      enabled: !entry.isDisabled,
      onPressed: () => onAction(entry.action),
    ),
    FolderMenuSubmenu() => FluxerMenuSubmenuItem(
      label: entry.label,
      enabled: !entry.isDisabled,
      submenuBuilder: (BuildContext _) =>
          buildFolderContextMenuItems(groups: entry.groups, onAction: onAction),
    ),
  };
}

PhosphorIconData? _phosphor(IconData? icon) =>
    icon is PhosphorIconData ? icon : null;
