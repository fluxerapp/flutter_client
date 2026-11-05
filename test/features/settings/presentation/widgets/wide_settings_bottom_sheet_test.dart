import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_modal_frame.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/input_modality_override.dart';

Future<ModalRoute<dynamic>?> _open(
  WidgetTester tester, {
  required bool touch,
}) async {
  final colorTheme = buildDarkColorTheme();
  ModalRoute<dynamic>? route;
  await tester.pumpWidget(
    ProviderScope(
      overrides: [inputModalityOverride(touch: touch)],
      child: MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => unawaited(
              showWideSettingsBottomSheet(
                context,
                child: Builder(
                  builder: (sheetContext) {
                    route = ModalRoute.of(sheetContext);
                    return const SizedBox(height: 100);
                  },
                ),
              ),
            ),
            child: const Text('Open'),
          ),
        ),
      ),
    ),
  );

  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
  return route;
}

void main() {
  testWidgets('wide settings sheet uses the sheet motion tokens', (
    tester,
  ) async {
    final ModalRoute<dynamic>? route = await _open(tester, touch: true);

    expect(route!.transitionDuration, FluxerMotionTheme.sheetDuration);
    expect(route.reverseTransitionDuration, kFluxerSheetCloseDuration);
  });

  testWidgets('a mouse opens wide settings as a desktop modal', (tester) async {
    final ModalRoute<dynamic>? route = await _open(tester, touch: false);

    expect(route, isA<FluxerDesktopRoute<dynamic>>());
    expect(
      (route! as FluxerDesktopRoute<dynamic>).surface,
      FluxerDesktopSurface.modal,
    );
  });
}
