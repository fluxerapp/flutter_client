import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/app.dart';
import 'package:fluxer_app/core/audio/app_media_audio_session.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_entrypoint.dart';
import 'package:fluxer_app/core/bootstrap/flutter_error_ui.dart';
import 'package:fluxer_app/core/bootstrap/image_cache_config.dart';
import 'package:fluxer_app/core/build/push_provider_assert.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/observability/fluxer_observability.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/fcm/fcm_entrypoint.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:material_ui/material_ui.dart';
import 'package:media_kit/media_kit.dart';
import 'package:window_manager/window_manager.dart';

void _configureImagePicker() {
  if (kIsWeb || !Platform.isAndroid) {
    return;
  }
  final ImagePickerPlatform implementation = ImagePickerPlatform.instance;
  if (implementation is ImagePickerAndroid) {
    implementation.useAndroidPhotoPicker = true;
  }
}

void _runFluxerApp(ProviderContainer container) {
  runApp(
    ProviderScope(
      child: UncontrolledProviderScope(
        container: container,
        child: const FluxerApp(),
      ),
    ),
  );
}

void _configureFluxerErrorReporting() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    FluxerObservability.instance.recordFlutterError(details);
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    if (isDriftCancellation(error)) {
      return true;
    }
    FluxerObservability.instance.recordError(
      error,
      stackTrace: stack,
      source: 'platform_dispatcher',
    );
    FluxerObservability.instance.forceFlush();
    return false;
  };
}

Future<void> _bootstrapFluxer(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  assertPushProviderBuildConfig();
  if (!kIsWeb &&
      Platform.isAndroid &&
      PushProviderGuard.isUnifiedPush &&
      args.contains('--unifiedpush-bg')) {
    await UnifiedPushService.ensureBackgroundInitialized();
    return;
  }

  configureFluxerMobileDetection();
  configureFluxerImageCache();
  configureFluxerErrorUi();
  _configureFluxerErrorReporting();

  if (!kIsWeb) {
    FluxerObservability.instance.traceSync(
      'app.bootstrap.media_kit',
      MediaKit.ensureInitialized,
    );
  }

  final ProviderContainer container = ProviderContainer();
  // Chat-attachment audio is platform-channel bound and independent of the
  // observability/FCM chain; observability consent stays ahead of Firebase.
  await Future.wait<void>([
    if (!kIsWeb)
      FluxerObservability.instance.traceAsync(
        'app.bootstrap.chat_attachment_audio',
        bootstrapChatAttachmentAudio,
      ),
    () async {
      await container.read(observabilityReportingProvider.notifier).load();
      await FluxerObservability.instance.traceAsync(
        'app.bootstrap.fcm',
        bootstrapFcmIfNeeded,
      );
    }(),
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid))
      FluxerObservability.instance.traceAsync(
        'app.bootstrap.app_media_audio_session',
        activateAppMediaAudioSession,
      ),
  ]);
  FluxerObservability.instance.traceSync(
    'app.bootstrap.image_picker',
    _configureImagePicker,
  );

  if (!kIsWeb && isFluxerDesktopOs) {
    await FluxerObservability.instance.traceAsync(
      'app.bootstrap.window',
      () async {
        await windowManager.ensureInitialized();

        const windowOptions = WindowOptions(
          size: Size(1280, 720),
          minimumSize: Size(200, 200),
          center: true,
          titleBarStyle: TitleBarStyle.hidden,
          title: 'Fluxer',
        );

        await windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
        });
      },
    );
  }

  if (PushProviderGuard.isUnifiedPush) {
    FluxerObservability.instance.traceSync(
      'app.bootstrap.unifiedpush_database',
      () {
        UnifiedPushService.instance.attachDatabase(
          container.read(fluxerDatabaseProvider),
        );
      },
    );
  }

  // First frame no longer waits for session validation: the router keeps the
  // splash up until startup settles and the gateway delivers READY, and the
  // splash surfaces startup errors as a retry. Engine warmup (shaders, fonts,
  // first raster) overlaps the network round-trips instead of following them.
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
}

Future<void> main(List<String> args) async {
  await runZonedGuarded<Future<void>>(
    () async {
      await _bootstrapFluxer(args);
    },
    (Object error, StackTrace stack) {
      if (isDriftCancellation(error)) {
        return;
      }
      FluxerObservability.instance.recordError(
        error,
        stackTrace: stack,
        source: 'zone',
      );
      FluxerObservability.instance.forceFlush();
      Error.throwWithStackTrace(error, stack);
    },
  );
}
