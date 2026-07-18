import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gateway_connection_provider.g.dart';

/// Mirrors web GatewayIdentifyFlags.DEBOUNCE_MESSAGE_REACTIONS (1 << 1).
const int kGatewayDebounceMessageReactions = 1 << 1;

@Riverpod(keepAlive: true)
GatewayConnection gatewayConnection(Ref ref) {
  final Dio dio = ref.watch(fluxerDioProvider);
  final String? token = ref.watch(fluxerAuthTokenProvider);
  ref.watch(activeInstanceProvider);

  if (token == null || token.isEmpty) {
    throw StateError('Cannot create gateway connection without auth token');
  }

  final isDesktop = Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  final activeGuildId = ref.read(activeGuildIdProvider);

  final connection = GatewayConnection(
    token: token,
    dio: dio,
    gatewayUrl: ref.watch(activeInstanceGatewayUrlProvider),
    initialGuildId: activeGuildId,
    flags: kGatewayDebounceMessageReactions,
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
      mobile: Platform.isAndroid || Platform.isIOS,
    ),
  );

  ref.onDispose(connection.dispose);
  return connection;
}
