import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_stream_info.dart';

void main() {
  group('voiceStreamResolutionLabel', () {
    test('snaps to the nearest named height', () {
      expect(voiceStreamResolutionLabel(250), '240p');
      expect(voiceStreamResolutionLabel(500), '480p');
      expect(voiceStreamResolutionLabel(700), '720p');
      expect(voiceStreamResolutionLabel(1100), '1080p');
      expect(voiceStreamResolutionLabel(1400), '1440p');
      expect(voiceStreamResolutionLabel(2100), '4K');
    });
  });

  group('voiceStreamQualityLabel', () {
    test('omits fps when it is missing', () {
      expect(voiceStreamQualityLabel(height: 1080, fps: 0), '1080p');
    });

    test('appends fps when present', () {
      expect(voiceStreamQualityLabel(height: 720, fps: 30), '720p 30 FPS');
    });
  });

  group('parsePositiveFrameRate', () {
    test('rounds finite numbers and ignores junk', () {
      expect(parsePositiveFrameRate(29.6), 30);
      expect(parsePositiveFrameRate('15'), 15);
      expect(parsePositiveFrameRate(0), 0);
      expect(parsePositiveFrameRate(null), 0);
    });
  });

  group('voiceStreamFpsFromSettings', () {
    test('reads common webrtc keys', () {
      expect(
        voiceStreamFpsFromSettings(<String, dynamic>{'maxFrameRate': 30}),
        30,
      );
      expect(
        voiceStreamFpsFromSettings(<String, dynamic>{'frameRate': 59.9}),
        60,
      );
    });
  });

  group('firstPositiveFrameRate', () {
    test('prefers the first available source', () {
      expect(firstPositiveFrameRate(const <int>[0, 24, 30]), 24);
    });
  });

  group('maxPositiveFrameRate', () {
    test('keeps the highest positive fps', () {
      expect(maxPositiveFrameRate(<num?>[0, 15, 29.6, null]), 30);
    });
  });

  group('resolveVoiceStreamLabelHeight', () {
    test('prefers encoded stats over capture publication size', () {
      expect(
        resolveVoiceStreamLabelHeight(
          statsWidth: 2560,
          statsHeight: 1440,
          publicationWidth: 3840,
          publicationHeight: 2160,
        ),
        1440,
      );
      expect(
        voiceStreamResolutionLabel(
          resolveVoiceStreamLabelHeight(
            statsHeight: 1440,
            publicationHeight: 2160,
          ),
        ),
        '1440p',
      );
    });

    test('labels a portrait frame by its landscape class', () {
      expect(
        resolveVoiceStreamLabelHeight(statsWidth: 576, statsHeight: 1280),
        720,
      );
      expect(
        resolveVoiceStreamLabelHeight(statsWidth: 857, statsHeight: 1920),
        1080,
      );
      expect(
        voiceStreamResolutionLabel(
          resolveVoiceStreamLabelHeight(statsWidth: 1080, statsHeight: 2424),
        ),
        '1440p',
      );
    });

    test('picks the largest sender frame', () {
      expect(
        voiceStreamLargestFrame(
          widths: <num?>[320, 576, null],
          heights: <num?>[720, 1280, 2160],
        ),
        (width: 576, height: 1280),
      );
    });

    test('uses video height, not the short side', () {
      expect(
        resolveVoiceStreamLabelHeight(
          publicationWidth: 2560,
          publicationHeight: 1440,
        ),
        1440,
      );
    });
  });
}
