import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_segmented_tabs.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_tabs.dart';
import 'package:material_ui/material_ui.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
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
  const testTabs = [
    FluxerTab(label: 'General'),
    FluxerTab(label: 'Advanced'),
    FluxerTab(label: 'About'),
  ];

  group('FluxerTabs', () {
    testWidgets('renders all tab labels', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerTabs(tabs: testTabs, selectedIndex: 0, onChanged: (_) {}),
        ),
      );

      expect(find.text('General'), findsOneWidget);
      expect(find.text('Advanced'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('calls onChanged with correct index when tapped', (
      tester,
    ) async {
      var tappedIndex = -1;
      await tester.pumpWidget(
        buildTestApp(
          FluxerTabs(
            tabs: testTabs,
            selectedIndex: 0,
            onChanged: (index) => tappedIndex = index,
          ),
        ),
      );

      await tester.tap(find.text('Advanced'));
      expect(tappedIndex, 1);

      await tester.tap(find.text('About'));
      expect(tappedIndex, 2);
    });

    testWidgets('renders icon when provided', (tester) async {
      final tabsWithIcon = [
        const FluxerTab(label: 'Home', icon: Icons.home),
        const FluxerTab(label: 'Settings'),
      ];

      await tester.pumpWidget(
        buildTestApp(
          FluxerTabs(tabs: tabsWithIcon, selectedIndex: 0, onChanged: (_) {}),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('supports vertical mobile layouts', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerTabs(
            tabs: const [
              FluxerTab(label: 'Home', icon: Icons.home),
              FluxerTab(label: 'Search', icon: Icons.search),
            ],
            selectedIndex: 0,
            direction: Axis.vertical,
            onChanged: (_) {},
          ),
        ),
      );

      final flex = tester.widget<Flex>(find.byType(Flex).first);
      expect(flex.direction, Axis.vertical);
      expect(flex.crossAxisAlignment, CrossAxisAlignment.stretch);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });
  });

  group('FluxerSegmentedTabs', () {
    testWidgets('renders all tab labels', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          FluxerSegmentedTabs(
            tabs: testTabs,
            selectedIndex: 0,
            onChanged: (_) {},
          ),
        ),
      );

      expect(find.text('General'), findsOneWidget);
      expect(find.text('Advanced'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('calls onChanged with correct index when tapped', (
      tester,
    ) async {
      var tappedIndex = -1;
      await tester.pumpWidget(
        buildTestApp(
          FluxerSegmentedTabs(
            tabs: testTabs,
            selectedIndex: 0,
            onChanged: (index) => tappedIndex = index,
          ),
        ),
      );

      await tester.tap(find.text('Advanced'));
      expect(tappedIndex, 1);
    });
  });
}
