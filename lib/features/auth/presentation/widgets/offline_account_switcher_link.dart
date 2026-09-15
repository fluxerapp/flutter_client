import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/account_switcher_sheet.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/instance_selector_sheet.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> openOfflineInstanceEscape(
  BuildContext context,
  WidgetRef ref,
) async {
  await ref.read(accountManagerProvider.notifier).loadAccounts();
  if (!context.mounted) {
    return;
  }
  if (ref.read(accountManagerProvider).accounts.isEmpty) {
    await showInstanceSelectorSheet(context);
    return;
  }
  await AccountSwitcherSheet.show(context);
}

class OfflineAccountSwitcherLink extends ConsumerStatefulWidget {
  const OfflineAccountSwitcherLink({super.key});

  @override
  ConsumerState<OfflineAccountSwitcherLink> createState() =>
      _OfflineAccountSwitcherLinkState();
}

class _OfflineAccountSwitcherLinkState
    extends ConsumerState<OfflineAccountSwitcherLink> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(accountManagerProvider).accounts.isEmpty) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle linkStyle = context.textStyles.bodySmall.copyWith(
      fontSize: 13,
      height: 1.4,
      color: context.colors.textLink,
    );
    return FluxerTextLink(
      text: l10n.profileTabMenuSwitchAccounts,
      onTap: () => unawaited(openOfflineInstanceEscape(context, ref)),
      style: linkStyle,
      color: context.colors.textLink,
    );
  }
}
