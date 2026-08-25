import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/members/presentation/widgets/manage_member_roles_picker.dart';
import 'package:fluxer_app/features/members/utils/guild_member_menu_state.dart';
import 'package:fluxer_app/features/profile/presentation/menus/guild_member_moderation_menu_items.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildMemberContextMenu {
  GuildMemberContextMenu._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required Offset position,
    required String guildId,
    required GuildMemberResponse member,
  }) async {
    final GuildMemberMenuState? menuState = await resolveGuildMemberMenuState(
      ref: ref,
      guildId: guildId,
      member: member,
    );
    if (!context.mounted || menuState == null) {
      return;
    }

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserPartialResponse user = member.user;
    final ProfileMenuCapabilities capabilities = menuState.capabilities;

    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) {
        final List<Widget> items = <Widget>[
          FluxerMenuItem(
            label: l10n.userProfileCopyUserId,
            icon: PhosphorIconsFill.identificationCard,
            onPressed: () async {
              close();
              await copyToClipboard(context: menuContext, value: user.id);
            },
          ),
        ];

        if (menuState.shouldShowRolesSubmenu) {
          items.add(
            FluxerMenuSubmenuItem(
              label: l10n.userProfileRoles,
              onPressed: () {
                close();
                unawaited(
                  ManageMemberRolesPicker.show(
                    menuContext,
                    ref,
                    position: position,
                    guildId: guildId,
                    userId: user.id,
                    allGuildRoles: menuState.allGuildRoles,
                    memberRoleIds: menuState.memberRoleIds,
                    canManageRoles: menuState.canManageRoles,
                    isGuildOwner: menuState.isGuildOwner,
                    viewerHighestRole: menuState.viewerHighestRole,
                  ),
                );
              },
            ),
          );
        }

        appendGuildMemberModerationMenuItems(
          items: items,
          context: menuContext,
          ref: ref,
          close: close,
          l10n: l10n,
          guildId: guildId,
          userId: user.id,
          username: user.username,
          capabilities: capabilities,
          currentNick: menuState.currentNick,
          includeNickname: true,
        );

        return items;
      },
    );
  }
}
