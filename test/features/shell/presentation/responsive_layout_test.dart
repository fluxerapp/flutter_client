import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

void main() {
  testWidgets(
    'isMobileLayout is true when shortest side is under mobile breakpoint',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(900, 400)),
            child: Builder(
              builder: (BuildContext context) {
                return Text(isMobileLayout(context) ? 'yes' : 'no');
              },
            ),
          ),
        ),
      );
      expect(find.text('yes'), findsOneWidget);
    },
  );

  testWidgets(
    'isMobileLayout is false when shortest side is at least tablet breakpoint',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(1200, 800)),
            child: Builder(
              builder: (BuildContext context) {
                return Text(isMobileLayout(context) ? 'yes' : 'no');
              },
            ),
          ),
        ),
      );
      expect(find.text('no'), findsOneWidget);
    },
  );

  testWidgets(
    'isWideLayout is false when shortest side is under mobile breakpoint',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(900, 400)),
            child: Builder(
              builder: (BuildContext context) {
                return Text(isWideLayout(context) ? 'yes' : 'no');
              },
            ),
          ),
        ),
      );
      expect(find.text('no'), findsOneWidget);
    },
  );

  testWidgets(
    'isWideLayout is true when shortest side is at least mobile breakpoint',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(1200, 800)),
            child: Builder(
              builder: (BuildContext context) {
                return Text(isWideLayout(context) ? 'yes' : 'no');
              },
            ),
          ),
        ),
      );
      expect(find.text('yes'), findsOneWidget);
    },
  );
}
