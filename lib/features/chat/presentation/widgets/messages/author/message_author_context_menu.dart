import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart' show RoutePaths;
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:fluxer_app/features/members/presentation/menus/guild_member_context_menu.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart';

class MessageAuthorMenuTarget {
  const MessageAuthorMenuTarget({
    required this.userId,
    required this.channelId,
    this.guildId,
    this.webhookId,
  });

  final String userId;
  final String channelId;
  final String? guildId;
  final String? webhookId;

  bool get isWebhook => webhookId != null && webhookId!.isNotEmpty;
}

bool insertMessageAuthorMention(WidgetRef ref, MessageAuthorMenuTarget target) {
  if (target.isWebhook || target.userId.isEmpty) {
    return false;
  }
  return ref
      .read(composerFocusCoordinatorProvider)
      .insertUserMention(target.userId);
}

Future<void> showMessageAuthorContextMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
  required MessageAuthorMenuTarget target,
}) async {
  if (target.isWebhook) {
    await _showWebhookMenu(context, position: position, target: target);
    return;
  }
  final String? guildId = target.guildId;
  if (guildId != null && guildId.isNotEmpty) {
    final GuildMemberResponse? member = await _resolveGuildMember(
      ref,
      guildId: guildId,
      userId: target.userId,
    );
    if (!context.mounted) {
      return;
    }
    if (member != null) {
      await GuildMemberContextMenu.show(
        context,
        ref,
        position: position,
        guildId: guildId,
        member: member,
      );
      return;
    }
  }
  await _showUserMenu(context, ref, position: position, target: target);
}

Future<GuildMemberResponse?> _resolveGuildMember(
  WidgetRef ref, {
  required String guildId,
  required String userId,
}) async {
  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final db.User? user = await database.userDao.getUserById(userId);
  if (user == null) {
    return null;
  }
  final db.Member? member = await database.memberDao.getMemberByUserId(
    userId,
    guildId,
  );
  if (member == null) {
    return null;
  }
  return userProfileFromCachedUser(user, member: member).guildMember;
}

Future<void> _showWebhookMenu(
  BuildContext context, {
  required Offset position,
  required MessageAuthorMenuTarget target,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
      FluxerMenuItem(
        label: l10n.messageAuthorMenuCopyWebhookId,
        icon: PhosphorIconsFill.identificationCard,
        onPressed: () {
          close();
          unawaited(
            copyToClipboard(context: menuContext, value: target.webhookId!),
          );
        },
      ),
    ],
  );
}

Future<void> _showUserMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
  required MessageAuthorMenuTarget target,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String? currentUserId = ref.read(currentUserIdProvider);
  final bool isSelf = currentUserId == target.userId;
  final bool canMention = ref
      .read(composerFocusCoordinatorProvider)
      .canInsertUserMention;
  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
      FluxerMenuItem(
        label: l10n.voiceParticipantMenuViewProfile,
        icon: PhosphorIconsFill.user,
        onPressed: () {
          close();
          unawaited(
            FluxerUserProfileSheet.show(
              context,
              userId: target.userId,
              guildId: target.guildId,
            ),
          );
        },
      ),
      if (canMention)
        FluxerMenuItem(
          label: l10n.messageAuthorMenuMention,
          icon: PhosphorIconsBold.at,
          onPressed: () {
            close();
            insertMessageAuthorMention(ref, target);
          },
        ),
      if (!isSelf)
        FluxerMenuItem(
          label: l10n.userProfileMessage,
          icon: PhosphorIconsFill.chatTeardrop,
          onPressed: () {
            close();
            unawaited(_openDm(context, ref, target.userId));
          },
        ),
      const FluxerMenuDivider(),
      FluxerMenuItem(
        label: l10n.userProfileCopyUserId,
        icon: PhosphorIconsFill.identificationCard,
        onPressed: () {
          close();
          unawaited(
            copyToClipboard(context: menuContext, value: target.userId),
          );
        },
      ),
    ],
  );
}

Future<void> _openDm(BuildContext context, WidgetRef ref, String userId) async {
  try {
    final String channelId = await ref
        .read(dmRepositoryProvider)
        .ensureDmChannel(userId);
    if (!context.mounted) {
      return;
    }
    navigateToContent(context, RoutePaths.dmChannel(channelId));
  } on Object catch (err) {
    if (context.mounted) {
      await showApiError(context, ApiErrorAction.openDm, err);
    }
  }
}
