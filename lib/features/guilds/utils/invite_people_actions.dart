import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/guilds/utils/invite_code.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';
import 'package:fluxer_dart/export.dart';

const int kDefaultInviteMaxAgeSeconds = 604800;

typedef InvitePeopleCreateFn =
    Future<({String url, String channelName})?> Function({
      int maxAge,
      int maxUses,
      bool temporary,
    });

typedef InvitePeopleSendFn =
    Future<void> Function(
      String? channelId,
      String? recipientId,
      String inviteUrl,
    );

typedef InviteLinkState = ({String url, String channelName, int maxAge});

Future<({String url, String channelName})?> createChannelInviteLink({
  required WidgetRef ref,
  required String channelId,
  required String channelName,
  int maxAge = kDefaultInviteMaxAgeSeconds,
  int maxUses = 0,
  bool temporary = false,
}) async {
  final InviteMetadataResponseSchema invite = await ref
      .read(fluxerClientProvider)
      .invites
      .createChannelInvite(
        channelId: channelId,
        body: ChannelInviteCreateRequest(
          maxAge: maxAge,
          maxUses: maxUses,
          temporary: temporary,
        ),
      );
  final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
  return (
    url: GuildInvitesUtils.buildInviteUrl(
      inviteBaseUrl: inviteBase,
      code: inviteCodeOf(invite),
    ),
    channelName: channelName,
  );
}

Future<({String url, String channelName})?> createGuildInviteLink({
  required WidgetRef ref,
  required String guildId,
  String? channelId,
  String? channelName,
  int maxAge = kDefaultInviteMaxAgeSeconds,
  int maxUses = 0,
  bool temporary = false,
}) async {
  String? resolvedChannelId = channelId;
  String? resolvedChannelName = channelName;
  if (resolvedChannelId == null) {
    final channels = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannels(guildId);
    final invitable = channels
        .where((channel) => isGuildTextBasedChannel(channel.type))
        .firstOrNull;
    if (invitable == null) {
      return null;
    }
    resolvedChannelId = invitable.id;
    resolvedChannelName = invitable.name;
  }
  return createChannelInviteLink(
    ref: ref,
    channelId: resolvedChannelId,
    channelName: resolvedChannelName ?? '',
    maxAge: maxAge,
    maxUses: maxUses,
    temporary: temporary,
  );
}

Future<void> sendInviteLinkMessage({
  required WidgetRef ref,
  required String? channelId,
  required String? recipientId,
  required String url,
}) async {
  String? targetId = channelId;
  if (targetId == null && recipientId != null) {
    targetId = await ref
        .read(dmRepositoryProvider)
        .ensureDmChannel(recipientId);
  }
  if (targetId == null) {
    return;
  }
  await ref
      .read(messageRepositoryProvider)
      .sendMessage(channelId: targetId, content: url);
}
