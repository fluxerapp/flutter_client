import 'dart:io';

import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String screenShareSourceLabel(
  FluxerLocalizations l10n,
  ScreenShareSource source,
) {
  if (source.name.isNotEmpty) {
    return source.name;
  }
  return switch (source.kind) {
    ScreenShareSourceKind.window => l10n.voiceScreenSharePickerWindowFallback,
    ScreenShareSourceKind.screen => l10n.voiceScreenSharePickerDisplayFallback,
  };
}

String? streamingModeHint(FluxerLocalizations l10n, StreamingMode mode) {
  return switch (mode) {
    StreamingMode.gaming => l10n.voiceScreenSharePickerSmootherVideo,
    StreamingMode.screenshare => l10n.voiceScreenSharePickerClearerText,
    StreamingMode.custom => null,
  };
}

String screenShareAudioSummary(FluxerLocalizations l10n) {
  return Platform.isMacOS
      ? l10n.voiceScreenShareAudioNone
      : l10n.voiceScreenShareAudioEntireSystem;
}
