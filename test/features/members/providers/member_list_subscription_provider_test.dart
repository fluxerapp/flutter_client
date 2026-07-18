import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_dart/gateway.dart';

void main() {
  test('disposing the subscription does not read providers', () async {
    final GatewayConnection connection = GatewayConnection(
      token: 'test-token',
      dio: Dio(),
    );
    addTearDown(connection.dispose);
    final List<Object> errors = <Object>[];

    await runZonedGuarded(() async {
      final ProviderContainer container = ProviderContainer(
        overrides: [gatewayConnectionProvider.overrideWithValue(connection)],
      );
      container
          .listen<void>(
            memberListDetailsSubscriptionProvider('guild-1', 'channel-1', true),
            (_, _) {},
            fireImmediately: true,
          )
          .close();
      container.dispose();
      await Future<void>.delayed(Duration.zero);
    }, (Object error, StackTrace _) => errors.add(error));

    expect(errors, isEmpty);
  });
}
