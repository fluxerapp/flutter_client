import 'package:fluxer_app/core/router/route_names.dart';

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

bool hasBlocklistedDeepLinkPathCharacters(String path) {
  return _routePathBlocklist.hasMatch(path);
}

bool isAllowedDeepLinkPath(Uri uri) {
  final String path = uri.path;
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
