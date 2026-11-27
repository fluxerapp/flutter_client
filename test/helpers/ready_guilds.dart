import 'package:fluxer_dart/gateway_client/event_parser.dart';
import 'package:fluxer_dart/gateway_client/gateway_event.dart';
import 'package:fluxer_dart/gateway_client/gateway_types.dart';

ReadyEvent _parseReadyGuilds(
  List<Map<String, dynamic>> rawGuilds,
  Map<String, dynamic>? self,
) {
  final GatewayEvent event = const EventParser().parse(
    'READY',
    <String, dynamic>{
      'session_id': 'test-session',
      'user': self ?? <String, dynamic>{'id': '0', 'username': 'test'},
      'guilds': rawGuilds,
    },
  );
  if (event is! ReadyEvent) {
    throw StateError('READY fixture did not parse: $event');
  }
  return event;
}

List<GuildCreateData> readyGuilds(
  List<Map<String, dynamic>> rawGuilds, {
  Map<String, dynamic>? self,
}) => _parseReadyGuilds(rawGuilds, self).guilds;

List<ReadyUnavailableGuild> readyUnavailableGuilds(
  List<Map<String, dynamic>> rawGuilds,
) => _parseReadyGuilds(rawGuilds, null).unavailableGuilds;
