import 'package:fluxer_dart/export.dart';

/// Instance URLs from `/.well-known/fluxer`, with compile-time fallbacks until loaded.
// Preserves the global endpoint holder API used across provider and link code.
// ignore: avoid_classes_with_only_static_members
abstract final class InstanceEndpoints {
  static const String defaultMedia = 'https://fluxerusercontent.com';
  static const String defaultStaticCdn = 'https://fluxerstatic.com';
  static const String defaultInvite = 'https://fluxer.app';
  static const String defaultGift = 'https://fluxer.app/gift';
  static const String defaultWebApp = 'https://web.fluxer.app';

  static String staticCdn = defaultStaticCdn;
  static String media = defaultMedia;
  static String invite = defaultInvite;
  static String gift = defaultGift;
  static String webApp = defaultWebApp;
  static String api = '';
  static String gateway = '';

  static void apply(WellKnownFluxerResponse response) {
    final WellKnownFluxerResponseEndpoints endpoints = response.endpoints;
    staticCdn = _normalizeBaseUrl(
      endpoints.staticCdn,
      fallback: defaultStaticCdn,
    );
    media = _normalizeBaseUrl(endpoints.media, fallback: defaultMedia);
    invite = _normalizeBaseUrl(endpoints.invite, fallback: defaultInvite);
    gift = _normalizeBaseUrl(endpoints.gift, fallback: defaultGift);
    webApp = _normalizeBaseUrl(endpoints.webapp, fallback: defaultWebApp);
    final String resolvedApi = endpoints.apiClient.isNotEmpty
        ? endpoints.apiClient
        : endpoints.api;
    api = resolvedApi.isNotEmpty ? _normalizeBaseUrl(resolvedApi) : api;
    gateway = endpoints.gateway.isNotEmpty ? endpoints.gateway : gateway;
  }

  static String _normalizeBaseUrl(String value, {String? fallback}) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      return fallback ?? trimmed;
    }
    return trimmed.replaceAll(RegExp(r'/+$'), '');
  }

  static void resetToDefaults() {
    staticCdn = defaultStaticCdn;
    media = defaultMedia;
    invite = defaultInvite;
    gift = defaultGift;
    webApp = defaultWebApp;
    api = '';
    gateway = '';
  }
}
