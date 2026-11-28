import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_context_menu_item.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/ui/action_menu/sidebar_peek_menu_panel.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

Future<FolderMenuAction?> showFolderSubmenuBottomSheet(
  BuildContext context,
  FolderMenuSubmenu submenu,
) {
  if (submenu.isDisabled) {
    return Future<FolderMenuAction?>.value();
  }

  return FluxerBottomSheet.showScrollable<FolderMenuAction>(
    context,
    title: submenu.label,
    onBack: () => Navigator.of(context).pop(),
    initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
    desktop: const FluxerDesktopPresentation(
      surface: FluxerDesktopSurface.menu,
    ),
    builder: (sheetContext, scrollController, close) {
      final layout = sheetContext.layout;
      void pop(FolderMenuAction action) =>
          Navigator.of(sheetContext).pop(action);

      return ListView(
        controller: scrollController,
        padding: FluxerBottomSheet.scrollViewPadding(
          sheetContext,
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
        ),
        children: [
          FluxerBottomSheetGroupColumn(
            children: [
              for (final group in submenu.groups)
                if (group.isNotEmpty)
                  FluxerMenuGroup(
                    children: [
                      for (final entry in group)
                        if (entry is FolderMenuActionEntry)
                          FluxerBottomSheetMenuItem(
                            label: entry.label,
                            icon: entry.icon,
                            enabled: !entry.isDisabled,
                            onTap: () => pop(entry.action),
                          ),
                    ],
                  ),
            ],
          ),
        ],
      );
    },
  );
}

Future<FolderMenuAction?> showFolderContextMenu(
  BuildContext context, {
  required Offset position,
  required List<Guild> guilds,
  required bool hasUnread,
}) {
  final List<FolderMenuGroup> groups = buildFolderMenuGroups(
    l10n: FluxerLocalizations.of(context),
    hasUnread: hasUnread,
    hasGuilds: guilds.isNotEmpty,
  );
  return pushFluxerDesktopMenu<FolderMenuAction>(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback _) =>
        FluxerDesktopMenuPanel.fitContent(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildFolderContextMenuItems(
                groups: groups,
                onAction: (FolderMenuAction action) =>
                    Navigator.of(menuContext).pop(action),
              ),
            ),
          ),
        ),
  );
}

List<Widget> buildFolderSidebarPeekSections({
  required BuildContext context,
  required List<FolderMenuGroup> groups,
  required void Function(FolderMenuActionEntry entry) onActionEntry,
  required void Function(FolderMenuSubmenu entry) onSubmenuEntry,
  Map<FolderPeekTarget, GlobalKey>? peekItemKeys,
}) {
  final colors = context.colors;
  final List<Widget> rows = <Widget>[];

  Widget keyedRow(FolderPeekTarget target, Widget child) {
    if (peekItemKeys == null) {
      return child;
    }
    return KeyedSubtree(
      key: peekItemKeys.putIfAbsent(target, GlobalKey.new),
      child: child,
    );
  }

  for (final FolderMenuGroup group in groups) {
    if (group.isEmpty) {
      continue;
    }
    for (final FolderMenuEntry entry in group) {
      switch (entry) {
        case FolderMenuActionEntry():
          final FolderPeekActionTarget target = FolderPeekActionTarget(
            entry.action,
          );
          rows.add(
            keyedRow(
              target,
              FluxerBottomSheetMenuItem(
                label: entry.label,
                icon: entry.icon,
                enabled: !entry.isDisabled,
                dense: true,
                onTap: entry.isDisabled ? () {} : () => onActionEntry(entry),
              ),
            ),
          );
        case FolderMenuSubmenu():
          final FolderPeekSubmenuTarget target = FolderPeekSubmenuTarget(
            entry.key,
          );
          rows.add(
            keyedRow(
              target,
              FluxerBottomSheetMenuItem(
                label: entry.label,
                icon: entry.icon,
                enabled: !entry.isDisabled,
                dense: true,
                trailing: PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: kSidebarPeekMenuItemTrailingIconSize,
                  color: colors.textSecondary,
                ),
                onTap: entry.isDisabled ? () {} : () => onSubmenuEntry(entry),
              ),
            ),
          );
      }
    }
  }

  if (rows.isEmpty) {
    return const <Widget>[];
  }
  return <Widget>[FluxerMenuGroup(roundedRows: true, children: rows)];
}

