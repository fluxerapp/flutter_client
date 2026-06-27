import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/auth/presentation/mfa_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/ip_authorization_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/login_form.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/sso_button.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/suspended_account_screen.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';

class AuthFlowContent extends ConsumerWidget {
  const AuthFlowContent({
    required this.showBrowserLogin,
    this.heading,
    super.key,
  });

  final bool showBrowserLogin;
  final String? heading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginViewState vm = ref.watch(loginViewModelProvider);
    final LoginViewModel notifier = ref.read(loginViewModelProvider.notifier);

    if (vm.mfaChallenge != null) {
      return MfaScreen(
        challenge: vm.mfaChallenge!,
        onAuthorized: () => unawaited(notifier.completeMfa()),
        onBack: notifier.clearMfaChallenge,
      );
    }

    if (vm.ipAuthChallenge != null) {
      return IpAuthorizationScreen(
        challenge: vm.ipAuthChallenge!,
        onAuthorized: () => unawaited(notifier.completeIpAuth()),
        onBack: notifier.clearIpAuthChallenge,
      );
    }

    if (vm.banViewInfo != null) {
      return SuspendedAccountScreen(onBack: notifier.clearBanView);
    }

    if (ref.watch(isAuthInstanceSsoEnforcedProvider)) {
      return const SsoLoginPanel();
    }

    return LoginForm(showBrowserLogin: showBrowserLogin, heading: heading);
  }
}
