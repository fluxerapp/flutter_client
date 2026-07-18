import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_result.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_waveform.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_wav_encoder.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_waveform.dart';
import 'package:fluxer_app/features/voice/utils/microphone_permission.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class VoiceMessagePreparedRecording {
  const VoiceMessagePreparedRecording({
    required this.filePath,
    required this.duration,
    required this.waveform,
    required this.pcm,
  });

  final String filePath;
  final int duration;
  final String waveform;
  final VoiceMessagePcmSlice pcm;
}

enum VoiceMessageCaptureMode { pcmStream, fileWithAmplitude }

// Captures mono audio, writes WAV on stop, and feeds the live waveform UI.
class VoiceMessageRecordingService {
  VoiceMessageRecordingService({AudioRecorder? recorder})
    : _recorder = recorder ?? AudioRecorder();

  final AudioRecorder _recorder;
  final StreamController<void> _maxDurationController =
      StreamController<void>.broadcast();
  final Uint8List _pcmRingBuffer = Uint8List(
    kVoiceMessageLivePcmWindowSamples * 2,
  );
  final Uint8List _pcmWindowSnapshot = Uint8List(
    kVoiceMessageLivePcmWindowSamples * 2,
  );
  final List<double> _amplitudeHistory = <double>[];
  List<double> _smoothedWaveformBars = List<double>.filled(
    kVoiceMessageWaveformBarCount,
    0,
  );

  StreamSubscription<Uint8List>? _pcmSubscription;
  StreamSubscription<Amplitude>? _amplitudeSubscription;
  IOSink? _pcmSink;
  Timer? _maxDurationTimer;
  VoiceMessageCaptureMode _captureMode = VoiceMessageCaptureMode.pcmStream;
  String? _wavOutputPath;
  String? _pcmTempPath;
  int _pcmRingWriteBytes = 0;
  int _pcmTotalBytes = 0;
  DateTime? _startedAt;
  bool _pcmWindowSnapshotDirty = true;

  Stream<void> get onMaxDurationReached => _maxDurationController.stream;

  bool get isRecording => _startedAt != null;

  VoiceMessageCaptureMode get captureMode => _captureMode;

  bool get usesPcmLiveWaveform =>
      _captureMode == VoiceMessageCaptureMode.pcmStream;

  List<double> get liveWaveformBars =>
      List<double>.unmodifiable(_smoothedWaveformBars);

  int get capturedDurationMs {
    if (!isRecording) {
      return 0;
    }
    if (_captureMode == VoiceMessageCaptureMode.pcmStream) {
      final int sampleCount = _pcmTotalBytes ~/ 2;
      return sampleCount * 1000 ~/ kVoiceMessageRecordingSampleRate;
    }
    return DateTime.now().difference(_startedAt!).inMilliseconds;
  }

  Uint8List get livePcmWindow {
    if (!usesPcmLiveWaveform) {
      return Uint8List(0);
    }
    if (_pcmWindowSnapshotDirty) {
      _fillOrderedPcmRingSnapshot(
        ring: _pcmRingBuffer,
        writeHeadBytes: _pcmRingWriteBytes,
        totalBytes: _pcmTotalBytes,
        into: _pcmWindowSnapshot,
      );
      _pcmWindowSnapshotDirty = false;
    }
    return _pcmWindowSnapshot;
  }

  Future<bool> requestPermission() => requestMicrophonePermissionForVoice();

  Future<void> start({
    required int maxDurationSeconds,
    bool isMicrophoneInUse = false,
  }) async {
    if (isRecording) {
      return;
    }
    if (isMicrophoneInUse) {
      throw const VoiceMessageMicrophoneInUseException();
    }
    final SystemPermissionOutcome outcome =
        await requestMicrophonePermissionOutcome();
    if (outcome != SystemPermissionOutcome.granted) {
      talker.warning(
        '[VoiceMessageRecording] Microphone permission not granted',
      );
      throw VoiceMessageRecordingPermissionException(
        requiresSettings: outcome == SystemPermissionOutcome.requiresSettings,
      );
    }
    final Directory dir = await getTemporaryDirectory();
    final int stamp = DateTime.now().microsecondsSinceEpoch;
    _wavOutputPath = '${dir.path}/fluxer_voice_$stamp.wav';
    _pcmTempPath = '${dir.path}/fluxer_voice_pcm_$stamp.pcm';
    _resetCaptureState();
    try {
      await _startPcmStream();
      talker.debug('[VoiceMessageRecording] Using PCM stream capture');
    } on Object catch (error, stackTrace) {
      talker.warning(
        '[VoiceMessageRecording] PCM stream unavailable, using file capture',
        error,
        stackTrace,
      );
      await _cleanupPartialStart();
      await _startFileWithAmplitude();
      talker.debug('[VoiceMessageRecording] Using file + amplitude capture');
    }
    _startedAt = DateTime.now();
    _startMaxDurationTimer(maxDurationSeconds);
  }

