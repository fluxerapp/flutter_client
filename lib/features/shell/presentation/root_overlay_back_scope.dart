import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/navigation/root_overlay_navigation.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:go_router/go_router.dart';

class RootOverlayBackScope extends ConsumerWidget {
  const RootOverlayBackScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileLayout(context) || context.canPop()) {
      return child;
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (didPop) {
          return;
        }
        popRootOverlay(context, ref);
      },
      child: child,
    );
  }
}
