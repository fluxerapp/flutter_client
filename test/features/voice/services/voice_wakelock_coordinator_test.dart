import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/services/voice_wakelock_coordinator.dart';

const String _toggleChannel =
    'dev.flutter.pigeon.wakelock_plus_platform_interface.WakelockPlusApi.toggle';

class _ToggleCodec extends StandardMessageCodec {
  const _ToggleCodec();

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    if (type == 129) {
      return readValue(buffer);
    }
    return super.readValueOfType(type, buffer);
  }
}

const _ToggleCodec _codec = _ToggleCodec();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final StateProvider<bool> shouldEnableProvider = StateProvider<bool>(
    (_) => false,
  );

  late List<bool> toggles;

  ProviderContainer createContainer() {
    return ProviderContainer(
      overrides: [
        voiceWakelockEnabledProvider.overrideWith(
          (Ref ref) => ref.watch(shouldEnableProvider),
        ),
      ],
    )..listen<void>(voiceWakelockCoordinatorProvider, (_, _) {});
  }

  void mockToggle(ByteData? Function() reply) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler(_toggleChannel, (ByteData? message) async {
          final List<Object?> arguments =
              _codec.decodeMessage(message)! as List<Object?>;
          final List<Object?> toggle = arguments.single! as List<Object?>;
          toggles.add(toggle.single! as bool);
          return reply();
        });
  }

  setUp(() {
    toggles = <bool>[];
    mockToggle(() => _codec.encodeMessage(<Object?>[]));
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler(_toggleChannel, null);
  });

  test(
    'dispose makes no platform call when the wakelock was never enabled',
    () async {
      final ProviderContainer container = createContainer();
      await pumpEventQueue();

      container.dispose();
      await pumpEventQueue();

      expect(toggles, isEmpty);
    },
  );

  test('dispose disables a wakelock that was enabled', () async {
    final ProviderContainer container = createContainer();
    container.read(shouldEnableProvider.notifier).state = true;
    await pumpEventQueue();
    expect(toggles, <bool>[true]);

    container.dispose();
    await pumpEventQueue();

    expect(toggles, <bool>[true, false]);
  });

  test('dispose after an explicit disable makes no second call', () async {
    final ProviderContainer container = createContainer();
    container.read(shouldEnableProvider.notifier).state = true;
    await pumpEventQueue();
    container.read(shouldEnableProvider.notifier).state = false;
    await pumpEventQueue();

    container.dispose();
    await pumpEventQueue();

    expect(toggles, <bool>[true, false]);
  });

  test('a platform error on enable and on dispose does not escape', () async {
    mockToggle(
      () => _codec.encodeMessage(<Object?>['unavailable', 'no wakelock', null]),
    );
    final List<Object> errors = <Object>[];

    await runZonedGuarded(() async {
      final ProviderContainer container = createContainer();
      container.read(shouldEnableProvider.notifier).state = true;
      await pumpEventQueue();

      container.dispose();
      await pumpEventQueue();
    }, (Object error, StackTrace _) => errors.add(error));

    expect(toggles, <bool>[true, false]);
    expect(errors, isEmpty);
  });

  test('a missing platform channel on dispose does not escape', () async {
    final List<Object> errors = <Object>[];

    await runZonedGuarded(() async {
      final ProviderContainer container = createContainer();
      container.read(shouldEnableProvider.notifier).state = true;
      await pumpEventQueue();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMessageHandler(_toggleChannel, null);

      container.dispose();
      await pumpEventQueue();
    }, (Object error, StackTrace _) => errors.add(error));

    expect(toggles, <bool>[true]);
    expect(errors, isEmpty);
  });
}
