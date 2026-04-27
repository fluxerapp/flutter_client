import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_voice_provider.g.dart';

Map<String, List<VoiceState>> _groupVoiceByUserInGuild(
  Map<String, VoiceState> voiceStates,
  String guildId,
) {
  final Map<String, List<VoiceState>> byUser = <String, List<VoiceState>>{};
  for (final VoiceState vs in voiceStates.values) {
    if (vs.guildId != guildId || vs.channelId == null) {
      continue;
    }
    byUser.putIfAbsent(vs.userId, () => <VoiceState>[]).add(vs);
  }
  return byUser;
}

enum VoiceActivityType { none, voice, screenshare, video }

class VoiceParticipantRow {
  const VoiceParticipantRow({
    required this.isScreenshare,
    required this.avatarUrls,
  });

  final bool isScreenshare;
  final List<String> avatarUrls;
}

@riverpod
VoiceActivityType guildVoiceActivity(Ref ref, String guildId) {
  final Map<String, VoiceState> voiceStates = ref.watch(voiceStatesMapProvider);
  final Map<String, List<VoiceState>> byUser = _groupVoiceByUserInGuild(
    voiceStates,
    guildId,
  );
  var activity = VoiceActivityType.none;
  for (final List<VoiceState> sessions in byUser.values) {
    if (sessions.any((VoiceState s) => s.selfVideo)) {
      return VoiceActivityType.video;
    }
    if (sessions.any((VoiceState s) => s.selfStream)) {
      activity = VoiceActivityType.screenshare;
    } else if (activity == VoiceActivityType.none) {
      activity = VoiceActivityType.voice;
    }
  }
  return activity;
}

@riverpod
Future<List<VoiceParticipantRow>> guildVoiceParticipants(
  Ref ref,
  String guildId,
) async {
  final Map<String, VoiceState> voiceStates = ref.watch(voiceStatesMapProvider);
  final db = ref.watch(fluxerDatabaseProvider);

  final List<String> voiceUserIds = <String>[];
  final List<String> screenshareUserIds = <String>[];
  for (final MapEntry<String, List<VoiceState>> e in _groupVoiceByUserInGuild(
    voiceStates,
    guildId,
  ).entries) {
    final String userId = e.key;
    final List<VoiceState> sessions = e.value;
    if (sessions.any((VoiceState s) => s.selfStream)) {
      screenshareUserIds.add(userId);
    } else {
      voiceUserIds.add(userId);
    }
  }

  if (voiceUserIds.isEmpty && screenshareUserIds.isEmpty) {
    return const [];
  }

  final allUserIds = {...voiceUserIds, ...screenshareUserIds};
  final users = await db.userDao.getUsersByIds(allUserIds.toList());
  final userMap = {for (final u in users) u.id: u};

  String? avatarUrl(String userId) {
    final user = userMap[userId];
    if (user?.avatar == null) {
      return null;
    }
    return '$fluxerMediaCdn/avatars/${user!.id}/${user.avatar}.png';
  }

  final rows = <VoiceParticipantRow>[];
  if (screenshareUserIds.isNotEmpty) {
    rows.add(
      VoiceParticipantRow(
        isScreenshare: true,
        avatarUrls: screenshareUserIds
            .map(avatarUrl)
            .whereType<String>()
            .take(3)
            .toList(),
      ),
    );
  }
  if (voiceUserIds.isNotEmpty) {
    rows.add(
      VoiceParticipantRow(
        isScreenshare: false,
        avatarUrls: voiceUserIds
            .map(avatarUrl)
            .whereType<String>()
            .take(3)
            .toList(),
      ),
    );
  }
  return rows;
}
