import 'package:fluxer_app/features/voice/domain/voice_connect_failed_target.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceSessionState {
  const VoiceSessionState({
    this.isConnecting = false,
    this.isConnected = false,
    this.isReconnecting = false,
    this.errorMessage,
    this.guildId,
    this.channelId,
    this.voiceServerEndpoint,
    this.activeConnectionId,
    this.liveKitRoom,
    this.e2eeKey,
    this.connectFailed = false,
    this.connectFailedTarget,
  });

  final bool isConnecting;
  final bool isConnected;
  final bool isReconnecting;
  final String? errorMessage;
  final String? guildId;
  final String? channelId;
  final String? voiceServerEndpoint;
  final String? activeConnectionId;
  final Room? liveKitRoom;
  final String? e2eeKey;
  final bool connectFailed;
  final VoiceConnectFailedTarget? connectFailedTarget;

  bool get isInVoice =>
      (isConnecting || isConnected) &&
      channelId != null &&
      channelId!.isNotEmpty;

  bool get showDesktopVoiceConnectionSection => isInVoice || connectFailed;

  VoiceSessionState copyWith({
    bool? isConnecting,
    bool? isConnected,
    bool? isReconnecting,
    String? errorMessage,
    String? guildId,
    String? channelId,
    String? voiceServerEndpoint,
    String? activeConnectionId,
    Room? liveKitRoom,
    String? e2eeKey,
    bool? connectFailed,
    VoiceConnectFailedTarget? connectFailedTarget,
    bool clearError = false,
    bool clearRoom = false,
    bool clearE2eeKey = false,
    bool clearChannel = false,
    bool clearActiveConnectionId = false,
    bool clearConnectFailed = false,
    bool clearConnectFailedTarget = false,
  }) {
    return VoiceSessionState(
      isConnecting: isConnecting ?? this.isConnecting,
      isConnected: isConnected ?? this.isConnected,
      isReconnecting: isReconnecting ?? this.isReconnecting,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      guildId: clearChannel ? null : (guildId ?? this.guildId),
      channelId: clearChannel ? null : (channelId ?? this.channelId),
      voiceServerEndpoint: clearActiveConnectionId
          ? null
          : (voiceServerEndpoint ?? this.voiceServerEndpoint),
      activeConnectionId: clearActiveConnectionId
          ? null
          : (activeConnectionId ?? this.activeConnectionId),
      liveKitRoom: clearRoom ? null : (liveKitRoom ?? this.liveKitRoom),
      e2eeKey: (clearRoom || clearE2eeKey) ? null : (e2eeKey ?? this.e2eeKey),
      connectFailed:
          !clearConnectFailed && (connectFailed ?? this.connectFailed),
      connectFailedTarget: clearConnectFailedTarget
          ? null
          : (connectFailedTarget ?? this.connectFailedTarget),
    );
  }
}
