import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_main_tab_shell.dart';

void main() {
  testWidgets(
    'main tab shell updates bottom nav when the selected tab changes',
    (tester) async {
      var currentIndex = 1;
      final colorTheme = buildDarkColorTheme();

      Future<void> pumpShell() {
        return tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
              home: MobileMainTabShell(
                navigationShell: Text('branch-$currentIndex'),
                bottomNav: Text('nav-$currentIndex'),
              ),
            ),
          ),
        );
      }

      await pumpShell();
      await tester.pumpAndSettle();

      expect(find.text('branch-1'), findsOneWidget);
      expect(find.text('nav-1'), findsOneWidget);

      currentIndex = 2;
      await pumpShell();
      await tester.pumpAndSettle();

      expect(find.text('branch-2'), findsOneWidget);
      expect(find.text('nav-2'), findsOneWidget);
      expect(find.text('nav-1'), findsNothing);
    },
  );
}
