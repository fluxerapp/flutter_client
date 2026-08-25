import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/account_switcher_sheet.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/profile/domain/presence_status_labels.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileTabMenuSheet {
  ProfileTabMenuSheet._();

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
    await FluxerBottomSheet.show<void>(
      context,
      variant: FluxerBottomSheetVariant.menu,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return FluxerBottomSheetContent(
          scrollable: false,
          child: ProfileTabMenuSheetBody(
            onClose: close,
            onOpenStatus: () {
              close();
              unawaited(StatusChangeSheet.show(sheetContext));
            },
            onOpenAccounts: () {
              close();
              unawaited(AccountSwitcherSheet.show(sheetContext));
            },
          ),
        );
      },
    );
  }
}

class ProfileTabMenuSheetBody extends ConsumerWidget {
  const ProfileTabMenuSheetBody({
    required this.onClose,
    required this.onOpenStatus,
    required this.onOpenAccounts,
    super.key,
  });

  final VoidCallback onClose;
  final VoidCallback onOpenStatus;
  final VoidCallback onOpenAccounts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserSettingsViewState user = ref.watch(userSettingsViewModelProvider);
    final String? selfUserId = user.userId.isEmpty ? null : user.userId;
    final String status = selfUserId == null
        ? 'online'
        : ref.watch(userPresenceProvider(selfUserId)).value?.status ?? 'online';

    return FluxerBottomSheetGroupColumn(
      children: [
        FluxerMenuGroup(
          children: [
            FluxerBottomSheetMenuItem(
              label: presenceStatusLabel(status, l10n),
              leading: FluxerStatusIndicator(status: status, size: 14),
              trailing: PhosphorIcon(
                PhosphorIconsBold.caretRight,
                size: 20,
                color: context.colors.textPrimaryMuted,
              ),
              onTap: onOpenStatus,
            ),
            FluxerBottomSheetSubmenuItem(
              label: l10n.profileTabMenuSwitchAccounts,
              icon: PhosphorIconsBold.users,
              onTap: onOpenAccounts,
            ),
          ],
        ),
      ],
    );
  }
}
