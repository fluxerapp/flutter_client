import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:cupertino_ui/cupertino_ui.dart'
    show CupertinoTheme, CupertinoThemeData;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/age/declared_age_range_lock.dart';
import 'package:fluxer_app/core/assistant/assistant_binding.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/instance/account_identity_sync.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_actions_binding.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/zoom/fluxer_app_zoom.dart';
import 'package:fluxer_app/features/accessibility/domain/resolve_reduced_motion.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/accessibility/presentation/reduced_motion_scope.dart';
import 'package:fluxer_app/features/accessibility/providers/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/accessibility/providers/screen_reader_active_provider.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_gate.dart';
import 'package:fluxer_app/features/recovery_kit/presentation/recovery_kit_gate.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_app_background.dart';
import 'package:fluxer_app/features/shell/presentation/gateway_reconnect_banner.dart';
import 'package:fluxer_app/features/shell/presentation/instance_compatibility_gate.dart';
import 'package:fluxer_app/features/shell/presentation/native_titlebar.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/incoming_voice_call_layer.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/pip/voice_pip_layer.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_accessibility_layer.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/widgets/beta_banner.dart';
import 'package:fluxer_app/shared/widgets/input_modality_listener.dart';
import 'package:foldable/foldable.dart';
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
    ref.listenManual<double>(
      themePreferenceProvider.select(
        (ThemePreferenceState state) => state.scaleFactor,
      ),
      (double? previous, double next) => FluxerAppZoom.apply(next),
      fireImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..watch(homeQuickActionsBindingProvider)
      ..watch(assistantBindingProvider);
    final router = ref.watch(fluxerRouterProvider);
    final ({
      FluxerThemeMode mode,
      FluxerColorTheme active,
      FluxerColorTheme light,
      FluxerColorTheme dark,
    })
    themePref = ref.watch(
      themePreferenceProvider.select(
        (ThemePreferenceState state) => (
          mode: state.mode,
          active: state.colorTheme,
          light: state.lightColorTheme,
          dark: state.darkColorTheme,
        ),
      ),
    );
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
        theme = cachedFluxerTheme(
          colorTheme: themePref.light,
          brightness: Brightness.light,
        );
        darkThemeData = cachedFluxerTheme(colorTheme: themePref.dark);
      case FluxerThemeMode.light:
        themeMode = ThemeMode.light;
        theme = cachedFluxerTheme(
          colorTheme: themePref.active,
          brightness: Brightness.light,
        );
        darkThemeData = null;
      case FluxerThemeMode.dark:
      case FluxerThemeMode.darkLegacy:
      case FluxerThemeMode.coal:
        themeMode = ThemeMode.dark;
        theme = cachedFluxerTheme(colorTheme: themePref.active);
        darkThemeData = theme;
    }

    final String productName = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    );
    if (isFluxerDesktopOs) {
      setDesktopMainWindowTitle(productName);
    }

    return FluxerAppZoomScope(
      child: FoldableProvider(
        child: MaterialApp.router(
          title: productName,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          locale: appLocale,
          theme: theme,
          darkTheme: darkThemeData,
          themeMode: themeMode,
          themeAnimationDuration: Duration.zero,
          routerConfig: router,
          builder: (context, child) {
            final Widget layered = ScreenReaderActiveSync(
              child: InputModalityListener(
                child: AppUiLifecycleObserver(
                  child: AccountIdentitySync(
                    child: RecoveryKitGate(
                      child: DeclaredAgeRangeLock(
                        child: IncomingVoiceCallLayer(
                          child: VoiceCallAccessibilityLayer(
                            child: VoicePipLayer(child: child!),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
            Widget overlayStack(Widget child) {
              return FluxerToastOverlay(
                child: InstanceCompatibilityGate(
                  child: GatewayReconnectBannerOverlay(child: child),
                ),
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

            final bool platformReducedMotion = platformReducedMotionOf(
              ref,
              context,
            );
            final bool disableAnimations = resolveReducedMotion(
              syncReducedMotionWithSystem: reducedMotionPrefs.sync,
              reducedMotionOverride: reducedMotionPrefs.override,
              platformReducedMotion: platformReducedMotion,
            );
            final Widget scaled = ReducedMotionScope(
              enabled: disableAnimations,
              child: FluxerAppTextScale(
                child: DesktopPointerUiScope(
                  child: AppLockGate(child: content),
                ),
              ),
            );
            final ThemeData materialTheme = Theme.of(context);
            final CupertinoThemeData cupertinoTheme = CupertinoTheme.of(context)
                .copyWith(
                  brightness: materialTheme.brightness,
                  scaffoldBackgroundColor:
                      materialTheme.scaffoldBackgroundColor,
                );
            return Material(
              type: MaterialType.transparency,
              child: CupertinoTheme(
                data: cupertinoTheme,
                child: AdaptiveToolbarHost(
                  child: IphoneDuoAppBackground(
                    child: AnnotatedRegion<SystemUiOverlayStyle>(
                      value:
                          materialTheme.appBarTheme.systemOverlayStyle ??
                          fluxerSystemUiOverlayStyle(
                            brightness: materialTheme.brightness,
                            navigationBarColor:
                                materialTheme.scaffoldBackgroundColor,
                          ),
                      child: NativePasteShortcuts(child: scaled),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
