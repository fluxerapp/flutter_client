import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_placement.dart';
import 'package:fluxer_app/material_ui.dart';

Future<BuildContext> _contextFor(
  WidgetTester tester,
  TextDirection direction,
) async {
  late BuildContext captured;
  await tester.pumpWidget(
    Directionality(
      textDirection: direction,
      child: Builder(
        builder: (BuildContext context) {
          captured = context;
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  return captured;
}

void main() {
  testWidgets('LTR opens right unless it would overflow', (tester) async {
    final BuildContext context = await _contextFor(tester, TextDirection.ltr);
    expect(
      contextMenuOpensLeft(
        context,
        anchorX: 300,
        menuWidth: 200,
        overlayWidth: 800,
      ),
      isFalse,
    );
    expect(
      contextMenuOpensLeft(
        context,
        anchorX: 700,
        menuWidth: 200,
        overlayWidth: 800,
      ),
      isTrue,
    );
  });

  testWidgets('RTL opens left unless it would overflow', (tester) async {
    final BuildContext context = await _contextFor(tester, TextDirection.rtl);
    expect(
      contextMenuOpensLeft(
        context,
        anchorX: 300,
        menuWidth: 200,
        overlayWidth: 800,
      ),
      isTrue,
    );
    expect(
      contextMenuOpensLeft(
        context,
        anchorX: 100,
        menuWidth: 200,
        overlayWidth: 800,
      ),
      isFalse,
    );
  });

  testWidgets('RTL submenus prefer the left side', (tester) async {
    final BuildContext context = await _contextFor(tester, TextDirection.rtl);
    expect(
      contextSubmenuOpensRight(
        context,
        rightX: 500,
        leftX: 100,
        menuWidth: 200,
        overlayWidth: 800,
      ),
      isFalse,
    );
    expect(
      contextSubmenuOpensRight(
        context,
        rightX: 300,
        leftX: -100,
        menuWidth: 200,
        overlayWidth: 800,
      ),
      isTrue,
    );
  });
}
