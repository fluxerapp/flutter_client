import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_parser.dart';

const String appProtocolScheme = 'fluxer';

const Set<String> kInviteShortLinkHosts = <String>{'fluxer.gg'};

const Set<String> kOfficialAppLinkHosts = <String>{
  'web.fluxer.app',
  'web.canary.fluxer.app',
  'web.fluxer.com',
  'web.canary.fluxer.com',
  'fluxer.gg',
};

final RegExp _inviteShortLinkCodePattern = RegExp(r'^[a-zA-Z0-9\-]{2,32}$');

final RegExp _routePathBlocklist = RegExp(r'''["'<>\\|\t\r\n]''');

const String userSettingsDeepLinkPath = '/settings/user';

/// Example paths that must not be handled as mobile deep links.
const List<String> kIgnoredDeepLinkPathExamples = [
  '/',
  '/authorize-ip',
  '/login',
  '/register',
  '/forgot',
  '/verify',
  '/wasntme',
  '/pending',
  '/oauth2/authorize',
  '/auth/sso/callback',
  '/report',
  '/admin',
  '/premium-callback',
  '/age-verification-callback',
  '/connection-callback',
  '/theme-studio',
  '/theme/my-theme',
  '/bookmarks',
  '/mentions',
  '/settings/guild/123',
  '/.well-known/fluxer',
  '/_health',
];

String normalizeDeepLinkPath(String path) {
  final String trimmed = path.replaceAll(RegExp(r'/+$'), '');
  return trimmed.isEmpty ? '/' : trimmed;
}

/// Converts `fluxer://` URIs into path only form matching https deep links.
///
/// Examples:
/// - `fluxer://channels/@me/123` → `/channels/@me/123`
/// - `fluxer://invite/abc` → `/invite/abc`
/// - `fluxer:/channels/@me` → `/channels/@me`
Uri normalizeAppProtocolDeepLinkUri(Uri uri) {
  if (uri.scheme != appProtocolScheme) {
    return uri;
  }
  final String host = uri.host;
  final String rawPath = uri.path;
  final String path = host.isNotEmpty
      ? (rawPath.isEmpty || rawPath == '/' ? '/$host' : '/$host$rawPath')
      : (rawPath.isEmpty ? '/' : rawPath);
  return Uri(
    path: normalizeDeepLinkPath(path),
    queryParameters: uri.queryParameters.isEmpty ? null : uri.queryParameters,
    fragment: uri.fragment.isEmpty ? null : uri.fragment,
  );
}

/// Normalizes invite URLs (fluxer.gg short links, /invite paths) to `/invite/:code`.
Uri normalizeInviteDeepLinkUri(Uri uri) {
  final Uri protocolNormalized = normalizeAppProtocolDeepLinkUri(uri);
  if (protocolNormalized.scheme == appProtocolScheme) {
    return protocolNormalized;
  }
  final String host = protocolNormalized.host.toLowerCase();
  if (kInviteShortLinkHosts.contains(host)) {
    final List<String> segments = protocolNormalized.pathSegments;
    if (segments.length == 1 &&
        _inviteShortLinkCodePattern.hasMatch(segments.first)) {
      return Uri(path: RoutePaths.inviteLink(segments.first));
    }
    if (segments.length >= 2 &&
        segments.first == 'invite' &&
        _inviteShortLinkCodePattern.hasMatch(segments[1])) {
      return Uri(path: RoutePaths.inviteLink(segments[1]));
    }
  }
  final String? parsedCode = parseInviteCode(protocolNormalized.toString());
  if (parsedCode != null && protocolNormalized.path.startsWith('/invite/')) {
    return Uri(path: RoutePaths.inviteLink(parsedCode));
  }
  return protocolNormalized;
}

/// Applies app protocol and invite URL normalization for incoming deep links.
Uri normalizeIncomingDeepLinkUri(Uri uri) {
  return normalizeInviteDeepLinkUri(normalizeAppProtocolDeepLinkUri(uri));
}

bool hasBlocklistedDeepLinkPathCharacters(String path) {
  return _routePathBlocklist.hasMatch(path);
}

Set<String> fluxerOAuthDeepLinkHosts({String? instanceWebAppBase}) {
  final Set<String> hosts = <String>{
    ...kOfficialAppLinkHosts,
    ...kOfficialChannelJumpHosts,
    ...kInviteShortLinkHosts,
  };
  final String? instanceHost = channelJumpHostFromBaseUrl(
    instanceWebAppBase ?? InstanceEndpoints.webApp,
  );
  if (instanceHost != null && instanceHost.isNotEmpty) {
    hosts.add(instanceHost);
  }
  return hosts;
}

bool isFluxerOAuthDeepLinkPath(String path) {
  return normalizeDeepLinkPath(path).startsWith('/oauth2/');
}

bool isFluxerOAuthDeepLinkUri(Uri uri, {String? instanceWebAppBase}) {
  if (uri.scheme != 'http' && uri.scheme != 'https') {
    return false;
  }
  if (!isFluxerOAuthDeepLinkPath(uri.path)) {
    return false;
  }
  return fluxerOAuthDeepLinkHosts(
    instanceWebAppBase: instanceWebAppBase,
  ).contains(uri.host.toLowerCase());
}

bool isAllowedDeepLinkPath(Uri uri) {
  if (isFluxerOAuthDeepLinkUri(uri)) {
    return false;
  }
  final String path = normalizeIncomingDeepLinkUri(uri).path;
  if (_routePathBlocklist.hasMatch(path)) {
    return false;
  }
  final String normalized = normalizeDeepLinkPath(path);
  if (normalized == '/') {
    return false;
  }
  if (normalized == RoutePaths.me || normalized.startsWith('/channels/')) {
    return true;
  }
  if (normalized.startsWith('/invite/')) {
    return true;
  }
  if (normalized.startsWith('/gift/')) {
    return true;
  }
  if (normalized.startsWith('/users/')) {
    return true;
  }
  if (normalized == userSettingsDeepLinkPath) {
    return true;
  }
  if (normalized == RoutePaths.notificationsPath ||
      normalized == RoutePaths.youPath) {
    return true;
  }
  return false;
}
