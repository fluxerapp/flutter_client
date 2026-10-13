import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';
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
    final bool onHomeBranch =
        !isMobileLayout(context) ||
        navigationShell.currentIndex == shellHomeBranchIndex;
    return PopScope(
      canPop: onHomeBranch,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop || onHomeBranch) {
          return;
        }
        navigationShell.goBranch(shellHomeBranchIndex);
      },
      child: child,
    );
  }
}
