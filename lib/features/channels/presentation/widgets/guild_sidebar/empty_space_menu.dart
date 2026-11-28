import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/utils/invites/invite_people_actions.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

Future<void> showChannelListContextMenu(
  BuildContext context,
  WidgetRef ref, {
  required Guild guild,
  required Offset position,
}) async {
  await ref
      .read(guildPermissionsProvider(readAccountUserId(ref)).notifier)
      .refreshPermissions(guild.id);
  final int permissions =
      ref.read(guildPermissionsProvider(readAccountUserId(ref)))[guild.id] ?? 0;
  final bool canManageChannels = hasPermission(
    permissions,
    Permission.manageChannels,
  );
  final bool canInvite =
      await resolveGuildInvitableChannel(ref: ref, guildId: guild.id) != null;
  final bool hideMutedChannels =
      ref.read(guildMuteProvider(guild.id)).value?.hideMutedChannels ?? false;
  if (!context.mounted) {
    return;
  }

  void run(GuildAction action, VoidCallback close) {
    close();
    if (context.mounted) {
      unawaited(runGuildMenuAction(context, ref, guild: guild, action: action));
    }
  }

  await FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(menuContext);
      return fluxerMenuGroups(<List<Widget>>[
        <Widget>[
          FluxerMenuCheckboxItem(
            label: l10n.guildMenuHideMutedChannels,
            isChecked: hideMutedChannels,
            onPressed: () => run(GuildAction.hideMutedChannels, close),
          ),
        ],
        if (canManageChannels)
          <Widget>[
            FluxerMenuItem(
              label: l10n.guildNavbarCreateChannel,
              icon: PhosphorIconsFill.plusCircle,
              onPressed: () => run(GuildAction.createChannel, close),
            ),
            FluxerMenuItem(
              label: l10n.guildNavbarCreateCategory,
              icon: PhosphorIconsFill.folderPlus,
              onPressed: () => run(GuildAction.createCategory, close),
            ),
          ],
        if (canInvite)
          <Widget>[
            FluxerMenuItem(
              label: l10n.channelDetailsInvitePeople,
              icon: PhosphorIconsFill.userPlus,
              onPressed: () => run(GuildAction.inviteMembers, close),
            ),
          ],
      ]);
    },
  );
}
