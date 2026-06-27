import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const _kSubmenuGap = 4.0;

Future<GuildAction?> showGuildContextMenu(
  BuildContext context, {
  required Offset position,
  required Guild guild,
  bool hasUnread = false,
  bool isMuted = false,
  bool isOwner = false,
  int permissions = 0,
  DateTime? muteEndTime,
  bool hideMutedChannels = false,
  bool developerMode = false,
}) async {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox?;
  if (overlay == null) {
    return null;
  }

  final local = overlay.globalToLocal(position);
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final groups = buildGuildMenuGroups(
    l10n: l10n,
    hasUnread: hasUnread,
    isMuted: isMuted,
    isOwner: isOwner,
    permissions: permissions,
    muteEndTime: muteEndTime,
    hideMutedChannels: hideMutedChannels,
    developerMode: developerMode,
  );

  final result = await Navigator.of(context).push<GuildAction>(
    _GuildContextMenuRoute(
      position: local,
      overlaySize: overlay.size,
      groups: groups,
    ),
  );

  if (result == GuildAction.copyGuildId) {
    await Clipboard.setData(ClipboardData(text: guild.id));
  }

  return result;
}

class _GuildContextMenuRoute extends PopupRoute<GuildAction> {
  final Offset position;
  final Size overlaySize;
  final List<GuildMenuGroup> groups;

  _GuildContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.groups,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 120);

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
  ) => _ContextMenuPage(
    position: position,
    overlaySize: overlaySize,
    animation: animation,
    groups: groups,
  );
}

class _ContextMenuPage extends StatefulWidget {
  final Offset position;
  final Size overlaySize;
  final Animation<double> animation;
  final List<GuildMenuGroup> groups;

  const _ContextMenuPage({
    required this.position,
    required this.overlaySize,
    required this.animation,
    required this.groups,
  });

  @override
  State<_ContextMenuPage> createState() => _ContextMenuPageState();
}

class _ContextMenuPageState extends State<_ContextMenuPage> {
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

  @override
  Widget build(BuildContext context) {
    final items = _buildItems(context);
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
        : widget.position.dy;
    mainLeft = mainLeft.clamp(
      8.0,
      widget.overlaySize.width - kContextMenuWidth - 8,
    );
    mainTop = mainTop.clamp(8.0, widget.overlaySize.height - mainHeight - 8);

    final alignment = Alignment(opensLeft ? 1.0 : -1.0, opensUp ? 1.0 : -1.0);

    Widget? submenuPanel;
    if (_activeSubmenuKey != null) {
      final subKey = _submenuKeys[_activeSubmenuKey];
      if (subKey?.currentContext != null) {
        final subItems = _buildSubmenuItems(context, _activeSubmenuKey!);
        if (subItems.isNotEmpty) {
          final box = subKey!.currentContext!.findRenderObject()! as RenderBox;
          final itemPos = box.localToGlobal(Offset.zero);
          final subHeight = estimateContextMenuHeight(subItems);

          final rightX = mainLeft + kContextMenuWidth + _kSubmenuGap;
          final leftX = mainLeft - kContextMenuWidth - _kSubmenuGap;
          final fitsRight =
              rightX + kContextMenuWidth < widget.overlaySize.width - 8;

          final subLeft = fitsRight ? rightX : leftX;
          final subTop = itemPos.dy.clamp(
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
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: widget.animation,
              curve: Curves.easeOut,
            ),
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1).animate(
                CurvedAnimation(
                  parent: widget.animation,
                  curve: Curves.easeOutCubic,
                ),
              ),
              alignment: alignment,
              child: ContextMenuPanel(items: items),
            ),
          ),
        ),
        ?submenuPanel,
      ],
    );
  }

  List<Widget> _buildSubmenuItems(BuildContext context, String key) {
    void pop(GuildAction action) => Navigator.of(context).pop(action);

    for (final group in widget.groups) {
      for (final entry in group) {
        if (entry is GuildMenuSubmenu && entry.key == key) {
          return _mapEntriesToContextItems(entry.children, pop);
        }
      }
    }
    return [];
  }

  List<Widget> _mapEntriesToContextItems(
    List<GuildMenuEntry> entries,
    void Function(GuildAction) pop,
  ) {
    return [
      for (final entry in entries)
        if (entry is GuildMenuAction)
          ContextMenuItem(
            label: entry.label,
            icon: entry.icon,
            isDanger: entry.isDanger,
            onTap: () => pop(entry.action),
          ),
    ];
  }

  List<Widget> _buildItems(BuildContext context) {
    void pop(GuildAction action) => Navigator.of(context).pop(action);
    final items = <Widget>[];

    for (var i = 0; i < widget.groups.length; i++) {
      final group = widget.groups[i];
      if (group.isEmpty) {
        continue;
      }

      if (items.isNotEmpty) {
        items.add(const ContextMenuDivider());
      }

      for (final entry in group) {
        switch (entry) {
          case GuildMenuAction():
            items.add(
              ContextMenuItem(
                label: entry.label,
                hint: entry.hint,
                icon: entry.icon,
                isDanger: entry.isDanger,
                onTap: () => pop(entry.action),
              ),
            );
          case GuildMenuSubmenu():
            items.add(
              _SubMenuItem(
                key: _keyFor(entry.key),
                label: entry.label,
                hint: entry.hint,
                isActive: _activeSubmenuKey == entry.key,
                onActivate: () => _activateSubmenu(entry.key),
                onDeactivate: () => _requestDeactivate(entry.key),
              ),
            );
          case GuildMenuCheckbox():
            items.add(
              _CheckboxMenuItem(
                label: entry.label,
                isChecked: entry.isChecked,
                onTap: () => pop(entry.action),
              ),
            );
        }
      }
    }

    return items;
  }
}

