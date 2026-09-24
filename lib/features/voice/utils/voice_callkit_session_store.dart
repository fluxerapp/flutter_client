import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';

class VoiceCallKitSessionStore {
  final Map<String, VoiceCallKitSession> _sessionsByCallKitId =
      <String, VoiceCallKitSession>{};
  final Map<String, String> _callKitIdByChannelId = <String, String>{};
  final Set<String> _presentedIncomingChannelIds = <String>{};
  final Set<String> _connectedCallKitIds = <String>{};

  bool get isEmpty => _sessionsByCallKitId.isEmpty;

  bool get hasIncomingRing => _sessionsByCallKitId.values.any(
    (VoiceCallKitSession session) =>
        session.kind == VoiceCallKitSessionKind.incomingRing,
  );

  bool get hasActiveVoiceSession => _sessionsByCallKitId.values.any(
    (VoiceCallKitSession session) =>
        session.kind == VoiceCallKitSessionKind.activeVoice,
  );

  String? get soleActiveVoiceChannelId {
    String? channelId;
    for (final VoiceCallKitSession session in _sessionsByCallKitId.values) {
      if (session.kind != VoiceCallKitSessionKind.activeVoice) {
        continue;
      }
      if (channelId != null) {
        return null;
      }
      channelId = session.channelId;
    }
    return channelId;
  }

  Iterable<MapEntry<String, String>> get channelEntries =>
      _callKitIdByChannelId.entries;

  List<String> incomingRingChannelIdsAbsentFrom(Set<String> liveChannelIds) {
    final List<String> stale = <String>[];
    for (final MapEntry<String, String> entry
        in _callKitIdByChannelId.entries) {
      final VoiceCallKitSession? session = _sessionsByCallKitId[entry.value];
      if (session == null ||
          session.kind != VoiceCallKitSessionKind.incomingRing) {
        continue;
      }
      if (!liveChannelIds.contains(entry.key)) {
        stale.add(entry.key);
      }
    }
    return stale;
  }

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
    String? callKitId,
    String? messageId,
    String? connectionId,
  }) {
    final String? existingId = _callKitIdByChannelId[channelId];
    if (existingId != null) {
      return existingId;
    }
    final String resolvedId = callKitId ?? resolveVoiceCallKitSessionId();
    final VoiceCallKitSession session = VoiceCallKitSession(
      callKitId: resolvedId,
      channelId: channelId,
      kind: kind,
      messageId: messageId,
      connectionId: connectionId,
    );
    _sessionsByCallKitId[resolvedId] = session;
    _callKitIdByChannelId[channelId] = resolvedId;
    return resolvedId;
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
