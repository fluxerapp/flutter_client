import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';

/// Resolves a push notification data payload to an in-app route path.
String? resolvePushNotificationPath(Map<String, String> payload) {
  final String? fromUrl = _pathFromUrl(payload['url']);
  if (fromUrl != null) {
    return fromUrl;
  }
  return _pathFromIds(payload);
}

({String guildId, String parentId})? resolvePushNotificationThreadParent(
  Map<String, String> payload,
) {
  final String? parentId = _nonEmpty(payload['parent_id']);
  final String? guildId = _nonEmpty(payload['guild_id']);
  if (parentId == null || guildId == null || isDmPushPayload(payload)) {
    return null;
  }
  return (guildId: guildId, parentId: parentId);
}

String? _pathFromUrl(String? rawUrl) {
  if (rawUrl == null || rawUrl.isEmpty) {
    return null;
  }
  String path = rawUrl.trim();
  if (path.startsWith('http://') || path.startsWith('https://')) {
    final Uri? uri = Uri.tryParse(path);
    if (uri == null) {
      return null;
    }
    path = uri.path;
  }
  if (!path.startsWith('/')) {
    path = '/$path';
  }
  if (!_isNavigableChannelPath(path)) {
    return null;
  }
  return path;
}

String? _pathFromIds(Map<String, String> payload) {
  final String? channelId = _nonEmpty(payload['channel_id']);
  if (channelId == null) {
    return _parentFallbackPath(payload);
  }
  final String? messageId = _nonEmpty(payload['message_id']);
  final bool isDm = isDmPushPayload(payload);
  if (isDm) {
    if (messageId != null) {
      return RoutePaths.dmChannelMessage(channelId, messageId);
    }
    return RoutePaths.dmChannel(channelId);
  }
  if (messageId != null) {
    return RoutePaths.guildChannelMessage(
      _nonEmpty(payload['guild_id'])!,
      channelId,
      messageId,
    );
  }
  return RoutePaths.guildChannel(_nonEmpty(payload['guild_id'])!, channelId);
}

String? _parentFallbackPath(Map<String, String> payload) {
  final String? parentId = _nonEmpty(payload['parent_id']);
  if (parentId == null || isDmPushPayload(payload)) {
    return null;
  }
  return RoutePaths.guildChannel(_nonEmpty(payload['guild_id'])!, parentId);
}

bool _isNavigableChannelPath(String path) {
  if (!path.startsWith('/channels/')) {
    return false;
  }
  final RouteKind kind = classifyRoute(path);
  return kind == RouteKind.chat || kind == RouteKind.dmCall;
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
