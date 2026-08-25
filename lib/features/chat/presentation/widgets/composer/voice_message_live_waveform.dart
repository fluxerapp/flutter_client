import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceMessageMobileWaveform extends StatelessWidget {
  const VoiceMessageMobileWaveform({required this.bars, super.key});

  final List<double> bars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(kVoiceMessageWaveformBarCount, (
          int index,
        ) {
          final double value = index < bars.length ? bars[index] : 0;
          final double heightFactor = (0.2 + value * 0.8).clamp(0.2, 1.0);
          return Container(
            width: 3,
            height: 24 * heightFactor,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(999),
            ),
          );
        }),
      ),
    );
  }
}

class VoiceMessageDesktopLiveWaveform extends StatelessWidget {
  const VoiceMessageDesktopLiveWaveform({required this.amplitudes, super.key});

  final List<double> amplitudes;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const double barTotalWidth =
            kVoiceMessageLiveWaveformBarWidthPx +
            kVoiceMessageLiveWaveformBarGapPx;
        final double trackWidth = amplitudes.length * barTotalWidth + 16;
        final double translateX = constraints.maxWidth > 0
            ? (constraints.maxWidth - trackWidth).clamp(
                constraints.maxWidth - trackWidth,
                0,
              )
            : 0;
        const double maxBarHeight =
            kVoiceMessageLiveWaveformViewportHeightPx *
            kVoiceMessageLiveWaveformMaxBarHeightRatio;
        return ClipRect(
          child: SizedBox(
            height: kVoiceMessageLiveWaveformViewportHeightPx.toDouble(),
            child: Transform.translate(
              offset: Offset(translateX, 0),
              child: Row(
                children: List<Widget>.generate(amplitudes.length, (int index) {
                  final double normalised = amplitudes[index].clamp(0, 1);
                  final double heightPx = (normalised * maxBarHeight).clamp(
                    kVoiceMessageLiveWaveformMinVisibleHeightPx,
                    maxBarHeight,
                  );
                  final bool isRecent =
                      index >=
                      amplitudes.length -
                          kVoiceMessageLiveWaveformRecentBarCount;
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: kVoiceMessageLiveWaveformBarGapPx,
                    ),
                    child: Container(
                      width: kVoiceMessageLiveWaveformBarWidthPx,
                      height: heightPx,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface
                            .withValues(alpha: isRecent ? 0.75 : 0.45),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Maps the latest PCM window onto 24 bars. Ported from the web mobile recorder
// (peak per segment, sqrt shaping, then eased toward the previous frame).
List<double> computeLiveWaveformBarsFromPcmWindow({
  required Uint8List pcmLe16,
  required List<double> previous,
}) {
  final List<double> next = List<double>.filled(
    kVoiceMessageWaveformBarCount,
    0,
  );
  final int sampleCount = pcmLe16.length ~/ 2;
  if (sampleCount == 0) {
    for (int i = 0; i < kVoiceMessageWaveformBarCount; i++) {
      next[i] = (previous.length > i ? previous[i] : 0) * 0.55;
    }
    return next;
  }
  final ByteData data = ByteData.sublistView(pcmLe16);
  final int step = math.max(1, sampleCount ~/ kVoiceMessageWaveformBarCount);
  for (int i = 0; i < kVoiceMessageWaveformBarCount; i++) {
    final int start = i * step;
    final int end = math.min(sampleCount, start + step);
    double peak = 0;
    for (int j = start; j < end; j++) {
      final int intSample = data.getInt16(j * 2, Endian.little);
      final double normalised = (intSample / 32768).abs();
      if (normalised > peak) {
        peak = normalised;
      }
    }
    final double shaped = math.sqrt(peak);
    final double prev = previous.length > i ? previous[i] : 0;
    // Same 0.55 / 0.45 mix as VoiceMessageRecorder.tsx.
    next[i] = prev * 0.55 + shaped * 0.45;
  }
  return next;
}

// Single level for the desktop composer strip (RMS over the window, capped).
double computeLiveRmsAmplitudeFromPcmWindow(Uint8List pcmLe16) {
  final int sampleCount = pcmLe16.length ~/ 2;
  if (sampleCount == 0) {
    return 0;
  }
  final ByteData data = ByteData.sublistView(pcmLe16);
  double sumSquares = 0;
  for (int i = 0; i < sampleCount; i++) {
    final int intSample = data.getInt16(i * 2, Endian.little);
    final double normalised = intSample / 32768;
    sumSquares += normalised * normalised;
  }
  final double rms = math.sqrt(sumSquares / sampleCount);
  return math.min(1, rms * 2.5);
}

// Fallback when only per tick dB levels are available (file capture path).
List<double> computeLiveWaveformBarsFromAmplitudeHistory({
  required List<double> previous,
  required List<double> amplitudes,
}) {
  final List<double> next = List<double>.filled(
    kVoiceMessageWaveformBarCount,
    0,
  );
  if (amplitudes.isEmpty) {
    for (int i = 0; i < kVoiceMessageWaveformBarCount; i++) {
      next[i] = (previous.length > i ? previous[i] : 0) * 0.55;
    }
    return next;
  }
  final int count = amplitudes.length;
  for (int i = 0; i < kVoiceMessageWaveformBarCount; i++) {
    final int sourceIndex = count - kVoiceMessageWaveformBarCount + i;
    final double peak = sourceIndex >= 0 ? amplitudes[sourceIndex] : 0;
    final double shaped = math.sqrt(peak);
    final double prev = previous.length > i ? previous[i] : 0;
    next[i] = prev * 0.55 + shaped * 0.45;
  }
  return next;
}

bool voiceMessageLockGesturePassesThreshold({
  required Offset pointerStart,
  required Offset globalPosition,
}) {
  return pointerStart.dy - globalPosition.dy >=
          kVoiceMessageLockDragMinVerticalDeltaPx &&
      (globalPosition.dx - pointerStart.dx).abs() <=
          kVoiceMessageLockDragMaxHorizontalDeltaPx;
}
