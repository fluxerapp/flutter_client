import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('paints circular outline rings around each slot', (
    WidgetTester tester,
  ) async {
    const Color ring = Color(0xFF112233);
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FluxerAvatarStack(
          size: 12,
          overlap: -4,
          outlineWidth: 1,
          outlineColor: ring,
          avatars: <Widget>[
            SizedBox.square(dimension: 12),
            SizedBox.square(dimension: 12),
          ],
        ),
      ),
    );

    final List<SizedBox> rings = tester
        .widgetList<DecoratedBox>(find.byType(DecoratedBox))
        .where((DecoratedBox box) {
          final Decoration decoration = box.decoration;
          return decoration is BoxDecoration &&
              decoration.shape == BoxShape.circle &&
              decoration.color == ring;
        })
        .map((DecoratedBox box) => box.child)
        .whereType<SizedBox>()
        .toList();

    expect(rings.length, 2);
    expect(
      rings.every((SizedBox box) => box.width == 14 && box.height == 14),
      isTrue,
    );
  });

  testWidgets('omits outline rings when outlineColor is null', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FluxerAvatarStack(
          size: 12,
          avatars: <Widget>[SizedBox.square(dimension: 12)],
        ),
      ),
    );

    expect(find.byType(DecoratedBox), findsNothing);
  });
}
