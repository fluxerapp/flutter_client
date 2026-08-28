import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'well_known_provider.g.dart';

@Riverpod(keepAlive: true)
class WellKnown extends _$WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() async {
    final InstanceConfigSnapshot snapshot = ref.watch(activeInstanceProvider);
    final WellKnownFluxerResponse? cached = snapshot.wellKnown;
    if (cached != null) {
      InstanceEndpoints.apply(cached);
      return cached;
    }
    final FluxerClient client = ref.watch(fluxerClientProvider);
    final WellKnownFluxerResponse response = await client.instance
        .getWellKnownFluxer();
    InstanceEndpoints.apply(response);
    return response;
  }

  Future<void> refresh({bool silent = true}) async {
    if (!silent) {
      state = const AsyncLoading<WellKnownFluxerResponse>();
    }
    try {
      final FluxerClient client = ref.read(fluxerClientProvider);
      final WellKnownFluxerResponse response = await client.instance
          .getWellKnownFluxer();
      InstanceEndpoints.apply(response);
      state = AsyncData<WellKnownFluxerResponse>(response);
      try {
        final InstanceConfigSnapshot current = ref.read(activeInstanceProvider);
        await ref
            .read(authRepositoryProvider)
            .persistInstanceSnapshot(
              InstanceConfigSnapshot(
                apiBaseUrl: current.apiBaseUrl,
                gatewayUrl: current.gatewayUrl,
                displayDomain: current.displayDomain,
                wellKnown: response,
              ),
            );
      } on Object catch (error, stackTrace) {
        talker.warning(
          '[WellKnown] Failed to persist instance snapshot: $error\n$stackTrace',
        );
      }
    } on Object catch (error, stackTrace) {
      if (silent && state.hasValue) {
        return;
      }
      state = AsyncError<WellKnownFluxerResponse>(error, stackTrace);
    }
  }
}

@Riverpod(keepAlive: true)
String instanceInviteBaseUrl(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => response.endpoints.invite,
    loading: () => InstanceEndpoints.invite,
    error: (_, _) => InstanceEndpoints.invite,
  );
}

@Riverpod(keepAlive: true)
String instanceGiftBaseUrl(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => response.endpoints.gift,
    loading: () => InstanceEndpoints.gift,
    error: (_, _) => InstanceEndpoints.gift,
  );
}

@Riverpod(keepAlive: true)
String instanceStaticCdnBaseUrl(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => response.endpoints.staticCdn,
    loading: () => InstanceEndpoints.staticCdn,
    error: (_, _) => InstanceEndpoints.staticCdn,
  );
}

@Riverpod(keepAlive: true)
String instanceMediaBaseUrl(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => response.endpoints.media,
    loading: () => InstanceEndpoints.media,
    error: (_, _) => InstanceEndpoints.media,
  );
}

@Riverpod(keepAlive: true)
String instanceWebAppBaseUrl(Ref ref) {
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  return wellKnown.when(
    data: (WellKnownFluxerResponse response) => response.endpoints.webapp,
    loading: () => InstanceEndpoints.webApp,
    error: (_, _) => InstanceEndpoints.webApp,
  );
}
