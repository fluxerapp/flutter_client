import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/advanced_setting_visibility.dart';
import 'package:fluxer_app/features/settings/utils/platform_desktop_utils.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/wide_layout_test_sizes.dart';

Widget _visibilityProbe({
  required Size size,
  required Widget Function(BuildContext context) builder,
}) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: MediaQuery(
      data: MediaQueryData(size: size),
      child: Builder(builder: builder),
    ),
  );
}

void main() {
  group('showWideLayoutAdvancedSettings', () {
    testWidgets('is false on narrow layout', (tester) async {
      await tester.pumpWidget(
        _visibilityProbe(
          size: const Size(400, 800),
          builder: (context) =>
              Text(showWideLayoutAdvancedSettings(context) ? 'wide' : 'narrow'),
        ),
      );
      expect(find.text('narrow'), findsOneWidget);
    });

    testWidgets('is true on wide layout', (tester) async {
      await tester.pumpWidget(
        _visibilityProbe(
          size: kWideTestViewportSize,
          builder: (context) =>
              Text(showWideLayoutAdvancedSettings(context) ? 'wide' : 'narrow'),
        ),
      );
      expect(find.text('wide'), findsOneWidget);
    });
  });

  group('showKeyboardShortcutAdvancedSettings', () {
    testWidgets('is false on narrow mobile layout', (tester) async {
      if (isDesktopOs) {
        return;
      }
      await tester.pumpWidget(
        _visibilityProbe(
          size: const Size(400, 800),
          builder: (context) => Text(
            showKeyboardShortcutAdvancedSettings(context)
                ? 'keyboard'
                : 'no-keyboard',
          ),
        ),
      );
      expect(find.text('no-keyboard'), findsOneWidget);
    });

    testWidgets('is true on wide layout', (tester) async {
      await tester.pumpWidget(
        _visibilityProbe(
          size: kWideTestViewportSize,
          builder: (context) => Text(
            showKeyboardShortcutAdvancedSettings(context)
                ? 'keyboard'
                : 'no-keyboard',
          ),
        ),
      );
      expect(find.text('keyboard'), findsOneWidget);
    });
  });
}
