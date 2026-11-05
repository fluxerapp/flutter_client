import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_closure_notice_alert.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_selector.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_flow_content.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_viewport.dart';
import 'package:fluxer_app/features/auth/providers/account_closure_notice_provider.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart';
import 'package:fluxer_app/material_ui.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  Widget _buildAuthContent(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);

    final accountState = ref.watch(accountManagerProvider);

    final bool showAccountSelector =
        vm.showAccountSelector &&
        !vm.signInInFlight &&
        !ref.watch(authStateProvider) &&
        accountState.accounts.isNotEmpty;

    if (showAccountSelector) {
      final AccountClosureNotice? closure = ref.watch(
        pendingAccountClosureNoticeProvider,
      );
      final Widget selector = AccountSelector(
        currentUserId: ref.read(currentUserIdProvider) ?? '',
        onSelectAccount: (account) {
          ref.read(pendingAccountClosureNoticeProvider.notifier).clear();
          final AuthRepository authRepository = ref.read(
            authRepositoryProvider,
          );
          final InstanceSelector selector = ref.read(
            instanceSelectorProvider.notifier,
          );
          void openExpiredSignIn() {
            notifier.startExpiredSignIn(account);
            unawaited(
              authRepository
                  .resolveInstanceSnapshotForUser(account.userId)
                  .then(selector.selectKnownInstance),
            );
          }

          if (!account.isValid) {
            openExpiredSignIn();
            return;
          }
          unawaited(
            ref
                .read(accountManagerProvider.notifier)
                .switchToAccount(account.userId, ignoreIfPending: true)
                .catchError((Object e) {
                  if (e is SessionExpiredFailure) {
                    openExpiredSignIn();
                  }
                }),
          );
        },
        onAddAccount: notifier.startNewSignIn,
      );
      if (closure == null) {
        return selector;
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AccountClosureNoticeAlert(notice: closure),
          SizedBox(height: context.layout.s6),
          selector,
        ],
      );
    }

    return const AuthFlowContent();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
