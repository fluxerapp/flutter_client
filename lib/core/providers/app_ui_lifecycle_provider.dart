import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/bootstrap/image_cache_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_ui_lifecycle_provider.g.dart';

/// True while [AppLifecycleState.resumed]
@Riverpod(keepAlive: true)
class AppUiForeground extends _$AppUiForeground {
  @override
  bool build() {
    final AppLifecycleState? s = WidgetsBinding.instance.lifecycleState;
    return s == null || s == AppLifecycleState.resumed;
  }

  // Keep the notifier API stable for tests and lifecycle call sites.
  // ignore: use_setters_to_change_properties, avoid_positional_boolean_parameters
  void setResumed(bool value) {
    state = value;
  }
}

/// Pushes [WidgetsBindingObserver] lifecycle into [appUiForegroundProvider].
class AppUiLifecycleObserver extends ConsumerStatefulWidget {
  const AppUiLifecycleObserver({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppUiLifecycleObserver> createState() =>
      _AppUiLifecycleObserverState();
}

class _AppUiLifecycleObserverState extends ConsumerState<AppUiLifecycleObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _syncLifecycle(WidgetsBinding.instance.lifecycleState);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _syncLifecycle(state);
  }

  void _syncLifecycle(AppLifecycleState? state) {
    if (!mounted || state == null) {
      return;
    }
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      clearFluxerImageCache();
    }
    ref
        .read(appUiForegroundProvider.notifier)
        .setResumed(state == AppLifecycleState.resumed);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
