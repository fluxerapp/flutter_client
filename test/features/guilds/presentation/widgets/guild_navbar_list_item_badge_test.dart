import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/ui/badge/fluxer_badge.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

void main() {
  for (final bool isSelected in <bool>[false, true]) {
    testWidgets('mention badge shows when isSelected is $isSelected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          child: Scaffold(
            body: Center(
              child: guildListItemForTest(
                label: 'Sim Lab',
                isSelected: isSelected,
                mentionCount: 1,
              ),
            ),
          ),
        ),
      );
      await pumpFluxerFramesQuick(tester);

      expect(find.byType(FluxerBadge), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });
  }
}
