import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_voice/fluxer_voice.dart';

void main() {
  group('resolveVoiceOutputRoute', () {
    test('keeps the saved route when it is available', () {
      expect(
        resolveVoiceOutputRoute(
          preference: VoiceOutputRoute.headset,
          available: VoiceOutputRoute.values.toSet(),
        ),
        VoiceOutputRoute.headset,
      );
    });

    test('keeps speaker while a headset is connected', () {
      expect(
        resolveVoiceOutputRoute(
          preference: VoiceOutputRoute.speaker,
          available: VoiceOutputRoute.values.toSet(),
        ),
        VoiceOutputRoute.speaker,
      );
    });

    test('falls back to speaker when the saved headset is gone', () {
      expect(
        resolveVoiceOutputRoute(
          preference: VoiceOutputRoute.headset,
          available: kPhoneVoiceOutputRoutes,
        ),
        VoiceOutputRoute.speaker,
      );
    });
  });

  group('resolveVoiceCallOutputRoute', () {
    const Set<VoiceOutputRoute> withBluetooth = <VoiceOutputRoute>{
      ...kPhoneVoiceOutputRoutes,
      VoiceOutputRoute.bluetooth,
    };

    test('moves to a connected Bluetooth device over the saved route', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: null,
          available: withBluetooth,
        ),
        VoiceOutputRoute.bluetooth,
      );
    });

    test('prefers Bluetooth over a wired headset', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: null,
          available: VoiceOutputRoute.values.toSet(),
        ),
        VoiceOutputRoute.bluetooth,
      );
    });

    test('moves to a wired headset when there is no Bluetooth device', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.earpiece,
          override: null,
          available: <VoiceOutputRoute>{
            ...kPhoneVoiceOutputRoutes,
            VoiceOutputRoute.headset,
          },
        ),
        VoiceOutputRoute.headset,
      );
    });

    test('holds a route the user picked while a headset is connected', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: VoiceOutputRoute.earpiece,
          available: withBluetooth,
        ),
        VoiceOutputRoute.earpiece,
      );
    });

    test('returns to the saved earpiece when the headset is gone', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.earpiece,
          override: VoiceOutputRoute.bluetooth,
          available: kPhoneVoiceOutputRoutes,
        ),
        VoiceOutputRoute.earpiece,
      );
    });

    test('falls back to speaker for an older saved headset route', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.headset,
          override: null,
          available: kPhoneVoiceOutputRoutes,
        ),
        VoiceOutputRoute.speaker,
      );
    });

    test('uses the earpiece when there is no speaker', () {
      expect(
        resolveVoiceCallOutputRoute(
          preference: VoiceOutputRoute.speaker,
          override: null,
          available: const <VoiceOutputRoute>{VoiceOutputRoute.earpiece},
        ),
        VoiceOutputRoute.earpiece,
      );
    });
  });

  group('didConnectExternalVoiceOutputRoute', () {
    test('is true when a Bluetooth or wired route appears', () {
      expect(
        didConnectExternalVoiceOutputRoute(
          previous: kPhoneVoiceOutputRoutes,
          current: <VoiceOutputRoute>{
            ...kPhoneVoiceOutputRoutes,
            VoiceOutputRoute.bluetooth,
          },
        ),
        isTrue,
      );
    });

    test('is false when a headset disconnects or nothing is known yet', () {
      expect(
        didConnectExternalVoiceOutputRoute(
          previous: VoiceOutputRoute.values.toSet(),
          current: kPhoneVoiceOutputRoutes,
        ),
        isFalse,
      );
      expect(
        didConnectExternalVoiceOutputRoute(
          previous: null,
          current: VoiceOutputRoute.values.toSet(),
        ),
        isFalse,
      );
    });
  });

  group('liveKitPrefersSpeaker', () {
    test('forces the speaker only for the speaker route', () {
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.speaker), isTrue);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.earpiece), isFalse);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.headset), isFalse);
      expect(liveKitPrefersSpeaker(VoiceOutputRoute.bluetooth), isFalse);
    });
  });

  group('stored speaker preference', () {
    test('maps the old boolean onto speaker or earpiece', () {
      expect(
        voiceOutputRouteFromSpeakerPreference(preferSpeaker: true),
        VoiceOutputRoute.speaker,
      );
      expect(
        voiceOutputRouteFromSpeakerPreference(preferSpeaker: false),
        VoiceOutputRoute.earpiece,
      );
      expect(
        voiceOutputRouteFromSpeakerPreference(preferSpeaker: null),
        VoiceOutputRoute.speaker,
      );
    });
  });

  group('voiceOutputDeviceOptions', () {
    const VoiceOutputDevice car = VoiceOutputDevice(
      kind: VoiceOutputDeviceKind.bluetooth,
      id: 3,
      name: 'Car Audio',
    );
    const VoiceOutputDevice buds = VoiceOutputDevice(
      kind: VoiceOutputDeviceKind.bluetoothLe,
      id: 4,
      name: 'Test Earbuds',
      active: true,
    );
    const VoiceOutputDevice speaker = VoiceOutputDevice(
      kind: VoiceOutputDeviceKind.speaker,
      id: 1,
      name: 'Test Phone',
    );

    test('lists every device in type order and fills missing routes', () {
      final List<VoiceOutputDevice> options = voiceOutputDeviceOptions(
        devices: const <VoiceOutputDevice>[buds, speaker, car],
        available: <VoiceOutputRoute>{
          ...kPhoneVoiceOutputRoutes,
          VoiceOutputRoute.bluetooth,
        },
      );
      expect(options, <VoiceOutputDevice>[
        const VoiceOutputDevice(kind: VoiceOutputDeviceKind.earpiece),
        speaker,
        car,
        buds,
      ]);
    });

    test('drops devices whose route is not available', () {
      final List<VoiceOutputDevice> options = voiceOutputDeviceOptions(
        devices: const <VoiceOutputDevice>[speaker, car],
        available: <VoiceOutputRoute>{VoiceOutputRoute.speaker},
      );
      expect(options, <VoiceOutputDevice>[speaker]);
    });

    test('selects the chosen device, then the active one, then the first', () {
      const List<VoiceOutputDevice> options = <VoiceOutputDevice>[
        speaker,
        car,
        buds,
      ];
      expect(
        selectedVoiceOutputDevice(
          options: options,
          route: VoiceOutputRoute.bluetooth,
          overrideDeviceId: 3,
        ),
        car,
      );
      expect(
        selectedVoiceOutputDevice(
          options: options,
          route: VoiceOutputRoute.bluetooth,
          overrideDeviceId: 99,
        ),
        buds,
      );
      expect(
        selectedVoiceOutputDevice(
          options: const <VoiceOutputDevice>[speaker, car],
          route: VoiceOutputRoute.bluetooth,
          overrideDeviceId: null,
        ),
        car,
      );
      expect(
        selectedVoiceOutputDevice(
          options: options,
          route: VoiceOutputRoute.speaker,
          overrideDeviceId: 3,
        ),
        speaker,
      );
    });

    test('reads native device messages', () {
      expect(
        VoiceOutputDevice.fromMessage(
          NativeVoiceDevice(
            id: 4,
            kind: NativeVoiceDeviceKind.bluetoothLe,
            name: 'Test Earbuds',
            active: true,
          ),
        ),
        buds,
      );
      expect(
        VoiceOutputDevice.fromMessage(
          NativeVoiceDevice(
            id: 5,
            kind: NativeVoiceDeviceKind.wired,
            name: '',
            active: false,
          ),
        ),
        const VoiceOutputDevice(kind: VoiceOutputDeviceKind.wired, id: 5),
      );
    });
  });

  group('newlyConnectedExternalVoiceOutputDevice', () {
    const VoiceOutputDevice speaker = VoiceOutputDevice(
      kind: VoiceOutputDeviceKind.speaker,
      id: 1,
    );
    const VoiceOutputDevice car = VoiceOutputDevice(
      kind: VoiceOutputDeviceKind.bluetooth,
      id: 3,
    );
    const VoiceOutputDevice buds = VoiceOutputDevice(
      kind: VoiceOutputDeviceKind.bluetoothLe,
      id: 4,
    );

    test('finds a headset that joins an already connected one', () {
      expect(
        newlyConnectedExternalVoiceOutputDevice(
          previousIds: voiceOutputDeviceIds(const <VoiceOutputDevice>[
            speaker,
            car,
          ]),
          devices: const <VoiceOutputDevice>[speaker, car, buds],
        ),
        buds,
      );
    });

    test('ignores built-in devices and the first reading', () {
      expect(
        newlyConnectedExternalVoiceOutputDevice(
          previousIds: <int>{3},
          devices: const <VoiceOutputDevice>[speaker, car],
        ),
        isNull,
      );
      expect(
        newlyConnectedExternalVoiceOutputDevice(
          previousIds: null,
          devices: const <VoiceOutputDevice>[speaker, car],
        ),
        isNull,
      );
    });
  });

  group('isExplicitVoiceOutputRoute', () {
    test('an override is explicit only for its own route', () {
      expect(
        isExplicitVoiceOutputRoute(
          route: VoiceOutputRoute.bluetooth,
          preference: VoiceOutputRoute.earpiece,
          override: VoiceOutputRoute.bluetooth,
        ),
        isTrue,
      );
      expect(
        isExplicitVoiceOutputRoute(
          route: VoiceOutputRoute.speaker,
          preference: VoiceOutputRoute.speaker,
          override: VoiceOutputRoute.bluetooth,
        ),
        isFalse,
      );
    });

    test('the built-in preference is explicit, automatic bluetooth is not', () {
      expect(
        isExplicitVoiceOutputRoute(
          route: VoiceOutputRoute.earpiece,
          preference: VoiceOutputRoute.earpiece,
          override: null,
        ),
        isTrue,
      );
      expect(
        isExplicitVoiceOutputRoute(
          route: VoiceOutputRoute.bluetooth,
          preference: VoiceOutputRoute.earpiece,
          override: null,
        ),
        isFalse,
      );
    });
  });
}
