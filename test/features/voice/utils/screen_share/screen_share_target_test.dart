import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:test/test.dart';

VideoQualityCaps _caps(int height, int frameRate) => VideoQualityCaps(
  screenShareMaxHeight: height,
  screenShareMaxFrameRate: frameRate,
  cameraMaxHeight: 720,
);

void main() {
  group('caps', () {
    test('resolution is capped to the tallest allowed rung', () {
      expect(
        capScreenShareResolution(_caps(720, 30), ScreenshareResolution.source),
        ScreenshareResolution.medium,
      );
      expect(
        capScreenShareResolution(_caps(1080, 30), ScreenshareResolution.source),
        ScreenshareResolution.high,
      );
      expect(
        capScreenShareResolution(_caps(1440, 30), ScreenshareResolution.source),
        ScreenshareResolution.ultra,
      );
      expect(
        capScreenShareResolution(_caps(2160, 30), ScreenshareResolution.source),
        ScreenshareResolution.source,
      );
      expect(
        capScreenShareResolution(_caps(2160, 30), ScreenshareResolution.medium),
        ScreenshareResolution.medium,
      );
    });

    test('frame rate is capped to the allowed rung', () {
      expect(capScreenShareFrameRate(_caps(720, 30), 120), 30);
      expect(capScreenShareFrameRate(_caps(720, 60), 120), 60);
      expect(capScreenShareFrameRate(_caps(720, 120), 120), 120);
      expect(capScreenShareFrameRate(_caps(720, 45), 60), 30);
      expect(capScreenShareFrameRate(_caps(720, 60), 15), 15);
    });

    test('limitedTo takes the lower value of each cap', () {
      expect(
        VideoQualityCaps.full.limitedTo(VideoQualityCaps.phone),
        VideoQualityCaps.phone,
      );
      expect(VideoQualityCaps.full.isFull, isTrue);
      expect(VideoQualityCaps.phone.isFull, isFalse);
    });

    test('device caps follow the platform and P2P', () {
      expect(
        deviceVideoQualityCaps(nativeMobile: false, mobile: false, p2p: true),
        VideoQualityCaps.full,
      );
      final VideoQualityCaps phoneP2p = deviceVideoQualityCaps(
        nativeMobile: true,
        mobile: true,
        p2p: true,
      );
      expect(phoneP2p.screenShareMaxHeight, 1080);
      expect(phoneP2p.screenShareMaxFrameRate, 30);
      expect(phoneP2p.cameraMaxHeight, 720);
    });
  });

  group('presets', () {
    test('presets resolve through the caps', () {
      expect(
        resolveScreenShareQuality(
          mode: StreamingMode.gaming,
          storedResolution: ScreenshareResolution.low480p,
          storedFrameRate: 15,
          caps: VideoQualityCaps.full,
        ),
        (resolution: ScreenshareResolution.ultra, frameRate: 60),
      );
      expect(
        resolveScreenShareQuality(
          mode: StreamingMode.screenshare,
          storedResolution: ScreenshareResolution.low480p,
          storedFrameRate: 15,
          caps: VideoQualityCaps.base,
        ),
        (resolution: ScreenshareResolution.medium, frameRate: 30),
      );
      expect(
        resolveScreenShareQuality(
          mode: StreamingMode.custom,
          storedResolution: ScreenshareResolution.low480p,
          storedFrameRate: 15,
          caps: VideoQualityCaps.base,
        ),
        (resolution: ScreenshareResolution.low480p, frameRate: 15),
      );
    });

    test('only custom quality above the caps is tier limited', () {
      const VoiceSettingsState saved = VoiceSettingsState(
        streamingMode: StreamingMode.custom,
        screenshareResolution: ScreenshareResolution.ultra,
      );
      expect(isScreenShareTierLimited(saved, VideoQualityCaps.base), isTrue);
      expect(isScreenShareTierLimited(saved, VideoQualityCaps.full), isFalse);
      expect(
        isScreenShareTierLimited(
          saved.copyWith(streamingMode: StreamingMode.gaming),
          VideoQualityCaps.base,
        ),
        isFalse,
      );
    });
  });

  group('quality picks', () {
    const VoiceSettingsState preset = VoiceSettingsState();

    test('picking a resolution keeps the preset frame rate', () {
      expect(
        resolveScreenShareQualityPick(
          settings: preset,
          caps: VideoQualityCaps.full,
          resolution: ScreenshareResolution.ultra,
        ),
        (resolution: ScreenshareResolution.ultra, frameRate: null),
      );
    });

    test('picking a frame rate keeps the preset resolution', () {
      expect(
        resolveScreenShareQualityPick(
          settings: preset,
          caps: VideoQualityCaps.full,
          frameRate: 60,
        ),
        (resolution: ScreenshareResolution.high, frameRate: 60),
      );
    });

    test('locked or unchanged picks do nothing', () {
      expect(
        resolveScreenShareQualityPick(
          settings: preset,
          caps: VideoQualityCaps.base,
          resolution: ScreenshareResolution.high,
        ),
        isNull,
      );
      expect(
        resolveScreenShareQualityPick(
          settings: preset,
          caps: VideoQualityCaps.base,
          frameRate: 60,
        ),
        isNull,
      );
      expect(
        resolveScreenShareQualityPick(
          settings: preset,
          caps: VideoQualityCaps.full,
          resolution: ScreenshareResolution.high,
        ),
        isNull,
      );
    });
  });

  group('bitrate', () {
    int bitrate(
      ScreenshareResolution resolution,
      int frameRate, {
      int ceiling = 9000000,
      int? chosen,
    }) {
      return resolveScreenShareTarget(
        settings: VoiceSettingsState(
          streamingMode: StreamingMode.custom,
          screenshareResolution: resolution,
          videoFrameRate: frameRate,
        ),
        caps: VideoQualityCaps.full,
        bitrate: ScreenShareBitrateBudget(
          ceilingBps: ceiling,
          chosenBps: chosen,
        ),
      ).maxBitrate;
    }

    test('uses the rung floor or the pixel rate, under the ceiling', () {
      expect(bitrate(ScreenshareResolution.medium, 30), 3000000);
      expect(bitrate(ScreenshareResolution.ultra, 60), 6000000);
      expect(bitrate(ScreenshareResolution.source, 120), 9000000);
    });

    test('a raised ceiling scales the automatic bitrate', () {
      expect(
        bitrate(ScreenshareResolution.source, 30, ceiling: 18000000),
        12000000,
      );
    });

    test('a lowered ceiling caps every bitrate', () {
      expect(
        bitrate(ScreenshareResolution.medium, 30, ceiling: 2000000),
        2000000,
      );
    });

    test('a chosen bitrate wins, up to the ceiling', () {
      expect(
        bitrate(ScreenshareResolution.medium, 30, chosen: 8000000),
        8000000,
      );
      expect(
        bitrate(
          ScreenshareResolution.medium,
          30,
          ceiling: 6000000,
          chosen: 8000000,
        ),
        6000000,
      );
    });

    test('a chosen bitrate needs higher quality', () {
      expect(
        screenShareBitrateBudget(
          ceilingBps: 9000000,
          chosenBps: 4000000,
          canChoose: false,
        ).chosenBps,
        isNull,
      );
    });

    test('options stop at the ceiling and keep the chosen value', () {
      expect(
        screenShareBitrateOptions(ScreenShareBitrateBudget.automatic),
        <int>[2000000, 4000000, 6000000, 8000000, 9000000],
      );
      expect(
        screenShareBitrateOptions(
          const ScreenShareBitrateBudget(
            ceilingBps: 9000000,
            chosenBps: 5000000,
          ),
        ),
        <int>[2000000, 4000000, 5000000, 6000000, 8000000, 9000000],
      );
    });
  });

  group('source fit', () {
    test('a larger source is scaled to the pixel budget', () {
      final ScreenShareTarget target = resolveScreenShareTarget(
        settings: const VoiceSettingsState(),
        caps: VideoQualityCaps.base,
        bitrate: ScreenShareBitrateBudget.automatic,
        source: const VideoDimensions(3840, 2160),
      );
      expect(target.width, 1280);
      expect(target.height, 720);
      expect(
        screenShareScaleDownBy(
          source: const VideoDimensions(3840, 2160),
          target: target.dimensions,
        ),
        3,
      );
    });

    test('a smaller source is sent as is at its own rung', () {
      final ScreenShareTarget target = resolveScreenShareTarget(
        settings: const VoiceSettingsState(),
        caps: VideoQualityCaps.full,
        bitrate: ScreenShareBitrateBudget.automatic,
        source: const VideoDimensions(1280, 800),
      );
      expect(target.dimensions, const VideoDimensions(1280, 800));
      expect(target.rung, ScreenshareResolution.medium);
      expect(target.maxBitrate, 3000000);
    });

    test('ultrawide sources keep their aspect ratio', () {
      final ScreenShareTarget target = resolveScreenShareTarget(
        settings: const VoiceSettingsState(),
        caps: VideoQualityCaps.full,
        bitrate: ScreenShareBitrateBudget.automatic,
        source: const VideoDimensions(3440, 1440),
      );
      expect(target.width / target.height, closeTo(3440 / 1440, 0.01));
      expect(target.width * target.height, lessThanOrEqualTo(1920 * 1080));
    });
  });
}
