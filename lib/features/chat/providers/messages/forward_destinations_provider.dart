import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forward_destinations_provider.g.dart';

enum ForwardDestinationKind { guildText, guildVoice, dm, group, personalNotes }

enum ForwardDestinationDisable {
  none,
  guildSendDisabled,
  memberTimedOut,
  noSendPermission,
  noEmbedPermission,
  noAttachPermission,
}

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

  final String? guildId;

  final String? guildName;

  final int rateLimitPerUser;

  final ForwardDestinationDisable disable;

  final bool slowmodeEnabled;

  final String? avatarUserId;

  final String? avatarImageUrl;

  final String? guildAvatarImageUrl;

  final String? groupIconUrl;

  final List<GroupMemberInfo> groupMembers;

  bool get isGuildChannel =>
      kind == ForwardDestinationKind.guildText ||
      kind == ForwardDestinationKind.guildVoice;

  bool get isPermissionBlocked => disable != ForwardDestinationDisable.none;
}

@riverpod
Future<List<ForwardDestination>> forwardDestinations(
  Ref ref, {
  required String sourceChannelId,
  required bool sourceHasEmbeds,
  required bool sourceHasAttachments,
}) async {
  final List<Channel> allChannels = await ref.watch(allChannelsProvider.future);
  final List<Guild> guilds = ref.watch(guildListViewModelProvider).guilds;
  final DmViewState dmState = ref.watch(dmViewModelProvider);
  final List<DmConversation> conversations = dmState.conversations;
  final Map<String, String?> friendNicknameById = friendNicknamesById(
    dmState.friendsList,
  );
  final FluxerLocalizations l10n = ref.watch(appLocalizationsProvider);

  final Map<String, Guild> guildsById = <String, Guild>{
    for (final Guild g in guilds) g.id: g,
  };
  final database = ref.watch(fluxerDatabaseProvider);
  final String? currentUserId = ref.watch(currentUserIdProvider);

  final List<ForwardDestination> destinations = <ForwardDestination>[];

  for (final DmConversation dm in conversations) {
    final ForwardDestinationKind kind = dm.isPersonalNotes
        ? ForwardDestinationKind.personalNotes
        : dm.isGroup
        ? ForwardDestinationKind.group
        : ForwardDestinationKind.dm;
    final bool isOneToOne = kind == ForwardDestinationKind.dm;
    destinations.add(
      ForwardDestination(
        channelId: dm.id,
        displayName: dm.isPersonalNotes
            ? l10n.personalNotesTitle
            : dm.displayNameWith(
                dm.isGroup ? null : friendNicknameById[dm.recipientId],
                l10n: l10n,
                currentUserId: currentUserId,
              ),
        kind: kind,
        avatarUserId: isOneToOne ? dm.recipientId : null,
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

  final Set<String> joined = await database.threadDao.getJoinedThreadIds();
  final List<Channel> threadDestinations = <Channel>[
    for (final String guildId in guildsById.keys)
      for (final db.Channel row in await database.threadDao.getThreadsForGuild(
        guildId,
      ))
        if (Channel.fromRow(row) case final Channel thread
            when isForwardableThread(
              thread,
              joined: joined.contains(thread.id),
            ))
          thread,
  ];
  final List<Channel> guildChannels =
      <Channel>[
        ...allChannels.where(
          (Channel c) => isGuildTextBasedChannelType(c.type),
        ),
        ...threadDestinations,
      ]..sort((Channel a, Channel b) {
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
        channel.rateLimitPerUser > 0 && !bypassesSlowmode(bits);
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

bool isForwardableThread(Channel thread, {required bool joined}) {
  final bool archived = thread.threadArchived ?? false;
  final bool locked = thread.threadLocked ?? false;
  if (archived && locked) {
    return false;
  }
  return joined || isPublicThreadChannelType(thread.type);
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
