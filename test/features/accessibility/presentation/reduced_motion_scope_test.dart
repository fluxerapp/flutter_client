import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/accessibility/presentation/reduced_motion_scope.dart';

const Key _listKey = Key('list');

Widget _app({required bool reducedMotion, ScrollPhysics? physics}) {
  return MaterialApp(
    builder: (BuildContext context, Widget? child) =>
        ReducedMotionScope(enabled: reducedMotion, child: child!),
    home: Builder(
      builder: (BuildContext context) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          key: _listKey,
          physics: physics,
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) =>
              SizedBox(height: 60, child: Text('row $index')),
        ),
      ),
    ),
  );
}

bool _uses<T extends ScrollPhysics>(WidgetTester tester) {
  ScrollPhysics? physics = _position(tester).physics;
  while (physics != null) {
    if (physics is T) {
      return true;
    }
    physics = physics.parent;
  }
  return false;
}

ScrollPosition _position(WidgetTester tester) {
  return tester.state<ScrollableState>(find.byType(Scrollable)).position;
}

Future<double> _pullPastTop(WidgetTester tester) async {
  final TestGesture gesture = await tester.startGesture(
    tester.getCenter(find.byKey(_listKey)),
  );
  await gesture.moveBy(const Offset(0, 40));
  await gesture.moveBy(const Offset(0, 40));
  await tester.pump();
  final double pixels = _position(tester).pixels;
  await gesture.up();
  await tester.pumpAndSettle();
  return pixels;
}

void main() {
  const TargetPlatformVariant mobile = TargetPlatformVariant(<TargetPlatform>{
    TargetPlatform.iOS,
    TargetPlatform.android,
  });

  testWidgets('reduced motion clamps the edge with no stretch', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_app(reducedMotion: true));

    expect(_uses<ClampingScrollPhysics>(tester), isTrue);
    expect(_uses<BouncingScrollPhysics>(tester), isFalse);
    expect(find.byType(StretchingOverscrollIndicator), findsNothing);
    expect(find.byType(GlowingOverscrollIndicator), findsNothing);
    expect(await _pullPastTop(tester), 0);
  }, variant: mobile);

  testWidgets('reduced motion clamps lists with explicit physics', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _app(reducedMotion: true, physics: const AlwaysScrollableScrollPhysics()),
    );

    expect(_uses<ClampingScrollPhysics>(tester), isTrue);
    expect(_uses<BouncingScrollPhysics>(tester), isFalse);
    expect(await _pullPastTop(tester), 0);
  }, variant: mobile);

  testWidgets('iOS keeps its bounce when reduced motion is off', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_app(reducedMotion: false));

    expect(_uses<BouncingScrollPhysics>(tester), isTrue);
    expect(await _pullPastTop(tester), lessThan(0));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

  testWidgets('Android keeps its stretch when reduced motion is off', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_app(reducedMotion: false));

    expect(_uses<ClampingScrollPhysics>(tester), isTrue);
    expect(find.byType(StretchingOverscrollIndicator), findsOneWidget);
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('reduced motion sets disableAnimations below the scope', (
    WidgetTester tester,
  ) async {
    late bool disabled;
    await tester.pumpWidget(
      MaterialApp(
        builder: (BuildContext context, Widget? child) =>
            ReducedMotionScope(enabled: true, child: child!),
        home: Builder(
          builder: (BuildContext context) {
            disabled = MediaQuery.disableAnimationsOf(context);
            return const SizedBox();
          },
        ),
      ),
    );

    expect(disabled, isTrue);
  });
}
