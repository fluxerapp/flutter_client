import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forward_destinations_provider.g.dart';

/// What kind of destination a [ForwardDestination] points at. Drives the
/// row leading visual and section grouping.
enum ForwardDestinationKind { guildText, guildVoice, dm, group, personalNotes }

/// Static (permission-based) reason a destination cannot receive a forward.
/// Slowmode cool-down and the selection cap are evaluated reactively by the
/// sheet, not stored here.
enum ForwardDestinationDisable {
  none,
  guildSendDisabled,
  memberTimedOut,
  noSendPermission,
  noEmbedPermission,
  noAttachPermission,
}

/// A channel or DM the current user may forward a message into.
class ForwardDestination {
  const ForwardDestination({
    required this.channelId,
    required this.displayName,
    required this.kind,
    this.guildId,
    this.guildName,
    this.rateLimitPerUser = 0,
    this.disable = ForwardDestinationDisable.none,
    this.slowmodeEnabled = false,
    this.avatarUserId,
    this.avatarImageUrl,
    this.guildAvatarImageUrl,
    this.groupIconUrl,
    this.groupMembers = const <GroupMemberInfo>[],
  });

  final String channelId;
  final String displayName;
  final ForwardDestinationKind kind;

  /// Owning guild id for guild channels; null/empty for DMs.
  final String? guildId;

  /// Owning guild name, used as the section header / secondary label.
  final String? guildName;

  final int rateLimitPerUser;

  /// Permission-based eligibility. [ForwardDestinationDisable.none] means the
  /// user may forward here (subject to slowmode/cap evaluated by the sheet).
  final ForwardDestinationDisable disable;

  /// Whether an active slowmode applies to the current user here (guild
  /// channels with a rate limit the user cannot bypass). Disables the optional
  /// comment when such a destination is selected.
  final bool slowmodeEnabled;

  /// Recipient user id for 1:1 DMs (default-avatar fallback).
  final String? avatarUserId;

  /// Resolved avatar image url for 1:1 DMs, when the recipient has one.
  final String? avatarImageUrl;

  /// Resolved guild icon url for guild channel destinations.
  final String? guildAvatarImageUrl;

  /// Custom group DM icon url, when the group has one.
  final String? groupIconUrl;

  /// Members shown in the group DM avatar cluster.
  final List<GroupMemberInfo> groupMembers;

  bool get isGuildChannel =>
      kind == ForwardDestinationKind.guildText ||
      kind == ForwardDestinationKind.guildVoice;

  bool get isPermissionBlocked => disable != ForwardDestinationDisable.none;
}