  Future<void> _startPcmStream() async {
    _captureMode = VoiceMessageCaptureMode.pcmStream;
    final File pcmFile = File(_pcmTempPath!);
    if (pcmFile.existsSync()) {
      pcmFile.deleteSync();
    }
    _pcmSink = pcmFile.openWrite();
    final Stream<Uint8List> stream = await _recorder.startStream(
      const RecordConfig(encoder: AudioEncoder.pcm16bits, numChannels: 1),
    );
    _pcmSubscription = stream.listen(
      _onPcmChunk,
      onError: (Object error, StackTrace stackTrace) {
        talker.error(
          '[VoiceMessageRecording] PCM stream error',
          error,
          stackTrace,
        );
      },
    );
  }

  Future<void> _startFileWithAmplitude() async {
    _captureMode = VoiceMessageCaptureMode.fileWithAmplitude;
    _pcmTempPath = null;
    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.wav, numChannels: 1),
      path: _wavOutputPath!,
    );
    _amplitudeSubscription = _recorder
        .onAmplitudeChanged(
          const Duration(milliseconds: kVoiceMessageLiveAnalyserIntervalMs),
        )
        .listen(_onAmplitudeSample);
  }

  void _onPcmChunk(Uint8List chunk) {
    if (chunk.isEmpty) {
      return;
    }
    _pcmSink?.add(chunk);
    _writePcmRing(chunk);
    _pcmWindowSnapshotDirty = true;
  }

  void _onAmplitudeSample(Amplitude amplitude) {
    final double normalised = ((amplitude.current + 60) / 60).clamp(0.0, 1.0);
    _amplitudeHistory.add(normalised);
    if (_amplitudeHistory.length > 600) {
      _amplitudeHistory.removeAt(0);
    }
  }

  void tickLiveWaveform() {
    if (!isRecording) {
      return;
    }
    if (usesPcmLiveWaveform) {
      _smoothedWaveformBars = computeLiveWaveformBarsFromPcmWindow(
        pcmLe16: livePcmWindow,
        previous: _smoothedWaveformBars,
      );
      return;
    }
    _smoothedWaveformBars = computeLiveWaveformBarsFromAmplitudeHistory(
      previous: _smoothedWaveformBars,
      amplitudes: _amplitudeHistory,
    );
  }

  double get liveRmsLevel {
    if (usesPcmLiveWaveform) {
      return computeLiveRmsAmplitudeFromPcmWindow(livePcmWindow);
    }
    if (_amplitudeHistory.isEmpty) {
      return 0;
    }
    return (_amplitudeHistory.last * 2.5).clamp(0.0, 1.0);
  }

  void _writePcmRing(Uint8List chunk) {
    for (int i = 0; i < chunk.length; i++) {
      _pcmRingBuffer[_pcmRingWriteBytes] = chunk[i];
      _pcmRingWriteBytes = (_pcmRingWriteBytes + 1) % _pcmRingBuffer.length;
    }
    _pcmTotalBytes += chunk.length;
  }

  void _startMaxDurationTimer(int maxDurationSeconds) {
    _maxDurationTimer?.cancel();
    _maxDurationTimer = Timer(Duration(seconds: maxDurationSeconds), () {
      if (!isRecording) {
        return;
      }
      talker.info('[VoiceMessageRecording] Max duration reached');
      if (!_maxDurationController.isClosed) {
        _maxDurationController.add(null);
      }
    });
  }

  Future<VoiceMessagePreparedRecording?> stop() async {
    if (!isRecording) {
      return null;
    }
    _maxDurationTimer?.cancel();
    _maxDurationTimer = null;
    await _pcmSubscription?.cancel();
    _pcmSubscription = null;
    await _amplitudeSubscription?.cancel();
    _amplitudeSubscription = null;
    await _pcmSink?.flush();
    await _pcmSink?.close();
    _pcmSink = null;
    final String? wavPath = await _recorder.stop();
    _startedAt = null;
    final String? outputPath = _wavOutputPath;
    if (outputPath == null || outputPath.isEmpty) {
      talker.error('[VoiceMessageRecording] stop() with no output path');
      await _deleteTempFiles();
      return null;
    }
    final VoiceMessagePcmSlice? pcm = await _resolvePcmAfterStop(
      wavPath: wavPath ?? outputPath,
    );
    _wavOutputPath = null;
    if (pcm == null) {
      await _deleteTempFiles();
      return null;
    }
    if (_captureMode == VoiceMessageCaptureMode.pcmStream) {
      final Uint8List wavBytes = encodePcmSliceToWav(
        samples: pcm.samples,
        sampleRate: pcm.sampleRate,
      );
      await File(outputPath).writeAsBytes(wavBytes, flush: true);
    }
    await _deleteTempFiles();
    final VoiceWaveformResult waveform = computeVoiceWaveformFromPcm(pcm);
    return VoiceMessagePreparedRecording(
      filePath: outputPath,
      duration: waveform.duration,
      waveform: waveform.waveform,
      pcm: pcm,
    );
  }

  Future<VoiceMessagePcmSlice?> _resolvePcmAfterStop({
    required String wavPath,
  }) async {
    if (_captureMode == VoiceMessageCaptureMode.fileWithAmplitude) {
      final File file = File(wavPath);
      if (!file.existsSync()) {
        talker.error(
          '[VoiceMessageRecording] WAV missing after file capture: $wavPath',
        );
        return null;
      }
      final Uint8List bytes = await file.readAsBytes();
      return decodeWavMonoPcm(bytes);
    }
    final String? pcmPath = _pcmTempPath;
    if (pcmPath == null) {
      talker.error('[VoiceMessageRecording] stop() with no PCM temp file');
      return null;
    }
    final File pcmFile = File(pcmPath);
    if (!pcmFile.existsSync()) {
      talker.error('[VoiceMessageRecording] PCM temp file missing: $pcmPath');
      return null;
    }
    final Uint8List pcmBytes = await pcmFile.readAsBytes();
    if (pcmBytes.isEmpty) {
      talker.error('[VoiceMessageRecording] stop() with no PCM data captured');
      return null;
    }
    return _pcmBytesToSlice(pcmBytes);
  }

  Future<void> discard() async {
    _maxDurationTimer?.cancel();
    _maxDurationTimer = null;
    await _pcmSubscription?.cancel();
    _pcmSubscription = null;
    await _amplitudeSubscription?.cancel();
    _amplitudeSubscription = null;
    await _pcmSink?.flush();
    await _pcmSink?.close();
    _pcmSink = null;
    if (isRecording) {
      await _recorder.stop();
    }
    _startedAt = null;
    final String? wavPath = _wavOutputPath;
    _wavOutputPath = null;
    await _deleteTempFiles();
    if (wavPath != null && wavPath.isNotEmpty) {
      final File file = File(wavPath);
      if (file.existsSync()) {
        await file.delete();
      }
    }
    _resetCaptureState();
  }

  Future<void> dispose() async {
    await discard();
    await _maxDurationController.close();
    await _recorder.dispose();
  }

  Future<void> _cleanupPartialStart() async {
    await _pcmSubscription?.cancel();
    _pcmSubscription = null;
    await _amplitudeSubscription?.cancel();
    _amplitudeSubscription = null;
    await _pcmSink?.close();
    _pcmSink = null;
    if (await _recorder.isRecording()) {
      await _recorder.stop();
    }
    await _deleteTempFiles();
    _resetCaptureState();
  }

  void _resetCaptureState() {
    _pcmRingWriteBytes = 0;
    _pcmTotalBytes = 0;
    _pcmWindowSnapshotDirty = true;
    _amplitudeHistory.clear();
    _smoothedWaveformBars = List<double>.filled(
      kVoiceMessageWaveformBarCount,
      0,
    );
  }

  Future<void> _deleteTempFiles() async {
    final String? pcmPath = _pcmTempPath;
    _pcmTempPath = null;
    if (pcmPath != null && pcmPath.isNotEmpty) {
      final File file = File(pcmPath);
      if (file.existsSync()) {
        await file.delete();
      }
    }
  }

  VoiceMessagePcmSlice? _pcmBytesToSlice(Uint8List pcmBytes) {
    final int sampleCount = pcmBytes.length ~/ 2;
    if (sampleCount == 0) {
      return null;
    }
    final Float32List samples = Float32List(sampleCount);
    final ByteData data = ByteData.sublistView(pcmBytes);
    for (int i = 0; i < sampleCount; i++) {
      final int intSample = data.getInt16(i * 2, Endian.little);
      samples[i] = intSample < 0 ? intSample / 0x8000 : intSample / 0x7fff;
    }
    return VoiceMessagePcmSlice(
      samples: samples,
      sampleRate: kVoiceMessageRecordingSampleRate,
      durationSeconds: sampleCount / kVoiceMessageRecordingSampleRate,
    );
  }

  @visibleForTesting
  static void fillOrderedPcmRingSnapshot({
    required Uint8List ring,
    required int writeHeadBytes,
    required int totalBytes,
    required Uint8List into,
  }) {
    _fillOrderedPcmRingSnapshot(
      ring: ring,
      writeHeadBytes: writeHeadBytes,
      totalBytes: totalBytes,
      into: into,
    );
  }

  static void _fillOrderedPcmRingSnapshot({
    required Uint8List ring,
    required int writeHeadBytes,
    required int totalBytes,
    required Uint8List into,
  }) {
    final int capacity = ring.length;
    final int copyLength = totalBytes < capacity ? totalBytes : capacity;
    if (copyLength == 0) {
      return;
    }
    if (totalBytes <= capacity) {
      into.setRange(0, copyLength, ring, 0);
      if (copyLength < into.length) {
        into.fillRange(copyLength, into.length, 0);
      }
      return;
    }
    final int tailLength = capacity - writeHeadBytes;
    into
      ..setRange(0, tailLength, ring, writeHeadBytes)
      ..setRange(tailLength, capacity, ring, 0);
  }
}

class VoiceMessageRecordingPermissionException implements Exception {
  const VoiceMessageRecordingPermissionException({
    this.requiresSettings = false,
  });

  final bool requiresSettings;
}

class VoiceMessageMicrophoneInUseException implements Exception {
  const VoiceMessageMicrophoneInUseException();
}
