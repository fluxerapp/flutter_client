import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_confirm_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Widget buildTestApp({
  required GlobalKey<NavigatorState> rootNavigatorKey,
  required Widget child,
}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    navigatorKey: rootNavigatorKey,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: child,
  );
}

Future<Completer<VoiceConnectionConfirmResult?>> pumpNestedNavModalOpener(
  WidgetTester tester, {
  required int otherDeviceCount,
}) async {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> branchNavigatorKey =
      GlobalKey<NavigatorState>();
  final Completer<VoiceConnectionConfirmResult?> resultCompleter =
      Completer<VoiceConnectionConfirmResult?>();

  await tester.pumpWidget(
    buildTestApp(
      rootNavigatorKey: rootNavigatorKey,
      child: Navigator(
        key: branchNavigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(
            builder: (BuildContext branchContext) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      unawaited(
                        showVoiceConnectionConfirmModal(
                          branchContext,
                          otherDeviceCount: otherDeviceCount,
                        ).then(resultCompleter.complete),
                      );
                    },
                    child: const Text('Open'),
                  ),
                ),
              );
            },
          );
        },
      ),
    ),
  );

  return resultCompleter;
}

void main() {
  group('showVoiceConnectionConfirmModal', () {
    testWidgets('shows title and singular description', (tester) async {
      final Completer<VoiceConnectionConfirmResult?> resultCompleter =
          await pumpNestedNavModalOpener(tester, otherDeviceCount: 1);

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Voice Connection Confirmation'), findsOneWidget);
      expect(find.textContaining('1 other device'), findsOneWidget);

      await tester.tap(find.text("Do nothing, I don't want to join"));
      await tester.pumpAndSettle();

      expect(await resultCompleter.future, isNull);
    });

    testWidgets('switch button returns switchToThisDevice and closes modal', (
      tester,
    ) async {
      final Completer<VoiceConnectionConfirmResult?> resultCompleter =
          await pumpNestedNavModalOpener(tester, otherDeviceCount: 1);

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Switch to This Device'));
      await tester.pumpAndSettle();

      expect(
        await resultCompleter.future,
        VoiceConnectionConfirmResult.switchToThisDevice,
      );
      expect(find.text('Voice Connection Confirmation'), findsNothing);
    });

    testWidgets('just join button returns justJoin and closes modal', (
      tester,
    ) async {
      final Completer<VoiceConnectionConfirmResult?> resultCompleter =
          await pumpNestedNavModalOpener(tester, otherDeviceCount: 1);

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Just Join (Keep Other Connections)'));
      await tester.pumpAndSettle();

      expect(
        await resultCompleter.future,
        VoiceConnectionConfirmResult.justJoin,
      );
      expect(find.text('Voice Connection Confirmation'), findsNothing);
    });

    testWidgets('cancel button returns null and closes modal', (tester) async {
      final Completer<VoiceConnectionConfirmResult?> resultCompleter =
          await pumpNestedNavModalOpener(tester, otherDeviceCount: 1);

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Do nothing, I don't want to join"));
      await tester.pumpAndSettle();

      expect(await resultCompleter.future, isNull);
      expect(find.text('Voice Connection Confirmation'), findsNothing);
    });

    testWidgets('header close button returns null and closes modal', (
      tester,
    ) async {
      final Completer<VoiceConnectionConfirmResult?> resultCompleter =
          await pumpNestedNavModalOpener(tester, otherDeviceCount: 1);

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(PhosphorIconsBold.x));
      await tester.pumpAndSettle();

      expect(await resultCompleter.future, isNull);
      expect(find.text('Voice Connection Confirmation'), findsNothing);
    });
  });
}
