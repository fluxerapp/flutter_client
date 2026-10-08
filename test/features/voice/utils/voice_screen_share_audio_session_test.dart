import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_screen_share_audio_session.dart';
import 'package:fluxer_app/features/voice/utils/voice_track_renderer_cache.dart';

void main() {
  VoiceScreenShareAudioSession<Object> session({required List<String> events}) {
    return VoiceScreenShareAudioSession<Object>(
      start: (Object _) async {
        events.add('start');
      },
      stop: (Object _) async {
        events.add('stop');
      },
    );
  }

  void tick(FakeAsync async, [Duration duration = Duration.zero]) {
    async
      ..elapse(duration)
      ..flushMicrotasks();
  }

  group('VoiceScreenShareAudioSession', () {
    test('does not stop a track that is retained again inside the grace', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        unawaited(playback.retain(track));
        tick(async);
        playback.release(track);
        tick(async, const Duration(milliseconds: 200));
        unawaited(playback.retain(track));
        tick(async, kVoiceTrackHandoffGrace);

        expect(events, <String>['start']);
      });
    });

    test('stops once after the grace period', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        unawaited(playback.retain(track));
        tick(async);
        playback.release(track);

        tick(async, kVoiceTrackHandoffGrace - const Duration(milliseconds: 1));
        expect(events, <String>['start']);

        tick(async, const Duration(milliseconds: 1));
        expect(events, <String>['start', 'stop']);

        tick(async, kVoiceTrackHandoffGrace);
        expect(events, <String>['start', 'stop']);
      });
    });

    test('only the retain that starts playback reports started', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        bool? first;
        bool? second;
        unawaited(playback.retain(track).then((bool value) => first = value));
        unawaited(playback.retain(track).then((bool value) => second = value));
        tick(async);
        expect(first, isTrue);
        expect(second, isFalse);
        expect(events, <String>['start']);

        playback
          ..release(track)
          ..release(track);
        tick(async, kVoiceTrackHandoffGrace);
        expect(events, <String>['start', 'stop']);

        bool? again;
        unawaited(playback.retain(track).then((bool value) => again = value));
        tick(async);
        expect(again, isTrue);
        expect(events, <String>['start', 'stop', 'start']);
      });
    });

    test('a second retain does not start the track again', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        unawaited(playback.retain(track));
        unawaited(playback.retain(track));
        tick(async);
        playback.release(track);
        tick(async, kVoiceTrackHandoffGrace);

        expect(events, <String>['start']);
      });
    });

    test('mute stops immediately and a later retain starts again', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        unawaited(playback.retain(track));
        tick(async);
        playback.release(track, immediate: true);
        tick(async);
        expect(events, <String>['start', 'stop']);

        unawaited(playback.retain(track));
        tick(async);
        expect(events, <String>['start', 'stop', 'start']);
      });
    });

    test('ending the session stops idle playback immediately', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        unawaited(playback.retain(track));
        tick(async);
        playback
          ..release(track)
          ..markSessionEnded();
        tick(async);
        expect(events, <String>['start', 'stop']);

        tick(async, kVoiceTrackHandoffGrace);
        expect(events, <String>['start', 'stop']);
      });
    });

    test('a failed start does not stick after release', () {
      fakeAsync((FakeAsync async) {
        var fail = true;
        var starts = 0;
        final List<String> stops = <String>[];
        final VoiceScreenShareAudioSession<Object> playback =
            VoiceScreenShareAudioSession<Object>(
              start: (Object _) async {
                starts++;
                if (fail) {
                  throw StateError('start failed');
                }
              },
              stop: (Object _) async {
                stops.add('stop');
              },
            );
        final Object track = Object();
        unawaited(
          playback.retain(track).then<void>((_) {}, onError: (_, _) {}),
        );
        tick(async);
        playback.release(track, immediate: true);
        tick(async);
        expect(stops, isEmpty);

        fail = false;
        unawaited(playback.retain(track));
        tick(async);
        expect(starts, 2);
        expect(stops, isEmpty);
      });
    });

    test('drain waits for stop chain to finish', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        unawaited(playback.retain(track));
        tick(async);
        playback.release(track);
        var drained = false;
        unawaited(playback.drain().then((_) => drained = true));
        tick(async);
        expect(drained, isTrue);
        expect(events, <String>['start', 'stop']);
      });
    });

    test('ending the session stops a held track when it is released', () {
      fakeAsync((FakeAsync async) {
        final List<String> events = <String>[];
        final VoiceScreenShareAudioSession<Object> playback = session(
          events: events,
        );
        final Object track = Object();
        unawaited(playback.retain(track));
        tick(async);
        playback.markSessionEnded();
        tick(async);
        expect(events, <String>['start']);

        playback.release(track);
        tick(async);
        expect(events, <String>['start', 'stop']);
      });
    });
  });
}