@immutable
sealed class FolderPeekTarget {
  const FolderPeekTarget();
}

class FolderPeekActionTarget extends FolderPeekTarget {
  const FolderPeekActionTarget(this.action);

  final FolderMenuAction action;

  @override
  bool operator ==(Object other) {
    return other is FolderPeekActionTarget && other.action == action;
  }

  @override
  int get hashCode => action.hashCode;
}

class FolderPeekSubmenuTarget extends FolderPeekTarget {
  const FolderPeekSubmenuTarget(this.submenuKey);

  final String submenuKey;

  @override
  bool operator ==(Object other) {
    return other is FolderPeekSubmenuTarget && other.submenuKey == submenuKey;
  }

  @override
  int get hashCode => submenuKey.hashCode;
}

class GuildFolderPeekMenuConfig implements SidebarPeekContent {
  GuildFolderPeekMenuConfig({
    required this.folderName,
    required this.guilds,
    required this.hasUnread,
    required this.onAction,
  });

  final String folderName;
  final List<Guild> guilds;
  final bool hasUnread;
  final Future<void> Function(FolderMenuAction action) onAction;
  final Map<FolderPeekTarget, GlobalKey> itemKeys =
      <FolderPeekTarget, GlobalKey>{};

  List<FolderMenuGroup> groupsFor(BuildContext context) {
    return buildFolderMenuGroups(
      l10n: FluxerLocalizations.of(context),
      hasUnread: hasUnread,
      hasGuilds: guilds.isNotEmpty,
    );
  }

  @override
  double estimateMenuHeight(BuildContext context) {
    var rowCount = 0;
    for (final FolderMenuGroup group in groupsFor(context)) {
      rowCount += group.length;
    }
    return estimateSidebarPeekMenuHeight(context, rowCount: rowCount);
  }

  @override
  Widget buildPanel({
    required BuildContext context,
    required ValueChanged<Object> onSelect,
  }) {
    return GuildFolderPeekMenuPanel(
      folderName: folderName,
      groups: groupsFor(context),
      itemKeys: itemKeys,
      onSelect: onSelect,
    );
  }

  @override
  Object? hitTestAction(Offset globalPosition) {
    return hitTestKeyedPeekTarget<FolderPeekTarget>(
      globalPosition: globalPosition,
      itemKeys: itemKeys,
      visibleKeys: itemKeys.keys,
    );
  }

  @override
  Future<PeekSelection> handleSelection(
    BuildContext context,
    Object action,
  ) async {
    final FolderPeekTarget target = action as FolderPeekTarget;
    switch (target) {
      case FolderPeekActionTarget():
        await onAction(target.action);
        return PeekSelection.dismiss;
      case FolderPeekSubmenuTarget():
        FolderMenuSubmenu? submenu;
        for (final FolderMenuGroup group in groupsFor(context)) {
          for (final FolderMenuEntry entry in group) {
            if (entry is FolderMenuSubmenu && entry.key == target.submenuKey) {
              submenu = entry;
            }
          }
        }
        if (submenu == null || submenu.isDisabled) {
          return PeekSelection.dismiss;
        }
        final FolderMenuAction? result = await showFolderSubmenuBottomSheet(
          context,
          submenu,
        );
        if (result != null) {
          await onAction(result);
          return PeekSelection.dismiss;
        }
        return PeekSelection.keepOpen;
    }
  }
}

class GuildFolderPeekMenuPanel extends StatelessWidget {
  const GuildFolderPeekMenuPanel({
    required this.folderName,
    required this.groups,
    required this.itemKeys,
    required this.onSelect,
    super.key,
  });

  final String folderName;
  final List<FolderMenuGroup> groups;
  final Map<FolderPeekTarget, GlobalKey> itemKeys;
  final ValueChanged<Object> onSelect;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SidebarPeekMenuPanel(
        title: folderName,
        sections: buildFolderSidebarPeekSections(
          context: context,
          groups: groups,
          peekItemKeys: itemKeys,
          onActionEntry: (FolderMenuActionEntry entry) {
            onSelect(FolderPeekActionTarget(entry.action));
          },
          onSubmenuEntry: (FolderMenuSubmenu entry) {
            onSelect(FolderPeekSubmenuTarget(entry.key));
          },
        ),
      ),
    );
  }
}
