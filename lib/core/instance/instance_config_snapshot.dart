import 'dart:convert';

import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/instance/well_known_compat.dart';
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
    final InstanceEndpointsSchema endpoints = wellKnown.endpoints;
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
      gatewayUrl: InstanceConstants.defaultGatewayUrl,
      displayDomain: InstanceConstants.defaultInstanceInputUrl,
    );
  }

  factory InstanceConfigSnapshot.fromJson(String json) {
    final Map<String, dynamic> map = jsonDecode(json) as Map<String, dynamic>;
    return InstanceConfigSnapshot(
      apiBaseUrl: map['api_base_url'] as String,
      gatewayUrl: map['gateway_url'] as String? ?? '',
      displayDomain: map['display_domain'] as String,
      wellKnown: _wellKnownFromJson(map['well_known']),
    );
  }

  InstanceConfigSnapshot withWellKnown(WellKnownFluxerResponse wellKnown) {
    return InstanceConfigSnapshot(
      apiBaseUrl: apiBaseUrl,
      gatewayUrl: gatewayUrl,
      displayDomain: displayDomain,
      wellKnown: wellKnown,
    );
  }

  static WellKnownFluxerResponse? _wellKnownFromJson(Object? value) {
    if (value is! Map) {
      return null;
    }
    try {
      return parseWellKnown(Map<String, dynamic>.from(value));
    } on Object {
      return null;
    }
  }

  static WellKnownFluxerResponse parseWellKnown(Map<String, dynamic> json) {
    final Object? features = json['features'];
    final Object? appPublic = json['app_public'];
    final Object? branding = appPublic is Map ? appPublic['branding'] : null;
    return parseWellKnownFluxer(<String, dynamic>{
      ...json,
      if (features is Map)
        'features': <String, dynamic>{
          'premium_enabled': false,
          'stripe_serviceable': false,
          'phone_verification_enabled': false,
          ...Map<String, dynamic>.from(features),
        },
      if (appPublic is Map && branding is Map)
        'app_public': <String, dynamic>{
          ...Map<String, dynamic>.from(appPublic),
          'branding': <String, dynamic>{
            'premium_product_name': 'Plutonium',
            ...Map<String, dynamic>.from(branding),
          },
        },
    });
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
    switch (wellKnown) {
      case final WellKnownFluxerResponse response:
        InstanceEndpoints.apply(response);
      case null:
        InstanceEndpoints.resetToDefaults();
    }
  }

  InstanceSsoSchema? get ssoConfig => wellKnown?.sso;

  bool get isSsoEnabled => ssoConfig?.enabled ?? false;

  bool get isSsoEnforced {
    final InstanceSsoSchema? config = ssoConfig;
    return config != null && config.enabled && config.enforced;
  }

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

  static String _resolveApiBaseUrl(InstanceEndpointsSchema endpoints) {
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
    'fluxer.com',
    'canary.fluxer.com',
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
