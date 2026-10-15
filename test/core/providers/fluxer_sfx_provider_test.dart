import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/settings/providers/notification_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/message_realtime_test_helpers.dart';

class _TestNotificationPreferences extends NotificationPreferences {
  @override
  NotificationPreferencesState build() {
    return const NotificationPreferencesState(isLoaded: true);
  }
}

class _TestSoundPreferences extends SoundPreferences {
  @override
  SoundPreferencesState build() {
    return const SoundPreferencesState();
  }
}

class _RecordingSfx implements FluxerSFX {
  final List<FluxerSfxClip> played = <FluxerSfxClip>[];

  @override
  Future<void> playOneShot(
    FluxerSfxClip clip, {
    double volume = 0.4,
    bool ignoreRingerPolicy = false,
  }) async {
    played.add(clip);
  }

  @override
  Future<void> dispose() async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const MethodChannel _androidNotificationsChannel = MethodChannel(
  'fluxer_app/android_notifications',
);

const MessagePersistSnapshot _dmSnapshot = MessagePersistSnapshot(
  mentionsCurrentUser: false,
  isDm: true,
  acknowledgedByGateway: false,
);

ProviderContainer _container(_RecordingSfx sfx, {required bool foreground}) {
  final FluxerDatabase db = FluxerDatabase.forTesting(
    LazyDatabase(() => throw const CancellationException()),
  );
  final container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      fluxerSfxProvider.overrideWithValue(sfx),
      notificationPreferencesProvider.overrideWith(
        _TestNotificationPreferences.new,
      ),
      soundPreferencesProvider.overrideWith(_TestSoundPreferences.new),
    ],
  );
  addTearDown(container.dispose);
  container.read(appUiForegroundProvider.notifier).setResumed(foreground);
  container.read(currentUserIdProvider.notifier).set('me');
  container.read(fluxerMessageSfxBindingProvider);
  return container;
}

void _mockAndroidSoundSuppressed({required bool suppressed}) {
  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(_androidNotificationsChannel, (
        MethodCall call,
      ) async {
        if (call.method == 'isNotificationSoundSuppressed') {
          return suppressed;
        }
        return null;
      });
  addTearDown(() {
    debugDefaultTargetPlatformOverride = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_androidNotificationsChannel, null);
  });
}

Future<void> _settle() async {
  await pumpEventQueue();
  await Future<void>.delayed(const Duration(milliseconds: 200));
}

MessageCreateEvent _createEvent(String id) {
  return MessageCreateEvent(
    message: MessageResponseSchema.fromJson(<String, dynamic>{
      'id': id,
      'channel_id': 'c1',
      'author': <String, dynamic>{
        'id': 'other',
        'username': 'user',
        'discriminator': '0001',
        'flags': 0,
      },
      'content': 'hello',
      'timestamp': '2020-01-01T00:00:00.000Z',
      'type': 0,
      'flags': 0,
      'pinned': false,
      'mention_everyone': false,
      'tts': false,
      'mentions': <dynamic>[],
      'mention_roles': <dynamic>[],
    }),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  });

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test(
    'message sfx binding survives a database cancellation mid-event',
    () async {
      final FluxerDatabase db = FluxerDatabase.forTesting(
        LazyDatabase(() => throw const CancellationException()),
      );
      final _RecordingSfx sfx = _RecordingSfx();
      final container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          fluxerSfxProvider.overrideWithValue(sfx),
          notificationPreferencesProvider.overrideWith(
            _TestNotificationPreferences.new,
          ),
          soundPreferencesProvider.overrideWith(_TestSoundPreferences.new),
        ],
      );
      addTearDown(container.dispose);
      container.read(appUiForegroundProvider.notifier).setResumed(true);
      container.read(currentUserIdProvider.notifier).set('me');
      container.read(fluxerMessageSfxBindingProvider);

      container
          .read(messageRealtimeBusProvider)
          .emit(testMessageCreated(_createEvent('1')));

      await pumpEventQueue();
      await Future<void>.delayed(const Duration(milliseconds: 200));

      expect(sfx.played, <FluxerSfxClip>[FluxerSfxClip.message]);
    },
  );
  test(
    'foreground message on another channel plays the message sound',
    () async {
      final _RecordingSfx sfx = _RecordingSfx();
      final ProviderContainer container = _container(sfx, foreground: true);

      container
          .read(messageRealtimeBusProvider)
          .emit(testMessageCreated(_createEvent('10')));
      await _settle();

      expect(sfx.played, <FluxerSfxClip>[FluxerSfxClip.message]);
    },
  );

  test('backgrounded app plays no message sound', () async {
    final _RecordingSfx sfx = _RecordingSfx();
    final ProviderContainer container = _container(sfx, foreground: false);

    container
        .read(messageRealtimeBusProvider)
        .emit(testMessageCreated(_createEvent('11')));
    await _settle();

    expect(sfx.played, isEmpty);
  });

  test(
    'a direct message delivered during a background push wake is silent',
    () async {
      final _RecordingSfx sfx = _RecordingSfx();
      final ProviderContainer container = _container(sfx, foreground: false);

      container
          .read(messageRealtimeBusProvider)
          .emit(testMessageCreated(_createEvent('12'), snapshot: _dmSnapshot));
      await _settle();

      expect(sfx.played, isEmpty);
    },
  );

  test('a queued sound is dropped when the app is backgrounded', () async {
    final _RecordingSfx sfx = _RecordingSfx();
    final ProviderContainer container = _container(sfx, foreground: true);

    container
        .read(messageRealtimeBusProvider)
        .emit(testMessageCreated(_createEvent('13')));
    await pumpEventQueue();
    container.read(appUiForegroundProvider.notifier).setResumed(false);
    await _settle();

    expect(sfx.played, isEmpty);
  });

  test(
    'android do not disturb or silent ringer mutes the foreground sound',
    () async {
      _mockAndroidSoundSuppressed(suppressed: true);
      final _RecordingSfx sfx = _RecordingSfx();
      final ProviderContainer container = _container(sfx, foreground: true);

      container
          .read(messageRealtimeBusProvider)
          .emit(testMessageCreated(_createEvent('14'), snapshot: _dmSnapshot));
      await _settle();

      expect(sfx.played, isEmpty);
    },
  );

  test('android with sound allowed plays the foreground sound', () async {
    _mockAndroidSoundSuppressed(suppressed: false);
    final _RecordingSfx sfx = _RecordingSfx();
    final ProviderContainer container = _container(sfx, foreground: true);

    container
        .read(messageRealtimeBusProvider)
        .emit(testMessageCreated(_createEvent('15'), snapshot: _dmSnapshot));
    await _settle();

    expect(sfx.played, <FluxerSfxClip>[FluxerSfxClip.directMessage]);
  });
}
