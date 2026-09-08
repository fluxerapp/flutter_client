import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/guilds/presentation/invite_people_flow.dart';
import 'package:fluxer_app/features/guilds/utils/invite_people_actions.dart';
import 'package:fluxer_app/features/guilds/utils/invite_people_recipients.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showChannelInviteModal(
  BuildContext context,
  WidgetRef ref, {
  required String channelId,
  required String channelName,
  required String guildId,
  required bool useVanityUrl,
  String? vanityUrlCode,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final guild = await ref
      .read(fluxerDatabaseProvider)
      .guildDao
      .getServerById(guildId);
  if (!context.mounted) {
    return;
  }
  final String communityName = guild?.name ?? channelName;
  String? vanityUrl;
  if (useVanityUrl && vanityUrlCode != null && vanityUrlCode.isNotEmpty) {
    vanityUrl = GuildInvitesUtils.buildInviteUrl(
      inviteBaseUrl: ref.read(instanceInviteBaseUrlProvider),
      code: vanityUrlCode,
    );
  }
  await InvitePeopleFlow.show(
    context,
    communityName: communityName,
    vanityUrl: vanityUrl,
    createInvite:
        ({
          int maxAge = kDefaultInviteMaxAgeSeconds,
          int maxUses = 0,
          bool temporary = false,
        }) {
          return createChannelInviteLink(
            ref: ref,
            channelId: channelId,
            channelName: channelName,
            maxAge: maxAge,
            maxUses: maxUses,
            temporary: temporary,
          );
        },
    getRecipients: () => loadInvitePeopleRecipients(ref: ref, l10n: l10n),
    sendInvite: (String? channelId, String? recipientId, String inviteUrl) {
      return sendInviteLinkMessage(
        ref: ref,
        channelId: channelId,
        recipientId: recipientId,
        url: inviteUrl,
      );
    },
  );
}
