import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/instance/instance_legacy_endpoint_migrator.dart';

const MeasureHttpPolicy kMeasureHttpPolicy = MeasureHttpPolicy();

class MeasureHttpPolicy {
  const MeasureHttpPolicy({
    this._normalizer = const InstanceEndpointNormalizer(),
    this._migrator = const InstanceLegacyEndpointMigrator(),
  });

  final InstanceEndpointNormalizer _normalizer;
  final InstanceLegacyEndpointMigrator _migrator;

  bool isOfficialFluxerInstance(InstanceConfigSnapshot snapshot) {
    return _normalizer.isOfficialInstanceInput(snapshot.apiBaseUrl) ||
        _normalizer.isOfficialInstanceInput(snapshot.displayDomain) ||
        _migrator.isLegacyOfficialApiBaseUrl(snapshot.apiBaseUrl);
  }

  bool shouldTrackHttpRequest({
    required InstanceConfigSnapshot instance,
    required Uri requestUri,
  }) {
    if (!isOfficialFluxerInstance(instance)) {
      return false;
    }
    return _targetsOfficialApiHost(instance: instance, requestUri: requestUri);
  }

  bool _targetsOfficialApiHost({
    required InstanceConfigSnapshot instance,
    required Uri requestUri,
  }) {
    final String host = requestUri.host.toLowerCase();
    if (host.isEmpty) {
      return false;
    }
    final Uri? apiUri = Uri.tryParse(instance.apiBaseUrl.trim());
    if (apiUri != null && apiUri.host.isNotEmpty) {
      if (host == apiUri.host.toLowerCase()) {
        return true;
      }
    }
    final String displayHost = _normalizer.formatDisplayDomain(host);
    return InstanceConstants.officialInstanceHosts.contains(displayHost);
  }
}
