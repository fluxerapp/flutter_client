class LocalVoiceStateData {
  const LocalVoiceStateData({
    this.selfMute = false,
    this.selfDeaf = false,
    this.shouldUnmuteOnUndeafen = false,
  });

  final bool selfMute;
  final bool selfDeaf;
  final bool shouldUnmuteOnUndeafen;

  LocalVoiceStateData copyWith({
    bool? selfMute,
    bool? selfDeaf,
    bool? shouldUnmuteOnUndeafen,
  }) {
    return LocalVoiceStateData(
      selfMute: selfMute ?? this.selfMute,
      selfDeaf: selfDeaf ?? this.selfDeaf,
      shouldUnmuteOnUndeafen:
          shouldUnmuteOnUndeafen ?? this.shouldUnmuteOnUndeafen,
    );
  }
}
