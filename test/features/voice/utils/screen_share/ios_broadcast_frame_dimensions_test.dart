import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_presets.dart';
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

    test('sender scale reaches the target from capped frames', () {
      final VideoDimensions source = iosBroadcastFrameDimensions(
        const VideoDimensions(1290, 2796),
      );
      final double scale = screenShareScaleDownBy(
        source: source,
        target: const VideoDimensions(1280, 720),
      );
      expect(source.height / scale, closeTo(1280, 1));
    });
  });

  test('screen audio follows the platform capability', () {
    final ScreenShareCaptureOptions options = screenShareCaptureOptionsFor(
      resolution: ScreenshareResolution.medium,
      frameRate: 30,
    );
    expect(options.captureScreenAudio, screenShareCapturesSystemAudio);
  });
}
