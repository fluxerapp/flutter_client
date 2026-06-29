import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_channel_participants_provider.g.dart';

/// Prefix for [voiceChannelParticipants] keys when listing DM / private voice
/// (`VoiceState.guildId` is null).
const String kVoiceDmParticipantsKeyPrefix = 'private|';

String voiceDmChannelParticipantsFamilyKey(String channelId) =>
    '$kVoiceDmParticipantsKeyPrefix$channelId';

String voiceChannelParticipantsFamilyKey(String guildId, String channelId) {
  return '$guildId|$channelId';
}

final Map<String, database.User> _voiceParticipantUsersCache =
    <String, database.User>{};

Future<Map<String, database.User>> _resolveVoiceParticipantUsers(
  Ref ref,
  Set<String> userIds,
) async {
  if (userIds.isEmpty) {
    return const <String, database.User>{};
  }
  final List<String> missing = userIds
      .where((String id) => !_voiceParticipantUsersCache.containsKey(id))
      .toList();
  if (missing.isNotEmpty) {
    final database.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final List<database.User> rows = await db.userDao.getUsersByIds(missing);
    for (final database.User user in rows) {
      _voiceParticipantUsersCache[user.id] = user;
    }
  }
  return _voiceParticipantUsersCache;
}

class VoiceChannelParticipantData {
  const VoiceChannelParticipantData({
    required this.userId,
    required this.voice,
    this.user,
  });

  final String userId;
  final database.User? user;
  final VoiceState voice;
}

class VoiceSidebarParticipant {
  const VoiceSidebarParticipant({
    required this.userId,
    required this.displayName,
    required this.avatarUrl,
    required this.avatarColor,
    required this.selfMute,
    required this.selfDeaf,
    required this.selfVideo,
    required this.selfStream,
    required this.guildMute,
    required this.guildDeaf,
  });

  final String userId;
  final String displayName;
  final String? avatarUrl;
  final int? avatarColor;
  final bool selfMute;
  final bool selfDeaf;
  final bool selfVideo;
  final bool selfStream;
  final bool guildMute;
  final bool guildDeaf;
}

String _displayNameForSort(
  String userId,
  Map<String, database.User> byId,
  Map<String, String?> nicknameByUserId,
) {
  final database.User? u = byId[userId];
  if (u == null) {
    return userId;
  }
  return resolveDisplayName(
    friendNickname: nicknameByUserId[userId],
    globalName: u.globalName,
    username: u.username,
  );
}

int _compareVoiceStateForSort(
  VoiceState a,
  VoiceState b,
  Map<String, database.User> byId,
  Map<String, String?> nicknameByUserId,
) {
  final String nameA = _displayNameForSort(a.userId, byId, nicknameByUserId);
  final String nameB = _displayNameForSort(b.userId, byId, nicknameByUserId);
  final int byName = nameA.toLowerCase().compareTo(nameB.toLowerCase());
  if (byName != 0) {
    return byName;
  }
  final String keyA = a.connectionId ?? a.sessionId ?? '';
  final String keyB = b.connectionId ?? b.sessionId ?? '';
  return keyA.compareTo(keyB);
}

@riverpod
Future<List<VoiceChannelParticipantData>> voiceChannelParticipants(
  Ref ref,
  String guildChannelKey,
) async {
  late final List<VoiceState> inChannel;
  if (guildChannelKey.startsWith(kVoiceDmParticipantsKeyPrefix)) {
    final String channelId = guildChannelKey.substring(
      kVoiceDmParticipantsKeyPrefix.length,
    );
    inChannel = ref.watch(voiceStatesInPrivateChannelProvider(channelId));
  } else {
    final int sep = guildChannelKey.indexOf('|');
    if (sep < 0 || sep == guildChannelKey.length - 1) {
      return const <VoiceChannelParticipantData>[];
    }
    final String guildId = guildChannelKey.substring(0, sep);
    final String channelId = guildChannelKey.substring(sep + 1);
    inChannel = ref.watch(voiceStatesInChannelProvider(guildId, channelId));
  }
  if (inChannel.isEmpty) {
    return const <VoiceChannelParticipantData>[];
  }
  final Set<String> userIds = inChannel.map((VoiceState v) => v.userId).toSet();
  final Map<String, database.User> byId = await _resolveVoiceParticipantUsers(
    ref,
    userIds,
  );
  final Map<String, String?> nicknameByUserId = await ref
      .read(fluxerDatabaseProvider)
      .relationshipDao
      .getNicknamesByUserId();
  final List<VoiceState> sortedInChannel = List<VoiceState>.of(inChannel)
    ..sort(
      (VoiceState a, VoiceState b) =>
          _compareVoiceStateForSort(a, b, byId, nicknameByUserId),
    );
  return sortedInChannel
      .map(
        (VoiceState vs) => VoiceChannelParticipantData(
          userId: vs.userId,
          voice: vs,
          user: byId[vs.userId],
        ),
      )
      .toList();
}

