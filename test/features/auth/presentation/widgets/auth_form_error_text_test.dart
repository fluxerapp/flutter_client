import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_form_error_text.dart';

Widget _app(Widget child) {
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
  testWidgets('exposes error text as a live region', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      _app(const AuthFormErrorText('Invalid email or password')),
    );

    expect(find.bySemanticsLabel('Invalid email or password'), findsOneWidget);
    final SemanticsNode node = tester.getSemantics(
      find.bySemanticsLabel('Invalid email or password'),
    );
    expect(node.flagsCollection.isLiveRegion, isTrue);
    handle.dispose();
  });
}
