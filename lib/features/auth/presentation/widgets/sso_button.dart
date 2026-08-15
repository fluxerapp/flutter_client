import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/instance_selector_sheet.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_selector.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

class SsoButton extends ConsumerWidget {
  const SsoButton({required this.enabled, this.subtitle, super.key});

  final bool enabled;
  final String? subtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations strings = FluxerLocalizations.of(context);
    final LoginViewState vm = ref.watch(loginViewModelProvider);
    final LoginViewModel notifier = ref.read(loginViewModelProvider.notifier);
    final WellKnownFluxerResponseSso? ssoConfig = ref
        .watch(authInstanceSnapshotProvider)
        .ssoConfig;
    final String providerName = ssoConfig?.displayName ?? 'Single Sign-On';
    final bool canAuthenticate = ref.watch(
      instanceSelectorCanAuthenticateProvider,
    );
    final bool canStartSso = enabled && canAuthenticate && !vm.isLoggingIn;
    final String? errorText = resolveLoginError(vm, strings);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (subtitle != null) ...[
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textTertiary,
            ),
          ),
          SizedBox(height: context.layout.s4),
        ],
        FluxerButton.secondary(
          onPressed: canStartSso
              ? () => unawaited(notifier.startSsoLogin())
              : null,
          label: strings.continueWithSso(providerName),
          isLoading: vm.isStartingSso,
        ),
        if (errorText != null) ...[
          SizedBox(height: context.layout.s2),
          Text(
            errorText,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textDanger,
            ),
          ),
        ],
      ],
    );
  }
}

class SsoLoginPanel extends ConsumerWidget {
  const SsoLoginPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations strings = FluxerLocalizations.of(context);
    final LoginViewState vm = ref.watch(loginViewModelProvider);
    final WellKnownFluxerResponseSso? ssoConfig = ref
        .watch(authInstanceSnapshotProvider)
        .ssoConfig;
    final String providerName = ssoConfig?.displayName ?? 'Single Sign-On';

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InstanceSelectorLoginEntry(
          enabled: !vm.isLoggingIn && !vm.isStartingSso,
          onOpenSheet: () => unawaited(showInstanceSelectorSheet(context)),
        ),
        SizedBox(height: context.layout.s6),
        Text(
          providerName,
          textAlign: TextAlign.center,
          style: context.textStyles.heading,
        ),
        SizedBox(height: context.layout.s4),
        Text(
          strings.organizationSsoProvider,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textTertiary,
          ),
        ),
        SizedBox(height: context.layout.s8),
        SsoButton(enabled: !vm.isLoggingIn),
      ],
    );
  }
}
