import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_audio_publish_options.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:test/test.dart';

void main() {
  group('normaliseAudioBitrateBps', () {
    test('keeps stored channel bitrates in bits per second', () {
      expect(normaliseAudioBitrateBps(64000), 64000);
      expect(normaliseAudioBitrateBps(320000), 320000);
    });

    test('accepts legacy kilobit-style values', () {
      expect(normaliseAudioBitrateBps(64), 64000);
      expect(normaliseAudioBitrateBps(384), 384000);
    });

    test('bounds audio bitrates to the Opus range', () {
      expect(normaliseAudioBitrateBps(1), kVoiceChannelMinAudioBitrateBps);
      expect(normaliseAudioBitrateBps(999999), kOpusMaxAudioBitrateBps);
    });

    test('ignores missing or invalid values', () {
      expect(normaliseAudioBitrateBps(null), isNull);
      expect(normaliseAudioBitrateBps(0), isNull);
    });
  });

  group('buildMicrophonePublishOptions', () {
    test('uses the channel bitrate for voice tracks', () {
      final AudioPublishOptions? options = buildMicrophonePublishOptions(
        channelBitrate: 96000,
        processingMode: VoiceProcessingMode.voice,
      );
      expect(options?.encoding?.maxBitrate, 96000);
      expect(options?.encoding?.bitratePriority, Priority.high);
      expect(options?.dtx, isTrue);
    });

    test('disables DTX in studio mode', () {
      final AudioPublishOptions? options = buildMicrophonePublishOptions(
        channelBitrate: 320000,
        processingMode: VoiceProcessingMode.studio,
      );
      expect(options?.encoding?.maxBitrate, 320000);
      expect(options?.dtx, isFalse);
    });

    test('returns null when the channel has no bitrate', () {
      expect(
        buildMicrophonePublishOptions(
          channelBitrate: null,
          processingMode: VoiceProcessingMode.voice,
        ),
        isNull,
      );
    });
  });

  test('screen share audio publish options use max stereo Opus', () {
    expect(
      kScreenShareAudioPublishOptions.encoding?.maxBitrate,
      kOpusMaxAudioBitrateBps,
    );
    expect(kScreenShareAudioPublishOptions.dtx, isFalse);
    expect(kScreenShareAudioPublishOptions.stream, 'screen_share');
  });
}
