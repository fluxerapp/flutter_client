import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/app.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/audio/app_media_audio_session.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_entrypoint.dart';
import 'package:fluxer_app/core/bootstrap/flutter_error_ui.dart';
import 'package:fluxer_app/core/bootstrap/image_cache_config.dart';
import 'package:fluxer_app/core/bootstrap/startup_first_frame_gate.dart';
import 'package:fluxer_app/core/bootstrap/touch_resampling_config.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/build/push_provider_assert.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/desktop/tray/desktop_tray.dart';
import 'package:fluxer_app/core/desktop/updater/oxygen_updater.dart';
import 'package:fluxer_app/core/desktop/window/desktop_window.dart';
import 'package:fluxer_app/core/observability/fluxer_measure_root.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/observability/reporting_consent/app_foreground_session_watchdog.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_coordinator.dart';
import 'package:fluxer_app/core/observability/startup_timeline.dart';
import 'package:fluxer_app/core/platform/android_proc_info.dart';
import 'package:fluxer_app/core/platform/bundled_root_certificates.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/app/shell_cache.dart';
import 'package:fluxer_app/core/providers/app/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/push/fcm/fcm_entrypoint.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_provider.dart';
import 'package:fluxer_app/core/push/services/apple_push_service.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/zoom/fluxer_app_zoom.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_sticker_image.dart';
import 'package:fluxer_app/features/chat/services/upload_keep_alive.dart';
import 'package:fluxer_app/features/settings/providers/preferences/local_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/bundled_licenses.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/input/text_editing_shortcuts.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

void _configureImagePicker() {
  if (!Platform.isAndroid) {
    return;
  }
  final ImagePickerPlatform implementation = ImagePickerPlatform.instance;
  if (implementation is ImagePickerAndroid) {
    implementation.useAndroidPhotoPicker = true;
  }
}

const Duration _kCachedLaunchFirstFrameLimit = Duration(milliseconds: 1500);
const Duration _kWarmProcessFirstFrameLimit = Duration(milliseconds: 300);
const Duration _kWarmProcessMinAge = Duration(seconds: 10);

Duration _cachedLaunchFirstFrameLimit(Duration? processAge) {
  if (processAge != null && processAge > _kWarmProcessMinAge) {
    return _kWarmProcessFirstFrameLimit;
  }
  return _kCachedLaunchFirstFrameLimit;
}

Future<void> _bootstrapStep(String name, Future<void> Function() step) async {
  try {
    await FluxerObservability.instance.traceAsync(name, step);
  } on Object catch (error, stack) {
    FluxerObservability.instance.reportUncaughtError(
      error,
      stack,
      library: 'bootstrap $name',
    );
  }
}

void _bootstrapChatAttachmentAudioAfterSplashReveal(
  ProviderContainer container,
) {
  late final ProviderSubscription<bool> subscription;
  subscription = container.listen<bool>(splashRevealCompleteProvider, (
    bool? previous,
    bool complete,
  ) {
    if (!complete) {
      return;
    }
    subscription.close();
    unawaited(
      _bootstrapStep(
        'app.bootstrap.chat_attachment_audio',
        bootstrapChatAttachmentAudio,
      ),
    );
  });
}

void _runFluxerApp(ProviderContainer container) {
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const FluxerMeasureRoot(child: FluxerApp()),
    ),
  );
}

