enum AssistantCommandStatus {
  ok,
  needsLogin,
  notInVoice,
  notFound,
  dmsDisabled,
  failed,
}

class AssistantCommandResult {
  const AssistantCommandResult({
    required this.status,
    required this.spoken,
    this.extras = const <String, Object?>{},
  });

  final AssistantCommandStatus status;
  final String spoken;
  final Map<String, Object?> extras;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'status': status.name,
      'spoken': spoken,
      'extras': extras,
    };
  }
}
