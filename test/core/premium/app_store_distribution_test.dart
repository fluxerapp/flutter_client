import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/premium/app_store_distribution.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final List<MethodCall> calls = <MethodCall>[];

  void fakeChannel(Object? Function(MethodCall call) reply) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(appStoreDistributionChannel, (
          MethodCall call,
        ) async {
          calls.add(call);
          return reply(call);
        });
  }

  ProviderContainer container() {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    calls.clear();
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(appStoreDistributionChannel, null);
  });

  group('appStoreDistributionProvider', () {
    const Map<String, AppStoreDistribution> replies =
        <String, AppStoreDistribution>{
          'production': AppStoreDistribution.production,
          'testflight': AppStoreDistribution.testflight,
          'development': AppStoreDistribution.development,
          'unknown': AppStoreDistribution.unknown,
          'enterprise': AppStoreDistribution.unknown,
        };

    for (final MapEntry<String, AppStoreDistribution> entry
        in replies.entries) {
      test('maps ${entry.key} to ${entry.value.name}', () async {
        fakeChannel((_) => entry.key);

        expect(
          await container().read(appStoreDistributionProvider.future),
          entry.value,
        );
        expect(calls.single.method, 'distribution');
      });
    }

    test('asks the native side once per launch', () async {
      fakeChannel((_) => 'production');
      final ProviderContainer providers = container();

      await providers.read(appStoreDistributionProvider.future);
      await providers.read(appStoreDistributionProvider.future);

      expect(calls, hasLength(1));
    });

    test('falls back to unknown when the channel fails', () async {
      fakeChannel((_) => throw PlatformException(code: 'failed'));

      expect(
        await container().read(appStoreDistributionProvider.future),
        AppStoreDistribution.unknown,
      );
    });

    test('falls back to unknown without a native handler', () async {
      expect(
        await container().read(appStoreDistributionProvider.future),
        AppStoreDistribution.unknown,
      );
    });

    test('never asks the channel off iOS', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      fakeChannel((_) => 'production');

      expect(
        await container().read(appStoreDistributionProvider.future),
        AppStoreDistribution.unknown,
      );
      expect(calls, isEmpty);
    });
  });

  group('sandboxStorePurchasesProvider', () {
    test('is off by default', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});

      expect(
        await container().read(sandboxStorePurchasesProvider.future),
        isFalse,
      );
    });

    test('keeps the toggle on this device', () async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final ProviderContainer providers = container();
      await providers.read(sandboxStorePurchasesProvider.future);

      await providers
          .read(sandboxStorePurchasesProvider.notifier)
          .setEnabled(value: true);

      expect(providers.read(sandboxStorePurchasesProvider).value, isTrue);
      expect(
        await container().read(sandboxStorePurchasesProvider.future),
        isTrue,
      );
    });
  });
}
