import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_sender.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:test/test.dart';

StatsReport _report(String type, Map<String, Object?> values) =>
    StatsReport(type, type, 0, values);

void main() {
  test('reads the video source size from media-source stats', () {
    final List<StatsReport> reports = <StatsReport>[
      _report('outbound-rtp', <String, Object?>{'frameWidth': 1280}),
      _report('media-source', <String, Object?>{
        'kind': 'audio',
        'trackIdentifier': 'audio',
      }),
      _report('media-source', <String, Object?>{
        'kind': 'video',
        'trackIdentifier': 'screen',
        'width': 3024,
        'height': 1964,
      }),
    ];
    expect(
      screenShareSourceDimensionsFromStats(reports, trackId: 'screen'),
      const VideoDimensions(3024, 1964),
    );
    expect(
      screenShareSourceDimensionsFromStats(reports, trackId: 'camera'),
      isNull,
    );
  });

  test('retries until the source size is known', () async {
    int calls = 0;
    final VideoDimensions? dimensions = await readScreenShareSourceDimensions(
      () async {
        calls++;
        return <StatsReport>[
          if (calls == 3)
            _report('media-source', <String, Object?>{
              'kind': 'video',
              'width': 2560,
              'height': 1440,
            }),
        ];
      },
      interval: Duration.zero,
    );
    expect(dimensions, const VideoDimensions(2560, 1440));
    expect(calls, 3);
  });

  test('the sender encoding scales a desktop capture to the target', () {
    const VideoDimensions source = VideoDimensions(3840, 2160);
    final ScreenShareTarget target = resolveScreenShareTarget(
      settings: const VoiceSettingsState(
        streamingMode: StreamingMode.custom,
        videoFrameRate: 60,
      ),
      caps: VideoQualityCaps.full,
      bitrate: ScreenShareBitrateBudget.automatic,
      source: source,
    );
    final RTCRtpEncoding encoding = screenShareEncoding(
      target: target,
      source: source,
      maxBitrateBps: 2000000,
    );
    expect(encoding.scaleResolutionDownBy, 3);
    expect(encoding.maxFramerate, 60);
    expect(encoding.maxBitrate, 2000000);
  });
}
