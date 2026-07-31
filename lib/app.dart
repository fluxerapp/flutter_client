import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/shell/presentation/native_titlebar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/required_action_gate.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/incoming_voice_call_layer.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/beta_banner.dart';
import 'package:fluxer_app/shared/widgets/input_modality_listener.dart';
import 'package:window_manager/window_manager.dart';

class FluxerApp extends ConsumerWidget {
  const FluxerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(fluxerRouterProvider);
    final themePref = ref.watch(themePreferenceProvider);
    final Locale appLocale = ref.watch(effectiveAppLocaleProvider);

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
      theme: theme,
      darkTheme: darkThemeData,
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) {
        final Widget layered = InputModalityListener(
          child: AppUiLifecycleObserver(
            child: RequiredActionGate(
              child: IncomingVoiceCallLayer(child: child!),
            ),
          ),
        );
        final Widget content;
        if (!isFluxerDesktopOs) {
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
