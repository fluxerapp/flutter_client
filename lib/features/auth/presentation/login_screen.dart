import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_selector.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_flow_content.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_viewport.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/forgot_password_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/register_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/reset_password_screen.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  Widget _buildAuthContent(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);

    if (vm.resetToken != null) {
      return ResetPasswordScreen(
        token: vm.resetToken!,
        onBack: notifier.clearResetToken,
      );
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

    final accountState = ref.watch(accountManagerProvider);

    // Account selector when accounts exist and not adding new.
    if (vm.showAccountSelector && accountState.accounts.isNotEmpty) {
      return AccountSelector(
        currentUserId: ref.read(currentUserIdProvider) ?? '',
        onSelectAccount: (account) {
          if (account.isValid) {
            final l10n = FluxerLocalizations.of(context);
            unawaited(
              ref
                  .read(accountManagerProvider.notifier)
                  .switchToAccount(account.userId)
                  .catchError((Object e) {
                    if (e is SessionExpiredFailure) {
                      notifier.setError(
                        l10n.accountSessionExpired(account.identifier),
                      );
                    }
                  }),
            );
          } else {
            // Pre-fill email for expired account.
            notifier
              ..updateEmail(account.identifier)
              ..hideAccountSelector();
          }
        },
        onAddAccount: notifier.hideAccountSelector,
      );
    }

    return const AuthFlowContent();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load stored accounts on first build.
    ref.listen(accountManagerProvider, (_, _) {});
    final accountManager = ref.read(accountManagerProvider);
    if (accountManager.accounts.isEmpty) {
      unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
    }

    final isMobile = isMobileLayout(context);

    if (isMobile) {
      return _buildMobileLayout(context, ref);
    }
    return _buildDesktopLayout(context, ref);
  }

  Widget _buildDesktopLayout(BuildContext context, WidgetRef ref) {
    final layout = context.layout;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarfieldBackground(
        child: Center(
          child: Container(
            width: 800,
            margin: EdgeInsets.all(layout.s5),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: context.colors.backgroundSecondary,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 8,
                  blurRadius: 24,
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ColoredBox(
                      color: context.colors.backgroundSecondary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InstanceBrandMark(size: 128),
                          SizedBox(height: layout.s4),
                          InstanceWordmark(
                            height: 36,
                            color: context.colors.textPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(color: context.colors.borderColor, width: 1),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(layout.s8),
                      child: _buildAuthContent(context, ref),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, WidgetRef ref) {
    final layout = context.layout;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarfieldBackground(
        child: AuthViewport(
          maxWidth: 448,
          padding: EdgeInsets.symmetric(
            horizontal: layout.s6,
            vertical: layout.s8,
          ),
          child: Column(
            children: [
              InstanceWordmark(height: 32, color: context.colors.textPrimary),
              SizedBox(height: layout.s8),
              _buildAuthContent(context, ref),
            ],
          ),
        ),
      ),
    );
  }
}
