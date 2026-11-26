import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:livekit_client/livekit_client.dart';

typedef ScreenShareStatsSource = Future<List<StatsReport>> Function();

const int _kSourceReadAttempts = 10;
const Duration _kSourceReadInterval = Duration(milliseconds: 200);

VideoDimensions? screenShareSourceDimensionsFromStats(
  Iterable<StatsReport> reports, {
  String? trackId,
}) {
  for (final StatsReport report in reports) {
    if (report.type != 'media-source') {
      continue;
    }
    final Map<dynamic, dynamic> values = report.values;
    if (values['kind'] != null && values['kind'] != 'video') {
      continue;
    }
    final Object? identifier = values['trackIdentifier'];
    if (trackId != null && identifier != null && identifier != trackId) {
      continue;
    }
    final Object? width = values['width'];
    final Object? height = values['height'];
    if (width is num && height is num && width > 0 && height > 0) {
      return VideoDimensions(width.round(), height.round());
    }
  }
  return null;
}

Future<VideoDimensions?> readScreenShareSourceDimensions(
  ScreenShareStatsSource stats, {
  String? trackId,
  int attempts = _kSourceReadAttempts,
  Duration interval = _kSourceReadInterval,
}) async {
  for (int attempt = 0; attempt < attempts; attempt++) {
    try {
      final VideoDimensions? dimensions = screenShareSourceDimensionsFromStats(
        await stats(),
        trackId: trackId,
      );
      if (dimensions != null) {
        return dimensions;
      }
    } on Object {
      return null;
    }
    if (attempt < attempts - 1) {
      await Future<void>.delayed(interval);
    }
  }
  return null;
}

RTCDegradationPreference rtcDegradationPreference(
  DegradationPreference preference,
) {
  return switch (preference) {
    DegradationPreference.maintainResolution =>
      RTCDegradationPreference.MAINTAIN_RESOLUTION,
    DegradationPreference.balanced => RTCDegradationPreference.BALANCED,
    DegradationPreference.maintainFramerateAndResolution =>
      RTCDegradationPreference.MAINTAIN_FRAMERATE_AND_RESOLUTION,
    _ => RTCDegradationPreference.MAINTAIN_FRAMERATE,
  };
}

double screenShareSenderScale({
  required ScreenShareTarget target,
  required VideoDimensions? source,
}) {
  if (source == null) {
    return 1;
  }
  return screenShareScaleDownBy(source: source, target: target.dimensions);
}

RTCRtpEncoding screenShareEncoding({
  required ScreenShareTarget target,
  required VideoDimensions? source,
  int? maxBitrateBps,
}) {
  return RTCRtpEncoding(
    maxBitrate: maxBitrateBps ?? target.maxBitrate,
    maxFramerate: target.frameRate,
    scaleResolutionDownBy: screenShareSenderScale(
      target: target,
      source: source,
    ),
    numTemporalLayers: null,
  );
}

Future<void> applyScreenShareSenderTarget({
  required RTCRtpSender sender,
  required ScreenShareTarget target,
  required VideoDimensions? source,
}) async {
  final RTCRtpParameters parameters = sender.parameters;
  final List<RTCRtpEncoding>? encodings = parameters.encodings;
  if (encodings == null || encodings.isEmpty) {
    return;
  }
  final double scale = screenShareSenderScale(target: target, source: source);
  for (final RTCRtpEncoding encoding in encodings) {
    encoding
      ..maxBitrate = target.maxBitrate
      ..maxFramerate = target.frameRate
      ..scaleResolutionDownBy = scale;
  }
  parameters.degradationPreference = rtcDegradationPreference(
    target.degradationPreference,
  );
  try {
    await sender.setParameters(parameters);
  } on Object {
    return;
  }
}