class _SubMenuItem extends StatefulWidget {
  final String label;
  final String? hint;
  final bool isActive;
  final VoidCallback onActivate;
  final VoidCallback onDeactivate;

  const _SubMenuItem({
    required this.label,
    required this.isActive,
    required this.onActivate,
    required this.onDeactivate,
    this.hint,
    super.key,
  });

  @override
  State<_SubMenuItem> createState() => _SubMenuItemState();
}

class _SubMenuItemState extends State<_SubMenuItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final isHighlighted = _isHovered || widget.isActive;

    final textColor = isHighlighted ? colors.textPrimary : colors.textSecondary;
    final bgColor = isHighlighted
        ? colors.backgroundModifierHover
        : Colors.transparent;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.onActivate();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.onDeactivate();
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onActivate,
        child: Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: layout.radiusSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.label,
                      style: context.textStyles.label.copyWith(
                        color: textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.hint != null)
                      Text(
                        widget.hint!,
                        style: context.textStyles.timestamp.copyWith(
                          color: colors.textTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              SizedBox(width: layout.s3),
              PhosphorIcon(
                PhosphorIconsBold.caretRight,
                size: 14,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckboxMenuItem extends StatefulWidget {
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  const _CheckboxMenuItem({
    required this.label,
    required this.isChecked,
    required this.onTap,
  });

  @override
  State<_CheckboxMenuItem> createState() => _CheckboxMenuItemState();
}

class _CheckboxMenuItemState extends State<_CheckboxMenuItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textColor = _isHovered ? colors.textPrimary : colors.textSecondary;
    final bgColor = _isHovered
        ? colors.backgroundModifierHover
        : Colors.transparent;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: layout.radiusSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: context.textStyles.label.copyWith(color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: layout.s3),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.isChecked
                        ? colors.brandPrimary
                        : colors.interactiveMuted,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: widget.isChecked
                      ? colors.brandPrimary
                      : Colors.transparent,
                ),
                child: widget.isChecked
                    ? Center(
                        child: PhosphorIcon(
                          PhosphorIconsBold.check,
                          size: 12,
                          color: colors.textOnBrandPrimary,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
