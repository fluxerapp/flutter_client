import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_context_menu_item.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:go_router/go_router.dart';

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
  final String locale = Localizations.localeOf(context).toString();
  final bool use12Hour = ProviderScope.containerOf(
    context,
  ).read(use12HourTimeFormatProvider);
  final bool isTouchPrimary = ProviderScope.containerOf(
    context,
  ).read(inputModalityProvider);
  final groups = buildGuildMenuGroups(
    l10n: l10n,
    hasUnread: hasUnread,
    isMuted: isMuted,
    isOwner: isOwner,
    permissions: permissions,
    locale: locale,
    use12Hour: use12Hour,
    muteEndTime: muteEndTime,
    hideMutedChannels: hideMutedChannels,
    developerMode: developerMode,
    isTouchPrimary: isTouchPrimary,
    guild: guild,
  );

  final result = await Navigator.of(context).push<GuildAction>(
    _GuildContextMenuRoute(
      position: local,
      overlaySize: overlay.size,
      groups: groups,
      guildId: guild.id,
    ),
  );

  if (result == GuildAction.copyGuildId && context.mounted) {
    await copyToClipboard(context: context, value: guild.id);
  }

  return result;
}

class _GuildContextMenuRoute extends PopupRoute<GuildAction> {
  final Offset position;
  final Size overlaySize;
  final List<GuildMenuGroup> groups;
  final String guildId;

  _GuildContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.groups,
    required this.guildId,
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
    guildId: guildId,
  );
}

class _ContextMenuPage extends StatefulWidget {
  final Offset position;
  final Size overlaySize;
  final Animation<double> animation;
  final List<GuildMenuGroup> groups;
  final String guildId;

  const _ContextMenuPage({
    required this.position,
    required this.overlaySize,
    required this.animation,
    required this.groups,
    required this.guildId,
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
          if (entry.key == 'communitySettings') {
            return _mapSettingsEntriesToContextItems(
              entry.children,
              widget.guildId,
              context,
            );
          }
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
          GuildContextMenuItem(entry: entry, onTap: () => pop(entry.action)),
    ];
  }

  List<Widget> _mapSettingsEntriesToContextItems(
    List<GuildMenuEntry> entries,
    String guildId,
    BuildContext context,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return [
      for (final entry in entries)
        if (entry is GuildMenuAction)
          GuildContextMenuItem(
            entry: entry,
            isDisabled: isGuildSettingsActionComingSoon(entry.action),
            onDisabledTap: () {
              Navigator.of(context).pop();
              ProviderScope.containerOf(context)
                  .read(toastProvider.notifier)
                  .show(FluxerToast(message: l10n.comingSoon));
            },
            onTap: () {
              Navigator.of(context).pop();
              _navigateToSettingsPage(context, entry.action, guildId);
            },
          ),
    ];
  }

  void _navigateToSettingsPage(
    BuildContext context,
    GuildAction action,
    String guildId,
  ) {
    if (isWideLayout(context)) {
      final GuildSettingsTab? tab = guildSettingsTabForAction(action);
      if (tab == null) {
        return;
      }
      if (isGuildSettingsTabComingSoon(tab)) {
        return;
      }
      unawaited(
        context.push(
          RoutePaths.guildSettingsPath(
            guildId,
            tab: guildSettingsTabQuery(tab),
          ),
        ),
      );
      return;
    }

    final String? path = switch (action) {
      GuildAction.settingsOverview => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.overview,
      ),
      GuildAction.settingsRoles => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.roles,
      ),
      GuildAction.settingsEmoji => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.emoji,
      ),
      GuildAction.settingsStickers => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.stickers,
      ),
      GuildAction.settingsSafetyModeration => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.moderation,
      ),
      GuildAction.settingsActivityLog => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.auditLog,
      ),
      GuildAction.settingsWebhooks => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.webhooks,
      ),
      GuildAction.settingsDiscovery => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.discovery,
      ),
      GuildAction.settingsMembers => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.members,
      ),
      GuildAction.settingsInviteLinks => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.invites,
      ),
      GuildAction.settingsBans => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.bans,
      ),
      GuildAction.settingsChannels => guildSettingsTabPath(
        guildId,
        GuildSettingsTab.channels,
      ),
      _ => null,
    };
    if (path != null) {
      unawaited(context.push(path));
    }
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
              GuildContextMenuItem(
                entry: entry,
                onTap: () => pop(entry.action),
              ),
            );
          case GuildMenuSubmenu():
            items.add(
              GuildContextSubmenuItem(
                key: _keyFor(entry.key),
                entry: entry,
                isActive: _activeSubmenuKey == entry.key,
                onActivate: () => _activateSubmenu(entry.key),
                onDeactivate: () => _requestDeactivate(entry.key),
              ),
            );
          case GuildMenuCheckbox():
            items.add(
              GuildContextMenuCheckboxItem(
                entry: entry,
                onTap: () => pop(entry.action),
              ),
            );
        }
      }
    }

    return items;
  }
}
