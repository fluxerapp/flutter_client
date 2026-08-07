import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';

class VoiceCallKitSessionStore {
  final Map<String, VoiceCallKitSession> _sessionsByCallKitId =
      <String, VoiceCallKitSession>{};
  final Map<String, String> _callKitIdByChannelId = <String, String>{};
  final Set<String> _presentedIncomingChannelIds = <String>{};
  final Set<String> _connectedCallKitIds = <String>{};

  bool get isEmpty => _sessionsByCallKitId.isEmpty;

  bool get hasActiveVoiceSession => _sessionsByCallKitId.values.any(
    (VoiceCallKitSession session) =>
        session.kind == VoiceCallKitSessionKind.activeVoice,
  );

  Iterable<MapEntry<String, String>> get channelEntries =>
      _callKitIdByChannelId.entries;

  bool containsChannel(String channelId) =>
      _callKitIdByChannelId.containsKey(channelId);

  String? callKitIdForChannel(String channelId) =>
      _callKitIdByChannelId[channelId];

  VoiceCallKitSession? sessionForCallKitId(String callKitId) =>
      _sessionsByCallKitId[callKitId];

  bool isCallKitConnected(String callKitId) =>
      _connectedCallKitIds.contains(callKitId);

  bool wasIncomingPresented(String channelId) =>
      _presentedIncomingChannelIds.contains(channelId);

  void markIncomingPresented(String channelId) {
    _presentedIncomingChannelIds.add(channelId);
  }

  void markCallKitConnected(String callKitId) {
    _connectedCallKitIds.add(callKitId);
  }

  String registerSession({
    required String channelId,
    required VoiceCallKitSessionKind kind,
    String? messageId,
    String? connectionId,
  }) {
    final String? existingId = _callKitIdByChannelId[channelId];
    if (existingId != null) {
      return existingId;
    }
    final String callKitId = resolveVoiceCallKitSessionId();
    final VoiceCallKitSession session = VoiceCallKitSession(
      callKitId: callKitId,
      channelId: channelId,
      kind: kind,
      messageId: messageId,
      connectionId: connectionId,
    );
    _sessionsByCallKitId[callKitId] = session;
    _callKitIdByChannelId[channelId] = callKitId;
    return callKitId;
  }

  void registerExistingSession(VoiceCallKitSession session) {
    _sessionsByCallKitId[session.callKitId] = session;
    _callKitIdByChannelId[session.channelId] = session.callKitId;
  }

  void unregisterSession(String callKitId, {required String channelId}) {
    _sessionsByCallKitId.remove(callKitId);
    _connectedCallKitIds.remove(callKitId);
    final String? mapped = _callKitIdByChannelId[channelId];
    if (mapped == callKitId) {
      _callKitIdByChannelId.remove(channelId);
    }
    _presentedIncomingChannelIds.remove(channelId);
  }

  void promoteSessionToActiveVoice({
    required String callKitId,
    required String channelId,
    required VoiceCallKitVoiceSnapshot voice,
  }) {
    final VoiceCallKitSession? existing = _sessionsByCallKitId[callKitId];
    if (existing == null ||
        existing.kind == VoiceCallKitSessionKind.activeVoice) {
      return;
    }
    _sessionsByCallKitId[callKitId] = VoiceCallKitSession(
      callKitId: callKitId,
      channelId: channelId,
      kind: VoiceCallKitSessionKind.activeVoice,
      messageId: existing.messageId,
      connectionId: voice.activeConnectionId,
    );
    _presentedIncomingChannelIds.remove(channelId);
  }

  void clearPresentedIncoming(String channelId) {
    _presentedIncomingChannelIds.remove(channelId);
  }

  void clearAll() {
    _sessionsByCallKitId.clear();
    _callKitIdByChannelId.clear();
    _presentedIncomingChannelIds.clear();
    _connectedCallKitIds.clear();
  }
}
