import 'package:audio_service/audio_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_handler.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';

void main() {
  late ChatAttachmentAudioSession session;
  late ChatAttachmentAudioHandler handler;

  ChatAttachmentAudioHostCallbacks callbacksFor({
    required void Function() onPause,
    required void Function() onResume,
    required void Function(Duration position) onSeek,
    required void Function() onStop,
  }) {
    return ChatAttachmentAudioHostCallbacks(
      onPauseRequested: () async {
        onPause();
      },
      onResumeRequested: () async {
        onResume();
      },
      onSeekRequested: (Duration position) async {
        onSeek(position);
      },
      onStopRequested: () async {
        onStop();
      },
    );
  }

  const MediaItem itemA = MediaItem(id: 'a', title: 'Track A');
  const MediaItem itemB = MediaItem(id: 'b', title: 'Track B');

  setUp(() {
    session = ChatAttachmentAudioSession.instance..resetForTest();
    handler = ChatAttachmentAudioHandler(session);
  });

  test('claiming a new host pauses the previous host', () async {
    var hostAPaused = false;

    await session.claim(
      hostId: 'a',
      mediaItem: itemA,
      callbacks: callbacksFor(
        onPause: () => hostAPaused = true,
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 30),
      speed: 1,
    );

    await session.claim(
      hostId: 'b',
      mediaItem: itemB,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 20),
      speed: 1,
    );

    expect(hostAPaused, isTrue);
    expect(session.isActiveHost('b'), isTrue);
    expect(handler.mediaItem.value, itemB);
    expect(handler.playbackState.value.playing, isTrue);
  });

  test('release suppresses stale in-flight publishes', () async {
    await session.claim(
      hostId: 'a',
      mediaItem: itemA,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    session
      ..update(
        hostId: 'a',
        mediaItem: itemA,
        playing: true,
        position: const Duration(seconds: 3),
        bufferedPosition: const Duration(seconds: 10),
        speed: 1,
      )
      ..release('a');
    expect(handler.mediaItem.value, isNull);

    await pumpEventQueue();

    expect(handler.mediaItem.value, isNull);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.idle,
    );
  });

  test('stale publish does not overwrite a newer active host', () async {
    await session.claim(
      hostId: 'a',
      mediaItem: itemA,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    session.update(
      hostId: 'a',
      mediaItem: itemA,
      playing: true,
      position: const Duration(seconds: 2),
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    await session.claim(
      hostId: 'b',
      mediaItem: itemB,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 20),
      speed: 1,
    );

    await pumpEventQueue();

    expect(session.isActiveHost('b'), isTrue);
    expect(handler.mediaItem.value, itemB);
    expect(handler.playbackState.value.playing, isTrue);
  });

  test('clearActivePlayback stops the active host', () async {
    var stopped = false;

    await session.claim(
      hostId: 'a',
      mediaItem: itemA,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () => stopped = true,
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    await session.clearActivePlayback();

    expect(stopped, isTrue);
    expect(session.isActiveHost('a'), isFalse);
    expect(handler.mediaItem.value, isNull);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.idle,
    );
  });

  test('release only clears the active host', () async {
    await session.claim(
      hostId: 'a',
      mediaItem: itemA,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    session.release('b');
    expect(session.isActiveHost('a'), isTrue);

    session.release('a');
    expect(session.isActiveHost('a'), isFalse);
    expect(handler.mediaItem.value, isNull);
    expect(
      handler.playbackState.value.processingState,
      AudioProcessingState.idle,
    );
  });

  test('system controls forward to the active host', () async {
    var paused = false;
    var resumed = false;
    Duration? seekTarget;
    var stopped = false;

    await session.claim(
      hostId: 'a',
      mediaItem: itemA,
      callbacks: callbacksFor(
        onPause: () => paused = true,
        onResume: () => resumed = true,
        onSeek: (Duration position) => seekTarget = position,
        onStop: () => stopped = true,
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    await session.handleSystemPause();
    await session.handleSystemPlay();
    await session.handleSystemSeek(const Duration(seconds: 4));
    await session.handleSystemStop();

    expect(paused, isTrue);
    expect(resumed, isTrue);
    expect(seekTarget, const Duration(seconds: 4));
    expect(stopped, isTrue);
    expect(session.isActiveHost('a'), isFalse);
  });

  test('update refreshes media item duration for system controls', () async {
    const MediaItem itemWithoutDuration = MediaItem(id: 'a', title: 'Track A');
    const MediaItem itemWithDuration = MediaItem(
      id: 'a',
      title: 'Track A',
      duration: Duration(seconds: 90),
    );

    await session.claim(
      hostId: 'a',
      mediaItem: itemWithoutDuration,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: Duration.zero,
      speed: 1,
    );

    session.update(
      hostId: 'a',
      mediaItem: itemWithDuration,
      playing: true,
      position: const Duration(seconds: 5),
      bufferedPosition: const Duration(seconds: 90),
      speed: 1,
    );

    await pumpEventQueue();

    expect(handler.mediaItem.value?.duration, const Duration(seconds: 90));
    expect(
      handler.playbackState.value.updatePosition,
      const Duration(seconds: 5),
    );
    expect(
      handler.playbackState.value.systemActions,
      contains(MediaAction.seek),
    );
  });

  test('clearForVoiceCall stops playback and blocks new claims', () async {
    var stopped = false;

    await session.claim(
      hostId: 'a',
      mediaItem: itemA,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () => stopped = true,
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    await session.clearForVoiceCall();

    expect(stopped, isTrue);
    expect(session.isActiveHost('a'), isFalse);

    await session.claim(
      hostId: 'b',
      mediaItem: itemB,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    expect(session.isActiveHost('b'), isFalse);

    session.restoreAfterVoiceCall();

    await session.claim(
      hostId: 'b',
      mediaItem: itemB,
      callbacks: callbacksFor(
        onPause: () {},
        onResume: () {},
        onSeek: (_) {},
        onStop: () {},
      ),
      playing: true,
      position: Duration.zero,
      bufferedPosition: const Duration(seconds: 10),
      speed: 1,
    );

    expect(session.isActiveHost('b'), isTrue);
  });
}
