import 'dart:async';

import 'package:flutter_localizations/flutter_localizations.dart' as l10n;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/accessibility/resolve_reduced_motion.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/gateway_reconnect_banner.dart';
import 'package:fluxer_app/features/shell/presentation/native_titlebar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/required_action_gate.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/incoming_voice_call_layer.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/pip/voice_pip_layer.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/beta_banner.dart';
import 'package:fluxer_app/shared/widgets/input_modality_listener.dart';
import 'package:window_manager/window_manager.dart';

class FluxerApp extends ConsumerStatefulWidget {
  const FluxerApp({super.key});

  @override
  ConsumerState<FluxerApp> createState() => _FluxerAppState();
}

class _FluxerAppState extends ConsumerState<FluxerApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(ref.read(voiceMediaDevicesProvider.notifier).refresh());
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(fluxerRouterProvider);
    final themePref = ref.watch(themePreferenceProvider);
    final Locale appLocale = ref.watch(effectiveAppLocaleProvider);
    final ({bool sync, bool override}) reducedMotionPrefs = ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState s) => (
          sync: s.syncReducedMotionWithSystem,
          override: s.reducedMotionOverride,
        ),
      ),
    );

    final ThemeMode themeMode;
    final ThemeData theme;
    final ThemeData? darkThemeData;
    switch (themePref.mode) {
      case FluxerThemeMode.system:
        themeMode = ThemeMode.system;
        theme = buildFluxerTheme(
          colorTheme: themePref.lightColorTheme,
          textTheme: themePref.lightTextTheme,
          layoutTheme: themePref.layoutTheme,
          brightness: Brightness.light,
        );
        darkThemeData = buildFluxerTheme(
          colorTheme: themePref.darkColorTheme,
          textTheme: themePref.darkTextTheme,
          layoutTheme: themePref.layoutTheme,
        );
      case FluxerThemeMode.light:
        themeMode = ThemeMode.light;
        theme = buildFluxerTheme(
          colorTheme: themePref.colorTheme,
          textTheme: themePref.textTheme,
          layoutTheme: themePref.layoutTheme,
          brightness: Brightness.light,
        );
        darkThemeData = null;
      case FluxerThemeMode.dark:
      case FluxerThemeMode.coal:
        themeMode = ThemeMode.dark;
        theme = buildFluxerTheme(
          colorTheme: themePref.colorTheme,
          textTheme: themePref.textTheme,
          layoutTheme: themePref.layoutTheme,
        );
        darkThemeData = theme;
    }

    return MaterialApp.router(
      title: ref.watch(
        instanceRuntimeConfigProvider.select((config) => config.productName),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FluxerLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
        l10n.GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: FluxerLocalizations.supportedLocales,
      locale: appLocale,
      theme: theme,
      darkTheme: darkThemeData,
      themeMode: themeMode,
      themeAnimationDuration: Duration.zero,
      routerConfig: router,
      builder: (context, child) {
        final Widget layered = InputModalityListener(
          child: AppUiLifecycleObserver(
            child: RequiredActionGate(
              child: IncomingVoiceCallLayer(
                child: VoicePipLayer(child: child!),
              ),
            ),
          ),
        );
        Widget overlayStack(Widget child) {
          return FluxerToastOverlay(
            child: GatewayReconnectBannerOverlay(child: child),
          );
        }

        final Widget content;
        if (!isFluxerDesktopOs) {
          content = BetaBanner(child: overlayStack(layered));
        } else {
          content = overlayStack(
            DragToResizeArea(
              child: Column(
                children: [
                  const NativeTitlebar(),
                  Expanded(child: layered),
                ],
              ),
            ),
          );
        }

        final bool platformReducedMotion = MediaQuery.disableAnimationsOf(
          context,
        );
        final bool disableAnimations = resolveReducedMotion(
          syncReducedMotionWithSystem: reducedMotionPrefs.sync,
          reducedMotionOverride: reducedMotionPrefs.override,
          platformReducedMotion: platformReducedMotion,
        );
        Widget scaled = FluxerAppTextScale(child: content);
        if (disableAnimations) {
          scaled = MediaQuery(
            data: MediaQuery.of(context).copyWith(disableAnimations: true),
            child: scaled,
          );
        }
        return scaled;
      },
    );
  }
}
