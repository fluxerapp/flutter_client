abstract final class InstanceConstants {
  static const int apiCodeVersion = 1;
  static const String defaultApiBaseUrl = 'https://api.fluxer.app/v1';
  static const String defaultInstanceInputUrl = 'api.fluxer.app/v1';
  static const String defaultMarketingBaseUrl = 'https://fluxer.app';
  static const int maxRecentInstances = 5;

  static const Set<String> officialInstanceHosts = <String>{
    'fluxer.app',
    'web.fluxer.app',
    'api.fluxer.app',
    'canary.fluxer.app',
    'web.canary.fluxer.app',
    'api.canary.fluxer.app',
    'fluxer.com',
    'web.fluxer.com',
    'api.fluxer.com',
    'canary.fluxer.com',
    'web.canary.fluxer.com',
    'api.canary.fluxer.com',
  };
}
