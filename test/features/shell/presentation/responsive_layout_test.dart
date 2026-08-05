import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

import '../../../helpers/wide_layout_test_sizes.dart';

void main() {
  group('layoutModeOfSize', () {
    test('stays mobile when shortest side is under mobile breakpoint', () {
      expect(layoutModeOfSize(const Size(900, 400)), LayoutMode.mobile);
    });

    test('stays mobile for narrow foldable inner displays', () {
      expect(layoutModeOfSize(const Size(984, 1092)), LayoutMode.mobile);
      expect(layoutModeOfSize(const Size(1092, 984)), LayoutMode.mobile);
    });

    test('stays mobile when width cannot fit the shell', () {
      expect(layoutModeOfSize(kBelowShellTestViewportSize), LayoutMode.mobile);
    });

    test('is wide on iPad 11 inch landscape', () {
      expect(
        layoutModeOfSize(kTabletLandscapeTestViewportSize),
        LayoutMode.tablet,
      );
    });

    test('is tablet when shortest side and width both qualify', () {
      expect(layoutModeOfSize(kWideTestViewportSize), LayoutMode.tablet);
    });

    test('is desktop when shortest side reaches desktop breakpoint', () {
      expect(layoutModeOfSize(kDesktopTestViewportSize), LayoutMode.desktop);
    });
  });

  group('isCompactWideMobileLayout', () {
    testWidgets('is true for foldable-width mobile viewports', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(984, 1092)),
            child: Builder(
              builder: (BuildContext context) {
                return Text(isCompactWideMobileLayout(context) ? 'yes' : 'no');
              },
            ),
          ),
        ),
      );
      expect(find.text('yes'), findsOneWidget);
    });

    testWidgets('is false for phone-width mobile viewports', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: Size(390, 844)),
            child: Builder(
              builder: (BuildContext context) {
                return Text(isCompactWideMobileLayout(context) ? 'yes' : 'no');
              },
            ),
          ),
        ),
      );
      expect(find.text('no'), findsOneWidget);
    });

    testWidgets('is false when desktop shell qualifies', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: const MediaQueryData(size: kWideTestViewportSize),
            child: Builder(
              builder: (BuildContext context) {
                return Text(isCompactWideMobileLayout(context) ? 'yes' : 'no');
              },
            ),
          ),
        ),
      );
      expect(find.text('no'), findsOneWidget);
    });
  });

  test('mobileDrawerPeekWidth falls back to breakpoint constants', () {
    expect(Breakpoints.guildListWidth + Breakpoints.channelSidebarWidth, 342);
  });
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

  testWidgets('isMobileLayout is false when the full shell can fit', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(size: kWideTestViewportSize),
          child: Builder(
            builder: (BuildContext context) {
              return Text(isMobileLayout(context) ? 'yes' : 'no');
            },
          ),
        ),
      ),
    );
    expect(find.text('no'), findsOneWidget);
  });

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

  testWidgets('isWideLayout is true when the full shell can fit', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(size: kWideTestViewportSize),
          child: Builder(
            builder: (BuildContext context) {
              return Text(isWideLayout(context) ? 'yes' : 'no');
            },
          ),
        ),
      ),
    );
    expect(find.text('yes'), findsOneWidget);
  });
}
