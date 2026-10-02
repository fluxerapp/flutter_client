import 'package:fluxer_app/features/voice/utils/voice_stream_audio_utils.dart';
import 'package:test/test.dart';

void main() {
  ScreenSharePlaybackControls controls({
    required List<String> events,
    required bool Function() isActive,
  }) {
    return ScreenSharePlaybackControls(
      isActive: isActive,
      start: () async {
        events.add('start');
      },
      setEnabled: ({required bool enabled}) {
        events.add(enabled ? 'enabled' : 'disabled');
      },
      setGain: (double gain) async {
        events.add('gain:$gain');
      },
    );
  }

  group('ScreenSharePlaybackControls', () {
    test('resume leaves an already active track alone', () async {
      final List<String> events = <String>[];
      final ScreenSharePlaybackControls playback = controls(
        events: events,
        isActive: () => true,
      );

      await playback.resume();

      expect(events, isEmpty);
    });

    test('resume starts a track that LiveKit has not started', () async {
      final List<String> events = <String>[];
      var active = false;
      final ScreenSharePlaybackControls playback = controls(
        events: events,
        isActive: () => active,
      );

      await playback.resume();
      active = true;
      await playback.resume();

      expect(events, <String>['start']);
    });

    test('pause mutes without stopping the track', () async {
      final List<String> events = <String>[];
      final ScreenSharePlaybackControls playback = controls(
        events: events,
        isActive: () => true,
      );

      await playback.pause();

      expect(events, <String>['disabled', 'gain:0.0']);
    });

    test('unmute sets enabled and the requested gain', () async {
      final List<String> events = <String>[];
      final ScreenSharePlaybackControls playback = controls(
        events: events,
        isActive: () => true,
      );

      await playback.apply(muted: false, gain: 1);

      expect(events, <String>['enabled', 'gain:1.0']);
    });

    test(
      'opening an unmuted stream flips enabled before setting gain',
      () async {
        final List<String> events = <String>[];
        final ScreenSharePlaybackControls playback = controls(
          events: events,
          isActive: () => true,
        );

        await playback.apply(muted: false, gain: 1, flipEnabled: true);

        expect(events, <String>['disabled', 'enabled', 'gain:1.0']);
      },
    );

    test('a muted stream stays silent when playback starts', () async {
      final List<String> events = <String>[];
      final ScreenSharePlaybackControls playback = controls(
        events: events,
        isActive: () => true,
      );

      await playback.apply(muted: true, gain: 1, flipEnabled: true);

      expect(events, <String>['disabled', 'gain:0.0']);
    });
  });
}
