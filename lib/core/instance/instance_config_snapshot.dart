import 'dart:convert';

import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
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

  String? get instanceDisplayName {
    final Object? appPublic = wellKnown?.appPublic;
    if (appPublic is Map<String, dynamic>) {
      final Object? branding = appPublic['branding'];
      if (branding is Map<String, dynamic>) {
        final Object? productName = branding['product_name'];
        if (productName is String && productName.trim().isNotEmpty) {
          return productName.trim();
        }
      }
    }
    return null;
  }

  static String _resolveApiBaseUrl(WellKnownFluxerResponseEndpoints endpoints) {
    final String apiClient = endpoints.apiClient.trim();
    if (apiClient.isNotEmpty) {
      return _stripTrailingSlashes(apiClient);
    }
    return _stripTrailingSlashes(endpoints.api.trim());
  }

  static final RegExp _trailingSlashes = RegExp(r'/+$');

  static String _stripTrailingSlashes(String value) {
    return value.replaceAll(_trailingSlashes, '');
  }
}
