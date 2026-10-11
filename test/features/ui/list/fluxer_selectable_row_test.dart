import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/list/fluxer_selectable_row.dart';
import 'package:fluxer_app/material_ui.dart';

final FluxerColorTheme _colorTheme = buildDarkColorTheme();

Widget _app(Widget child) {
  final colorTheme = _colorTheme;
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('exposes semanticLabel for screen readers', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      _app(
        FluxerSelectableRow(
          isSelected: true,
          selectedColor: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          semanticLabel: 'General channel',
          onTap: () {},
          child: const Text('General'),
        ),
      ),
    );

    expect(find.bySemanticsLabel('General channel'), findsOneWidget);
    handle.dispose();
  });

  Color? fillOf(WidgetTester tester) {
    final Container container = tester.widget<Container>(
      find.descendant(
        of: find.byType(InkWell),
        matching: find.byType(Container),
      ),
    );
    return (container.decoration as BoxDecoration?)?.color;
  }

  testWidgets('shows the pressed fill while a finger is down', (tester) async {
    await tester.pumpWidget(
      _app(
        FluxerSelectableRow(
          isSelected: false,
          selectedColor: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          height: 50,
          onTap: () {},
          child: const Text('Row'),
        ),
      ),
    );
    expect(fillOf(tester), isNull);

    final TestGesture gesture = await tester.startGesture(
      tester.getCenter(find.text('Row')),
    );
    await tester.pump(const Duration(milliseconds: 150));
    expect(fillOf(tester), _colorTheme.listItemPressedBg);

    await gesture.up();
    await tester.pump();
    expect(fillOf(tester), isNull);
  });

  testWidgets('keeps the pressed fill while its menu is active', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        FluxerSelectableRow(
          isSelected: false,
          isActive: true,
          selectedColor: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: const Text('Row'),
        ),
      ),
    );
    expect(fillOf(tester), _colorTheme.listItemPressedBg);
  });

  testWidgets('draws the selected border without shifting content', (
    tester,
  ) async {
    Widget row({required bool selected}) => _app(
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 300,
          child: FluxerSelectableRow(
            isSelected: selected,
            selectedColor: _colorTheme.listItemSelectedBg,
            selectedBorderColor: _colorTheme.listItemSelectedBorder,
            borderRadius: BorderRadius.circular(12),
            height: 50,
            padding: const EdgeInsets.only(left: 8),
            onTap: () {},
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Row'),
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(row(selected: false));
    final Offset unselected = tester.getTopLeft(find.text('Row'));
    await tester.pumpWidget(row(selected: true));
    expect(tester.getTopLeft(find.text('Row')), unselected);
    expect(fillOf(tester), _colorTheme.listItemSelectedBg);
    final Container container = tester.widget<Container>(
      find.descendant(
        of: find.byType(InkWell),
        matching: find.byType(Container),
      ),
    );
    final BoxDecoration border =
        container.foregroundDecoration! as BoxDecoration;
    expect(
      (border.border! as Border).top.color,
      _colorTheme.listItemSelectedBorder,
    );
  });
}
