import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'use_12_hour_time_format_provider.g.dart';

@Riverpod(keepAlive: true)
bool use12HourTimeFormat(Ref ref) {
  final TimeFormatTypes timeFormat =
      ref.watch(
        userSettingsStatusProvider.select((settings) => settings?.timeFormat),
      ) ??
      TimeFormatTypes.auto;
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
