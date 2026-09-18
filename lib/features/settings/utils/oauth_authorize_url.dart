const List<String> kOAuth2Scopes = <String>[
  'identify',
  'email',
  'guilds',
  'connections',
  'bot',
];

const int kMaxApplicationRedirectUris = 10;

const String kApplicationDocsUrl = 'https://fluxer.dev';
const String kApplicationDocsDomain = 'fluxer.dev';
const String kExampleCallbackUrl = 'https://example.com/callback';

String resolveOAuthAuthorizeOrigin({
  required String displayDomain,
  String? marketingUrl,
  String? webAppUrl,
}) {
  final String? marketing = _nonEmptyBase(marketingUrl);
  if (marketing != null) {
    return marketing;
  }
  final String? webApp = _nonEmptyBase(webAppUrl);
  if (webApp != null) {
    return webApp;
  }
  return 'https://$displayDomain';
}

String buildOAuthAuthorizeUrl({
  required String origin,
  required String clientId,
  required Iterable<String> scopes,
  required bool botRequireCodeGrant,
  String? redirectUri,
  int botPermissions = 0,
}) {
  final List<String> scopeList = scopes
      .map((scope) => scope.trim())
      .where((scope) => scope.isNotEmpty)
      .toList();
  if (scopeList.isEmpty) {
    return '';
  }

  final bool isBotOnly = scopeList.length == 1 && scopeList.first == 'bot';
  final bool requireRedirectUri = !isBotOnly || botRequireCodeGrant;
  final String? redirect = redirectUri?.trim();
  if (requireRedirectUri && (redirect == null || redirect.isEmpty)) {
    return '';
  }

  final Map<String, String> query = <String, String>{'client_id': clientId};
  query['scope'] = scopeList.join(' ');
  if (scopeList.contains('bot') && botPermissions != 0) {
    query['permissions'] = botPermissions.toString();
  }
  if (redirect != null && redirect.isNotEmpty) {
    query['redirect_uri'] = redirect;
    query['response_type'] = 'code';
  }

  final Uri base = Uri.parse(_stripTrailingSlash(origin));
  return Uri(
    scheme: base.scheme,
    host: base.host,
    port: base.hasPort ? base.port : null,
    path: '/oauth2/authorize',
    queryParameters: query,
  ).toString();
}

int oauthBotPermissionsValue(Iterable<int> permissionBits) {
  var total = 0;
  for (final int bit in permissionBits) {
    total |= bit;
  }
  return total;
}

String? _nonEmptyBase(String? value) {
  if (value == null) {
    return null;
  }
  final String trimmed = _stripTrailingSlash(value.trim());
  if (trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}

String _stripTrailingSlash(String value) {
  if (value.endsWith('/')) {
    return value.substring(0, value.length - 1);
  }
  return value;
}
