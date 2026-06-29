import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_avatar.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_stats.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<GuildAction?> showGuildBottomSheet(
  BuildContext context, {
  required Guild guild,
  bool hasUnread = false,
  bool isMuted = false,
  bool isOwner = false,
  int permissions = 0,
  DateTime? muteEndTime,
  bool hideMutedChannels = false,
  bool developerMode = false,
}) async {
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

  final result = await FluxerBottomSheet.showScrollable<GuildAction>(
    context,
    title: guild.name,
    leading: GuildBottomSheetAvatar(guild: guild),
    subtitle: GuildBottomSheetStats(guildId: guild.id, fallbackGuild: guild),
    initialChildSize: 0.7,
    maxChildSize: 0.85,
    builder: (sheetContext, scrollController, close) {
      final layout = sheetContext.layout;
      void pop(GuildAction action) => Navigator.of(sheetContext).pop(action);

      final menuGroups = <Widget>[
        for (final group in groups)
          if (group.isNotEmpty)
            FluxerMenuGroup(
              children: [
                for (final entry in group)
                  _buildMenuEntry(sheetContext, entry, pop, guild.id),
              ],
            ),
      ];

      return ListView(
        controller: scrollController,
        padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
        children: [FluxerBottomSheetGroupColumn(children: menuGroups)],
      );
    },
  );

  if (result == GuildAction.copyGuildId) {
    await Clipboard.setData(ClipboardData(text: guild.id));
  }

  return result;
}

Widget _buildMenuEntry(
  BuildContext context,
  GuildMenuEntry entry,
  void Function(GuildAction) pop,
  String guildId,
) {
  return switch (entry) {
    GuildMenuAction() => FluxerBottomSheetMenuItem(
      label: entry.label,
      hint: entry.hint,
      icon: entry.icon,
      isDanger: entry.isDanger,
      onTap: () => pop(entry.action),
    ),
    GuildMenuSubmenu() => FluxerBottomSheetSubmenuItem(
      label: entry.label,
      hint: entry.hint,
      icon: entry.icon,
      onTap: () => _handleSubmenuTap(context, entry, guildId),
    ),
    GuildMenuCheckbox() => FluxerBottomSheetCheckboxItem(
      label: entry.label,
      isChecked: entry.isChecked,
      onTap: () => pop(entry.action),
    ),
  };
}

void _handleSubmenuTap(
  BuildContext context,
  GuildMenuSubmenu submenu,
  String guildId,
) {
  switch (submenu.key) {
    case 'communitySettings':
      Navigator.of(context).pop();
      context.push(RoutePaths.guildSettingsPath(guildId));
    case 'mute':
      _openMuteSubmenu(context, submenu);
    default:
      _openGenericSubmenu(context, submenu);
  }
}

void _openMuteSubmenu(BuildContext context, GuildMenuSubmenu submenu) {
  final nav = Navigator.of(context);
  unawaited(
    FluxerBottomSheet.showScrollable<GuildAction>(
      context,
      title: submenu.label,
      onBack: () => Navigator.of(context).pop(),
      initialChildSize: 0.5,
      maxChildSize: 0.85,
      builder: (sheetContext, scrollController, close) {
        final layout = sheetContext.layout;
        void pop(GuildAction action) => Navigator.of(sheetContext).pop(action);

        return ListView(
          controller: scrollController,
          padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
          children: [
            FluxerBottomSheetGroupColumn(
              children: [
                FluxerMenuGroup(
                  children: [
                    for (final entry in submenu.children)
                      if (entry is GuildMenuAction)
                        FluxerBottomSheetMenuItem(
                          label: entry.label,
                          onTap: () => pop(entry.action),
                        ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ).then((result) {
      if (result != null) {
        nav.pop(result);
      }
    }),
  );
}

void _openGenericSubmenu(BuildContext context, GuildMenuSubmenu submenu) {
  final nav = Navigator.of(context);
  unawaited(
    FluxerBottomSheet.showScrollable<GuildAction>(
      context,
      title: submenu.label,
      onBack: () => Navigator.of(context).pop(),
      initialChildSize: 0.5,
      maxChildSize: 0.85,
      builder: (sheetContext, scrollController, close) {
        final layout = sheetContext.layout;
        void pop(GuildAction action) => Navigator.of(sheetContext).pop(action);

        return ListView(
          controller: scrollController,
          padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
          children: [
            FluxerBottomSheetGroupColumn(
              children: [
                FluxerMenuGroup(
                  children: [
                    for (final entry in submenu.children)
                      if (entry is GuildMenuAction)
                        FluxerBottomSheetMenuItem(
                          label: entry.label,
                          icon: entry.icon,
                          onTap: () => pop(entry.action),
                        ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ).then((result) {
      if (result != null) {
        nav.pop(result);
      }
    }),
  );
}
