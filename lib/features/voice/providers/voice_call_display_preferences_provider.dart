import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_call_display_preferences_provider.g.dart';

class VoiceCallDisplayPreferencesState {
  const VoiceCallDisplayPreferencesState({
    this.onlyShowVideos = false,
    this.showOwnCamera = true,
  });

  final bool onlyShowVideos;
  final bool showOwnCamera;

  VoiceCallDisplayPreferencesState copyWith({
    bool? onlyShowVideos,
    bool? showOwnCamera,
  }) {
    return VoiceCallDisplayPreferencesState(
      onlyShowVideos: onlyShowVideos ?? this.onlyShowVideos,
      showOwnCamera: showOwnCamera ?? this.showOwnCamera,
    );
  }
}

@Riverpod(keepAlive: true)
class VoiceCallDisplayPreferences extends _$VoiceCallDisplayPreferences {
  @override
  VoiceCallDisplayPreferencesState build() {
    return const VoiceCallDisplayPreferencesState();
  }

  void setOnlyShowVideos({required bool value}) {
    state = state.copyWith(onlyShowVideos: value);
  }

  void setShowOwnCamera({required bool value}) {
    state = state.copyWith(showOwnCamera: value);
  }

  void reset() {
    state = const VoiceCallDisplayPreferencesState();
  }
}
