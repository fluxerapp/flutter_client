import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/fluxer_icon.dart'
    show phosphorIconMirrorsInRtl;
import 'package:fluxer_app/shared/icons/phosphor.dart';

Widget _harness(TextDirection direction, Widget child) {
  return Directionality(
    textDirection: direction,
    child: Center(child: child),
  );
}

bool _isMirrored(WidgetTester tester) {
  return find.byType(Transform).evaluate().isNotEmpty;
}

void main() {
  testWidgets('directional icons mirror in RTL', (tester) async {
    await tester.pumpWidget(
      _harness(TextDirection.rtl, const Icon(PhosphorIconsBold.caretRight)),
    );
    expect(_isMirrored(tester), isTrue);
  });

  testWidgets('non-directional icons do not mirror in RTL', (tester) async {
    for (final IconData icon in <IconData>[
      PhosphorIconsBold.question,
      PhosphorIconsFill.microphone,
      PhosphorIconsBold.play,
      PhosphorIconsBold.textAlignLeft,
    ]) {
      await tester.pumpWidget(_harness(TextDirection.rtl, Icon(icon)));
      expect(_isMirrored(tester), isFalse);
    }
  });

  testWidgets('PhosphorIcon follows the same policy', (tester) async {
    await tester.pumpWidget(
      _harness(
        TextDirection.rtl,
        const PhosphorIcon(PhosphorIconsFill.signOut),
      ),
    );
    expect(_isMirrored(tester), isTrue);
    await tester.pumpWidget(
      _harness(TextDirection.rtl, const PhosphorIcon(PhosphorIconsBold.hash)),
    );
    expect(_isMirrored(tester), isFalse);
  });

  testWidgets('directional icons stay unmirrored in LTR', (tester) async {
    await tester.pumpWidget(
      _harness(TextDirection.ltr, const Icon(PhosphorIconsBold.arrowLeft)),
    );
    expect(_isMirrored(tester), isFalse);
  });

  test('allowlist covers every weight', () {
    for (final IconData icon in <IconData>[
      PhosphorIconsBold.arrowLeft,
      PhosphorIconsFill.arrowLeft,
      PhosphorIconsRegular.arrowLeft,
      PhosphorIconsDuotone.arrowLeft,
    ]) {
      expect(phosphorIconMirrorsInRtl(icon), isTrue);
    }
    expect(phosphorIconMirrorsInRtl(PhosphorIconsDuotone.question), isFalse);
  });
}
