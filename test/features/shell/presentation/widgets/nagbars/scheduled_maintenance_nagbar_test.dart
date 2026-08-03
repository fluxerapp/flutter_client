import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/shell/data/scheduled_maintenance_dismissal_storage.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/scheduled_maintenance_nagbar.dart';
import 'package:fluxer_app/features/shell/providers/scheduled_maintenance_dismissal_provider.dart';
import 'package:fluxer_app/features/shell/providers/service_status_maintenance_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/wide_layout_test_sizes.dart';

void main() {
  group('ScheduledMaintenanceNagbar', () {
    final ServiceStatusMaintenance maintenance = ServiceStatusMaintenance(
      id: 'maint-1',
      name: 'Maintenance',
      status: ServiceStatusMaintenanceStatus.scheduled,
      start: DateTime.utc(2026, 7, 11, 18),
      durationMinutes: 60,
      url: 'https://status.example',
    );

    testWidgets('renders learn more action on desktop layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        _wrap(
          maintenance: maintenance,
          width: kWideTestViewportSize.width,
          child: const ScheduledMaintenanceNagbar(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FluxerNagbar), findsOneWidget);
      expect(find.text('Learn more'), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('uses column layout on mobile', (WidgetTester tester) async {
      final FluxerColorTheme colorTheme = buildDarkColorTheme();
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: FluxerNagbarContent(
              isMobile: true,
              message: 'Maintenance soon',
              onDismiss: () {},
              actions: const Text('Learn more'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TextButton), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });
  });
}

Widget _wrap({
  required ServiceStatusMaintenance maintenance,
  required Widget child,
  required double width,
}) {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      serviceStatusMaintenanceReadProvider.overrideWith(
        () => _FixedMaintenance(maintenance),
      ),
      scheduledMaintenanceDismissalStorageProvider.overrideWithValue(
        MapScheduledMaintenanceDismissalStorage(),
      ),
    ],
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Center(
          child: SizedBox(width: width, child: child),
        ),
      ),
    ),
  );
}

class _FixedMaintenance extends ServiceStatusMaintenanceRead {
  _FixedMaintenance(this._maintenance);

  final ServiceStatusMaintenance _maintenance;

  @override
  ServiceStatusMaintenance? build() => _maintenance;
}
