import 'package:fluxer_app/core/instance/instance_endpoints.dart';

class ChannelJumpLink {
  const ChannelJumpLink({required this.scope, required this.channelId});

  final String scope;
  final String channelId;

  bool get isDm => scope == '@me';
}

class MessageJumpLink extends ChannelJumpLink {
  const MessageJumpLink({
    required super.scope,
    required super.channelId,
    required this.messageId,
  });

  final String messageId;
}

const Set<String> kOfficialChannelJumpHosts = <String>{
  'fluxer.app',
  'canary.fluxer.app',
  'web.fluxer.app',
  'web.canary.fluxer.app',
};

String? channelJumpHostFromBaseUrl(String baseUrl) {
  final String trimmed = baseUrl.trim().replaceAll(RegExp(r'/+$'), '');
  if (trimmed.isEmpty) {
    return null;
  }
  try {
    final Uri uri = trimmed.contains('://')
        ? Uri.parse(trimmed)
        : Uri.parse('https://$trimmed');
    if (uri.host.isEmpty) {
      return null;
    }
    return uri.host.toLowerCase();
  } on FormatException {
    return null;
  }
}

Set<String> channelJumpLinkHosts({String? instanceWebAppBase}) {
  final Set<String> hosts = Set<String>.from(kOfficialChannelJumpHosts);
  final String? instanceHost = channelJumpHostFromBaseUrl(
    instanceWebAppBase ?? InstanceEndpoints.webApp,
  );
  if (instanceHost != null && instanceHost.isNotEmpty) {
    hosts.add(instanceHost);
  }
  return hosts;
}

bool isChannelJumpHost(String host, {String? instanceWebAppBase}) {
  if (host.isEmpty) {
    return false;
  }
  return channelJumpLinkHosts(
    instanceWebAppBase: instanceWebAppBase,
  ).contains(host.toLowerCase());
}

RegExp buildChannelJumpLinkPattern(Set<String> hosts) {
  final String hostPattern = hosts.map(RegExp.escape).join('|');
  return RegExp(
    'https?://(?:$hostPattern)/channels/'
    r'(?:@me|\d{15,21})/\d{15,21}(?:/\d{15,21})?',
    caseSensitive: false,
  );
}

bool _isSnowflake(String? s) {
  if (s == null || s.isEmpty) {
    return false;
  }
  return RegExp(r'^\d{15,21}$').hasMatch(s);
}

ChannelJumpLink? parseChannelJumpLink(
  String url, {
  String? instanceWebAppBase,
}) {
  final uri = Uri.tryParse(url);
  if (uri == null) {
    return null;
  }
  if (!isChannelJumpHost(uri.host, instanceWebAppBase: instanceWebAppBase)) {
    return null;
  }

  final parts = uri.pathSegments;
  if (parts.length < 3 || parts[0] != 'channels') {
    return null;
  }

  final scope = parts[1];
  final channelId = parts[2];

  final isDm = scope == '@me';
  if (!isDm && !_isSnowflake(scope)) {
    return null;
  }
  if (!_isSnowflake(channelId)) {
    return null;
  }

  if (parts.length >= 4 && _isSnowflake(parts[3])) {
    return MessageJumpLink(
      scope: scope,
      channelId: channelId,
      messageId: parts[3],
    );
  }

  return ChannelJumpLink(scope: scope, channelId: channelId);
}
