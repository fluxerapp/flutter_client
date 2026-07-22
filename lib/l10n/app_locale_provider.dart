import 'dart:ui' show Locale, PlatformDispatcher;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/models/locale.dart' as sdk;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale_provider.g.dart';

List<Locale> _currentPlatformLocales() {
  final List<Locale> locales = PlatformDispatcher.instance.locales;
  if (locales.isNotEmpty) {
    return List<Locale>.unmodifiable(locales);
  }
  return <Locale>[PlatformDispatcher.instance.locale];
}

/// The system's ordered locale preferences, kept reactive for runtime changes.
@Riverpod(keepAlive: true)
class SystemLocales extends _$SystemLocales {
  @override
  List<Locale> build() => _currentPlatformLocales();

  void updateFromPlatform(List<Locale>? locales) {
    state = locales == null || locales.isEmpty
        ? _currentPlatformLocales()
        : List<Locale>.unmodifiable(locales);
  }
}

/// The locale used for all app UI, including work without a widget context.
@Riverpod(keepAlive: true)
Locale effectiveAppLocale(Ref ref) {
  final sdk.Locale? selected = ref.watch(
    userSettingsStatusProvider.select((settings) => settings?.locale),
  );
  final Locale? selectedLocale = selected == null
      ? null
      : tryFlutterLocaleFromSdkLocale(selected);
  if (selectedLocale != null) {
    return selectedLocale;
  }
  return resolveSupportedFluxerLocales(ref.watch(systemLocalesProvider));
}

/// Localized strings for providers and services that do not own a widget tree.
@Riverpod(keepAlive: true)
FluxerLocalizations appLocalizations(Ref ref) {
  return lookupFluxerLocalizations(ref.watch(effectiveAppLocaleProvider));
}
