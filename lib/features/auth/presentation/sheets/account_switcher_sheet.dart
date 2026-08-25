import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/add_account_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_row.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountSwitcherSheet {
  AccountSwitcherSheet._();

  static Future<void> show(BuildContext context) async {
    await FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).accountManageTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return FluxerBottomSheetContent(
          child: AccountSwitcherSheetBody(onClose: close),
        );
      },
    );
  }
}

class AccountSwitcherSheetBody extends ConsumerWidget {
  const AccountSwitcherSheetBody({required this.onClose, super.key});

  final VoidCallback onClose;

  Future<void> _confirmSignOut(
    BuildContext context,
    WidgetRef ref,
    StoredAccount account, {
    required bool isCurrent,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AccountManager manager = ref.read(accountManagerProvider.notifier);
    await FluxerConfirmModal.show(
      context,
      title: l10n.signOut,
      description: l10n.accountRemoveDescription,
      confirmLabel: l10n.signOut,
      isDanger: true,
      onConfirm: () {
        if (isCurrent) {
          unawaited(manager.signOut(account.userId));
        } else {
          unawaited(manager.removeAccount(account.userId));
        }
      },
    );
  }

  Future<void> _handleSelectAccount(
    WidgetRef ref,
    StoredAccount account,
    FluxerLocalizations l10n,
  ) async {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (account.userId == currentUserId) {
      return;
    }
    if (!account.isValid) {
      onClose();
      final BuildContext? rootContext = rootNavigatorKey.currentContext;
      if (rootContext == null || !rootContext.mounted) {
        return;
      }
      await Navigator.of(rootContext, rootNavigator: true).push<void>(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (_) => AddAccountScreen(prefillEmail: account.identifier),
        ),
      );
      return;
    }
    onClose();
    try {
      await ref
          .read(accountManagerProvider.notifier)
          .switchToAccount(account.userId);
    } on SessionExpiredFailure {
      ref.read(loginViewModelProvider.notifier)
        ..updateEmail(account.identifier)
        ..hideAccountSelector();
      final BuildContext? rootContext = rootNavigatorKey.currentContext;
      if (rootContext == null || !rootContext.mounted) {
        return;
      }
      await Navigator.of(rootContext, rootNavigator: true).push<void>(
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (_) => AddAccountScreen(prefillEmail: account.identifier),
        ),
      );
    } on Object catch (_) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.accountSwitchFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<void> _handleAddAccount(BuildContext context) async {
    onClose();
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => const AddAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<StoredAccount> accounts = ref
        .watch(accountManagerProvider)
        .accounts;
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    if (accounts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...accounts.map(
          (StoredAccount account) => Padding(
            padding: EdgeInsets.only(bottom: layout.s2),
            child: AccountRow(
              account: account,
              isCurrent: account.userId == currentUserId,
              onTap: () => unawaited(_handleSelectAccount(ref, account, l10n)),
              onSignOut: () => unawaited(
                _confirmSignOut(
                  context,
                  ref,
                  account,
                  isCurrent: account.userId == currentUserId,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: layout.s2),
        FluxerButton.secondary(
          onPressed: () => unawaited(_handleAddAccount(context)),
          label: l10n.accountAdd,
          icon: PhosphorIconsBold.plus,
          fitContent: true,
        ),
      ],
    );
  }
}
