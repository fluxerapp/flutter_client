import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/audio_and_video/screen_share_settings_view.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/providers/voice_video_quality_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_share_settings_view_provider.g.dart';

@riverpod
ScreenShareSettingsView screenShareSettingsView(Ref ref) {
  return resolveScreenShareSettingsView(
    settings: ref.watch(voiceSettingsProvider),
    entitlementCaps: ref.watch(voiceVideoQualityCapsProvider),
    deviceCaps: ref.watch(voiceDeviceVideoQualityCapsProvider),
    bitrate: ref.watch(voiceScreenShareBitrateBudgetProvider),
    showsPremiumFeatures: ref.watch(
      instanceRuntimeConfigProvider.select(
        (config) => config.showsPremiumFeatures,
      ),
    ),
  );
}

@riverpod
VideoQualityCaps screenShareEffectiveCaps(Ref ref) {
  return ref
      .watch(voiceVideoQualityCapsProvider)
      .limitedTo(ref.watch(voiceDeviceVideoQualityCapsProvider));
}
