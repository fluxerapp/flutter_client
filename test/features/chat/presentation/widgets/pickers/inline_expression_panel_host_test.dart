import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel_host.dart';

Widget _harness({required bool showInlineEmojiPicker, required Size size}) {
  return ProviderScope(
    child: MediaQuery(
      data: MediaQueryData(size: size),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: <Widget>[
            InlineExpressionPanelHost(
              showInlineEmojiPicker: showInlineEmojiPicker,
            ),
          ],
        ),
      ),
    ),
  );
}

void main() {
  // Shortest side < 600 => mobile (see isMobileLayout / Breakpoints.mobile).
  const Size mobileSize = Size(400, 800);
  const Size tabletSize = Size(1200, 800);

  testWidgets('renders nothing when the inline picker is disabled', (
    tester,
  ) async {
    await tester.pumpWidget(
      _harness(showInlineEmojiPicker: false, size: mobileSize),
    );

    expect(find.byType(InlineExpressionPanelHost), findsOneWidget);
    expect(find.byType(InlineExpressionPanel), findsNothing);
  });

  testWidgets(
    'renders nothing on mobile while the expression panel is closed',
    (tester) async {
      await tester.pumpWidget(
        _harness(showInlineEmojiPicker: true, size: mobileSize),
      );

      expect(find.byType(InlineExpressionPanel), findsNothing);
    },
  );

  testWidgets('renders nothing on non-mobile layouts', (tester) async {
    await tester.pumpWidget(
      _harness(showInlineEmojiPicker: true, size: tabletSize),
    );

    expect(find.byType(InlineExpressionPanel), findsNothing);
  });
}
