import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

void main() {
  testWidgets('guild action sheet gate matches isMobileLayout at 599px', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(size: Size(900, 599)),
          child: Builder(
            builder: (BuildContext context) {
              return Text(isMobileLayout(context) ? 'mobile' : 'wide');
            },
          ),
        ),
      ),
    );
    expect(find.text('mobile'), findsOneWidget);
  });

  testWidgets('guild action sheet gate matches isMobileLayout at 800px', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(size: Size(1280, 800)),
          child: Builder(
            builder: (BuildContext context) {
              return Text(isMobileLayout(context) ? 'mobile' : 'wide');
            },
          ),
        ),
      ),
    );
    expect(find.text('wide'), findsOneWidget);
  });
}
