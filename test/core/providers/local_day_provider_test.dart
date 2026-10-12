import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/local_day_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';

class _IdleWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() =>
      Completer<WellKnownFluxerResponse>().future;

  @override
  Future<void> refresh({bool silent = true}) async {}
}

void main() {
  test('checks again at midnight or within a minute', () {
    expect(
      nextLocalDayCheckDelay(DateTime(2026, 1, 1, 23, 59, 30)),
      const Duration(seconds: 30),
    );
    expect(
      nextLocalDayCheckDelay(DateTime(2026, 1, 1, 12)),
      kLocalDayRecheckInterval,
    );
  });

  testWidgets(
    'rolls at local midnight, pauses in background, syncs on resume',
    (WidgetTester tester) async {
      final Clock fake = clock;
      final DateTime t0 = fake.now();
      final DateTime start = DateTime(2026, 1, 1, 23, 59, 30);
      await withClock(
        Clock(() => start.add(fake.now().difference(t0))),
        () async {
          tester.binding.handleAppLifecycleStateChanged(
            AppLifecycleState.resumed,
          );
          final ProviderContainer container = ProviderContainer(
            overrides: [wellKnownProvider.overrideWith(_IdleWellKnown.new)],
          );
          addTearDown(container.dispose);
          await tester.pumpWidget(
            UncontrolledProviderScope(
              container: container,
              child: const AppUiLifecycleObserver(child: SizedBox()),
            ),
          );
          await tester.pump();
          expect(container.read(localDayProvider), DateTime(2026));

          await tester.pump(const Duration(seconds: 29));
          expect(container.read(localDayProvider), DateTime(2026));
          await tester.pump(const Duration(seconds: 2));
          expect(container.read(localDayProvider), DateTime(2026, 1, 2));

          tester.binding.handleAppLifecycleStateChanged(
            AppLifecycleState.inactive,
          );
          tester.binding.handleAppLifecycleStateChanged(
            AppLifecycleState.hidden,
          );
          tester.binding.handleAppLifecycleStateChanged(
            AppLifecycleState.paused,
          );
          await tester.pump(const Duration(days: 1));
          expect(container.read(localDayProvider), DateTime(2026, 1, 2));

          tester.binding.handleAppLifecycleStateChanged(
            AppLifecycleState.hidden,
          );
          tester.binding.handleAppLifecycleStateChanged(
            AppLifecycleState.inactive,
          );
          tester.binding.handleAppLifecycleStateChanged(
            AppLifecycleState.resumed,
          );
          expect(container.read(localDayProvider), DateTime(2026, 1, 3));

          await tester.pumpWidget(const SizedBox());
        },
      );
    },
  );
}
