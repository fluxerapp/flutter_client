import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/service_unavailable.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/features/shell/domain/service_status_incident.dart';
import 'package:fluxer_app/features/shell/presentation/splash_screen.dart';
import 'package:fluxer_app/features/shell/providers/service_status_incident_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/pump_fluxer_app.dart';
import '../../../helpers/test_l10n.dart';

class _PendingAppStartup extends AppStartup {
  @override
  Future<void> build() => Completer<void>().future;
}

class _UnavailableAppStartup extends AppStartup {
  @override
  Future<void> build() async {
    throw const ServiceUnavailableException(statusCode: 503);
  }
}

class _GenericFailAppStartup extends AppStartup {
  @override
  Future<void> build() async {
    throw Exception('boot failure');
  }
}

class _NoopIncidentRead extends ServiceStatusIncidentRead {
  @override
  ServiceStatusIncident? build() => null;

  @override
  Future<void> refresh() async {}
}

void main() {
  testWidgets('unmounting before the reveal releases the gateway gate', (
    tester,
  ) async {
    final List<Override> overrides = <Override>[
      appStartupProvider.overrideWith(_PendingAppStartup.new),
    ];
    await tester.pumpWidget(
      pumpFluxerApp(overrides: overrides, child: const SplashScreen()),
    );
    await tester.pump();

    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(SplashScreen)),
    );
    expect(container.read(splashRevealCompleteProvider), isFalse);

    await tester.pumpWidget(
      pumpFluxerApp(overrides: overrides, child: const SizedBox.shrink()),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(container.read(splashRevealCompleteProvider), isTrue);
  });

  testWidgets('503 startup shows outage copy and status links', (tester) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        retry: (int retryCount, Object error) => null,
        overrides: <Override>[
          appStartupProvider.overrideWith(_UnavailableAppStartup.new),
          serviceStatusIncidentReadProvider.overrideWith(_NoopIncidentRead.new),
        ],
        child: const SplashScreen(),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text(testL10n.splashConnectionLost), findsOneWidget);
    expect(find.text(testL10n.reconnectingBody), findsOneWidget);
    expect(find.text(testL10n.splashStatusPageLink), findsOneWidget);
    expect(find.text(testL10n.retry), findsOneWidget);
    expect(find.textContaining('Failed to start'), findsNothing);
  });

  testWidgets(
    'generic startup failure still uses the failed-to-start message',
    (tester) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          retry: (int retryCount, Object error) => null,
          overrides: <Override>[
            appStartupProvider.overrideWith(_GenericFailAppStartup.new),
            serviceStatusIncidentReadProvider.overrideWith(
              _NoopIncidentRead.new,
            ),
          ],
          child: const SplashScreen(),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.textContaining('Failed to start'), findsOneWidget);
      expect(find.text('Connection lost'), findsNothing);
    },
  );
}
