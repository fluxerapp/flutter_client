import 'dart:async';
import 'dart:io' show Platform;
import 'dart:ui' show PlatformDispatcher;

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/time_format_preference_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';

class UserLanguageAndTime extends ConsumerWidget {
  const UserLanguageAndTime({super.key, this.scrollController});

  final ScrollController? scrollController;

  static final DateTime _sampleDateTime = DateTime(2025, 1, 1, 14, 30);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final TimeFormatTypes timeFormat = ref.watch(timeFormatPreferenceProvider);
    final AppearancePreferencesState appearance = ref.watch(
      appearancePreferencesProvider,
    );
    final UserSettingsResponse? settings = ref.watch(
      userSettingsStatusProvider,
    );
    final String appLocale = settings?.locale.json ?? 'en-US';
    final String systemLocale = PlatformDispatcher.instance.locale
        .toLanguageTag();
    final String displayLocale = Localizations.localeOf(context).toString();

    void showSyncFailedToast() {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.languageAndTimeTimeFormatSyncFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }

    Future<void> changeTimeFormat(TimeFormatTypes value) async {
      try {
        await ref
            .read(timeFormatPreferenceProvider.notifier)
            .setTimeFormat(value);
      } on Object {
        showSyncFailedToast();
      }
    }

    Future<void> changeUseSystemLocale({required bool value}) async {
      try {
        await ref
            .read(appearancePreferencesProvider.notifier)
            .setUseSystemLocaleForTimeFormat(value: value);
      } on Object {
        showSyncFailedToast();
      }
    }

    String autoDescription() {
      final bool useSystemLocale = appearance.useSystemLocaleForTimeFormat;
      final String effectiveLocale = useSystemLocale ? systemLocale : appLocale;
      final bool use12Hour = localeUses12Hour(effectiveLocale);
      final String format = formatUserTime(
        _sampleDateTime,
        displayLocale,
        use12Hour: use12Hour,
      );
      if (useSystemLocale) {
        return l10n.languageAndTimeTimeFormatSystemLocale(format);
      }
      return l10n.languageAndTimeTimeFormatAppLanguage(format);
    }

    final String twelveHourExample = formatUserTime(
      _sampleDateTime,
      displayLocale,
      use12Hour: true,
    );
    final String twentyFourHourExample = formatUserTime(
      _sampleDateTime,
      displayLocale,
      use12Hour: false,
    );

    // TODO: Add desktop language picker
    final bool showLanguageSection =
        !kIsWeb && (Platform.isIOS || Platform.isAndroid);

    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.languageAndTimeTimeFormatSectionTitle,
            description: l10n.languageAndTimeTimeFormatSectionDescription,
            isFirst: true,
            children: [
              Semantics(
                label: l10n.languageAndTimeTimeFormatSelectionLabel,
                container: true,
                child: FluxerRadioGroup<TimeFormatTypes>(
                  value: timeFormat,
                  onChanged: (value) => unawaited(changeTimeFormat(value)),
                  items: [
                    FluxerRadioItem(
                      value: TimeFormatTypes.auto,
                      label: l10n.languageAndTimeTimeFormatAuto,
                      description: autoDescription(),
                    ),
                    FluxerRadioItem(
                      value: TimeFormatTypes.twelveHour,
                      label: l10n.languageAndTimeTimeFormat12Hour,
                      description: twelveHourExample,
                    ),
                    FluxerRadioItem(
                      value: TimeFormatTypes.twentyFourHour,
                      label: l10n.languageAndTimeTimeFormat24Hour,
                      description: twentyFourHourExample,
                    ),
                  ],
                ),
              ),
              if (timeFormat == TimeFormatTypes.auto) ...[
                SizedBox(height: layout.s4),
                FluxerSettingsSwitchItem(
                  label: l10n.languageAndTimeUseSystemLocaleForTimeFormat,
                  value: appearance.useSystemLocaleForTimeFormat,
                  onChanged: (value) =>
                      unawaited(changeUseSystemLocale(value: value)),
                ),
              ],
            ],
          ),
          if (showLanguageSection)
            FluxerSettingsSection(
              title: l10n.languageAndTimeLanguageSectionTitle,
              description: l10n.languageAndTimeLanguageSectionDescription,
              children: [
                FluxerButton.primary(
                  label: l10n.languageAndTimeOpenLanguageSettings,
                  onPressedAsync: () => AppSettings.openAppSettings(
                    type: AppSettingsType.appLocale,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