/// All channels and DMs the current user may forward into, given the source
/// channel and whether the source message carries embeds/attachments (which
/// gate EMBED_LINKS / ATTACH_FILES on guild destinations, matching the server).
///
/// DMs are returned first (in recency order), then guild channels grouped by
/// guild name then channel name, so the sheet can build sections by walking
/// consecutive runs. The source channel is excluded; non-text-based channel
/// types (category/link) are filtered out.
@riverpod
Future<List<ForwardDestination>> forwardDestinations(
  Ref ref, {
  required String sourceChannelId,
  required bool sourceHasEmbeds,
  required bool sourceHasAttachments,
}) async {
  final List<Channel> allChannels = await ref.watch(allChannelsProvider.future);
  final List<Guild> guilds = ref.watch(guildListViewModelProvider).guilds;
  final List<DmConversation> conversations = ref
      .watch(dmViewModelProvider)
      .conversations;

  final Map<String, Guild> guildsById = <String, Guild>{
    for (final Guild g in guilds) g.id: g,
  };
  final database = ref.watch(fluxerDatabaseProvider);
  final String? currentUserId = ref.watch(currentUserIdProvider);

  final List<ForwardDestination> destinations = <ForwardDestination>[];

  for (final DmConversation dm in conversations) {
    if (dm.id == sourceChannelId) {
      continue;
    }
    final ForwardDestinationKind kind = dm.isPersonalNotes
        ? ForwardDestinationKind.personalNotes
        : dm.isGroup
        ? ForwardDestinationKind.group
        : ForwardDestinationKind.dm;
    final bool isOneToOne = kind == ForwardDestinationKind.dm;
    destinations.add(
      ForwardDestination(
        channelId: dm.id,
        displayName: dm.displayName,
        kind: kind,
        avatarUserId: isOneToOne && BigInt.tryParse(dm.recipientId) != null
            ? dm.recipientId
            : null,
        avatarImageUrl: isOneToOne
            ? FluxerMediaUrl.userAvatar(
                userId: dm.recipientId,
                hash: dm.recipientAvatar,
              )
            : null,
        groupIconUrl: kind == ForwardDestinationKind.group
            ? FluxerMediaUrl.guildIcon(guildId: dm.id, hash: dm.icon)
            : null,
        groupMembers: kind == ForwardDestinationKind.group
            ? dm.groupMembers
            : const <GroupMemberInfo>[],
      ),
    );
  }

  final List<Channel> guildChannels =
      allChannels
          .where(
            (Channel c) =>
                c.id != sourceChannelId &&
                (c.type == ChannelType.guildText ||
                    c.type == ChannelType.guildVoice),
          )
          .toList()
        ..sort((Channel a, Channel b) {
          final String an = (guildsById[a.guildId]?.name ?? '').toLowerCase();
          final String bn = (guildsById[b.guildId]?.name ?? '').toLowerCase();
          final int byGuild = an.compareTo(bn);
          if (byGuild != 0) {
            return byGuild;
          }
          if (a.position != b.position) {
            return a.position.compareTo(b.position);
          }
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });

  // Guild-wide gates precede per-channel permission bits (web parity).
  final Map<String, ForwardDestinationDisable> guildLevelDisable =
      <String, ForwardDestinationDisable>{};
  final DateTime now = DateTime.now();
  final Set<String> destinationGuildIds = guildChannels
      .map((Channel c) => c.guildId)
      .where((String id) => id.isNotEmpty)
      .toSet();
  for (final String guildId in destinationGuildIds) {
    final Guild? guild = guildsById[guildId];
    if (guild != null && guild.isSendDisabled) {
      guildLevelDisable[guildId] = ForwardDestinationDisable.guildSendDisabled;
      continue;
    }
    if (currentUserId != null) {
      final memberRow = await database.memberDao.getMemberByUserId(
        currentUserId,
        guildId,
      );
      final DateTime? until = memberRow?.communicationDisabledUntil;
      if (until != null && until.isAfter(now)) {
        guildLevelDisable[guildId] = ForwardDestinationDisable.memberTimedOut;
      }
    }
  }

  final List<ChannelPermissionBitsOutcome> permissionOutcomes =
      await Future.wait(
        guildChannels.map(
          (Channel c) => computeEffectiveGuildChannelPermissionBitsOutcome(
            ref: ref,
            channelId: c.id,
          ),
        ),
      );

  for (int i = 0; i < guildChannels.length; i++) {
    final Channel channel = guildChannels[i];
    final ChannelPermissionBitsOutcome outcome = permissionOutcomes[i];
    final int bits = outcome.value;
    final ForwardDestinationDisable? guildGate =
        guildLevelDisable[channel.guildId];
    final ForwardDestinationDisable disable;
    if (guildGate != null) {
      disable = guildGate;
    } else if (!outcome.shouldCache) {
      // Permission data for this guild is not loaded yet, so do not
      // over-restrict; the server enforces on send (matches the composer).
      disable = ForwardDestinationDisable.none;
    } else {
      disable = _resolveDisable(
        bits: bits,
        isVoice: channel.type == ChannelType.guildVoice,
        hasEmbeds: sourceHasEmbeds,
        hasAttachments: sourceHasAttachments,
      );
    }
    final bool slowmodeEnabled =
        channel.rateLimitPerUser > 0 &&
        !hasPermission(bits, Permission.bypassSlowmode);
    final Guild? guild = guildsById[channel.guildId];
    destinations.add(
      ForwardDestination(
        channelId: channel.id,
        displayName: channel.name,
        kind: channel.type == ChannelType.guildVoice
            ? ForwardDestinationKind.guildVoice
            : ForwardDestinationKind.guildText,
        guildId: channel.guildId,
        guildName: guild?.name,
        guildAvatarImageUrl: guild?.iconUrl,
        rateLimitPerUser: channel.rateLimitPerUser,
        disable: disable,
        slowmodeEnabled: slowmodeEnabled,
      ),
    );
  }

  return destinations;
}

ForwardDestinationDisable _resolveDisable({
  required int bits,
  required bool isVoice,
  required bool hasEmbeds,
  required bool hasAttachments,
}) {
  final bool canSend = hasPermission(bits, Permission.sendMessages);
  if (!canSend) {
    return ForwardDestinationDisable.noSendPermission;
  }
  if (hasEmbeds && !hasPermission(bits, Permission.embedLinks)) {
    return ForwardDestinationDisable.noEmbedPermission;
  }
  if (hasAttachments && !hasPermission(bits, Permission.attachFiles)) {
    return ForwardDestinationDisable.noAttachPermission;
  }
  return ForwardDestinationDisable.none;
}
