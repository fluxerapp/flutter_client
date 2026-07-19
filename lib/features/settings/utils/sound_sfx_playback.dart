import 'dart:async';

import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/sound_type_utils.dart';
import 'package:fluxer_app/features/settings/utils/sound_volume_utils.dart';

Future<void> playFluxerSoundEffect({
  required SoundPreferencesState prefs,
  required FluxerSFX sfx,
  required FluxerSfxClip clip,
  String? soundType,
  bool ignoreRingerPolicy = false,
}) async {
  final String? resolvedSoundType =
      soundType ?? soundTypeForFluxerSfxClip(clip);
  if (resolvedSoundType == null) {
    return;
  }
  if (!prefs.isSoundTypeEnabled(resolvedSoundType)) {
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
