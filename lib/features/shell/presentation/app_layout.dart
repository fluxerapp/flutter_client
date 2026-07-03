import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/shell_route_listeners.dart';
import 'package:go_router/go_router.dart';

enum BottomNavBranch { home, notifications, you }

class AppLayout extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AppLayout({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShellRouteListeners(
      child: AppLayoutShell(navigationShell: navigationShell),
    );
  }
}
