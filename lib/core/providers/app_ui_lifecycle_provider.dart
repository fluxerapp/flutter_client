import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/bootstrap/image_cache_config.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_ui_lifecycle_provider.g.dart';

bool isAppUiForegroundLifecycle(AppLifecycleState state) {
  return state == AppLifecycleState.resumed ||
      state == AppLifecycleState.inactive;
}

bool shouldCloseInAppBrowserOnLifecycleResume({
  required bool wasForeground,
  required AppLifecycleState state,
}) {
  return !wasForeground && isAppUiForegroundLifecycle(state);
}

/// True while the app is visible (resumed or briefly inactive)
@Riverpod(keepAlive: true)
class AppUiForeground extends _$AppUiForeground {
  @override
  bool build() {
    final AppLifecycleState? s = WidgetsBinding.instance.lifecycleState;
    return s == null || isAppUiForegroundLifecycle(s);
  }

  // Keep the notifier API stable for tests and lifecycle call sites.
  // ignore: use_setters_to_change_properties, avoid_positional_boolean_parameters
  void setResumed(bool value) {
    state = value;
  }
}

/// Pushes platform lifecycle and locale changes into Riverpod state.
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

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    ref.read(systemLocalesProvider.notifier).updateFromPlatform(locales);
  }

  void _syncLifecycle(AppLifecycleState? state) {
    if (!mounted || state == null) {
      return;
    }
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      clearFluxerImageCache();
    }
    final bool wasForeground = ref.read(appUiForegroundProvider);
    final bool isForeground = isAppUiForegroundLifecycle(state);
    if (shouldCloseInAppBrowserOnLifecycleResume(
      wasForeground: wasForeground,
      state: state,
    )) {
      unawaited(closeInAppBrowserIfOpen());
    }
    ref.read(appUiForegroundProvider.notifier).setResumed(isForeground);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
