import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_channel_participants_provider.g.dart';

String voiceChannelParticipantsFamilyKey(
  String guildId,
  String channelId,
) {
  return '$guildId|$channelId';
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

String _displayNameForSort(
  String userId,
  Map<String, database.User> byId,
) {
  final database.User? u = byId[userId];
  if (u == null) {
    return userId;
  }
  return u.globalName ?? u.username;
}

int _compareVoiceStateForSort(
  VoiceState a,
  VoiceState b,
  Map<String, database.User> byId,
) {
  final String nameA = _displayNameForSort(a.userId, byId);
  final String nameB = _displayNameForSort(b.userId, byId);
  final int byName = nameA.toLowerCase().compareTo(nameB.toLowerCase());
  if (byName != 0) {
    return byName;
  }
  final String keyA = a.connectionId ?? a.sessionId ?? '';
  final String keyB = b.connectionId ?? b.sessionId ?? '';
  return keyA.compareTo(keyB);
}

List<VoiceState> _voiceStatesInChannel(
  Map<String, VoiceState> map,
  String guildId,
  String channelId,
) {
  final List<VoiceState> out = <VoiceState>[];
  for (final VoiceState vs in map.values) {
    if (vs.channelId != channelId || vs.guildId != guildId) {
      continue;
    }
    out.add(vs);
  }
  return out;
}

@riverpod
Future<List<VoiceChannelParticipantData>> voiceChannelParticipants(
  Ref ref,
  String guildChannelKey,
) async {
  final int sep = guildChannelKey.indexOf('|');
  if (sep < 0 || sep == guildChannelKey.length - 1) {
    return const <VoiceChannelParticipantData>[];
  }
  final String guildId = guildChannelKey.substring(0, sep);
  final String channelId = guildChannelKey.substring(sep + 1);
  final Map<String, VoiceState> map = ref.watch(voiceStatesMapProvider);
  final List<VoiceState> inChannel = _voiceStatesInChannel(
    map,
    guildId,
    channelId,
  );
  if (inChannel.isEmpty) {
    return const <VoiceChannelParticipantData>[];
  }
  final Set<String> userIds = inChannel
      .map((VoiceState v) => v.userId)
      .toSet();
  final database.FluxerDatabase db = ref.watch(fluxerDatabaseProvider);
  final List<database.User> userRows = await db.userDao.getUsersByIds(
    userIds.toList(),
  );
  final Map<String, database.User> byId = <String, database.User>{
    for (final database.User u in userRows) u.id: u,
  };
  inChannel.sort(
    (VoiceState a, VoiceState b) => _compareVoiceStateForSort(a, b, byId),
  );
  return inChannel
      .map(
        (VoiceState vs) => VoiceChannelParticipantData(
          userId: vs.userId,
          voice: vs,
          user: byId[vs.userId],
        ),
      )
      .toList();
}
