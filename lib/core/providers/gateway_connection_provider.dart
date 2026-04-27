import 'dart:io';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_connection_provider.g.dart';

@Riverpod(keepAlive: true)
GatewayConnection gatewayConnection(Ref ref) {
  final dio = ref.watch(fluxerDioProvider);
  final token = ref.watch(fluxerAuthTokenProvider);

  if (token == null || token.isEmpty) {
    throw StateError('Cannot create gateway connection without auth token');
  }

  final isDesktop = Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  final activeGuildId = ref.read(activeGuildIdProvider);

  final connection = GatewayConnection(
    token: token,
    dio: dio,
    initialGuildId: activeGuildId,
    properties: GatewayIdentifyProperties(
      os: Platform.operatingSystem,
      browser: 'fluxer_app',
      device: Platform.operatingSystem,
      osVersion: Platform.operatingSystemVersion,
      locale: Platform.localeName,
      browserVersion: '1.0.0',
      desktopAppVersion: isDesktop ? '1.0.0' : null,
      desktopOs: isDesktop ? Platform.operatingSystem : null,
    ),
  );

  ref.onDispose(connection.dispose);
  return connection;
}
