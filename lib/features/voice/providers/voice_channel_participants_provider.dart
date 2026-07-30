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

String voiceParticipantUserIdsKey(Set<String> userIds) {
  if (userIds.isEmpty) {
    return '';
  }
  final List<String> sorted = userIds.toList()..sort();
  return sorted.join(',');
}

String voiceGuildMembersKey(String guildId, Set<String> userIds) {
  return '$guildId|${voiceParticipantUserIdsKey(userIds)}';
}

String voiceSidebarVoiceFlagsKey({
  required String guildId,
  required String channelId,
  required String userId,
}) {
  return '$guildId|$channelId|$userId';
}

final Map<String, database.User> _voiceParticipantUsersCache =
    <String, database.User>{};

final Map<String, database.Member> _voiceGuildMembersCache =
    <String, database.Member>{};

Map<String, String?>? _friendNicknamesCache;

void clearVoiceParticipantUsersCache() {
  _voiceParticipantUsersCache.clear();
  _voiceGuildMembersCache.clear();
  _friendNicknamesCache = null;
}

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

List<VoiceState> _voiceStatesForGuildChannelKey(
  Ref ref,
  String guildChannelKey,
) {
  if (guildChannelKey.startsWith(kVoiceDmParticipantsKeyPrefix)) {
    final String channelId = guildChannelKey.substring(
      kVoiceDmParticipantsKeyPrefix.length,
    );
    return ref.watch(voiceStatesInPrivateChannelProvider(channelId));
  }
  final int sep = guildChannelKey.indexOf('|');
  if (sep < 0 || sep == guildChannelKey.length - 1) {
    return const <VoiceState>[];
  }
  final String guildId = guildChannelKey.substring(0, sep);
  final String channelId = guildChannelKey.substring(sep + 1);
  return ref.watch(voiceStatesInChannelProvider(guildId, channelId));
}

Map<String, database.User> _cachedUsersForIds(Set<String> userIds) {
  final Map<String, database.User> byId = <String, database.User>{};
  for (final String userId in userIds) {
    final database.User? user = _voiceParticipantUsersCache[userId];
    if (user != null) {
      byId[userId] = user;
    }
  }
  return byId;
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
    required this.primaryVoice,
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
  final VoiceState primaryVoice;
}

