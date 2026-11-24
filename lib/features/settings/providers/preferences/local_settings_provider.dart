import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_settings_provider.g.dart';

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
  LocalSettingsState build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    final bool hapticsEnabled = store.read(LocalSettingKeys.hapticsEnabled);
    FluxerHaptics.enabled = hapticsEnabled;
    return LocalSettingsState(
      hapticsEnabled: hapticsEnabled,
      splashQuotesEnabled: store.read(LocalSettingKeys.splashQuotesEnabled),
      openCommunitiesToLastChannel: store.read(
        LocalSettingKeys.openCommunitiesToLastChannel,
      ),
    );
  }

  Future<void> setHapticsEnabled({required bool value}) async {
    ref
        .read(localSettingsStoreProvider)
        .write(LocalSettingKeys.hapticsEnabled, value);
    FluxerHaptics.enabled = value;
    state = state.copyWith(hapticsEnabled: value);
  }

  Future<void> setSplashQuotesEnabled({required bool value}) async {
    ref
        .read(localSettingsStoreProvider)
        .write(LocalSettingKeys.splashQuotesEnabled, value);
    state = state.copyWith(splashQuotesEnabled: value);
  }

  Future<void> setOpenCommunitiesToLastChannel({required bool value}) async {
    ref
        .read(localSettingsStoreProvider)
        .write(LocalSettingKeys.openCommunitiesToLastChannel, value);
    state = state.copyWith(openCommunitiesToLastChannel: value);
  }
}
