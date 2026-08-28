import 'dart:convert';

import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_dart/export.dart';

class InstanceConfigSnapshot {
  const InstanceConfigSnapshot({
    required this.apiBaseUrl,
    required this.gatewayUrl,
    required this.displayDomain,
    this.wellKnown,
  });

  final String apiBaseUrl;
  final String gatewayUrl;
  final String displayDomain;
  final WellKnownFluxerResponse? wellKnown;

  factory InstanceConfigSnapshot.fromWellKnown({
    required WellKnownFluxerResponse wellKnown,
    required InstanceEndpointNormalizer normalizer,
  }) {
    final WellKnownFluxerResponseEndpoints endpoints = wellKnown.endpoints;
    final String apiBaseUrl = _resolveApiBaseUrl(endpoints);
    final String gatewayUrl = endpoints.gateway.trim();
    final String displayDomain = normalizer.extractDisplayDomain(apiBaseUrl);
    return InstanceConfigSnapshot(
      apiBaseUrl: apiBaseUrl,
      gatewayUrl: gatewayUrl,
      displayDomain: displayDomain,
      wellKnown: wellKnown,
    );
  }

  factory InstanceConfigSnapshot.officialDefault() {
    return const InstanceConfigSnapshot(
      apiBaseUrl: InstanceConstants.defaultApiBaseUrl,
      gatewayUrl: '',
      displayDomain: 'fluxer.app',
    );
  }

  factory InstanceConfigSnapshot.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json) as Map<String, dynamic>;
    final Object? wellKnownJson = map['well_known'];
    return InstanceConfigSnapshot(
      apiBaseUrl: map['api_base_url'] as String,
      gatewayUrl: map['gateway_url'] as String? ?? '',
      displayDomain: map['display_domain'] as String,
      wellKnown: wellKnownJson is Map<String, Object?>
          ? WellKnownFluxerResponse.fromJson(wellKnownJson)
          : null,
    );
  }

  String toJson() {
    return jsonEncode(<String, dynamic>{
      'api_base_url': apiBaseUrl,
      'gateway_url': gatewayUrl,
      'display_domain': displayDomain,
      if (wellKnown != null) 'well_known': wellKnown!.toJson(),
    });
  }

  void apply() {
    final WellKnownFluxerResponse? response = wellKnown;
    if (response != null) {
      InstanceEndpoints.apply(response);
      return;
    }
    InstanceEndpoints.resetToDefaults();
  }

  WellKnownFluxerResponseSso? get ssoConfig => wellKnown?.sso;

  bool get isSsoEnabled => ssoConfig?.enabled ?? false;

  bool get isSsoEnforced {
    final WellKnownFluxerResponseSso? config = ssoConfig;
    return config != null && config.enabled && config.enforced;
  }

  bool get isSsoOptional {
    final WellKnownFluxerResponseSso? config = ssoConfig;
    return config != null && config.enabled && !config.enforced;
  }

  bool get isRegistrationClosed =>
      wellKnown?.registration.mode ==
      WellKnownFluxerResponseRegistrationModeMode.closed;

  /// Terms of service URL to show during registration, null when this instance
  /// has none to offer.
  String? get termsUrl =>
      _legalUrl(wellKnown?.appPublic.legal.termsUrl, 'terms');

  /// Privacy policy URL to show during registration, null when this instance
  /// has none to offer.
  String? get privacyUrl =>
      _legalUrl(wellKnown?.appPublic.legal.privacyUrl, 'privacy');

  /// Self-hosted instances only get the documents their operator configured;
  /// everything else falls back to the instance marketing site.
  String? _legalUrl(String? configured, String marketingPath) {
    if (configured != null) {
      return configured;
    }
    if (wellKnown?.features.selfHosted ?? false) {
      return null;
    }
    final String marketing =
        wellKnown?.endpoints.marketing ??
        InstanceConstants.defaultMarketingBaseUrl;
    return '$marketing/$marketingPath';
  }

  String get productName {
    final String? name = wellKnown?.appPublic.branding.productName.trim();
    if (name == null || name.isEmpty) {
      return InstanceConstants.defaultProductName;
    }
    return name;
  }

  String? get instanceDisplayName {
    final String name = productName;
    if (name == InstanceConstants.defaultProductName && wellKnown == null) {
      return null;
    }
    if (wellKnown == null) {
      return null;
    }
    return name;
  }

  bool get emailsEnabled => wellKnown?.features.emailsEnabled ?? true;

  bool get collectDateOfBirth =>
      wellKnown?.appPublic.registration.collectDateOfBirth ?? true;

  bool canPublicRegister({String? registrationUrlCode}) {
    return InstanceRuntimeConfig.fromWellKnown(
      wellKnown,
    ).canPublicRegister(registrationUrlCode: registrationUrlCode);
  }

  static String _resolveApiBaseUrl(WellKnownFluxerResponseEndpoints endpoints) {
    final String apiPublic = endpoints.apiPublic.trim();
    if (apiPublic.isNotEmpty && _isOfficialApiPublicUrl(apiPublic)) {
      return '${_stripTrailingSlashes(apiPublic)}/v1';
    }
    final String apiClient = endpoints.apiClient.trim();
    if (apiClient.isNotEmpty) {
      return _stripTrailingSlashes(apiClient);
    }
    return _stripTrailingSlashes(endpoints.api.trim());
  }

  static const Set<String> _officialApiPublicHosts = <String>{
    'api.fluxer.app',
    'api.canary.fluxer.app',
    'api.fluxer.com',
    'api.canary.fluxer.com',
  };

  static bool _isOfficialApiPublicUrl(String apiPublic) {
    try {
      final String host = Uri.parse(apiPublic).host.toLowerCase();
      return _officialApiPublicHosts.contains(host);
    } on FormatException {
      return false;
    }
  }

  static final RegExp _trailingSlashes = RegExp(r'/+$');

  static String _stripTrailingSlashes(String value) {
    return value.replaceAll(_trailingSlashes, '');
  }
}
