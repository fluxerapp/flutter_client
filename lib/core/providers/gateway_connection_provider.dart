import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_connection_provider.g.dart';

/// Mirrors web GatewayIdentifyFlags.DEBOUNCE_MESSAGE_REACTIONS (1 << 1).
const int kGatewayDebounceMessageReactions = 1 << 1;

@Riverpod(keepAlive: true)
bool gatewayHasAuthToken(Ref ref) {
  final String? token = ref.watch(fluxerAuthTokenProvider);
  return token != null && token.isNotEmpty;
}

@Riverpod(keepAlive: true)
class IdentifyInitialGuildId extends _$IdentifyInitialGuildId {
  @override
  String? build() => null;

  // Applied from the persisted last location before Identify.
  // ignore: use_setters_to_change_properties
  void set(String? guildId) {
    state = guildId;
  }
}

Future<void> restoreIdentifyInitialGuildId(
  IdentifyInitialGuildId notifier,
  FluxerDatabase database,
) async {
  final String? location = await readPersistedAppLocation(database);
  notifier.set(location == null ? null : extractGuildId(location));
}

@Riverpod(keepAlive: true)
GatewayConnection gatewayConnection(Ref ref) {
  final Dio dio = ref.watch(fluxerDioProvider);
  final bool hasToken = ref.watch(gatewayHasAuthTokenProvider);
  ref.watch(activeInstanceProvider);

  if (!hasToken) {
    throw StateError('Cannot create gateway connection without auth token');
  }

  final String token = ref.read(fluxerAuthTokenProvider)!;

  final bool isDesktop = isFluxerDesktopOs;

  // /loading has no guild; use the persisted last location on cold start.
  final String? initialGuildId =
      ref.read(activeGuildIdProvider) ??
      ref.read(identifyInitialGuildIdProvider);

  final connection = GatewayConnection(
    token: token,
    dio: dio,
    gatewayUrl: ref.watch(activeInstanceGatewayUrlProvider),
    initialGuildId: initialGuildId,
    flags: kGatewayDebounceMessageReactions,
    traceAsync: FluxerObservability.instance.traceAsync,
    traceSync: FluxerObservability.instance.traceSync,
    properties: GatewayIdentifyProperties(
      os: Platform.operatingSystem,
      browser: 'fluxer_app',
      device: Platform.operatingSystem,
      osVersion: Platform.operatingSystemVersion,
      locale: Platform.localeName,
      browserVersion: '1.0.0',
      desktopAppVersion: isDesktop ? '1.0.0' : null,
      desktopOs: isDesktop ? Platform.operatingSystem : null,
      e2eeCapable: true,
      mobile: isFluxerMobileOs,
    ),
  );

  ref.onDispose(connection.dispose);
  return connection;
}
