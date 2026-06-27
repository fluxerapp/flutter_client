import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/'
    'widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';

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
    leading: _GuildAvatar(guild: guild),
    subtitle: _GuildStats(guildId: guild.id, fallbackGuild: guild),
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
                  _buildMenuEntry(sheetContext, entry, pop),
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
      onTap: () => _openSubmenuSheet(context, entry),
    ),
    GuildMenuCheckbox() => FluxerBottomSheetCheckboxItem(
      label: entry.label,
      isChecked: entry.isChecked,
      onTap: () => pop(entry.action),
    ),
  };
}

void _openSubmenuSheet(BuildContext context, GuildMenuSubmenu submenu) {
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

// ---------------------------------------------------------------------------
// Guild-specific widgets
// ---------------------------------------------------------------------------

class _GuildAvatar extends StatelessWidget {
  final Guild guild;

  const _GuildAvatar({required this.guild});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final iconUrl = guild.iconUrl;

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colors.backgroundSecondaryAlt,
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: iconUrl != null
          ? CachedNetworkImage(
              imageUrl: iconUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _buildFallback(context),
            )
          : _buildFallback(context),
    );
  }

  Widget _buildFallback(BuildContext context) {
    return Center(
      child: Text(
        abbreviateGuildName(guild.name),
        style: context.textStyles.label.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}

class _GuildStats extends ConsumerWidget {
  final String guildId;
  final Guild fallbackGuild;

  const _GuildStats({required this.guildId, required this.fallbackGuild});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Guild guild =
        ref.watch(
          guildListViewModelProvider.select(
            (GuildListViewState state) =>
                state.guilds.where((Guild g) => g.id == guildId).firstOrNull,
          ),
        ) ??
        fallbackGuild;
    final colors = context.colors;
    final textStyle = context.textStyles.timestamp;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StatDot(color: colors.statusOnline),
        const SizedBox(width: 5),
        Text(
          '${guild.onlineCount} Online',
          style: textStyle.copyWith(color: colors.textTertiary),
        ),
        const SizedBox(width: 10),
        _StatDot(color: colors.textTertiarySecondary),
        const SizedBox(width: 5),
        Text(
          '${guild.memberCount} Members',
          style: textStyle.copyWith(color: colors.textTertiary),
        ),
      ],
    );
  }
}

class _StatDot extends StatelessWidget {
  final Color color;

  const _StatDot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
