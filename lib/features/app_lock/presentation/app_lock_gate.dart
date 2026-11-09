import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/app_lock/app_lock_controller.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_screen.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/material_ui.dart';

class AppLockGate extends ConsumerStatefulWidget {
  const AppLockGate({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends ConsumerState<AppLockGate> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        unawaited(ref.read(appLockControllerProvider.notifier).load());
      }
    });
  }

  Widget? _overlay(AppLockState lock) {
    if (!lock.loaded) {
      return const StarfieldBackdrop();
    }
    if (!lock.enabled) {
      return null;
    }
    if (lock.isLocked) {
      return const _AppLockNavigator();
    }
    if (lock.isPrivacyCovered) {
      return const StarfieldBackdrop();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final AppLockState lock = ref.watch(appLockControllerProvider);
    final Widget? overlay = _overlay(lock);
    final bool covered = overlay != null;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ExcludeSemantics(
          excluding: covered,
          child: ExcludeFocus(
            excluding: lock.enabled && lock.isLocked,
            child: AbsorbPointer(absorbing: covered, child: widget.child),
          ),
        ),
        ?overlay,
      ],
    );
  }
}

class _AppLockNavigator extends StatelessWidget {
  const _AppLockNavigator();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) => PageRouteBuilder<void>(
        settings: settings,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (_, _, _) => const AppLockScreen(),
      ),
    );
  }
}
