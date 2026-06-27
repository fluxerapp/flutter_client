import 'package:flutter/foundation.dart';
import 'package:fluxer_dart/gateway_client/gateway_types.dart';

class ParsedReadyGuild {
  const ParsedReadyGuild({
    required this.guildData,
    required this.position,
    this.memberCount,
    this.onlineCount,
  });

  final GuildCreateData guildData;
  final int position;
  final int? memberCount;
  final int? onlineCount;
}

List<ParsedReadyGuild> parseReadyGuildsOnIsolate(Map<String, Object?> input) {
  final List<Map<String, dynamic>> rawGuilds =
      (input['rawGuilds']! as List<Object?>)
          .map((Object? guild) => Map<String, dynamic>.from(guild! as Map))
          .toList();
  final Map<String, int> guildPositions = Map<String, int>.from(
    input['guildPositions']! as Map,
  );
  final List<ParsedReadyGuild> parsed = <ParsedReadyGuild>[];
  var fallbackPosition = guildPositions.length;
  for (final Map<String, dynamic> rawGuild in rawGuilds) {
    final bool unavailable = rawGuild['unavailable'] as bool? ?? false;
    if (unavailable) {
      continue;
    }
    final GuildCreateData guildData = GuildCreateData.fromJson(rawGuild);
    final String guildId = guildData.guild.id;
    final int position = guildPositions[guildId] ?? fallbackPosition++;
    parsed.add(
      ParsedReadyGuild(
        guildData: guildData,
        position: position,
        memberCount: (rawGuild['member_count'] as num?)?.toInt(),
        onlineCount: (rawGuild['online_count'] as num?)?.toInt(),
      ),
    );
  }
  return parsed;
}

Future<List<ParsedReadyGuild>> parseReadyGuilds({
  required List<Map<String, dynamic>> rawGuilds,
  required Map<String, int> guildPositions,
}) {
  if (rawGuilds.isEmpty) {
    return Future<List<ParsedReadyGuild>>.value(const <ParsedReadyGuild>[]);
  }
  return compute(parseReadyGuildsOnIsolate, <String, Object?>{
    'rawGuilds': rawGuilds,
    'guildPositions': guildPositions,
  });
}