Future<void> _bootstrapFluxer(List<String> args) async {
  if (isFluxerDesktopOs) {
    await _bootstrapStep(
      'app.bootstrap.oxygen_updater',
      OxygenUpdater.initialize,
    );
  }
  final Duration? processAge = androidProcessAge();
  FluxerAppZoomBinding.ensureInitialized();
  registerBundledLicenses();
  registerEnglishBackedIntlLocales();
  final Future<void> rootCertificates = _bootstrapStep(
    'app.bootstrap.root_certificates',
    trustBundledRootCertificates,
  );
  unawaited(ApplePushService.installReplyHandler());
  assertPushProviderBuildConfig();
  if (Platform.isAndroid &&
      PushProviderGuard.isUnifiedPush &&
      args.contains('--unifiedpush-bg')) {
    DartPluginRegistrant.ensureInitialized();
    await rootCertificates;
    await UnifiedPushService.ensureBackgroundInitialized();
    return;
  }

  if (Platform.isAndroid) {
    installImeEditingShortcutHandler();
    UploadKeepAlive.ensureAndroidResumeSync();
  }
  if (Platform.isIOS) {
    installNativePasteHandler();
  }
  configureFluxerMobileDetection();
  final int? totalMemoryBytes = androidTotalMemoryBytes();
  configureFluxerImageCache(totalMemoryBytes: totalMemoryBytes);
  configureFluxerGpuResourceCache(totalMemoryBytes: totalMemoryBytes);
  configureFluxerTouchResampling();
  configureFluxerErrorUi();
  FluxerObservability.instance.installGlobalErrorHandlers();
  if (AppBuildConfig.hasObservabilityConfig) {
    await _bootstrapStep(
      'app.bootstrap.observability',
      FluxerObservability.instance.prepare,
    );
  }

  final ProviderContainer container = ProviderContainer();
  if (Platform.isIOS || Platform.isAndroid) {
    unawaited(
      _bootstrapStep(
        'app.bootstrap.app_media_audio_session',
        AppMediaAudioSession.instance.configure,
      ),
    );
  }
  await Future.wait<void>([
    rootCertificates,
    () async {
      await _bootstrapStep(
        'app.bootstrap.foreground_session',
        bootstrapAppForegroundSession,
      );
      await _bootstrapStep('app.bootstrap.settings', () async {
        await Future.wait<void>([
          container.read(observabilityReportingProvider.notifier).load(),
          container.read(pushRelayConsentProvider.notifier).load(),
          container.read(localSettingsProvider.notifier).load(),
          loadMessageStickerAspectRatios(),
        ]);
        await loadObservabilityReportingPrompt(container);
      });
      await _bootstrapStep('app.bootstrap.fcm', bootstrapFcmIfNeeded);
    }(),
    _bootstrapStep('app.bootstrap.active_instance', () async {
      final authRepository = container.read(authRepositoryProvider);
      await authRepository.migrateLegacyInstanceEndpoints();
      await container
          .read(activeInstanceProvider.notifier)
          .restorePersistedSnapshot(
            authRepository.resolveActiveInstanceSnapshot(),
          );
    }),
  ]);
  await _bootstrapStep('app.bootstrap.image_picker', () async {
    _configureImagePicker();
  });

  if (isFluxerDesktopOs) {
    await _bootstrapStep('app.bootstrap.window', () async {
      await configureDesktopWindow();
    });
    await _bootstrapStep('app.bootstrap.tray', () async {
      await DesktopTray.start(container);
    });
  }

  if (PushProviderGuard.isUnifiedPush) {
    await _bootstrapStep('app.bootstrap.unifiedpush_database', () async {
      UnifiedPushService.instance.attachDatabase(
        container.read(fluxerDatabaseProvider),
      );
    });
  }

  if ((Platform.isAndroid || Platform.isIOS) &&
      await isShellCacheMarkedFresh()) {
    StartupFirstFrameGate.hold(limit: _cachedLaunchFirstFrameLimit(processAge));
  }

  _bootstrapChatAttachmentAudioAfterSplashReveal(container);
  unawaited(
    FluxerObservability.instance.traceAsync('app.startup.provider', () async {
      try {
        await container.read(appStartupProvider.future);
      } on Object {
        // Surfaced on the splash screen as a retry affordance.
      }
    }),
  );
  FluxerObservability.instance.traceSync(
    'app.run',
    () => _runFluxerApp(container),
  );
  unawaited(
    WidgetsBinding.instance.waitUntilFirstFrameRasterized.then(
      (_) => StartupTimeline.instance.markFirstFrame(),
    ),
  );
}

Future<void> main(List<String> args) async {
  StartupTimeline.instance.start();
  await runZonedGuarded<Future<void>>(
    () async {
      await _bootstrapFluxer(args);
    },
    (Object error, StackTrace stack) {
      if (isDriftCancellation(error) ||
          isTransientNetworkError(unwrapMeasureSanitizedError(error))) {
        return;
      }
      FluxerObservability.instance.reportUncaughtError(
        error,
        stack,
        library: 'Flutter zone',
      );
      FluxerObservability.instance.forceFlush();
    },
  );
}
