import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/fluxer_sfx_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
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
}
