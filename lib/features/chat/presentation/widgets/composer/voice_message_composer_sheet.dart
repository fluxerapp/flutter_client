import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_service.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_waveform.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_trim_waveform.dart';
import 'package:fluxer_app/features/chat/providers/messages/voice_message_max_duration_provider.dart';
import 'package:fluxer_app/features/chat/service/voice_message_recording_service.dart';
import 'package:fluxer_app/features/chat/service/voice_message_send.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_wav_encoder.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_waveform.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum _VoiceComposerStage { recording, reviewing, permissionError }

class VoiceMessageComposerSheet {
  VoiceMessageComposerSheet._();

  static Future<void> show(BuildContext context, {required String channelId}) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).voiceMessageTitle,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return VoiceMessageComposerSheetBody(
          channelId: channelId,
          onClose: close,
        );
      },
    );
  }
}

class VoiceMessageComposerSheetBody extends ConsumerStatefulWidget {
  const VoiceMessageComposerSheetBody({
    required this.channelId,
    required this.onClose,
    super.key,
  });

  final String channelId;
  final VoidCallback onClose;

  @override
  ConsumerState<VoiceMessageComposerSheetBody> createState() =>
      _VoiceMessageComposerSheetBodyState();
}

class _VoiceMessageComposerSheetBodyState
    extends ConsumerState<VoiceMessageComposerSheetBody> {
  final VoiceMessageRecordingService _recordingService =
      VoiceMessageRecordingService();
  final AudioPlayer _player = AudioPlayer();
  _VoiceComposerStage _stage = _VoiceComposerStage.recording;
  String? _errorMessage;
  List<double> _amplitudes = <double>[];
  int _elapsedMs = 0;
  VoiceMessagePcmSlice? _pcm;
  double _startSeconds = 0;
  double _endSeconds = 0;
  double? _playheadSeconds;
  bool _isPlaying = false;
  bool _isSending = false;
  Timer? _elapsedTimer;
  Timer? _waveformTimer;
  StreamSubscription<void>? _maxDurationSubscription;
  List<double> _peaks = <double>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_startRecording());
    });
    _player.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
          _playheadSeconds = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _elapsedTimer?.cancel();
    _waveformTimer?.cancel();
    unawaited(_maxDurationSubscription?.cancel());
    unawaited(_player.dispose());
    unawaited(_recordingService.dispose());
    super.dispose();
  }

  bool _isVoiceMicInUse() {
    return ref.read(voiceSessionProvider).isInVoice;
  }

  Future<void> _startRecording() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    try {
      final int maxSeconds = ref.read(maxVoiceMessageDurationSecondsProvider);
      await _recordingService.start(
        maxDurationSeconds: maxSeconds,
        isMicrophoneInUse: _isVoiceMicInUse(),
      );
    } on VoiceMessageMicrophoneInUseException {
      setState(() {
        _stage = _VoiceComposerStage.permissionError;
        _errorMessage = l10n.voiceMessageMicInUse;
      });
      return;
    } on VoiceMessageRecordingPermissionException catch (error) {
      if (error.requiresSettings) {
        if (!mounted) {
          return;
        }
        await ensureSystemPermission(context, SystemPermissionKind.microphone);
        if (!mounted) {
          return;
        }
        setState(() {
          _stage = _VoiceComposerStage.recording;
          _errorMessage = null;
        });
        return;
      }
      setState(() {
        _stage = _VoiceComposerStage.permissionError;
        _errorMessage = l10n.voiceMessageMicPermissionDenied;
      });
      return;
    } on Object {
      setState(() {
        _stage = _VoiceComposerStage.permissionError;
        _errorMessage = l10n.voiceMessageRecordingNotSupported;
      });
      return;
    }
    setState(() {
      _stage = _VoiceComposerStage.recording;
      _amplitudes = <double>[];
      _elapsedMs = 0;
    });
    await _maxDurationSubscription?.cancel();
    _maxDurationSubscription = _recordingService.onMaxDurationReached.listen((
      _,
    ) {
      if (mounted && _stage == _VoiceComposerStage.recording) {
        unawaited(_stopRecording());
      }
    });
    _elapsedTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted || _stage != _VoiceComposerStage.recording) {
        return;
      }
      setState(() {
        _elapsedMs = _recordingService.capturedDurationMs;
      });
    });
    _waveformTimer = Timer.periodic(
      const Duration(milliseconds: kVoiceMessageLiveAnalyserIntervalMs),
      (_) {
        if (!mounted || _stage != _VoiceComposerStage.recording) {
          return;
        }
        _recordingService.tickLiveWaveform();
        final double amp = _recordingService.liveRmsLevel;
        if (amp <= 0 && _amplitudes.isEmpty) {
          return;
        }
        setState(() {
          _amplitudes = _amplitudes.length >= 600
              ? <double>[..._amplitudes.sublist(_amplitudes.length - 599), amp]
              : <double>[..._amplitudes, amp];
        });
      },
    );
  }

  Future<void> _stopRecording() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    _elapsedTimer?.cancel();
    _waveformTimer?.cancel();
    await _maxDurationSubscription?.cancel();
    _maxDurationSubscription = null;
    final VoiceMessagePreparedRecording? prepared = await _recordingService
        .stop();
    if (prepared == null) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.voiceMessageRecordingFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
      widget.onClose();
      return;
    }
    setState(() {
      _pcm = prepared.pcm;
      _startSeconds = 0;
      _endSeconds = prepared.pcm.durationSeconds;
      _peaks = computePeaksFromPcm(prepared.pcm);
      _stage = _VoiceComposerStage.reviewing;
    });
  }

  Future<void> _restartRecording() async {
    await _player.stop();
    setState(() {
      _pcm = null;
      _isPlaying = false;
      _playheadSeconds = null;
    });
    await _recordingService.discard();
    await _startRecording();
  }

  Future<void> _togglePlayback() async {
    if (_pcm == null) {
      return;
    }
    if (_isPlaying) {
      await _player.pause();
      setState(() => _isPlaying = false);
      return;
    }
    final Uint8List wavBytes = encodePcmSliceToWav(
      samples: slicePcm(
        source: _pcm!,
        startSeconds: _startSeconds,
        endSeconds: _endSeconds,
      ).samples,
      sampleRate: _pcm!.sampleRate,
    );
    final Directory dir = await getTemporaryDirectory();
    final String path =
        '${dir.path}/fluxer_voice_preview_${DateTime.now().microsecondsSinceEpoch}.wav';
    await File(path).writeAsBytes(wavBytes, flush: true);
    await _player.stop();
    await _player.play(DeviceFileSource(path));
    setState(() {
      _isPlaying = true;
      _playheadSeconds = _startSeconds;
    });
  }

  Future<void> _send() async {
    if (_pcm == null || _isSending) {
      return;
    }
    final double selectionDuration = _endSeconds - _startSeconds;
    if (selectionDuration < kVoiceMessageMinSendDurationMs / 1000) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(context)
                  .voiceMessageSelectionTooShort(
                    kVoiceMessageMinSendDurationMs / 1000,
                  ),
              variant: FluxerToastVariant.warning,
            ),
          );
      return;
    }
    setState(() => _isSending = true);
    try {
      await sendTrimmedVoiceMessage(
        ref: ref,
        channelId: widget.channelId,
        pcm: _pcm!,
        startSeconds: _startSeconds,
        endSeconds: _endSeconds,
      );
      widget.onClose();
    } on Object {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(context).voiceMessageSendFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
      setState(() => _isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final FluxerColorTheme colors = context.colors;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_errorMessage != null) ...[
            Text(
              _errorMessage!,
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.accentDanger,
              ),
            ),
            const SizedBox(height: 12),
            FluxerButton.secondary(
              label: l10n.voiceMessageStartRecording,
              onPressed: () => unawaited(_restartRecording()),
            ),
          ] else if (_stage == _VoiceComposerStage.recording) ...[
            Text(
              l10n.voiceMessageRecordingHint,
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            VoiceMessageDesktopLiveWaveform(amplitudes: _amplitudes),
            const SizedBox(height: 8),
            Text(
              formatVoiceDurationMs(_elapsedMs),
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textPrimary,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    label: l10n.cancel,
                    onPressed: widget.onClose,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FluxerButton.primary(
                    label: l10n.voiceMessageStop,
                    onPressed: () => unawaited(_stopRecording()),
                  ),
                ),
              ],
            ),
          ] else ...[
            Text(
              l10n.voiceMessageReviewHint,
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            VoiceMessageTrimWaveform(
              peaks: _peaks,
              startFraction: _pcm == null || _pcm!.durationSeconds <= 0
                  ? 0
                  : _startSeconds / _pcm!.durationSeconds,
              endFraction: _pcm == null || _pcm!.durationSeconds <= 0
                  ? 1
                  : _endSeconds / _pcm!.durationSeconds,
              playheadFraction: _playheadSeconds == null || _pcm == null
                  ? 0
                  : _playheadSeconds! / _pcm!.durationSeconds,
              onStartChanged: (double value) {
                if (_pcm == null) {
                  return;
                }
                setState(() {
                  _startSeconds = value * _pcm!.durationSeconds;
                });
              },
              onEndChanged: (double value) {
                if (_pcm == null) {
                  return;
                }
                setState(() {
                  _endSeconds = value * _pcm!.durationSeconds;
                });
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                FluxerButton.ghost(
                  icon: _isPlaying
                      ? PhosphorIconsFill.pause
                      : PhosphorIconsFill.play,
                  label: _isPlaying
                      ? l10n.voiceMessagePause
                      : l10n.voiceMessagePlay,
                  onPressed: () => unawaited(_togglePlayback()),
                ),
                const Spacer(),
                Text(
                  '${(_endSeconds - _startSeconds).toStringAsFixed(2)}s',
                  style: context.textStyles.bodyMedium.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    label: l10n.voiceMessageRerecord,
                    onPressed: _isSending
                        ? null
                        : () => unawaited(_restartRecording()),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FluxerButton.primary(
                    label: l10n.voiceMessageSend,
                    isLoading: _isSending,
                    onPressed: _isSending ? null : () => unawaited(_send()),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
