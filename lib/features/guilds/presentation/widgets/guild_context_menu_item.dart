import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

List<Widget> buildGuildContextMenuItems({
  required List<GuildMenuGroup> groups,
  required ValueChanged<GuildAction> onAction,
}) {
  final List<Widget> items = <Widget>[];
  for (final GuildMenuGroup group in groups) {
    if (group.isEmpty) {
      continue;
    }
    if (items.isNotEmpty) {
      items.add(const FluxerMenuDivider());
    }
    for (final GuildMenuEntry entry in group) {
      items.add(guildContextMenuItem(entry, onAction: onAction));
    }
  }
  return items;
}

Widget guildContextMenuItem(
  GuildMenuEntry entry, {
  required ValueChanged<GuildAction> onAction,
}) {
  return switch (entry) {
    GuildMenuAction() => FluxerMenuItem(
      label: entry.label,
      hint: entry.hint,
      icon: _phosphor(entry.icon),
      isDanger: entry.isDanger,
      onPressed: () => onAction(entry.action),
    ),
    GuildMenuSubmenu() => FluxerMenuSubmenuItem(
      label: entry.label,
      hint: entry.hint,
      onTriggerSelect: switch (entry.triggerAction) {
        final GuildAction action => (_) => onAction(action),
        null => null,
      },
      submenuBuilder: (BuildContext _) => <Widget>[
        for (final GuildMenuEntry child in entry.children)
          guildContextMenuItem(child, onAction: onAction),
      ],
    ),
    GuildMenuCheckbox() => FluxerMenuCheckboxItem(
      label: entry.label,
      isChecked: entry.isChecked,
      onPressed: () => onAction(entry.action),
    ),
  };
}

PhosphorIconData? _phosphor(IconData? icon) =>
    icon is PhosphorIconData ? icon : null;
