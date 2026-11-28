import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/input_modality_override.dart';

Widget _menu(List<Widget> items) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [inputModalityOverride(touch: false)],
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Center(
          child: FluxerDesktopMenuPanel.fitContent(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: items,
            ),
          ),
        ),
      ),
    ),
  );
}

FocusNode? _focusedRowLabel(WidgetTester tester, String label) {
  final FocusNode? focus = FocusManager.instance.primaryFocus;
  final BuildContext? focusContext = focus?.context;
  if (focusContext == null) {
    return null;
  }
  final FluxerDesktopMenuRow? row = focusContext
      .findAncestorWidgetOfExactType<FluxerDesktopMenuRow>();
  return row?.label == label ? focus : null;
}

void main() {
  testWidgets('arrows, Home and End move focus and wrap', (tester) async {
    await tester.pumpWidget(
      _menu(<Widget>[
        FluxerMenuItem(label: 'Alpha', onPressed: () {}),
        FluxerMenuItem(label: 'Beta', enabled: false, onPressed: () {}),
        FluxerMenuItem(label: 'Gamma', onPressed: () {}),
      ]),
    );
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    expect(_focusedRowLabel(tester, 'Alpha'), isNotNull);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    expect(_focusedRowLabel(tester, 'Gamma'), isNotNull);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    expect(_focusedRowLabel(tester, 'Alpha'), isNotNull);

    await tester.sendKeyEvent(LogicalKeyboardKey.end);
    await tester.pump();
    expect(_focusedRowLabel(tester, 'Gamma'), isNotNull);

    await tester.sendKeyEvent(LogicalKeyboardKey.home);
    await tester.pump();
    expect(_focusedRowLabel(tester, 'Alpha'), isNotNull);
  });

  testWidgets('typeahead focuses the matching label', (tester) async {
    await tester.pumpWidget(
      _menu(<Widget>[
        FluxerMenuItem(label: 'Copy text', onPressed: () {}),
        FluxerMenuItem(label: 'Mark unread', onPressed: () {}),
        FluxerMenuItem(label: 'Mute', onPressed: () {}),
      ]),
    );
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.keyM);
    await tester.pump();
    expect(_focusedRowLabel(tester, 'Mark unread'), isNotNull);

    await tester.sendKeyEvent(LogicalKeyboardKey.keyU);
    await tester.pump();
    expect(_focusedRowLabel(tester, 'Mute'), isNotNull);
  });

  testWidgets('single-key shortcut activates its item', (tester) async {
    int edits = 0;
    await tester.pumpWidget(
      _menu(<Widget>[
        FluxerMenuItem(label: 'Reply', shortcut: 'R', onPressed: () {}),
        FluxerMenuItem(label: 'Edit', shortcut: 'E', onPressed: () => edits++),
      ]),
    );
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.keyE);
    await tester.pump();
    expect(edits, 1);
  });

  testWidgets('Enter activates with the held modifiers', (tester) async {
    FluxerKeyModifiers? received;
    await tester.pumpWidget(
      _menu(<Widget>[
        FluxerMenuItem(
          label: 'Delete',
          onSelect: (FluxerKeyModifiers modifiers) => received = modifiers,
        ),
      ]),
    );
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.shiftLeft);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.shiftLeft);
    await tester.pump();
    expect(received?.shift, isTrue);
  });

  testWidgets('disabled rows dim once, not twice', (tester) async {
    await tester.pumpWidget(
      _menu(<Widget>[
        FluxerMenuItem(label: 'Off', enabled: false, onPressed: () {}),
      ]),
    );
    await tester.pumpAndSettle();
    final Iterable<double> opacities = tester
        .widgetList<Widget>(
          find.ancestor(
            of: find.text('Off'),
            matching: find.byWidgetPredicate(
              (Widget w) => w is Opacity || w is AnimatedOpacity,
            ),
          ),
        )
        .map(
          (Widget w) =>
              w is Opacity ? w.opacity : (w as AnimatedOpacity).opacity,
        )
        .where((double o) => o < 1);
    expect(opacities, <double>[0.5]);
  });

  testWidgets('ArrowRight opens a submenu and focuses its first item', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      _menu(<Widget>[
        FluxerMenuSubmenuItem(
          label: 'Mute',
          submenuBuilder: (BuildContext _) => <Widget>[
            FluxerMenuItem(label: 'For 15 minutes', onPressed: () {}),
          ],
        ),
      ]),
    );
    await tester.pumpAndSettle();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    expect(find.text('For 15 minutes'), findsOneWidget);
    expect(_focusedRowLabel(tester, 'For 15 minutes'), isNotNull);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(find.text('For 15 minutes'), findsNothing);
  });

  testWidgets('clicking a trigger label runs onTriggerSelect', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    int triggered = 0;
    await tester.pumpWidget(
      _menu(<Widget>[
        FluxerMenuSubmenuItem(
          label: 'Mute',
          onTriggerSelect: (_) => triggered++,
          submenuBuilder: (BuildContext _) => <Widget>[
            FluxerMenuItem(label: 'For 15 minutes', onPressed: () {}),
          ],
        ),
      ]),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mute'));
    await tester.pumpAndSettle();
    expect(triggered, 1);
  });
}
