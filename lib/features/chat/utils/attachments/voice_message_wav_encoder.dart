import 'dart:typed_data';

class VoiceMessagePcmSlice {
  const VoiceMessagePcmSlice({
    required this.samples,
    required this.sampleRate,
    required this.durationSeconds,
  });

  final Float32List samples;
  final int sampleRate;
  final double durationSeconds;
}

double clampVoiceSample(double value, double min, double max) {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

Uint8List encodePcmSliceToWav({
  required Float32List samples,
  required int sampleRate,
  int channels = 1,
}) {
  const int bytesPerSample = 2;
  const int riffHeaderBytes = 44;
  final int frameCount = samples.length;
  final int dataBytes = frameCount * channels * bytesPerSample;
  final int totalBytes = riffHeaderBytes + dataBytes;
  final ByteData view = ByteData(totalBytes);
  int offset = 0;
  void writeString(String value) {
    for (int i = 0; i < value.length; i++) {
      view.setUint8(offset++, value.codeUnitAt(i));
    }
  }

  writeString('RIFF');
  view.setUint32(offset, totalBytes - 8, Endian.little);
  offset += 4;
  writeString('WAVE');
  writeString('fmt ');
  view.setUint32(offset, 16, Endian.little);
  offset += 4;
  view.setUint16(offset, 1, Endian.little);
  offset += 2;
  view.setUint16(offset, channels, Endian.little);
  offset += 2;
  view.setUint32(offset, sampleRate, Endian.little);
  offset += 4;
  view.setUint32(offset, sampleRate * channels * bytesPerSample, Endian.little);
  offset += 4;
  view.setUint16(offset, channels * bytesPerSample, Endian.little);
  offset += 2;
  view.setUint16(offset, bytesPerSample * 8, Endian.little);
  offset += 2;
  writeString('data');
  view.setUint32(offset, dataBytes, Endian.little);
  offset += 4;
  for (int i = 0; i < frameCount; i++) {
    final double sample = clampVoiceSample(samples[i], -1, 1);
    final int intSample = sample < 0
        ? (sample * 0x8000).round()
        : (sample * 0x7fff).round();
    view.setInt16(offset, intSample, Endian.little);
    offset += 2;
  }
  return view.buffer.asUint8List();
}

VoiceMessagePcmSlice? decodeWavMonoPcm(Uint8List bytes) {
  const int riffHeaderBytes = 44;
  if (bytes.length < riffHeaderBytes) {
    return null;
  }
  final ByteData header = ByteData.sublistView(bytes, 0, riffHeaderBytes);
  final String riff = String.fromCharCodes(bytes.sublist(0, 4));
  final String wave = String.fromCharCodes(bytes.sublist(8, 12));
  if (riff != 'RIFF' || wave != 'WAVE') {
    return null;
  }
  final int channels = header.getUint16(22, Endian.little);
  final int sampleRate = header.getUint32(24, Endian.little);
  final int bitsPerSample = header.getUint16(34, Endian.little);
  if (bitsPerSample != 16) {
    return null;
  }
  const int dataOffset = riffHeaderBytes;
  final int dataBytes = bytes.length - dataOffset;
  if (dataBytes <= 0) {
    return null;
  }
  final int totalSamples = dataBytes ~/ (bitsPerSample ~/ 8);
  final int frameCount = totalSamples ~/ channels;
  final Float32List mono = Float32List(frameCount);
  final ByteData data = ByteData.sublistView(bytes, dataOffset);
  for (int frame = 0; frame < frameCount; frame++) {
    double sum = 0;
    for (int c = 0; c < channels; c++) {
      final int index = (frame * channels + c) * 2;
      final int intSample = data.getInt16(index, Endian.little);
      sum += intSample < 0 ? intSample / 0x8000 : intSample / 0x7fff;
    }
    mono[frame] = sum / channels;
  }
  final double durationSeconds = frameCount / sampleRate;
  return VoiceMessagePcmSlice(
    samples: mono,
    sampleRate: sampleRate,
    durationSeconds: durationSeconds,
  );
}

VoiceMessagePcmSlice slicePcm({
  required VoiceMessagePcmSlice source,
  required double startSeconds,
  required double endSeconds,
}) {
  final double clampedStart = clampVoiceSample(
    startSeconds,
    0,
    source.durationSeconds,
  );
  final double clampedEnd = clampVoiceSample(
    endSeconds,
    clampedStart,
    source.durationSeconds,
  );
  final int startFrame = (clampedStart * source.sampleRate).floor();
  final int endFrame = (clampedEnd * source.sampleRate).ceil();
  final int frameCount = (endFrame - startFrame).clamp(
    0,
    source.samples.length,
  );
  final Float32List slice = Float32List(frameCount);
  for (int i = 0; i < frameCount; i++) {
    final int sourceIndex = startFrame + i;
    if (sourceIndex < source.samples.length) {
      slice[i] = source.samples[sourceIndex];
    }
  }
  return VoiceMessagePcmSlice(
    samples: slice,
    sampleRate: source.sampleRate,
    durationSeconds: (clampedEnd - clampedStart).clamp(
      0,
      source.durationSeconds,
    ),
  );
}
