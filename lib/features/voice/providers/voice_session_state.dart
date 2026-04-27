import 'package:livekit_client/livekit_client.dart';

class VoiceSessionState {
  const VoiceSessionState({
    this.isConnecting = false,
    this.isConnected = false,
    this.errorMessage,
    this.guildId,
    this.channelId,
    this.voiceServerEndpoint,
    this.activeConnectionId,
    this.liveKitRoom,
  });

  final bool isConnecting;
  final bool isConnected;
  final String? errorMessage;
  final String? guildId;
  final String? channelId;
  final String? voiceServerEndpoint;
  final String? activeConnectionId;
  final Room? liveKitRoom;

  bool get isInVoice =>
      (isConnecting || isConnected) &&
      channelId != null &&
      channelId!.isNotEmpty;

  VoiceSessionState copyWith({
    bool? isConnecting,
    bool? isConnected,
    String? errorMessage,
    String? guildId,
    String? channelId,
    String? voiceServerEndpoint,
    String? activeConnectionId,
    Room? liveKitRoom,
    bool clearError = false,
    bool clearRoom = false,
  }) {
    return VoiceSessionState(
      isConnecting: isConnecting ?? this.isConnecting,
      isConnected: isConnected ?? this.isConnected,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      guildId: guildId ?? this.guildId,
      channelId: channelId ?? this.channelId,
      voiceServerEndpoint: voiceServerEndpoint ?? this.voiceServerEndpoint,
      activeConnectionId: activeConnectionId ?? this.activeConnectionId,
      liveKitRoom: clearRoom ? null : (liveKitRoom ?? this.liveKitRoom),
    );
  }
}
