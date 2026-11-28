import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_context_menu_item.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/settings/providers/preferences/time_format_providers.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

Future<GuildAction?> showGuildContextMenu(
  BuildContext context, {
  required Offset position,
  required Guild guild,
  bool hasUnread = false,
  bool isMuted = false,
  bool isOwner = false,
  int permissions = 0,
  bool? canInvite,
  DateTime? muteEndTime,
  bool hideMutedChannels = false,
  bool developerMode = false,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String locale = Localizations.localeOf(context).toString();
  final ProviderContainer container = ProviderScope.containerOf(context);
  final List<GuildMenuGroup> groups = buildGuildMenuGroups(
    l10n: l10n,
    hasUnread: hasUnread,
    isMuted: isMuted,
    isOwner: isOwner,
    permissions: permissions,
    canInvite: canInvite,
    locale: locale,
    use12Hour: container.read(use12HourTimeFormatProvider),
    muteEndTime: muteEndTime,
    hideMutedChannels: hideMutedChannels,
    developerMode: developerMode,
    isTouchPrimary: container.read(inputModalityProvider),
    canEditCommunityProfile: !container
        .read(userSettingsViewModelProvider)
        .isKnownUnclaimed,
    isStockCommunity: container
        .read(instanceRuntimeConfigProvider)
        .isStockCommunityGuild(guild.id),
    guild: guild,
  );

  return pushFluxerDesktopMenu<GuildAction>(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback _) =>
        FluxerDesktopMenuPanel.fitContent(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildGuildContextMenuItems(
                groups: groups,
                onAction: (GuildAction action) =>
                    Navigator.of(menuContext).pop(action),
              ),
            ),
          ),
        ),
  );
}
