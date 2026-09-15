import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('child is tappable after the overlay is revealed', (
    tester,
  ) async {
    var childTaps = 0;
    await _pumpOverlay(tester, onChildTap: () => childTaps++);

    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 0);

    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 1);
  });

  testWidgets('stays revealed after remount with the same sync controller', (
    tester,
  ) async {
    final FluxerSpoilerSyncController controller =
        FluxerSpoilerSyncController();
    addTearDown(controller.dispose);
    const List<String> syncKeys = <String>['attachment:message-1:image-1'];
    var childTaps = 0;

    await _pumpOverlay(
      tester,
      onChildTap: () => childTaps++,
      controller: controller,
      syncKeys: syncKeys,
    );
    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 0);

    await _pumpOverlay(
      tester,
      onChildTap: () => childTaps++,
      controller: controller,
      syncKeys: syncKeys,
      key: UniqueKey(),
    );
    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 1);
  });

  testWidgets('covers again after remount with a new sync controller', (
    tester,
  ) async {
    final FluxerSpoilerSyncController firstController =
        FluxerSpoilerSyncController();
    addTearDown(firstController.dispose);
    const List<String> syncKeys = <String>['attachment:message-1:image-1'];
    var childTaps = 0;

    await _pumpOverlay(
      tester,
      onChildTap: () => childTaps++,
      controller: firstController,
      syncKeys: syncKeys,
    );
    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 0);

    final FluxerSpoilerSyncController secondController =
        FluxerSpoilerSyncController();
    addTearDown(secondController.dispose);
    await _pumpOverlay(
      tester,
      onChildTap: () => childTaps++,
      controller: secondController,
      syncKeys: syncKeys,
      key: UniqueKey(),
    );

    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 0);

    await tester.tap(find.byType(SpoilerOverlay));
    await tester.pumpAndSettle();
    expect(childTaps, 1);
  });
}

Future<void> _pumpOverlay(
  WidgetTester tester, {
  required VoidCallback onChildTap,
  FluxerSpoilerSyncController? controller,
  List<String> syncKeys = const <String>[],
  Key? key,
}) {
  return tester.pumpWidget(
    _buildTestApp(
      child: SpoilerOverlay(
        key: key,
        isSpoiler: true,
        initiallyRevealed: false,
        spoilerSyncController: controller,
        syncKeys: syncKeys,
        child: GestureDetector(
          onTap: onChildTap,
          child: const SizedBox(
            width: 120,
            height: 80,
            child: ColoredBox(color: Color(0xFF123456)),
          ),
        ),
      ),
    ),
  );
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}
