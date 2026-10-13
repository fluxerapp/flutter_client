import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:dynamic_app_icon_flutter_plus/dynamic_app_icon_flutter_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/audio/app_media_audio_session.dart';
import 'package:fluxer_app/core/bootstrap/image_cache_config.dart';
import 'package:fluxer_app/core/providers/local_day_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/chat/utils/media/media_kit_player_lifecycle.dart';
import 'package:fluxer_app/features/voice/services/voice_wakelock_coordinator.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_ui_lifecycle_provider.g.dart';

bool isAppUiForegroundLifecycle(
  AppLifecycleState state, {
  required bool wasForeground,
}) {
  return switch (state) {
    AppLifecycleState.resumed => true,
    AppLifecycleState.inactive => wasForeground || !_isMobileTarget,
    _ => false,
  };
}

bool get _isMobileTarget =>
    defaultTargetPlatform == TargetPlatform.iOS ||
    defaultTargetPlatform == TargetPlatform.android;

bool shouldCloseInAppBrowserOnLifecycleResume({
  required bool wasForeground,
  required AppLifecycleState state,
}) {
  return !wasForeground && state == AppLifecycleState.resumed;
}

@Riverpod(keepAlive: true)
class AppUiForeground extends _$AppUiForeground {
  @override
  bool build() {
    final AppLifecycleState? state = WidgetsBinding.instance.lifecycleState;
    return state != null &&
        isAppUiForegroundLifecycle(state, wasForeground: false);
  }

  // Keep the notifier API stable for tests and lifecycle call sites.
  // ignore: avoid_positional_boolean_parameters
  void setResumed(bool value) {
    if (state == value) {
      return;
    }
    state = value;
  }
}

class AppUiLifecycleObserver extends ConsumerStatefulWidget {
  const AppUiLifecycleObserver({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppUiLifecycleObserver> createState() =>
      _AppUiLifecycleObserverState();
}

class _AppUiLifecycleObserverState extends ConsumerState<AppUiLifecycleObserver>
    with WidgetsBindingObserver {
  Timer? _localDayTimer;

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
    _localDayTimer?.cancel();
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
      unawaited(MediaKitPlayerLifecycleCoordinator.instance.pauseAll());
      if (Platform.isAndroid) {
        unawaited(DynamicAppIconFlutterPlus.applyPendingIcon());
      }
    }
    final bool wasForeground = ref.read(appUiForegroundProvider);
    final bool isForeground = isAppUiForegroundLifecycle(
      state,
      wasForeground: wasForeground,
    );
    if (shouldCloseInAppBrowserOnLifecycleResume(
      wasForeground: wasForeground,
      state: state,
    )) {
      unawaited(closeInAppBrowserIfOpen());
    }
    ref.read(appUiForegroundProvider.notifier).setResumed(isForeground);
    if (isForeground) {
      _syncLocalDay();
    } else {
      _localDayTimer?.cancel();
      _localDayTimer = null;
    }
    if (!wasForeground && isForeground) {
      unawaited(ref.read(wellKnownProvider.notifier).refresh());
    }
    unawaited(
      AppMediaAudioSession.instance.setForeground(foreground: isForeground),
    );
  }

  void _syncLocalDay() {
    _localDayTimer?.cancel();
    if (!mounted) {
      _localDayTimer = null;
      return;
    }
    ref.read(localDayProvider.notifier).sync();
    _localDayTimer = Timer(nextLocalDayCheckDelay(clock.now()), _syncLocalDay);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(voiceWakelockCoordinatorProvider);
    return widget.child;
  }
}