class _VoiceSidebarAgg {
  bool selfMute = false;
  bool selfDeaf = false;
  bool selfVideo = false;
  bool selfStream = false;
  bool guildMute = false;
  bool guildDeaf = false;
}

Map<String, _VoiceSidebarAgg> _aggregateVoiceByUserId(List<VoiceState> states) {
  final Map<String, _VoiceSidebarAgg> byUser = <String, _VoiceSidebarAgg>{};
  for (final VoiceState vs in states) {
    byUser.putIfAbsent(vs.userId, _VoiceSidebarAgg.new)
      ..selfMute |= vs.selfMute
      ..selfDeaf |= vs.selfDeaf
      ..selfVideo |= vs.selfVideo
      ..selfStream |= vs.selfStream
      ..guildMute |= vs.mute || vs.suppress
      ..guildDeaf |= vs.deaf;
  }
  return byUser;
}

@riverpod
Future<List<VoiceSidebarParticipant>> voiceChannelSidebarParticipants(
  Ref ref,
  String guildChannelKey,
) async {
  final int sep = guildChannelKey.indexOf('|');
  if (sep < 0 || sep == guildChannelKey.length - 1) {
    return const <VoiceSidebarParticipant>[];
  }
  final String guildId = guildChannelKey.substring(0, sep);
  final String channelId = guildChannelKey.substring(sep + 1);
  final List<VoiceState> inChannel = ref.watch(
    voiceStatesInChannelProvider(guildId, channelId),
  );
  if (inChannel.isEmpty) {
    return const <VoiceSidebarParticipant>[];
  }
  final Map<String, _VoiceSidebarAgg> byUser = _aggregateVoiceByUserId(
    inChannel,
  );
  final List<String> userIds = byUser.keys.toList();
  final database.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
  final Map<String, database.User> usersById =
      await _resolveVoiceParticipantUsers(ref, userIds.toSet());
  final List<database.Member> memberRows = await db.memberDao
      .getMembersByUserIds(guildId, userIds);
  final Map<String, database.Member> membersByUserId =
      <String, database.Member>{
        for (final database.Member m in memberRows) m.userId: m,
      };
  final Map<String, String?> nicknameByUserId = await db.relationshipDao
      .getNicknamesByUserId();
  final List<VoiceSidebarParticipant> out = <VoiceSidebarParticipant>[];
  for (final String userId in userIds) {
    final database.User? user = usersById[userId];
    if (user == null) {
      continue;
    }
    final _VoiceSidebarAgg agg = byUser[userId]!;
    final database.Member? member = membersByUserId[userId];
    final GuildUserDisplay display = resolveGuildUserDisplayFromRows(
      user: user,
      member: member,
      guildId: guildId,
      friendNickname: nicknameByUserId[userId],
    );
    out.add(
      VoiceSidebarParticipant(
        userId: userId,
        displayName: display.displayName,
        avatarUrl: display.avatarUrl,
        avatarColor: display.avatarColor,
        selfMute: agg.selfMute,
        selfDeaf: agg.selfDeaf,
        selfVideo: agg.selfVideo,
        selfStream: agg.selfStream,
        guildMute: agg.guildMute,
        guildDeaf: agg.guildDeaf,
      ),
    );
  }
  out.sort((VoiceSidebarParticipant a, VoiceSidebarParticipant b) {
    final int byName = a.displayName.toLowerCase().compareTo(
      b.displayName.toLowerCase(),
    );
    if (byName != 0) {
      return byName;
    }
    return a.userId.compareTo(b.userId);
  });
  return out;
}
