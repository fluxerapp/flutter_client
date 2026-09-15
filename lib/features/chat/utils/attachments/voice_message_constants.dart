const int kVoiceMessageMinSendDurationMs = 500;
const int kVoiceMessageRecordingTickMs = 120;
const int kVoiceMessageRecordingSampleRate = 44100;
const int kVoiceMessageLivePcmWindowSamples = 256;
const int kVoiceMessageRmsUpdateIntervalMs = 70;
const int kVoiceMessageLockDragMinVerticalDeltaPx = 52;
const int kVoiceMessageLockDragMaxHorizontalDeltaPx = 96;
const double kVoiceMessageDiscardHitPadPx = 16;
const double kVoiceMessageGradientIdleLevel = 0.15;
const double kVoiceMessageRecordingBarRadiusPx = 22;
const double kVoiceMessageRecordingBarInsetH = 8;
const double kVoiceMessageRecordingBarInsetTop = 3;
const double kVoiceMessageRecordingBarInsetBottom = 4;

const int kVoiceMessageLiveAnalyserIntervalMs = 60;
const int kVoiceMessageWaveformMaxPoints = 256;
const double kVoiceMessageWaveformSampleIntervalSeconds = 0.1;

const int kVoiceMessagePlayerWaveformBarCount = 32;
const int kVoiceMessagePlayerFallbackBarCount = 48;
const int kVoiceMessagePlayerFallbackBarValue = 128;
const double kVoiceMessagePlayerWaveformHeightPx = 20;
const double kVoiceMessagePlayerMinBarHeightRatio = 0.08;

const int kMessageFlagVoiceMessage = 1 << 13;

const String kVoiceMessageFilename = 'voice-message.wav';
