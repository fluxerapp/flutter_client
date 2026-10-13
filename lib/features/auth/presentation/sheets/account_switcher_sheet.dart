import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/add_account_screen.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_row.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_domain_icon.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/selected_check/fluxer_selected_check.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
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
      title: FluxerLocalizations.of(context).profileTabMenuSwitchAccounts,
      variant: FluxerBottomSheetVariant.menu,
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
    await FluxerConfirmModal.show(
      context,
      title: l10n.accountSignOutTitle(account.identifier),
      description: l10n.accountRemoveDescription,
      confirmLabel: l10n.signOut,
      isDanger: true,
      onConfirm: () {
        final AccountManager manager = ref.read(
          accountManagerProvider.notifier,
        );
        if (isCurrent) {
          unawaited(manager.signOut(account.userId));
        } else {
          unawaited(manager.removeAccount(account.userId));
        }
      },
    );
  }

  Future<void> _openAddAccount({StoredAccount? expiredAccount}) async {
    final BuildContext? rootContext = rootNavigatorKey.currentContext;
    if (rootContext == null || !rootContext.mounted) {
      return;
    }
    await Navigator.of(rootContext, rootNavigator: true).push<void>(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => AddAccountScreen(expiredAccount: expiredAccount),
      ),
    );
  }

  Future<void> _handleSelectAccount(
    WidgetRef ref,
    StoredAccount account,
    FluxerLocalizations l10n,
  ) async {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (account.userId == currentUserId) {
      onClose();
      return;
    }
    onClose();
    if (!account.isValid) {
      await _openAddAccount(expiredAccount: account);
      return;
    }
    try {
      await ref
          .read(accountManagerProvider.notifier)
          .switchToAccount(account.userId, ignoreIfPending: true);
    } on SessionExpiredFailure {
      await _openAddAccount(expiredAccount: account);
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<StoredAccount> accounts = ref
        .watch(accountManagerProvider)
        .accounts;
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return FluxerBottomSheetGroupColumn(
      children: [
        FluxerMenuGroup(
          children: [
            for (final StoredAccount account in accounts)
              _AccountSwitcherRow(
                account: account,
                isCurrent: account.userId == currentUserId,
                onTap: () =>
                    unawaited(_handleSelectAccount(ref, account, l10n)),
                onSignOut: () => unawaited(
                  _confirmSignOut(
                    context,
                    ref,
                    account,
                    isCurrent: account.userId == currentUserId,
                  ),
                ),
              ),
            _AddAccountRow(
              onTap: () {
                onClose();
                unawaited(_openAddAccount());
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _AccountSwitcherRow extends StatelessWidget {
  const _AccountSwitcherRow({
    required this.account,
    required this.isCurrent,
    required this.onTap,
    required this.onSignOut,
  });

  final StoredAccount account;
  final bool isCurrent;
  final VoidCallback onTap;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return FluxerTappable(
      onTap: onTap,
      selected: isCurrent,
      semanticLabel: '${account.displayName}, ${account.instanceDomain}',
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool isPressed = states.contains(WidgetState.pressed);
        return ColoredBox(
          color: isPressed ? colors.listItemPressedBg : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 6, 10),
            child: Row(
              children: [
                FluxerAvatar.user(
                  userId: account.userId,
                  imageUrl: account.avatarUrl(),
                  fallbackText: account.displayName,
                  showStatus: false,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        account.displayName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyles.username.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          InstanceDomainIcon(
                            isOfficial: account.isOfficialInstance,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              account.isValid
                                  ? account.instanceDomain
                                  : '${account.instanceDomain} · ${l10n.accountExpired}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyles.timestamp.copyWith(
                                color: account.isValid
                                    ? colors.textTertiary
                                    : colors.textDanger,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isCurrent) ...[
                  const SizedBox(width: 12),
                  const FluxerSelectedCheck(),
                ],
                const SizedBox(width: 4),
                AccountOverflowButton(onSignOut: onSignOut),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AddAccountRow extends StatelessWidget {
  const _AddAccountRow({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String label = FluxerLocalizations.of(context).accountAdd;

    return FluxerTappable(
      onTap: onTap,
      semanticLabel: label,
      excludeChildSemantics: true,
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool isPressed = states.contains(WidgetState.pressed);
        return ColoredBox(
          color: isPressed ? colors.listItemPressedBg : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                SizedBox.square(
                  dimension: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.backgroundModifierAccent,
                    ),
                    child: Center(
                      child: PhosphorIcon(
                        PhosphorIconsBold.plus,
                        size: 18,
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: context.textStyles.username.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
