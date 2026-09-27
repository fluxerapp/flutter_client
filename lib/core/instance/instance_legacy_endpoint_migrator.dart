import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';

class InstanceLegacyEndpointMigrator {
  const InstanceLegacyEndpointMigrator({
    this._normalizer = const InstanceEndpointNormalizer(),
  });

  final InstanceEndpointNormalizer _normalizer;

  static const Set<String> _legacyGatewayHosts = <String>{
    'gateway.fluxer.app',
    'gateway.canary.fluxer.app',
  };

  InstanceConfigSnapshot? migrateOfficialSnapshotIfNeeded(
    InstanceConfigSnapshot snapshot,
  ) {
    if (!_isOfficialSnapshot(snapshot)) {
      return null;
    }
    final _OfficialTargets targets = _targetsFor(snapshot.displayDomain);
    final String apiBaseUrl = snapshot.apiBaseUrl.trim();
    final String gatewayUrl = snapshot.gatewayUrl.trim();
    final String displayDomain = snapshot.displayDomain.trim();

    if (!_needsRewrite(
      apiBaseUrl: apiBaseUrl,
      gatewayUrl: gatewayUrl,
      displayDomain: displayDomain,
      targets: targets,
    )) {
      return null;
    }

    return InstanceConfigSnapshot(
      apiBaseUrl: targets.apiBaseUrl,
      gatewayUrl: targets.gatewayUrl,
      displayDomain: targets.displayDomain,
    );
  }

  bool isLegacyOfficialApiBaseUrl(String apiBaseUrl) {
    final String trimmed = apiBaseUrl.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    final Uri? uri = Uri.tryParse(trimmed);
    if (uri == null) {
      return false;
    }
    final String host = uri.host.toLowerCase();
    if (!host.startsWith('api.')) {
      return false;
    }
    final String displayHost = _normalizer.formatDisplayDomain(host);
    return InstanceConstants.officialInstanceHosts.contains(displayHost);
  }

  String? migrateOfficialApiBaseUrlIfNeeded(String apiBaseUrl) {
    if (!isLegacyOfficialApiBaseUrl(apiBaseUrl)) {
      return null;
    }
    final String displayHost = _normalizer.formatDisplayDomain(
      Uri.parse(apiBaseUrl.trim()).host,
    );
    return _targetsFor(displayHost).apiBaseUrl;
  }

  String? migrateOfficialRecentDomainIfNeeded(String domain) {
    final String trimmed = domain.trim().toLowerCase();
    if (trimmed.isEmpty || !_normalizer.isOfficialInstanceInput(trimmed)) {
      return null;
    }
    final String target = _targetsFor(trimmed).displayDomain;
    return trimmed == target ? null : target;
  }

  bool _isOfficialSnapshot(InstanceConfigSnapshot snapshot) {
    return _normalizer.isOfficialInstanceInput(snapshot.apiBaseUrl) ||
        _normalizer.isOfficialInstanceInput(snapshot.displayDomain) ||
        isLegacyOfficialApiBaseUrl(snapshot.apiBaseUrl) ||
        _isLegacyGatewayUrl(snapshot.gatewayUrl);
  }

  bool _needsRewrite({
    required String apiBaseUrl,
    required String gatewayUrl,
    required String displayDomain,
    required _OfficialTargets targets,
  }) {
    if (isLegacyOfficialApiBaseUrl(apiBaseUrl) ||
        _isLegacyGatewayUrl(gatewayUrl)) {
      return true;
    }
    if (displayDomain.isNotEmpty && displayDomain != targets.displayDomain) {
      return true;
    }
    if (apiBaseUrl.isNotEmpty && apiBaseUrl != targets.apiBaseUrl) {
      return true;
    }
    return gatewayUrl.isNotEmpty && gatewayUrl != targets.gatewayUrl;
  }

  bool _isLegacyGatewayUrl(String gatewayUrl) {
    final String trimmed = gatewayUrl.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    final Uri? uri = Uri.tryParse(trimmed);
    if (uri == null) {
      return false;
    }
    return _legacyGatewayHosts.contains(uri.host.toLowerCase());
  }

  _OfficialTargets _targetsFor(String displayDomain) {
    final String normalized = _normalizer.formatDisplayDomain(displayDomain);
    if (normalized.startsWith('canary.')) {
      return const _OfficialTargets(
        apiBaseUrl: InstanceConstants.canaryApiBaseUrl,
        gatewayUrl: InstanceConstants.defaultGatewayUrl,
        displayDomain: InstanceConstants.canaryInstanceInputUrl,
      );
    }
    return const _OfficialTargets(
      apiBaseUrl: InstanceConstants.defaultApiBaseUrl,
      gatewayUrl: InstanceConstants.defaultGatewayUrl,
      displayDomain: InstanceConstants.defaultInstanceInputUrl,
    );
  }
}

class _OfficialTargets {
  const _OfficialTargets({
    required this.apiBaseUrl,
    required this.gatewayUrl,
    required this.displayDomain,
  });

  final String apiBaseUrl;
  final String gatewayUrl;
  final String displayDomain;
}
