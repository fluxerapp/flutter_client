import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/guild_channel_ordering.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/guilds/utils/invitable_channel.dart';
import 'package:fluxer_app/features/guilds/utils/invite_code.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';
import 'package:fluxer_dart/export.dart';

const int kDefaultInviteMaxAgeSeconds = 604800;

typedef InvitePeopleCreateFn =
    Future<({String url, String channelName, bool useVanityUrl})?> Function({
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

typedef InviteLinkState = ({
  String url,
  String channelName,
  int maxAge,
  bool useVanityUrl,
});

Future<InvitableChannelMatch?> resolveGuildInvitableChannel({
  required WidgetRef ref,
  required String guildId,
  String? channelId,
  bool preferSelectedChannel = true,
}) async {
  final db = ref.read(fluxerDatabaseProvider);
  final channels = await db.channelDao.getChannels(guildId);
  if (channels.isEmpty) {
    return null;
  }
  final List<Channel> mapped = channels.map(Channel.fromRow).toList();
  final guildRow = await db.guildDao.getServerById(guildId);
  final String? vanityUrlCode = guildRow?.vanityUrlCode;

  Channel? channelById(String? id) {
    if (id == null || id.isEmpty) {
      return null;
    }
    for (final Channel channel in mapped) {
      if (channel.id == id) {
        return channel;
      }
    }
    return null;
  }

  final Channel? preferred =
      channelById(channelId) ??
      (preferSelectedChannel
          ? channelById(ref.read(activeChannelIdProvider))
          : null);

  Future<InvitableChannelMatch?> matchChannel(Channel channel) async {
    final int bits = await readEffectiveGuildChannelPermissionBits(
      container: ref.container,
      channelId: channel.id,
    );
    return resolveInvitableChannel(
      channels: <Channel>[channel],
      guildId: guildId,
      permissionBitsFor: (_) => bits,
      vanityUrlCode: vanityUrlCode,
      preferSelectedChannel: false,
    );
  }

  if (preferred != null) {
    final InvitableChannelMatch? selected = await matchChannel(preferred);
    if (selected != null) {
      return selected;
    }
  }

  for (final Channel channel in GuildChannelOrdering.sortChannelsForOrdering(
    mapped,
  )) {
    if (preferred != null && channel.id == preferred.id) {
      continue;
    }
    if (!isGuildTextBasedChannelType(channel.type)) {
      continue;
    }
    final InvitableChannelMatch? match = await matchChannel(channel);
    if (match != null) {
      return match;
    }
  }
  return null;
}

Future<({String url, String channelName, bool useVanityUrl})?>
createChannelInviteLink({
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
    useVanityUrl: false,
  );
}

Future<({String url, String channelName, bool useVanityUrl})?>
createGuildInviteLink({
  required WidgetRef ref,
  required String guildId,
  String? channelId,
  String? channelName,
  int maxAge = kDefaultInviteMaxAgeSeconds,
  int maxUses = 0,
  bool temporary = false,
}) async {
  final InvitableChannelMatch? match = await resolveGuildInvitableChannel(
    ref: ref,
    guildId: guildId,
    channelId: channelId,
  );
  if (match == null) {
    return null;
  }
  if (match.capability.useVanityUrl) {
    final String? vanityCode = match.capability.vanityUrlCode;
    if (vanityCode == null || vanityCode.isEmpty) {
      return null;
    }
    final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
    return (
      url: GuildInvitesUtils.buildInviteUrl(
        inviteBaseUrl: inviteBase,
        code: vanityCode,
      ),
      channelName: match.channel.name,
      useVanityUrl: true,
    );
  }
  return createChannelInviteLink(
    ref: ref,
    channelId: match.channel.id,
    channelName: channelName ?? match.channel.name,
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
