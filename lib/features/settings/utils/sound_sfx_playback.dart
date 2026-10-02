import 'dart:async';

import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:fluxer_app/core/audio/sound_effect_policy.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/sound_type_utils.dart';
import 'package:fluxer_app/features/settings/utils/sound_volume_utils.dart';

Future<void> playFluxerSoundEffect({
  required SoundPreferencesState prefs,
  required FluxerSFX sfx,
  required FluxerSfxClip clip,
  String? soundType,
  bool ignoreRingerPolicy = false,
  bool notificationsEnabled = true,
}) async {
  final String? resolvedSoundType =
      soundType ?? soundTypeForFluxerSfxClip(clip);
  if (resolvedSoundType == null) {
    return;
  }
  if (!shouldPlaySoundEffect(
    soundPrefs: prefs,
    soundType: resolvedSoundType,
    notificationsEnabled: notificationsEnabled,
  )) {
    return;
  }
  final double volume = computeEffectiveSfxVolume(
    prefs: prefs,
    soundType: resolvedSoundType,
  );
  await sfx.playOneShot(
    clip,
    volume: volume,
    ignoreRingerPolicy: ignoreRingerPolicy,
  );
}
