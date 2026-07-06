import 'package:livekit_noise_filter/livekit_noise_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_noise_filter_provider.g.dart';

class VoiceNoiseFilterState {
  const VoiceNoiseFilterState({
    required this.filter,
    required this.isSupported,
  });

  final LiveKitNoiseFilter filter;
  final bool isSupported;
}

@Riverpod(keepAlive: true)
class VoiceNoiseFilter extends _$VoiceNoiseFilter {
  LiveKitNoiseFilter? _filter;

  @override
  Future<VoiceNoiseFilterState> build() async {
    final bool isSupported = await LiveKitNoiseFilter.isSupported();
    _filter ??= LiveKitNoiseFilter();
    return VoiceNoiseFilterState(filter: _filter!, isSupported: isSupported);
  }

  LiveKitNoiseFilter? get filterOrNull => _filter;

  Future<void> setBypass(bool bypass) async {
    final LiveKitNoiseFilter? filter = _filter;
    if (filter == null) {
      return;
    }
    await filter.setBypass(bypass);
  }
}
