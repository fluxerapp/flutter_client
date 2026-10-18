import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_presentation.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/wide_layout_test_sizes.dart';

void main() {
  group('resolveShellPopupUseRootNavigator', () {
    Future<bool> resolve(WidgetTester tester, Size size) async {
      late bool value;
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(
            data: MediaQueryData(size: size),
            child: Builder(
              builder: (BuildContext context) {
                value = resolveShellPopupUseRootNavigator(context);
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
      return value;
    }

    testWidgets('uses branch navigator on phone-width mobile', (
      WidgetTester tester,
    ) async {
      expect(await resolve(tester, const Size(390, 844)), isFalse);
    });

    testWidgets('uses root navigator on pinned wide mobile', (
      WidgetTester tester,
    ) async {
      expect(await resolve(tester, const Size(750, 832)), isTrue);
    });

    testWidgets('uses root navigator on tablet and desktop', (
      WidgetTester tester,
    ) async {
      expect(await resolve(tester, kWideTestViewportSize), isTrue);
      expect(await resolve(tester, kDesktopTestViewportSize), isTrue);
    });
  });
}
