import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'haptics_preferences_provider.g.dart';

const String _kHapticsEnabledKey = 'haptics_enabled';

@Riverpod(keepAlive: true)
class HapticsPreferences extends _$HapticsPreferences {
  @override
  bool build() => true;

  Future<void> load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool enabled = preferences.getBool(_kHapticsEnabledKey) ?? true;
    FluxerHaptics.setEnabled(enabled);
    state = enabled;
  }

  Future<void> setEnabled({required bool value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kHapticsEnabledKey, value);
    FluxerHaptics.setEnabled(value);
    state = value;
  }
}
