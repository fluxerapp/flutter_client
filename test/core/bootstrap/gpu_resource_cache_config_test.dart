import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/bootstrap/image_cache_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<MethodCall> calls;

  setUp(() {
    calls = <MethodCall>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.skia, (call) async {
          calls.add(call);
          return <Object?>[true];
        });
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.skia, null);
  });

  test(
    'android sets the Skia cache to 64 MiB once, not the 48 bytes per pixel default',
    () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      configureFluxerGpuResourceCache();
      await Future<void>.delayed(Duration.zero);

      expect(calls, hasLength(1));
      expect(calls.single.method, 'Skia.setResourceCacheMaxBytes');
      expect(calls.single.arguments, 67108864);
    },
  );

  test('low-memory android devices get a 32 MiB Skia cache', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    configureFluxerGpuResourceCache(totalMemoryBytes: 3800 << 20);
    await Future<void>.delayed(Duration.zero);

    expect(calls.single.arguments, 33554432);
  });

  test('6 GB android devices keep the 64 MiB Skia cache', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    configureFluxerGpuResourceCache(totalMemoryBytes: 5800 << 20);
    await Future<void>.delayed(Duration.zero);

    expect(calls.single.arguments, 67108864);
  });

  test('non-android platforms leave the engine cache limit alone', () async {
    for (final TargetPlatform platform in <TargetPlatform>[
      TargetPlatform.iOS,
      TargetPlatform.linux,
      TargetPlatform.macOS,
      TargetPlatform.windows,
    ]) {
      debugDefaultTargetPlatformOverride = platform;
      configureFluxerGpuResourceCache();
    }
    await Future<void>.delayed(Duration.zero);

    expect(calls, isEmpty);
  });
}
