import 'dart:async';

import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/app/startup_gateway_fallback_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('opening from cache after arming uses the cache-first delay', () {
    fakeAsync((FakeAsync async) {
      final FluxerDatabase db = FluxerDatabase.forTesting(
        NativeDatabase.memory(),
      );
      unawaited(
        db.userSettingsDao.upsertSettings(
          UserSettingsTableCompanion.insert(userId: 'user-1', data: '{}'),
        ),
      );
      async.flushMicrotasks();
      final container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          gatewayConnectivityCheckProvider.overrideWithValue(() async => true),
        ],
      );
      container.read(appUiForegroundProvider.notifier).setResumed(true);
      container.read(currentUserIdProvider.notifier).set('user-1');
      final StartupGatewayFallbackNotifier fallback = container.read(
        startupGatewayFallbackProvider.notifier,
      )..arm();
      async.flushMicrotasks();
      fallback.openFromCache();
      async.elapse(
        kStartupCacheFirstIndicatorDelay + const Duration(milliseconds: 100),
      );

      expect(
        container.read(startupGatewayFallbackProvider),
        StartupGatewayFallback.cachedShell,
      );

      container.dispose();
      async.flushMicrotasks();
      unawaited(db.close());
      async.flushMicrotasks();
    });
  });
}
