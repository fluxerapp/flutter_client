import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/constants/external_urls.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/color_utils.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_domain_icon.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/offline_account_switcher_link.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/domain/service_status_incident.dart';
import 'package:fluxer_app/features/shell/presentation/splash_reveal_overlay.dart';
import 'package:fluxer_app/features/shell/providers/service_status_incident_provider.dart';
import 'package:fluxer_app/features/shell/utils/splash_quotes.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_brand_logo.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:material_ui/material_ui.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  static const double _logoHeight = 85;
  static const Duration _pulseDuration = Duration(milliseconds: 1300);
  static const Duration _statusPageDisplayDelay = Duration(seconds: 5);
  static const Duration _problemsDelay = Duration(seconds: 10);
  static const Duration _footerFadeDuration = Duration(milliseconds: 400);
  static const Color _splashMutedText = Color(0xFF9B94B8);
  static const Color _splashLinkText = Color(0xFFC4B8F0);
  static const Color _splashQuoteText = Color(0xFFD6D0EC);

  late final AnimationController _pulseController;
  late final SplashQuote _selectedQuote;
  Timer? _statusTimer;
  Timer? _problemsTimer;
  bool _showStatusData = false;
  bool _showProblems = false;
  bool _timersStarted = false;
  bool _exitRevealStarted = false;
  final GlobalKey _logoKey = GlobalKey();
  ServiceStatusIncident? _frozenIncident;
  String _frozenDisplayText = '';

  @override
  void initState() {
    super.initState();
    _selectedQuote = pickRandomSplashQuote();
    _pulseController = AnimationController(
      vsync: this,
      duration: _pulseDuration,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref.read(splashExitAllowedProvider.notifier).reset();
      final AsyncValue<void> startup = ref.read(appStartupProvider);
      if (startup is AsyncError<dynamic>) {
        return;
      }
      _ensureSplashTimers();
      _cancelSplashIfReady();
      _scheduleExitReveal();
    });
  }

  @override
  void dispose() {
    _cancelSplashTimers();
    _pulseController.dispose();
    super.dispose();
  }

  void _cancelSplashTimers() {
    _statusTimer?.cancel();
    _statusTimer = null;
    _problemsTimer?.cancel();
    _problemsTimer = null;
  }

  void _cancelSplashIfReady() {
    final AsyncValue<void> startup = ref.read(appStartupProvider);
    final bool gatewayReady = ref.read(gatewayReadyProvider);
    if (startup is AsyncData<void> && gatewayReady) {
      _cancelSplashTimers();
    }
  }

  void _allowSplashExit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashExitAllowedProvider.notifier).allow();
    });
  }

  void _scheduleExitReveal() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _maybeStartExitReveal();
    });
  }

  void _maybeStartExitReveal() {
    if (_exitRevealStarted) {
      return;
    }
    final AsyncValue<void> startup = ref.read(appStartupProvider);
    if (startup is! AsyncData<void> || !ref.read(gatewayReadyProvider)) {
      return;
    }
    if (!ref.read(authStateProvider)) {
      return;
    }

    _exitRevealStarted = true;
    _cancelSplashTimers();
    _pulseController.stop();

    final bool animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    final bool useLogoZoomTransition = ref.read(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState state) => state.mobileSplashZoomAnimation,
      ),
    );
    final Offset? logoCenter = _logoCenterGlobal();
    final Color brand = context.colors.brandPrimary;
    SplashRevealOverlay.show(
      context: context,
      coverColor: context.colors.backgroundPrimary,
      logoBrandColor: brand,
      logoBrandSymbolColor: ColorUtils.bestContrastColor(brand.toARGB32()),
      logoCenterGlobal:
          logoCenter ?? MediaQuery.sizeOf(context).center(Offset.zero),
      useLogoZoomTransition: useLogoZoomTransition,
      animationsEnabled: animationsEnabled,
    );
    _allowSplashExit();
    setState(() {});
  }

  Offset? _logoCenterGlobal() {
    final RenderObject? renderObject = _logoKey.currentContext
        ?.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return null;
    }
    return renderObject.localToGlobal(renderObject.size.center(Offset.zero));
  }

  Widget _fadeExitContent({required Widget child}) {
    if (_exitRevealStarted) {
      return const SizedBox.shrink();
    }
    return child;
  }

  void _ensureSplashTimers() {
    if (_timersStarted) {
      return;
    }
    final AsyncValue<void> startup = ref.read(appStartupProvider);
    if (startup is AsyncError<dynamic>) {
      return;
    }
    _timersStarted = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      unawaited(ref.read(serviceStatusIncidentReadProvider.notifier).refresh());
    });
    _statusTimer = Timer(_statusPageDisplayDelay, () {
      if (mounted) {
        setState(() => _showStatusData = true);
      }
    });
    _problemsTimer = Timer(_problemsDelay, () {
      if (!mounted) {
        return;
      }
      setState(() => _showProblems = true);
      unawaited(ref.read(serviceStatusIncidentReadProvider.notifier).refresh());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pulseController.syncWithVisibility(
      isVisible: true,
      animationsEnabled: !MediaQuery.disableAnimationsOf(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations strings = FluxerLocalizations.of(context);
    final AsyncValue<void> startup = ref.watch(appStartupProvider);
    final AsyncError<dynamic>? startupError = startup is AsyncError<dynamic>
        ? startup
        : null;
    final String statusText = strings.splashStartupFailed(
      startupError?.error.toString() ?? '',
    );
    final bool isStartupComplete = startup is AsyncData<void>;
    final bool isGatewayReady = ref.watch(gatewayReadyProvider);
    final bool isReady = isStartupComplete && isGatewayReady;
    ref
      ..listen<bool>(gatewayReadyProvider, (bool? previous, bool _) {
        _cancelSplashIfReady();
        _scheduleExitReveal();
      })
      ..listen<AsyncValue<void>>(appStartupProvider, (
        AsyncValue<void>? previous,
        AsyncValue<void> next,
      ) {
        if (next is AsyncError<dynamic>) {
          _cancelSplashTimers();
          _timersStarted = false;
          if (mounted) {
            setState(() {
              _showStatusData = false;
              _showProblems = false;
            });
          }
          return;
        }
        _ensureSplashTimers();
        _cancelSplashIfReady();
        _scheduleExitReveal();
      });
    final ServiceStatusIncident? liveIncident = _showStatusData
        ? ref.watch(serviceStatusIncidentReadProvider)
        : null;
    final String liveText = liveIncident != null
        ? liveIncident.name
        : _selectedQuote.text;
    if (!isReady) {
      _frozenIncident = liveIncident;
      _frozenDisplayText = liveText;
    }
    final ServiceStatusIncident? visibleIncident = isReady
        ? liveIncident
        : _frozenIncident;
    final String displayText = isReady ? liveText : _frozenDisplayText;
    final ServiceStatusIncident? footerIncident = ref.watch(
      serviceStatusIncidentReadProvider,
    );
    final bool isOfficialInstance = ref.watch(isActiveInstanceOfficialProvider);
    final String displayDomain = ref.watch(activeInstanceDisplayDomainProvider);
    final bool showConnectionProblemsFooter =
        _showProblems && !isReady && visibleIncident == null;
    final bool showConnectionFooter =
        showConnectionProblemsFooter && isOfficialInstance;
    final bool showSelfHostedAccountSwitcher =
        showConnectionProblemsFooter && !isOfficialInstance;
    final String secondLinkUrl =
        footerIncident?.url ?? ExternalUrls.serviceStatusHistory;
    final TextStyle footerPromptStyle = context.textStyles.bodySmall.copyWith(
      fontSize: 13,
      height: 1.4,
      color: _splashMutedText,
    );
    final TextStyle footerLinkStyle = footerPromptStyle.copyWith(
      color: _splashLinkText,
    );
    final TextStyle incidentCtaStyle = context.textStyles.smallText.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: _splashLinkText,
    );
    final TextStyle instanceFooterStyle = context.textStyles.bodySmall.copyWith(
      fontSize: 12,
      color: _splashMutedText,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarfieldBackground(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 512),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: _logoHeight * 2,
                        width: _logoHeight * 2,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (!_exitRevealStarted &&
                                MediaQuery.disableAnimationsOf(context))
                              Transform.scale(
                                scale: 1.25,
                                child: Container(
                                  width: _logoHeight,
                                  height: _logoHeight,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.colors.brandPrimary
                                        .withValues(alpha: 0.35),
                                  ),
                                ),
                              )
                            else if (!_exitRevealStarted)
                              AnimatedBuilder(
                                animation: _pulseController,
                                builder: (BuildContext context, Widget? child) {
                                  const double startScale = 0.4;
                                  const double endScale = 1.4;
                                  final double scale =
                                      startScale +
                                      (endScale - startScale) *
                                          Curves.easeOut.transform(
                                            _pulseController.value,
                                          );
                                  final double opacity =
                                      (1 -
                                          Curves.easeIn.transform(
                                            _pulseController.value,
                                          )) *
                                      0.5;
                                  return Transform.scale(
                                    scale: scale,
                                    child: Container(
                                      width: _logoHeight,
                                      height: _logoHeight,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.colors.brandPrimary
                                            .withValues(alpha: opacity),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            if (!_exitRevealStarted)
                              KeyedSubtree(
                                key: _logoKey,
                                child: FluxerBrandLogo(
                                  size: _logoHeight,
                                  backgroundColor: context.colors.brandPrimary,
                                ),
                              ),
                          ],
                        ),
                      ),
                      _fadeExitContent(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: startupError == null
                              ? _buildNormalMessageArea(
                                  context,
                                  strings,
                                  visibleIncident,
                                  displayText,
                                  incidentCtaStyle,
                                )
                              : Text(
                                  statusText,
                                  style: context.textStyles.smallText.copyWith(
                                    color: context.colors.textDanger,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ),
                      ),
                      if (startupError != null)
                        _fadeExitContent(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 16),
                              FilledButton(
                                onPressed: () => ref
                                    .read(appStartupProvider.notifier)
                                    .retry(),
                                style: FilledButton.styleFrom(
                                  backgroundColor: context.colors.brandPrimary,
                                ),
                                child: Text(strings.retry),
                              ),
                              const SizedBox(height: 12),
                              const OfflineAccountSwitcherLink(),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 24,
                child: _fadeExitContent(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (showConnectionFooter)
                        AnimatedOpacity(
                          opacity: 1,
                          duration: _footerFadeDuration,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  strings.splashConnectionIssuesPrompt,
                                  style: footerPromptStyle,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: FluxerGestureDetector(
                                        onTap: () => handleExternalLinkTap(
                                          context,
                                          ExternalUrls.serviceStatus,
                                        ),
                                        child: Text(
                                          strings.splashStatusPageLink,
                                          style: footerLinkStyle,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '·',
                                      style: footerPromptStyle.copyWith(
                                        color: _splashMutedText,
                                      ),
                                    ),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: FluxerGestureDetector(
                                        onTap: () => handleExternalLinkTap(
                                          context,
                                          secondLinkUrl,
                                        ),
                                        child: Text(
                                          footerIncident != null
                                              ? strings.splashReadIncident
                                              : strings.splashIncidentHistory,
                                          style: footerLinkStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const OfflineAccountSwitcherLink(),
                              ],
                            ),
                          ),
                        ),
                      if (showSelfHostedAccountSwitcher) ...[
                        const OfflineAccountSwitcherLink(),
                        const SizedBox(height: 16),
                      ],
                      if (showConnectionFooter) const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InstanceDomainIcon(isOfficial: isOfficialInstance),
                          const SizedBox(width: 4),
                          Text(displayDomain, style: instanceFooterStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNormalMessageArea(
    BuildContext context,
    FluxerLocalizations strings,
    ServiceStatusIncident? visibleIncident,
    String displayText,
    TextStyle incidentCtaStyle,
  ) {
    if (visibleIncident != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: FluxerGestureDetector(
              onTap: () => handleExternalLinkTap(context, visibleIncident.url),
              child: Text(
                displayText,
                style: context.textStyles.quoteLink.copyWith(
                  color: _splashQuoteText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 12),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: FluxerGestureDetector(
              onTap: () =>
                  handleExternalLinkTap(context, ExternalUrls.serviceStatus),
              child: Text(
                strings.splashViewOnStatusPage,
                style: incidentCtaStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          displayText,
          style: context.textStyles.quote.copyWith(color: _splashQuoteText),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          _selectedQuote.source,
          style: context.textStyles.quoteLink.copyWith(
            color: _splashMutedText,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
