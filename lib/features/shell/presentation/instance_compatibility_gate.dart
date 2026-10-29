import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/constants/external_urls.dart';
import 'package:fluxer_app/core/instance/instance_compatibility_messages.dart';
import 'package:fluxer_app/core/instance/instance_discovery_service.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_compatibility_provider.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/offline_account_switcher_link.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart'
    show InstanceBrandMark;
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_dart/export.dart';

class InstanceCompatibilityGate extends ConsumerWidget {
  const InstanceCompatibilityGate({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ActiveInstanceCompatibilityIssue? issue = ref.watch(
      activeInstanceCompatibilityProvider,
    );
    if (issue == null) {
      return child;
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        IgnorePointer(child: child),
        Positioned.fill(child: _InstanceCompatibilityScreen(issue: issue)),
      ],
    );
  }
}

class _InstanceCompatibilityScreen extends ConsumerWidget {
  const _InstanceCompatibilityScreen({required this.issue});

  final ActiveInstanceCompatibilityIssue issue;

  Future<void> _retry(WidgetRef ref) async {
    await ref.read(wellKnownProvider.notifier).refresh(silent: false);
  }

  Future<void> _openAppUpdate(BuildContext context) async {
    await handleExternalLinkTap(context, ExternalUrls.fluxerDownload);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String body = instanceCompatibilityBody(
      issue.reason,
      issue.domain,
      l10n,
    );
    final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
      wellKnownProvider,
    );
    final String? statusPageUrl = wellKnown
        .asData
        ?.value
        .appPublic
        .branding
        .statusPageUrl
        ?.trim();
    final bool showUpdate =
        issue.reason == InstanceDiscoveryFailureReason.requiresNewerClient;
    final bool retrying = wellKnown.isLoading;

    return Material(
      color: context.colors.backgroundPrimary,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.layout.s6),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const InstanceBrandMark(size: 72),
              SizedBox(height: context.layout.s6),
              Text(
                l10n.instanceCompatibilityTitle,
                style: context.textStyles.heading,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.layout.s3),
              Text(
                body,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              if (statusPageUrl != null && statusPageUrl.isNotEmpty) ...[
                SizedBox(height: context.layout.s4),
                Text.rich(
                  TextSpan(
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                    ),
                    children: [
                      TextSpan(
                        text: '${l10n.instanceCompatibilityStatusPagePrompt} ',
                      ),
                      TextSpan(
                        text: l10n.instanceCompatibilityStatusPageLink,
                        style: TextStyle(color: context.colors.textLink),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => unawaited(
                            handleExternalLinkTap(context, statusPageUrl),
                          ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const Spacer(flex: 3),
              FluxerButton.primary(
                onPressed: retrying ? null : () => unawaited(_retry(ref)),
                label: l10n.instanceCompatibilityRetry,
                isLoading: retrying,
              ),
              if (showUpdate) ...[
                SizedBox(height: context.layout.s3),
                FluxerButton.secondary(
                  onPressed: () => unawaited(_openAppUpdate(context)),
                  label: l10n.instanceCompatibilityUpdateApp,
                ),
              ],
              SizedBox(height: context.layout.s4),
              const OfflineAccountSwitcherLink(),
              SizedBox(height: context.layout.s6),
            ],
          ),
        ),
      ),
    );
  }
}
