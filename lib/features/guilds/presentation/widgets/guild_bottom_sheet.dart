import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_avatar.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_stats.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/menu_environment.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:go_router/go_router.dart';

void dismissGuildBottomSheet(BuildContext context) {
  closeFluxerSheetOpenedFrom(context, useRootNavigator: true);
}

Future<GuildAction?> showGuildBottomSheet(
  BuildContext context, {
  required Guild guild,
  bool hasUnread = false,
  bool isMuted = false,
  bool isOwner = false,
  int permissions = 0,
  bool? canInvite,
  DateTime? muteEndTime,
  bool hideMutedChannels = false,
  bool developerMode = false,
  BuildContext? anchorContext,
  bool compactHeaderList = false,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String locale = Localizations.localeOf(context).toString();
  final GuildMenuEnvironment environment = readGuildMenuEnvironment(
    ProviderScope.containerOf(context),
    guild.id,
  );
  final groups = compactHeaderList && usesDesktopPointerUi(context)
      ? buildGuildHeaderMenuGroups(
          l10n: l10n,
          isOwner: isOwner,
          permissions: permissions,
          canInvite: canInvite,
          hideMutedChannels: hideMutedChannels,
          isTouchPrimary: environment.isTouchPrimary,
          canEditCommunityProfile: environment.canEditCommunityProfile,
          isStockCommunity: environment.isStockCommunity,
          guild: guild,
          directMessagesDisabled: environment.directMessagesDisabled,
        )
      : buildGuildMenuGroups(
          l10n: l10n,
          hasUnread: hasUnread,
          isMuted: isMuted,
          isOwner: isOwner,
          permissions: permissions,
          canInvite: canInvite,
          locale: locale,
          use12Hour: environment.use12Hour,
          muteEndTime: muteEndTime,
          hideMutedChannels: hideMutedChannels,
          developerMode: developerMode,
          isTouchPrimary: environment.isTouchPrimary,
          canEditCommunityProfile: environment.canEditCommunityProfile,
          isStockCommunity: environment.isStockCommunity,
          guild: guild,
          directMessagesDisabled: environment.directMessagesDisabled,
        );

  final result = await FluxerBottomSheet.showScrollable<GuildAction>(
    context,
    desktop: _guildMenuDesktopPresentation(anchorContext),
    title: guild.name,
    leading: GuildBottomSheetAvatar(guild: guild),
    subtitle: GuildBottomSheetStats(guildId: guild.id, fallbackGuild: guild),
    initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
    useRootNavigator: true,
    builder: (sheetContext, scrollController, close) {
      final layout = sheetContext.layout;
      void pop(GuildAction action) => Navigator.of(sheetContext).pop(action);

      final menuGroups = <Widget>[
        for (final group in groups)
          if (group.isNotEmpty)
            FluxerMenuGroup(
              children: [
                for (final entry in group)
                  FluxerRovingFocusItem(
                    child: _buildMenuEntry(sheetContext, entry, pop, guild.id),
                  ),
              ],
            ),
      ];

      return FluxerRovingFocusList(
        child: ListView(
          controller: scrollController,
          padding: FluxerBottomSheet.scrollViewPadding(
            sheetContext,
            padding: EdgeInsets.symmetric(horizontal: layout.s4),
          ),
          children: [FluxerBottomSheetGroupColumn(children: menuGroups)],
        ),
      );
    },
  );

  if (result == GuildAction.copyGuildId && context.mounted) {
    await copyToClipboard(context: context, value: guild.id);
  }

  return result;
}

FluxerDesktopPresentation _guildMenuDesktopPresentation(
  BuildContext? anchorContext,
) {
  final RenderObject? anchor = anchorContext != null && anchorContext.mounted
      ? anchorContext.findRenderObject()
      : null;
  if (anchor is! RenderBox || !anchor.hasSize) {
    return const FluxerDesktopPresentation(
      surface: FluxerDesktopSurface.menu,
      width: 260,
    );
  }
  return FluxerDesktopPresentation(
    surface: FluxerDesktopSurface.menu,
    width: anchor.size.width.clamp(
      kFluxerDesktopMenuMinWidth,
      kFluxerDesktopMenuMaxWidth,
    ),
    placement: FluxerDesktopPlacement.belowCenter,
    anchorContext: anchorContext,
    reveal: true,
  );
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
      Navigator.of(context, rootNavigator: true).pop();
      unawaited(context.push(RoutePaths.guildSettingsPath(guildId)));
    default:
      _openSubmenu(context, submenu);
  }
}

void _openSubmenu(BuildContext context, GuildMenuSubmenu submenu) {
  final NavigatorState nav = Navigator.of(context, rootNavigator: true);
  unawaited(
    FluxerBottomSheet.showScrollable<GuildAction>(
      context,
      title: submenu.label,
      onBack: nav.pop,
      initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
      useRootNavigator: true,
      builder: (sheetContext, scrollController, close) {
        final layout = sheetContext.layout;
        void pop(GuildAction action) => Navigator.of(sheetContext).pop(action);

        return ListView(
          controller: scrollController,
          padding: FluxerBottomSheet.scrollViewPadding(
            sheetContext,
            padding: EdgeInsets.symmetric(horizontal: layout.s4),
          ),
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
