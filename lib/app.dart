import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/shell/presentation/native_titlebar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/beta_warning_layer.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/incoming_voice_call_layer.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/beta_banner.dart';
import 'package:fluxer_app/shared/widgets/input_modality_listener.dart';
import 'package:fluxer_dart/export.dart' hide Locale;
import 'package:fluxer_dart/models/locale.dart' as sdk;
import 'package:window_manager/window_manager.dart';

bool get _isDesktopPlatform =>
    !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);

class FluxerApp extends ConsumerWidget {
  const FluxerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(fluxerRouterProvider);
    final themePref = ref.watch(themePreferenceProvider);
    final UserSettingsResponse? userSettings = ref.watch(
      userSettingsStatusProvider,
    );
    final Locale? appLocale =
        userSettings == null || userSettings.locale == sdk.Locale.$unknown
        ? null
        : flutterLocaleFromSdkLocale(userSettings.locale);

    final darkTheme = buildFluxerTheme(
      colorTheme: themePref.darkColorTheme,
      textTheme: themePref.darkTextTheme,
      layoutTheme: themePref.layoutTheme,
    );
    final lightTheme = buildFluxerTheme(
      colorTheme: themePref.lightColorTheme,
      textTheme: themePref.lightTextTheme,
      layoutTheme: themePref.layoutTheme,
      brightness: Brightness.light,
    );
    final explicitTheme = buildFluxerTheme(
      colorTheme: themePref.colorTheme,
      textTheme: themePref.textTheme,
      layoutTheme: themePref.layoutTheme,
      brightness: themePref.mode == FluxerThemeMode.light
          ? Brightness.light
          : Brightness.dark,
    );

    final ThemeMode themeMode;
    final ThemeData theme;
    final ThemeData? darkThemeData;
    switch (themePref.mode) {
      case FluxerThemeMode.system:
        themeMode = ThemeMode.system;
        theme = lightTheme;
        darkThemeData = darkTheme;
      case FluxerThemeMode.light:
        themeMode = ThemeMode.light;
        theme = explicitTheme;
        darkThemeData = null;
      case FluxerThemeMode.dark:
      case FluxerThemeMode.coal:
        themeMode = ThemeMode.dark;
        theme = explicitTheme;
        darkThemeData = explicitTheme;
    }

    return MaterialApp.router(
      title: 'Fluxer',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      locale: appLocale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return supportedLocales.first;
        }
        return resolveSupportedFluxerLocale(locale);
      },
      theme: theme,
      darkTheme: darkThemeData,
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) {
        final Widget layered = InputModalityListener(
          child: AppUiLifecycleObserver(
            child: BetaWarningLayer(
              child: IncomingVoiceCallLayer(child: child!),
            ),
          ),
        );
        final Widget content;
        if (!_isDesktopPlatform) {
          content = BetaBanner(child: FluxerToastOverlay(child: layered));
        } else {
          content = FluxerToastOverlay(
            child: DragToResizeArea(
              child: Column(
                children: [
                  const NativeTitlebar(),
                  Expanded(child: layered),
                ],
              ),
            ),
          );
        }

        return content;
      },
    );
  }
}
