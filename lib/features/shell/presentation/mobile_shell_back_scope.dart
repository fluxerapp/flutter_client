import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:go_router/go_router.dart';

class MobileShellBackScope extends ConsumerWidget {
  const MobileShellBackScope({
    required this.navigationShell,
    required this.child,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileLayout(context)) {
      return child;
    }
    final int branchIndex = navigationShell.currentIndex;
    if (branchIndex == shellHomeBranchIndex) {
      return child;
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) {
          return;
        }
        navigationShell.goBranch(shellHomeBranchIndex);
      },
      child: child,
    );
  }
}
