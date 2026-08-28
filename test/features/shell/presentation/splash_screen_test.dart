import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/features/shell/presentation/splash_screen.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/pump_fluxer_app.dart';

class _PendingAppStartup extends AppStartup {
  @override
  Future<void> build() => Completer<void>().future;
}

void main() {
  testWidgets('unmounting before the reveal releases the gateway gate', (
    tester,
  ) async {
    final List<Override> overrides = <Override>[
      appStartupProvider.overrideWith(_PendingAppStartup.new),
      instanceRuntimeConfigProvider.overrideWithValue(
        InstanceRuntimeConfig.defaults,
      ),
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
}
