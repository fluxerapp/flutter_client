import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/providers/voice_p2p_mode_provider.dart';
import 'package:fluxer_app/features/voice/utils/e2ee/p2p_mode.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_video_quality_provider.g.dart';

@Riverpod(keepAlive: true)
bool instanceHigherVideoQuality(Ref ref) {
  return ref.watch(
    instanceFeatureEnabledProvider(LimitKeys.featureHigherVideoQuality),
  );
}

@Riverpod(keepAlive: true)
VideoQualityCaps instanceVideoQualityCaps(Ref ref) {
  if (ref.watch(instanceHigherVideoQualityProvider)) {
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
int instanceScreenShareBitrateCeiling(Ref ref) {
  return ref.watch(instanceLimitProvider(LimitKeys.maxScreenShareBitrate));
}

bool _activeChannelIsP2p(Ref ref) {
  return ref.watch(activeVoiceChannelModeProvider) == VoiceChannelMode.p2p;
}

@Riverpod(keepAlive: true)
VideoQualityCaps voiceVideoQualityCaps(Ref ref) {
  if (_activeChannelIsP2p(ref)) {
    return VideoQualityCaps.full;
  }
  return ref.watch(instanceVideoQualityCapsProvider);
}

@Riverpod(keepAlive: true)
VideoQualityCaps voiceDeviceVideoQualityCaps(Ref ref) {
  return deviceVideoQualityCaps(
    nativeMobile: isFluxerNativeMobileOs,
    mobile: isFluxerMobileOs,
    p2p: _activeChannelIsP2p(ref),
  );
}

@Riverpod(keepAlive: true)
ScreenShareBitrateBudget voiceScreenShareBitrateBudget(Ref ref) {
  final bool canChoose =
      _activeChannelIsP2p(ref) || ref.watch(instanceHigherVideoQualityProvider);
  final int ceiling = ref.watch(instanceScreenShareBitrateCeilingProvider);
  final int? chosen = ref.watch(voiceSettingsProvider).screenShareBitrate;
  return screenShareBitrateBudget(
    ceilingBps: ceiling,
    chosenBps: chosen,
    canChoose: canChoose,
  );
}
