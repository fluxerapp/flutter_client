import 'dart:ui' show PlatformDispatcher;

import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'use_12_hour_time_format_provider.g.dart';

@Riverpod(keepAlive: true)
bool use12HourTimeFormat(Ref ref) {
  final UserSettingsResponse? settings = ref.watch(userSettingsStatusProvider);
  final AppearancePreferencesState appearance = ref.watch(
    appearancePreferencesProvider,
  );
  return resolveUse12Hour(
    timeFormat: settings?.timeFormat ?? TimeFormatTypes.auto,
    useSystemLocaleForTimeFormat: appearance.useSystemLocaleForTimeFormat,
    appLocale: settings?.locale.json ?? 'en-US',
    systemLocale: PlatformDispatcher.instance.locale.toLanguageTag(),
  );
}
