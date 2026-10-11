import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar_dm_transition.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _host({
  required bool visible,
  required bool animateIn,
  required VoidCallback onExited,
}) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GuildNavbarDmTransition(
            visible: visible,
            animateIn: animateIn,
            onExited: onExited,
            child: const SizedBox(key: Key('row'), width: 72, height: 60),
          ),
        ],
      ),
    ),
  );
}

void main() {
  testWidgets('enters by expanding and sliding in from the left', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(visible: true, animateIn: true, onExited: () {}),
    );

    expect(tester.getSize(find.byType(GuildNavbarDmTransition)).height, 0);
    await tester.pump(const Duration(milliseconds: 60));
    final double midHeight = tester
        .getSize(find.byType(GuildNavbarDmTransition))
        .height;
    expect(midHeight, inExclusiveRange(0, 60));
    expect(tester.getTopLeft(find.byKey(const Key('row'))).dx, lessThan(0));

    await tester.pump(GuildNavbarDmTransition.enterDuration);
    expect(tester.getSize(find.byType(GuildNavbarDmTransition)).height, 60);
    expect(tester.getTopLeft(find.byKey(const Key('row'))).dx, 0);
  });

  testWidgets('existing rows render at full size without animating', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(visible: true, animateIn: false, onExited: () {}),
    );

    expect(tester.getSize(find.byType(GuildNavbarDmTransition)).height, 60);
  });

  testWidgets('a settled row does not clip a badge hanging past its edge', (
    tester,
  ) async {
    await tester.pumpWidget(
      _host(visible: true, animateIn: true, onExited: () {}),
    );
    await tester.pump(const Duration(milliseconds: 60));
    ClipRect clip() => tester.widget<ClipRect>(
      find.descendant(
        of: find.byType(GuildNavbarDmTransition),
        matching: find.byType(ClipRect),
      ),
    );
    expect(clip().clipBehavior, Clip.hardEdge);

    await tester.pumpAndSettle();
    expect(clip().clipBehavior, Clip.none);
  });

  testWidgets('exits by collapsing, then reports once it is gone', (
    tester,
  ) async {
    var exited = 0;
    await tester.pumpWidget(
      _host(visible: true, animateIn: false, onExited: () => exited++),
    );
    await tester.pumpWidget(
      _host(visible: false, animateIn: false, onExited: () => exited++),
    );

    await tester.pump(const Duration(milliseconds: 100));
    expect(
      tester.getSize(find.byType(GuildNavbarDmTransition)).height,
      inExclusiveRange(0, 60),
    );
    expect(exited, 0);

    await tester.pump(GuildNavbarDmTransition.exitDuration);
    expect(tester.getSize(find.byType(GuildNavbarDmTransition)).height, 0);
    expect(exited, 1);
  });

  testWidgets('a row that turns unread again while exiting comes back', (
    tester,
  ) async {
    var exited = 0;
    await tester.pumpWidget(
      _host(visible: true, animateIn: false, onExited: () => exited++),
    );
    await tester.pumpWidget(
      _host(visible: false, animateIn: false, onExited: () => exited++),
    );
    await tester.pump(const Duration(milliseconds: 80));
    await tester.pumpWidget(
      _host(visible: true, animateIn: false, onExited: () => exited++),
    );
    await tester.pumpAndSettle();

    expect(tester.getSize(find.byType(GuildNavbarDmTransition)).height, 60);
    expect(exited, 0);
  });
}
