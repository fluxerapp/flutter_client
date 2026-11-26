import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/mac_permission_intro_step.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/auth/providers/mac_permission_intro_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class MacPermissionIntroGate extends ConsumerStatefulWidget {
  const MacPermissionIntroGate({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<MacPermissionIntroGate> createState() =>
      _MacPermissionIntroGateState();
}

class _MacPermissionIntroGateState
    extends ConsumerState<MacPermissionIntroGate> {
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = ref.read(macPermissionIntroProvider.notifier).isPending;
    if (_loading) {
      unawaited(_start());
    }
  }

  Future<void> _start() async {
    try {
      await ref.read(accountManagerProvider.notifier).loadAccounts();
      if (!mounted) {
        return;
      }
      if (ref.read(accountManagerProvider).accounts.isEmpty) {
        await ref.read(macPermissionIntroProvider.notifier).start();
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final MacPermissionIntroState intro = ref.watch(macPermissionIntroProvider);
    final bool interrupted = ref.watch(
      loginViewModelProvider.select(
        (LoginViewState vm) =>
            vm.expiredAccount != null ||
            vm.resetToken != null ||
            vm.mfaChallenge != null ||
            vm.ipAuthChallenge != null ||
            vm.accountRestricted ||
            vm.showForgotPassword,
      ),
    );
    if (interrupted) {
      return widget.child;
    }
    if (_loading) {
      return const SizedBox(height: 240);
    }
    final MacPermissionKind? kind = intro.current;
    if (kind == null) {
      return widget.child;
    }
    final MacPermissionIntro notifier = ref.read(
      macPermissionIntroProvider.notifier,
    );
    return MacPermissionIntroStep(
      kind: kind,
      index: intro.index,
      count: intro.steps.length,
      onAllowed: notifier.advance,
      onNotNow: notifier.skip,
    );
  }
}
