import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/chat_back_button.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
  testWidgets('hides unread badge when count is zero', (tester) async {
    await tester.pumpWidget(
      buildTestApp(ChatBackButton(unreadCount: 0, onPressed: () {})),
    );
    expect(find.byType(FluxerBadge), findsNothing);
    expect(find.byIcon(PhosphorIconsBold.arrowLeft), findsOneWidget);
  });

  testWidgets('shows unread count badge when count is positive', (
    tester,
  ) async {
    await tester.pumpWidget(
      buildTestApp(ChatBackButton(unreadCount: 4, onPressed: () {})),
    );
    expect(find.byType(FluxerBadge), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
  });
}
