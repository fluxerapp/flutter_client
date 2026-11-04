import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/mfa_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_closure_notice_alert.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/forgot_password_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/ip_authorization_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/login_form.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/recover_account_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/register_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/reset_password_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/sso_button.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/suspended_account_screen.dart';
import 'package:fluxer_app/features/auth/providers/account_closure_notice_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/material_ui.dart';

class AuthFlowContent extends ConsumerWidget {
  const AuthFlowContent({this.heading, super.key});

  final String? heading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginViewState vm = ref.watch(loginViewModelProvider);
    final LoginViewModel notifier = ref.read(loginViewModelProvider.notifier);

    if (vm.resetToken != null) {
      return ResetPasswordScreen(
        token: vm.resetToken!,
        onBack: notifier.clearResetToken,
      );
    }

    if (vm.showForgotPassword &&
        ref.watch(
          authInstanceRuntimeConfigProvider.select(
            (config) => config.usernameSignIn,
          ),
        )) {
      return RecoverAccountScreen(onBack: notifier.backFromForgotPassword);
    }

    if (vm.showForgotPassword) {
      return ForgotPasswordScreen(
        onBack: notifier.backFromForgotPassword,
        onRegister: notifier.showRegisterScreen,
      );
    }

    if (vm.showRegister) {
      return RegisterScreen(onBack: notifier.backFromRegister);
    }

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

    if (vm.accountRestricted) {
      return SuspendedAccountScreen(
        notice: vm.enforcementNotice,
        onBack: notifier.clearAccountRestriction,
      );
    }

    final AccountClosureNotice? closure = ref.watch(
      pendingAccountClosureNoticeProvider,
    );
    final Widget form = ref.watch(isAuthInstanceSsoEnforcedProvider)
        ? const SsoLoginPanel()
        : LoginForm(heading: heading);
    if (closure == null) {
      return form;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AccountClosureNoticeAlert(notice: closure),
        SizedBox(height: context.layout.s6),
        form,
      ],
    );
  }
}
