import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_noise_filter_provider.g.dart';

class VoiceNoiseFilterState {
  const VoiceNoiseFilterState({required this.isSupported});

  final bool isSupported;
}

@Riverpod(keepAlive: true)
class VoiceNoiseFilter extends _$VoiceNoiseFilter {
  @override
  Future<VoiceNoiseFilterState> build() async {
    return const VoiceNoiseFilterState(isSupported: false);
  }
}
