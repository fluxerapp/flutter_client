import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/discovery/data/discovery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discovery_providers.g.dart';

@Riverpod(keepAlive: true)
DiscoveryRepository discoveryRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  return DiscoveryRepository(client);
}
