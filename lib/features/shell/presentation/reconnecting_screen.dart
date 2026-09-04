import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/offline_account_switcher_link.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/service_status_connection_footer.dart';
import 'package:fluxer_app/features/shell/providers/service_status_incident_provider.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Duration _kRetryDelay = Duration(seconds: 3);

class ReconnectingScreen extends ConsumerStatefulWidget {
  const ReconnectingScreen({super.key});

  @override
  ConsumerState<ReconnectingScreen> createState() => _ReconnectingScreenState();
}

class _ReconnectingScreenState extends ConsumerState<ReconnectingScreen> {
  Timer? _retryTimer;
  var _retryInFlight = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      unawaited(_retryConnection());
      unawaited(ref.read(serviceStatusIncidentReadProvider.notifier).refresh());
    });
    _scheduleRetry();
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    super.dispose();
  }

  Future<void> _retryConnection() async {
    if (_retryInFlight) {
      return;
    }
    // A session-expiry sign-out nulls the token and invalidates the gateway
    // connection provider — reading it would throw. The router is already
    // redirecting to /login at that point.
    if (!ref.read(authStateProvider)) {
      return;
    }
    _retryInFlight = true;
    try {
      final List<ConnectivityResult> results = await Connectivity()
          .checkConnectivity();
      final bool hasConnection = results.any(
        (ConnectivityResult r) => r != ConnectivityResult.none,
      );
      if (!hasConnection) {
        return;
      }
      await ref.read(gatewayConnectionProvider).reconnectNow();
    } finally {
      _retryInFlight = false;
    }
  }

  void _scheduleRetry() {
    _retryTimer = Timer(_kRetryDelay, () async {
      await _retryConnection();
      if (mounted) {
        _scheduleRetry();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations strings = FluxerLocalizations.of(context);
    ref.listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
      if (previous == false && next) {
        unawaited(_retryConnection());
      }
    });
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.plugsConnected,
              size: 48,
              color: context.colors.textPrimaryMuted,
            ),
            const SizedBox(height: 16),
            Text(
              strings.reconnectingTitle,
              style: context.textStyles.heading.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              strings.reconnectingBody,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
            const SizedBox(height: 24),
            FluxerLoadingSpinner(color: context.colors.brandPrimary),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ServiceStatusConnectionFooter(
                promptStyle: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textPrimaryMuted,
                ),
                linkStyle: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textLink,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const OfflineAccountSwitcherLink(),
          ],
        ),
      ),
    );
  }
}
