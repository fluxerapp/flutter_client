import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_presets.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:livekit_client/livekit_client.dart';

void main() {
  group('iosBroadcastFrameDimensions', () {
    test('caps the long edge and keeps the aspect ratio', () {
      final VideoDimensions capped = iosBroadcastFrameDimensions(
        const VideoDimensions(1290, 2796),
      );
      expect(capped.height, kIosBroadcastMaxLongEdge);
      expect(capped.width, 886);
    });

    test('caps landscape displays', () {
      final VideoDimensions capped = iosBroadcastFrameDimensions(
        const VideoDimensions(2796, 1290),
      );
      expect(capped.width, kIosBroadcastMaxLongEdge);
      expect(capped.height, 886);
    });

    test('leaves smaller displays unchanged', () {
      final VideoDimensions capped = iosBroadcastFrameDimensions(
        const VideoDimensions(750, 1334),
      );
      expect(capped.width, 750);
      expect(capped.height, 1334);
    });

    test('sender scale reaches the target pixel budget from capped frames', () {
      final VideoDimensions source = iosBroadcastFrameDimensions(
        const VideoDimensions(1290, 2796),
      );
      final double scale = screenShareScaleDownBy(
        source: source,
        target: const VideoDimensions(1280, 720),
      );
      final double sentPixels =
          (source.width / scale) * (source.height / scale);
      expect(sentPixels, closeTo(1280 * 720, 1));
    });

    test('a 1080p target sends capped iPhone frames unscaled', () {
      final VideoDimensions source = iosBroadcastFrameDimensions(
        const VideoDimensions(1290, 2796),
      );
      expect(
        screenShareScaleDownBy(
          source: source,
          target: const VideoDimensions(1920, 1080),
        ),
        1,
      );
    });
  });

  test('screen audio follows the platform capability', () {
    final ScreenShareCaptureOptions options = screenShareCaptureOptionsFor(
      resolveScreenShareTarget(
        settings: const VoiceSettingsState(),
        caps: VideoQualityCaps.base,
        bitrate: ScreenShareBitrateBudget.automatic,
      ),
    );
    expect(options.captureScreenAudio, screenShareCapturesSystemAudio);
  });
}
