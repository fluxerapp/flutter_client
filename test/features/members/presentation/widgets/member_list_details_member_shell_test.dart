import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

const Key _rowKey = Key('member-row');

Color? _shellColor(WidgetTester tester) {
  final DecoratedBox box = tester.widget<DecoratedBox>(
    find
        .ancestor(of: find.byKey(_rowKey), matching: find.byType(DecoratedBox))
        .first,
  );
  return (box.decoration as BoxDecoration).color;
}

void main() {
  const Widget shell = MemberListDetailsMemberShell(
    isFirstInGroup: true,
    isLastInGroup: true,
    child: SizedBox(key: _rowKey, height: 48),
  );
  final FluxerColorTheme colors = buildDarkColorTheme();

  testWidgets('member cards stand out from the sheet surface', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        child: Scaffold(
          body: Builder(
            builder: (BuildContext context) => TextButton(
              onPressed: () => FluxerBottomSheet.show<void>(
                context,
                builder: (BuildContext _, VoidCallback _) => shell,
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await pumpFluxerFrames(tester);

    expect(_shellColor(tester), colors.backgroundTertiary);
  });

  testWidgets('member cards keep the page card colour outside sheets', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(pumpFluxerApp(child: const Scaffold(body: shell)));

    expect(_shellColor(tester), colors.backgroundSecondaryAlt);
  });
}
