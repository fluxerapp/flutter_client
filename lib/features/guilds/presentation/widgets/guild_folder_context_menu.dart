import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_context_menu_item.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const _kSubmenuGap = 4.0;
const _kFolderSubmenuSheetInitialChildSize = 0.7;
const _kFolderSubmenuSheetMaxChildSize = 0.92;

Future<FolderMenuAction?> showFolderContextMenu(
  BuildContext context, {
  required Offset position,
  required String folderName,
  required List<Guild> guilds,
  required bool hasUnread,
  bool verticallyCenterAtPosition = false,
}) async {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
  if (overlay == null) {
    return null;
  }

  final local = overlay.globalToLocal(position);
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final groups = buildFolderMenuGroups(
    l10n: l10n,
    hasUnread: hasUnread,
    hasGuilds: guilds.isNotEmpty,
  );

  return Navigator.of(context).push<FolderMenuAction>(
    _FolderContextMenuRoute(
      position: local,
      overlaySize: overlay.size,
      folderName: folderName,
      groups: groups,
      verticallyCenterAtPosition: verticallyCenterAtPosition,
    ),
  );
}

class _FolderContextMenuRoute extends PopupRoute<FolderMenuAction> {
  _FolderContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.folderName,
    required this.groups,
    required this.verticallyCenterAtPosition,
  });

  final Offset position;
  final Size overlaySize;
  final String folderName;
  final List<FolderMenuGroup> groups;
  final bool verticallyCenterAtPosition;

  @override
  Duration get transitionDuration => kContextMenuEntranceDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) => _FolderContextMenuPage(
    position: position,
    overlaySize: overlaySize,
    folderName: folderName,
    animation: animation,
    groups: groups,
    verticallyCenterAtPosition: verticallyCenterAtPosition,
  );
}

class _FolderContextMenuPage extends StatefulWidget {
  const _FolderContextMenuPage({
    required this.position,
    required this.overlaySize,
    required this.folderName,
    required this.animation,
    required this.groups,
    required this.verticallyCenterAtPosition,
  });

  final Offset position;
  final Size overlaySize;
  final String folderName;
  final Animation<double> animation;
  final List<FolderMenuGroup> groups;
  final bool verticallyCenterAtPosition;

  @override
  State<_FolderContextMenuPage> createState() => _FolderContextMenuPageState();
}

class _FolderContextMenuPageState extends State<_FolderContextMenuPage> {
  String? _activeSubmenuKey;
  final Map<String, GlobalKey> _submenuKeys = {};
  Timer? _hideTimer;
  bool _isSubmenuHovered = false;

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _activateSubmenu(String key) {
    _hideTimer?.cancel();
    if (_activeSubmenuKey != key) {
      setState(() => _activeSubmenuKey = key);
    }
  }

