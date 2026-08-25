import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/account_switcher_sheet.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

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
      if (ref.read(authStateProvider)) {
        unawaited(ref.read(accountManagerProvider.notifier).loadAccounts());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(authStateProvider)) {
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
      onTap: () => unawaited(AccountSwitcherSheet.show(context)),
      style: linkStyle,
      color: context.colors.textLink,
    );
  }
}
