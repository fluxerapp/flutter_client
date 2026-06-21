import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_instance_provider.g.dart';

// ignore: do_not_use_environment -- compile-time override for the API base URL
const _kFluxerBaseUrl = String.fromEnvironment('FLUXER_BASE_URL');

@Riverpod(keepAlive: true)
class ActiveInstance extends _$ActiveInstance {
  final InstanceEndpointNormalizer _normalizer =
      const InstanceEndpointNormalizer();
  final InstanceDiscoveryService _discoveryService = InstanceDiscoveryService();
  int _connectSeq = 0;

  @override
  InstanceConfigSnapshot build() {
    final String configuredBaseUrl = _kFluxerBaseUrl.trim();
    if (configuredBaseUrl.isNotEmpty) {
      return InstanceConfigSnapshot(
        apiBaseUrl: configuredBaseUrl,
        gatewayUrl: '',
        displayDomain: _normalizer.extractDisplayDomain(configuredBaseUrl),
      );
    }
    return InstanceConfigSnapshot.officialDefault();
  }

  String get apiBaseUrl => state.apiBaseUrl;

  String? get gatewayUrl {
    final String gateway = state.gatewayUrl.trim();
    return gateway.isEmpty ? null : gateway;
  }

  String describeApiEndpoint() {
    return _normalizer.describeApiEndpoint(state.apiBaseUrl);
  }

  Future<InstanceConfigSnapshot> discoverEndpoint(String input) {
    return _discoveryService.connectToEndpoint(input);
  }

  Future<List<RecentInstance>> connectToEndpoint(String input) async {
    final int connectId = ++_connectSeq;
    final InstanceConfigSnapshot snapshot =
        await _discoveryService.connectToEndpoint(input);
    if (connectId != _connectSeq) {
      return ref.read(fluxerDatabaseProvider).recentInstancesDao.getRecentInstances();
    }
    _applySnapshot(snapshot);
    return ref.read(fluxerDatabaseProvider).recentInstancesDao.touchRecentInstance(
      domain: snapshot.displayDomain,
      name: snapshot.instanceDisplayName,
    );
  }

  void applySnapshot(InstanceConfigSnapshot snapshot) {
    _applySnapshot(snapshot);
  }

  void _applySnapshot(InstanceConfigSnapshot snapshot) {
    snapshot.apply();
    state = snapshot;
  }

  void resetToOfficialDefault() {
    applySnapshot(InstanceConfigSnapshot.officialDefault());
  }
}

@Riverpod(keepAlive: true)
String fluxerBaseUrl(Ref ref) {
  return ref.watch(activeInstanceProvider).apiBaseUrl;
}

@Riverpod(keepAlive: true)
String? activeInstanceGatewayUrl(Ref ref) {
  final String gateway = ref.watch(activeInstanceProvider).gatewayUrl.trim();
  return gateway.isEmpty ? null : gateway;
}

@Riverpod(keepAlive: true)
String activeInstanceDisplayDomain(Ref ref) {
  final String domain = ref.watch(activeInstanceProvider).displayDomain;
  return const InstanceEndpointNormalizer().formatDisplayDomain(domain);
}

@Riverpod(keepAlive: true)
bool isActiveInstanceOfficial(Ref ref) {
  return ref.watch(fluxerBaseUrlProvider) ==
      InstanceConstants.defaultApiBaseUrl;
}
