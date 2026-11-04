const Set<String> _kFirstPartySiteHosts = <String>{
  'fluxer.com',
  'canary.fluxer.com',
  'fluxer.app',
  'canary.fluxer.app',
};

const List<String> _kFirstPartySitePaths = <String>[
  '/help',
  '/blog',
  '/patch-notes',
  '/terms',
  '/privacy',
  '/operator-pass-terms',
  '/operator-pass-privacy',
  '/guidelines',
  '/push-relay',
  '/company-information',
  '/security',
  '/changelog',
  '/licenses',
  '/ai-stance',
  '/download',
  '/careers',
  '/partners',
  '/press',
  '/feedback-privacy',
];

bool _isFirstPartySiteHost(Uri uri) {
  return uri.scheme == 'https' &&
      _kFirstPartySiteHosts.contains(uri.host.toLowerCase());
}

bool _hasAppView(Uri uri) {
  final String path = uri.path;
  return _kFirstPartySitePaths.any(
    (String prefix) => path == prefix || path.startsWith('$prefix/'),
  );
}

bool isFirstPartySiteLinkWithoutAppView(Uri uri) {
  return _isFirstPartySiteHost(uri) && !_hasAppView(uri);
}

Uri withFirstPartySiteAppView(Uri uri) {
  if (!_isFirstPartySiteHost(uri) ||
      !_hasAppView(uri) ||
      uri.queryParameters['view'] == 'app') {
    return uri;
  }
  return uri.replace(
    queryParameters: <String, String>{...uri.queryParameters, 'view': 'app'},
  );
}
