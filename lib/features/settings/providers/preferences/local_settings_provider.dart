import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_settings_provider.g.dart';

const String _kHapticsEnabledKey = 'haptics_enabled';
const String _kSplashQuotesEnabledKey = 'splash_quotes_enabled';
const String _kOpenCommunitiesToLastChannelKey =
    'open_communities_to_last_channel';

class LocalSettingsState {
  const LocalSettingsState({
    this.hapticsEnabled = true,
    this.splashQuotesEnabled = false,
    this.openCommunitiesToLastChannel = false,
  });

  final bool hapticsEnabled;
  final bool splashQuotesEnabled;
  final bool openCommunitiesToLastChannel;

  LocalSettingsState copyWith({
    bool? hapticsEnabled,
    bool? splashQuotesEnabled,
    bool? openCommunitiesToLastChannel,
  }) {
    return LocalSettingsState(
      hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled,
      splashQuotesEnabled: splashQuotesEnabled ?? this.splashQuotesEnabled,
      openCommunitiesToLastChannel:
          openCommunitiesToLastChannel ?? this.openCommunitiesToLastChannel,
    );
  }
}

@Riverpod(keepAlive: true)
class LocalSettings extends _$LocalSettings {
  @override
  LocalSettingsState build() => const LocalSettingsState();

  Future<void> load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool hapticsEnabled =
        preferences.getBool(_kHapticsEnabledKey) ?? true;
    FluxerHaptics.enabled = hapticsEnabled;
    state = LocalSettingsState(
      hapticsEnabled: hapticsEnabled,
      splashQuotesEnabled:
          preferences.getBool(_kSplashQuotesEnabledKey) ?? false,
      openCommunitiesToLastChannel:
          preferences.getBool(_kOpenCommunitiesToLastChannelKey) ?? false,
    );
  }

  Future<void> setHapticsEnabled({required bool value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kHapticsEnabledKey, value);
    FluxerHaptics.enabled = value;
    state = state.copyWith(hapticsEnabled: value);
  }

  Future<void> setSplashQuotesEnabled({required bool value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kSplashQuotesEnabledKey, value);
    state = state.copyWith(splashQuotesEnabled: value);
  }

  Future<void> setOpenCommunitiesToLastChannel({required bool value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kOpenCommunitiesToLastChannelKey, value);
    state = state.copyWith(openCommunitiesToLastChannel: value);
  }
}
