import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/features/voice/providers/voice_p2p_mode_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_p2p_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_video_quality_provider.g.dart';

@Riverpod(keepAlive: true)
bool voiceHigherVideoQuality(Ref ref) {
  return ref.watch(
        instanceFeatureEnabledProvider(LimitKeys.featureHigherVideoQuality),
      ) ||
      ref.watch(activeVoiceChannelModeProvider) == VoiceChannelMode.p2p;
}