  void _requestDeactivate(String key) {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(milliseconds: 100), () {
      if (_activeSubmenuKey == key && !_isSubmenuHovered) {
        setState(() => _activeSubmenuKey = null);
      }
    });
  }

  void _onSubmenuPanelEnter() {
    _hideTimer?.cancel();
    _isSubmenuHovered = true;
  }

  void _onSubmenuPanelExit() {
    _isSubmenuHovered = false;
    if (_activeSubmenuKey != null) {
      _requestDeactivate(_activeSubmenuKey!);
    }
  }

  GlobalKey _keyFor(String submenuKey) {
    return _submenuKeys.putIfAbsent(submenuKey, GlobalKey.new);
  }

  void _openFolderSubmenuBottomSheet(
    BuildContext context,
    FolderMenuSubmenu submenu,
  ) {
    if (submenu.isDisabled) {
      return;
    }

    final nav = Navigator.of(context);
    unawaited(
      FluxerBottomSheet.showScrollable<FolderMenuAction>(
        context,
        title: submenu.label,
        onBack: () => Navigator.of(context).pop(),
        initialChildSize: _kFolderSubmenuSheetInitialChildSize,
        maxChildSize: _kFolderSubmenuSheetMaxChildSize,
        builder: (sheetContext, scrollController, close) {
          final layout = sheetContext.layout;
          void pop(FolderMenuAction action) =>
              Navigator.of(sheetContext).pop(action);

          return ListView(
            controller: scrollController,
            padding: FluxerBottomSheet.scrollViewPadding(
              sheetContext,
              padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
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
      ).then((FolderMenuAction? result) {
        if (result != null) {
          nav.pop(result);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool useBottomSheetSubmenus = isMobileLayout(context);
    final items = _buildItems(
      context,
      useBottomSheetSubmenus: useBottomSheetSubmenus,
    );
    final mainHeight = estimateContextMenuHeight(items);

    final opensLeft =
        widget.position.dx + kContextMenuWidth > widget.overlaySize.width - 8;
    final opensUp =
        widget.position.dy + mainHeight > widget.overlaySize.height - 8;

    var mainLeft = opensLeft
        ? widget.position.dx - kContextMenuWidth
        : widget.position.dx;
    var mainTop = opensUp
        ? widget.position.dy - mainHeight
        : widget.verticallyCenterAtPosition
        ? widget.position.dy - mainHeight / 2
        : widget.position.dy;
    mainLeft = mainLeft.clamp(
      8.0,
      widget.overlaySize.width - kContextMenuWidth - 8,
    );
    mainTop = mainTop.clamp(8.0, widget.overlaySize.height - mainHeight - 8);

    final alignment = Alignment(opensLeft ? 1.0 : -1.0, opensUp ? 1.0 : -1.0);

    Widget? submenuPanel;
    if (!useBottomSheetSubmenus && _activeSubmenuKey != null) {
      final subKey = _submenuKeys[_activeSubmenuKey];
      if (subKey?.currentContext != null) {
        final subItems = _buildSubmenuItems(_activeSubmenuKey!);
        if (subItems.isNotEmpty) {
          final box = subKey!.currentContext!.findRenderObject()! as RenderBox;
          final RenderBox overlayBox =
              Overlay.of(context).context.findRenderObject()! as RenderBox;
          final Offset itemTopLeft = overlayBox.globalToLocal(
            box.localToGlobal(Offset.zero),
          );
          final subHeight = estimateContextMenuHeight(subItems);

          final rightX = mainLeft + kContextMenuWidth + _kSubmenuGap;
          final leftX = mainLeft - kContextMenuWidth - _kSubmenuGap;
          final fitsRight =
              rightX + kContextMenuWidth < widget.overlaySize.width - 8;

          final subLeft = fitsRight ? rightX : leftX;
          final subTop = itemTopLeft.dy.clamp(
            8.0,
            widget.overlaySize.height - subHeight - 8,
          );

          submenuPanel = Positioned(
            left: subLeft,
            top: subTop,
            child: MouseRegion(
              onEnter: (_) => _onSubmenuPanelEnter(),
              onExit: (_) => _onSubmenuPanelExit(),
              child: ContextMenuPanel(items: subItems),
            ),
          );
        }
      }
    }

    return Stack(
      children: [
        Positioned(
          left: mainLeft,
          top: mainTop,
          child: ContextMenuEntranceAnimation(
            animation: widget.animation,
            alignment: alignment,
            child: ContextMenuPanel(items: items),
          ),
        ),
        ?submenuPanel,
      ],
    );
  }

  List<Widget> _buildSubmenuItems(String key) {
    void pop(FolderMenuAction action) => Navigator.of(context).pop(action);
    final items = <Widget>[];

    for (final group in widget.groups) {
      for (final entry in group) {
        if (entry is FolderMenuSubmenu && entry.key == key) {
          for (final submenuGroup in entry.groups) {
            if (submenuGroup.isEmpty) {
              continue;
            }
            if (items.isNotEmpty) {
              items.add(const ContextMenuDivider());
            }
            for (final child in submenuGroup) {
              if (child is FolderMenuActionEntry) {
                items.add(
                  GuildFolderContextMenuItem(
                    entry: child,
                    onTap: child.isDisabled ? () {} : () => pop(child.action),
                  ),
                );
              }
            }
          }
          return items;
        }
      }
    }
    return [];
  }

  List<Widget> _buildItems(
    BuildContext context, {
    required bool useBottomSheetSubmenus,
  }) {
    void pop(FolderMenuAction action) => Navigator.of(context).pop(action);
    final items = <Widget>[
      ContextMenuTitle(title: widget.folderName),
      const ContextMenuDivider(),
    ];

    for (final group in widget.groups) {
      if (group.isEmpty) {
        continue;
      }
      if (items.length > 2) {
        items.add(const ContextMenuDivider());
      }
      for (final entry in group) {
        switch (entry) {
          case FolderMenuActionEntry():
            items.add(
              GuildFolderContextMenuItem(
                entry: entry,
                onTap: entry.isDisabled ? () {} : () => pop(entry.action),
              ),
            );
          case FolderMenuSubmenu():
            items.add(
              GuildFolderContextSubmenuItem(
                key: _keyFor(entry.key),
                entry: entry,
                isActive: _activeSubmenuKey == entry.key,
                enableHoverSubmenu: !useBottomSheetSubmenus,
                onActivate: useBottomSheetSubmenus
                    ? () => _openFolderSubmenuBottomSheet(context, entry)
                    : () => _activateSubmenu(entry.key),
                onDeactivate: () => _requestDeactivate(entry.key),
              ),
            );
        }
      }
    }

    return items;
  }
}
