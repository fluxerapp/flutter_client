import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart';

String screenShareResolutionLabel(
  FluxerLocalizations l10n,
  ScreenshareResolution resolution,
) {
  return switch (resolution) {
    ScreenshareResolution.low480p => l10n.audioAndVideoCameraQuality480pLabel,
    ScreenshareResolution.medium => l10n.audioAndVideoCameraQuality720pLabel,
    ScreenshareResolution.high => l10n.audioAndVideoCameraQuality1080pLabel,
    ScreenshareResolution.ultra => l10n.audioAndVideoQuality1440pLabel,
    ScreenshareResolution.source => l10n.audioAndVideoQualitySourceLabel,
  };
}

String cameraResolutionLabel(
  FluxerLocalizations l10n,
  CameraResolution resolution,
) {
  return switch (resolution) {
    CameraResolution.low => l10n.audioAndVideoCameraQuality480pLabel,
    CameraResolution.medium => l10n.audioAndVideoCameraQuality720pLabel,
    CameraResolution.high => l10n.audioAndVideoCameraQuality1080pLabel,
  };
}

String screenShareFrameRateLabel(FluxerLocalizations l10n, int frameRate) {
  return switch (frameRate) {
    15 => l10n.audioAndVideoFrameRate15Label,
    30 => l10n.audioAndVideoFrameRate30Label,
    60 => l10n.audioAndVideoFrameRate60Label,
    _ => l10n.audioAndVideoFrameRate120Label,
  };
}

String streamingModeLabel(FluxerLocalizations l10n, StreamingMode mode) {
  return switch (mode) {
    StreamingMode.gaming => l10n.audioAndVideoStreamingModeGaming,
    StreamingMode.screenshare => l10n.audioAndVideoStreamingModeScreenShare,
    StreamingMode.custom => l10n.audioAndVideoStreamingModeCustom,
  };
}

String screenShareBitrateLabel(FluxerLocalizations l10n, int bitrateBps) {
  final String megabits = NumberFormat.decimalPatternDigits(
    locale: l10n.localeName,
    decimalDigits: bitrateBps % 1000000 == 0 ? 0 : 1,
  ).format(bitrateBps / 1000000);
  return l10n.audioAndVideoScreenShareBitrateMbps(megabits);
}