class VoiceSidebarVoiceFlags {
  const VoiceSidebarVoiceFlags({
    required this.selfMute,
    required this.selfDeaf,
    required this.selfVideo,
    required this.selfStream,
    required this.guildMute,
    required this.guildDeaf,
  });

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

@Riverpod(keepAlive: true)
Future<void> friendNicknamesLoader(Ref ref) async {
  _friendNicknamesCache ??= await ref
      .read(fluxerDatabaseProvider)
      .relationshipDao
      .getNicknamesByUserId();
}

@riverpod
Future<void> voiceParticipantUsersLoader(Ref ref, String userIdsKey) async {
  if (userIdsKey.isEmpty) {
    return;
  }
  final Set<String> userIds = userIdsKey.split(',').toSet();
  await _resolveVoiceParticipantUsers(ref, userIds);
}

@riverpod
Future<void> voiceGuildMembersLoader(Ref ref, String guildMembersKey) async {
  final int sep = guildMembersKey.indexOf('|');
  if (sep < 0) {
    return;
  }
  final String guildId = guildMembersKey.substring(0, sep);
  final String userIdsKey = guildMembersKey.substring(sep + 1);
  if (userIdsKey.isEmpty) {
    return;
  }
  final List<String> userIds = userIdsKey.split(',');
  final database.FluxerDatabase db = ref.read(fluxerDatabaseProvider);
  final List<database.Member> memberRows = await db.memberDao
      .getMembersByUserIds(guildId, userIds);
  for (final database.Member member in memberRows) {
    _voiceGuildMembersCache[member.userId] = member;
  }
}

/// Emits when grid tile membership or video/stream visibility changes.
@riverpod
String voiceChannelGridStructure(Ref ref, String guildChannelKey) {
  final List<VoiceState> inChannel = _voiceStatesForGuildChannelKey(
    ref,
    guildChannelKey,
  );
  final List<String> parts = <String>[];
  for (final VoiceState vs in inChannel) {
    final String identity = vs.connectionId ?? vs.sessionId ?? vs.userId;
    parts.add('${vs.userId}|$identity|${vs.selfVideo}|${vs.selfStream}');
  }
  parts.sort();
  return parts.join(';');
}

/// Emits when the set of users in a guild voice channel changes.
@riverpod
String voiceChannelSidebarStructure(Ref ref, String guildChannelKey) {
  final List<VoiceState> inChannel = _voiceStatesForGuildChannelKey(
    ref,
    guildChannelKey,
  );
  final List<String> userIds =
      inChannel.map((VoiceState vs) => vs.userId).toSet().toList()..sort();
  return userIds.join(',');
}

@riverpod
List<VoiceChannelParticipantData> voiceChannelParticipants(
  Ref ref,
  String guildChannelKey,
) {
  final List<VoiceState> inChannel = _voiceStatesForGuildChannelKey(
    ref,
    guildChannelKey,
  );
  if (inChannel.isEmpty) {
    return const <VoiceChannelParticipantData>[];
  }
  final Set<String> userIds = inChannel.map((VoiceState v) => v.userId).toSet();
  final String userIdsKey = voiceParticipantUserIdsKey(userIds);
  ref.watch(voiceParticipantUsersLoaderProvider(userIdsKey));
  ref.watch(friendNicknamesLoaderProvider);
  final Map<String, String?> nicknameByUserId =
      _friendNicknamesCache ?? const <String, String?>{};
  final Map<String, database.User> byId = _cachedUsersForIds(userIds);
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

List<VoiceChannelParticipantData> uniqueVoiceChannelParticipants(
  List<VoiceChannelParticipantData> participants,
) {
  final Map<String, VoiceChannelParticipantData> byUserId =
      <String, VoiceChannelParticipantData>{};
  for (final VoiceChannelParticipantData participant in participants) {
    byUserId.putIfAbsent(participant.userId, () => participant);
  }
  return byUserId.values.toList();
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

_VoiceSidebarAgg _aggregateVoiceForUser(
  List<VoiceState> states,
  String userId,
) {
  final _VoiceSidebarAgg agg = _VoiceSidebarAgg();
  for (final VoiceState vs in states) {
    if (vs.userId != userId) {
      continue;
    }
    agg
      ..selfMute |= vs.selfMute
      ..selfDeaf |= vs.selfDeaf
      ..selfVideo |= vs.selfVideo
      ..selfStream |= vs.selfStream
      ..guildMute |= vs.mute || vs.suppress
      ..guildDeaf |= vs.deaf;
  }
  return agg;
}

@riverpod
VoiceSidebarVoiceFlags voiceSidebarVoiceFlags(Ref ref, String flagsKey) {
  final int firstSep = flagsKey.indexOf('|');
  final int secondSep = flagsKey.indexOf('|', firstSep + 1);
  if (firstSep < 0 || secondSep < 0) {
    return const VoiceSidebarVoiceFlags(
      selfMute: false,
      selfDeaf: false,
      selfVideo: false,
      selfStream: false,
      guildMute: false,
      guildDeaf: false,
    );
  }
  final String guildId = flagsKey.substring(0, firstSep);
  final String channelId = flagsKey.substring(firstSep + 1, secondSep);
  final String userId = flagsKey.substring(secondSep + 1);
  final List<VoiceState> inChannel = ref.watch(
    voiceStatesInChannelProvider(guildId, channelId),
  );
  final _VoiceSidebarAgg agg = _aggregateVoiceForUser(inChannel, userId);
  return VoiceSidebarVoiceFlags(
    selfMute: agg.selfMute,
    selfDeaf: agg.selfDeaf,
    selfVideo: agg.selfVideo,
    selfStream: agg.selfStream,
    guildMute: agg.guildMute,
    guildDeaf: agg.guildDeaf,
  );
}

@riverpod
List<VoiceSidebarParticipant> voiceChannelSidebarParticipants(
  Ref ref,
  String guildChannelKey,
) {
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
  final Map<String, VoiceState> primaryVoiceByUserId = <String, VoiceState>{};
  for (final VoiceState voiceState in inChannel) {
    primaryVoiceByUserId.putIfAbsent(voiceState.userId, () => voiceState);
  }
  final Set<String> userIds = byUser.keys.toSet();
  final String userIdsKey = voiceParticipantUserIdsKey(userIds);
  final String guildMembersKey = voiceGuildMembersKey(guildId, userIds);
  ref.watch(voiceParticipantUsersLoaderProvider(userIdsKey));
  ref.watch(voiceGuildMembersLoaderProvider(guildMembersKey));
  ref.watch(friendNicknamesLoaderProvider);
  final Map<String, database.User> usersById = _cachedUsersForIds(userIds);
  final Map<String, database.Member> membersByUserId =
      <String, database.Member>{
        for (final String userId in userIds)
          if (_voiceGuildMembersCache.containsKey(userId))
            userId: _voiceGuildMembersCache[userId]!,
      };
  final Map<String, String?> nicknameByUserId =
      _friendNicknamesCache ?? const <String, String?>{};
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
        primaryVoice: primaryVoiceByUserId[userId]!,
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
