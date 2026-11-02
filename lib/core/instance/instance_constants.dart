abstract final class InstanceConstants {
  static const int apiCodeVersion = 1;
  static const String defaultApiBaseUrl = 'https://fluxer.com/api/v1';
  static const String defaultGatewayUrl = 'wss://gateway.fluxer.com';
  static const String defaultInstanceInputUrl = 'fluxer.com';
  static const String canaryApiBaseUrl = 'https://canary.fluxer.com/api/v1';
  static const String canaryInstanceInputUrl = 'canary.fluxer.com';
  static const String defaultMarketingBaseUrl = 'https://fluxer.app';
  static const String defaultTermsUrl = 'https://fluxer.com/terms';
  static const String defaultPrivacyUrl = 'https://fluxer.com/privacy';
  static const String defaultProductName = 'Fluxer';
  static const String defaultPremiumProductName = 'Plutonium';
  static const int maxRecentInstances = 5;

  static const Set<String> officialInstanceHosts = <String>{
    'fluxer.app',
    'web.fluxer.app',
    'canary.fluxer.app',
    'web.canary.fluxer.app',
    'fluxer.com',
    'web.fluxer.com',
    'canary.fluxer.com',
    'web.canary.fluxer.com',
  };
}
