import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/sync/user_settings_sync_service.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_format_providers.g.dart';

@Riverpod(keepAlive: true)
class TimeFormatPreference extends _$TimeFormatPreference {
  TimeFormatTypes? _optimisticOverride;

  @override
  TimeFormatTypes build() {
    ref.listen(userSettingsStatusStreamProvider, (previous, next) {
      final TimeFormatTypes? serverValue = next.value?.timeFormat;
      if (serverValue == null) {
        return;
      }
      if (_optimisticOverride != null && serverValue != _optimisticOverride) {
        return;
      }
      _optimisticOverride = null;
      if (state != serverValue) {
        state = serverValue;
      }
    });

    final UserSettingsResponse? settings = ref.watch(
      userSettingsStatusProvider,
    );
    if (_optimisticOverride != null) {
      return _optimisticOverride!;
    }
    return settings?.timeFormat ?? TimeFormatTypes.auto;
  }

  Future<void> setTimeFormat(TimeFormatTypes value) async {
    final TimeFormatTypes previous = state;
    _optimisticOverride = value;
    state = value;
    try {
      await ref.read(userSettingsSyncProvider).pushTimeFormat(value);
      _optimisticOverride = null;
    } on Object catch (e, st) {
      _optimisticOverride = null;
      state = previous;
      talker.error('[TimeFormatPreference] Push failed', e, st);
      rethrow;
    }
  }
}

@Riverpod(keepAlive: true)
bool use12HourTimeFormat(Ref ref) {
  final TimeFormatTypes timeFormat = ref.watch(timeFormatPreferenceProvider);
  final bool useSystemLocaleForTimeFormat = ref.watch(
    appearancePreferencesProvider.select(
      (appearance) => appearance.useSystemLocaleForTimeFormat,
    ),
  );
  return resolveUse12Hour(
    timeFormat: timeFormat,
    useSystemLocaleForTimeFormat: useSystemLocaleForTimeFormat,
    appLocale: ref.watch(effectiveAppLocaleProvider).toLanguageTag(),
    systemLocale: ref.watch(systemLocalesProvider).first.toLanguageTag(),
  );
}
