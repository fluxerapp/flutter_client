import 'dart:math' as math;
import 'dart:typed_data';

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
