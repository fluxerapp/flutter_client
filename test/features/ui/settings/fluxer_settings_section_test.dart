import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_section.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_subsection.dart';
import 'package:fluxer_app/material_ui.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: SingleChildScrollView(child: child)),
  );
}

void main() {
  group('FluxerSettingsSection', () {
    testWidgets('renders title and description', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerSettingsSection(
            title: 'Connections',
            description: 'Control who can send you friend requests',
            isFirst: true,
            children: [Text('child content')],
          ),
        ),
      );

      expect(find.text('Connections'), findsOneWidget);
      expect(
        find.text('Control who can send you friend requests'),
        findsOneWidget,
      );
      expect(find.text('child content'), findsOneWidget);
    });

    testWidgets('renders title only when no description', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerSettingsSection(
            title: 'Security',
            isFirst: true,
            children: [Text('content')],
          ),
        ),
      );

      expect(find.text('Security'), findsOneWidget);
      expect(find.text('content'), findsOneWidget);
    });

    testWidgets('renders divider when isFirst is false', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const Column(
            children: [
              FluxerSettingsSection(
                title: 'First',
                isFirst: true,
                children: [Text('a')],
              ),
              FluxerSettingsSection(title: 'Second', children: [Text('b')]),
            ],
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('does not render divider when isFirst is true', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerSettingsSection(
            title: 'Only',
            isFirst: true,
            children: [Text('content')],
          ),
        ),
      );

      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('renders multiple children', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerSettingsSection(
            title: 'Test',
            isFirst: true,
            children: [
              Text('child one'),
              Text('child two'),
              Text('child three'),
            ],
          ),
        ),
      );

      expect(find.text('child one'), findsOneWidget);
      expect(find.text('child two'), findsOneWidget);
      expect(find.text('child three'), findsOneWidget);
    });
  });

  group('FluxerSettingsSubsection', () {
    testWidgets('renders title, description, and children', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerSettingsSubsection(
            title: 'Friend Requests',
            description: 'Control who can send you friend requests',
            children: [Text('switch one'), Text('switch two')],
          ),
        ),
      );

      expect(find.text('Friend Requests'), findsOneWidget);
      expect(
        find.text('Control who can send you friend requests'),
        findsOneWidget,
      );
      expect(find.text('switch one'), findsOneWidget);
      expect(find.text('switch two'), findsOneWidget);
    });

    testWidgets('renders children only when no title', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerSettingsSubsection(children: [Text('just content')]),
        ),
      );

      expect(find.text('just content'), findsOneWidget);
    });

    testWidgets('renders title without description', (tester) async {
      await tester.pumpWidget(
        buildTestApp(
          const FluxerSettingsSubsection(
            title: 'Passkeys',
            children: [Text('content')],
          ),
        ),
      );

      expect(find.text('Passkeys'), findsOneWidget);
      expect(find.text('content'), findsOneWidget);
    });
  });
}
