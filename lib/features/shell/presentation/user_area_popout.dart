import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/account_switcher_sheet.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserAreaPopout {
  UserAreaPopout._();

  static Future<void> show(BuildContext context, WidgetRef ref) {
    unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.statusChangeSheetTitle,
      variant: FluxerBottomSheetVariant.menu,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              StatusChangeSheetBody(onClose: close),
              const Divider(height: 1),
              ListTile(
                leading: const PhosphorIcon(PhosphorIconsBold.users, size: 20),
                title: Text(l10n.profileTabMenuSwitchAccounts),
                trailing: const PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: 20,
                ),
                onTap: () {
                  close();
                  unawaited(AccountSwitcherSheet.show(context));
                },
              ),
              ListTile(
                leading: const PhosphorIcon(PhosphorIconsBold.user, size: 20),
                title: Text(l10n.userSettingsNavProfile),
                onTap: () {
                  close();
                  unawaited(UserSettingsModal.show(context));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
