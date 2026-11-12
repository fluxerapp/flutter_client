import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/features/voice/providers/voice_p2p_mode_provider.dart';
import 'package:fluxer_app/features/voice/utils/e2ee/p2p_mode.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_presets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_video_quality_provider.g.dart';

@Riverpod(keepAlive: true)
VideoQualityCaps instanceVideoQualityCaps(Ref ref) {
  if (ref.watch(
    instanceFeatureEnabledProvider(LimitKeys.featureHigherVideoQuality),
  )) {
    return VideoQualityCaps.full;
  }
  return VideoQualityCaps(
    screenShareMaxHeight: ref.watch(
      instanceLimitProvider(LimitKeys.maxScreenShareResolution),
    ),
    screenShareMaxFrameRate: ref.watch(
      instanceLimitProvider(LimitKeys.maxScreenShareFrameRate),
    ),
    cameraMaxHeight: ref.watch(
      instanceLimitProvider(LimitKeys.maxCameraResolution),
    ),
  );
}

@Riverpod(keepAlive: true)
VideoQualityCaps voiceVideoQualityCaps(Ref ref) {
  if (ref.watch(activeVoiceChannelModeProvider) == VoiceChannelMode.p2p) {
    return VideoQualityCaps.full;
  }
  return ref.watch(instanceVideoQualityCapsProvider);
}
