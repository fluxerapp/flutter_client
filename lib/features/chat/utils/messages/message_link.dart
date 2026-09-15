import 'package:fluxer_app/core/instance/instance_endpoints.dart';

String channelLink(String channelId, String? guildId, {String? webAppBase}) {
  final String base = (webAppBase ?? InstanceEndpoints.webApp).replaceAll(
    RegExp(r'/+$'),
    '',
  );
  final scope = guildId == null || guildId.isEmpty ? '@me' : guildId;
  return '$base/channels/$scope/$channelId';
}

String messageLink({
  required String channelId,
  required String messageId,
  required String? guildId,
  String? webAppBase,
}) {
  return '${channelLink(channelId, guildId, webAppBase: webAppBase)}/$messageId';
}
