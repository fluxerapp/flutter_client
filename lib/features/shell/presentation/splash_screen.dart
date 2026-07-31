import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/constants/external_urls.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_domain_icon.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/offline_account_switcher_link.dart';
import 'package:fluxer_app/features/shell/domain/service_status_incident.dart';
import 'package:fluxer_app/features/shell/providers/service_status_incident_provider.dart';
import 'package:fluxer_app/features/shell/utils/splash_quotes.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_brand_logo.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

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

  late final AnimationController _pulseController;
  late final SplashQuote _selectedQuote;
  Timer? _statusTimer;
  Timer? _problemsTimer;
  bool _showStatusData = false;
  bool _showProblems = false;
  bool _timersStarted = false;
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
      final AsyncValue<void> startup = ref.read(appStartupProvider);
      if (startup is AsyncError<dynamic>) {
        return;
      }
      _ensureSplashTimers();
      _cancelSplashIfReady();
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

  void _ensureSplashTimers() {
    if (_timersStarted) {
      return;
    }
    final AsyncValue<void> startup = ref.read(appStartupProvider);
    if (startup is AsyncError<dynamic>) {
      return;
    }
    _timersStarted = true;
    unawaited(ref.read(serviceStatusIncidentReadProvider.notifier).refresh());
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
    final bool disableMotion = MediaQuery.disableAnimationsOf(context);
    if (disableMotion) {
      _pulseController.stop();
    } else {
      if (!_pulseController.isAnimating) {
        unawaited(_pulseController.repeat());
      }
    }
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
      ..listen<bool>(
        gatewayReadyProvider,
        (bool? previous, bool _) => _cancelSplashIfReady(),
      )
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
      color: context.colors.textSecondary,
    );
    final TextStyle footerLinkStyle = footerPromptStyle.copyWith(
      color: context.colors.textLink,
    );
    final TextStyle incidentCtaStyle = context.textStyles.smallText.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: context.colors.textLink,
    );
    final TextStyle instanceFooterStyle = context.textStyles.bodySmall.copyWith(
      fontSize: 12,
      color: context.colors.textChatMuted,
    );

    return Scaffold(
      backgroundColor: context.colors.backgroundSecondary,
      body: SafeArea(
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
                          if (MediaQuery.disableAnimationsOf(context))
                            Transform.scale(
                              scale: 1.25,
                              child: Container(
                                width: _logoHeight,
                                height: _logoHeight,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.colors.brandPrimary.withValues(
                                    alpha: 0.35,
                                  ),
                                ),
                              ),
                            )
                          else
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
                          const FluxerBrandLogo(size: _logoHeight),
                        ],
                      ),
                    ),
                    Padding(
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
                    if (startupError != null) ...[
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () =>
                            ref.read(appStartupProvider.notifier).retry(),
                        style: FilledButton.styleFrom(
                          backgroundColor: context.colors.brandPrimary,
                        ),
                        child: Text(strings.retry),
                      ),
                      const SizedBox(height: 12),
                      const OfflineAccountSwitcherLink(),
                    ],
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 24,
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
                                  child: GestureDetector(
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
                                    color: context.colors.textChatMuted,
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
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
          ],
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
            child: GestureDetector(
              onTap: () => handleExternalLinkTap(context, visibleIncident.url),
              child: Text(
                displayText,
                style: context.textStyles.quoteLink,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 12),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
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
          style: context.textStyles.quote,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          _selectedQuote.source,
          style: context.textStyles.quoteLink.copyWith(
            color: context.colors.textChatMuted,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
