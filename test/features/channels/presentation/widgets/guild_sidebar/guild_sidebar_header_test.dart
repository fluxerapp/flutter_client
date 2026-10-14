import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar/guild_sidebar.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/pump_fluxer_app.dart';

void main() {
  testWidgets('the whole community header bar opens the menu', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      pumpFluxerApp(
        child: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 300,
              child: GuildSidebarHeaderBody(
                guild: null,
                outageUnavailable: false,
                onTap: () => taps++,
                collapseRatio: 1,
                height: 120,
              ),
            ),
          ),
        ),
      ),
    );

    final Rect bar = tester.getRect(find.byType(GuildSidebarHeaderBody));
    for (final Offset point in <Offset>[
      bar.topLeft + const Offset(4, 4),
      bar.topRight + const Offset(-4, 4),
      bar.centerLeft + const Offset(4, 0),
      bar.bottomCenter - const Offset(0, 4),
    ]) {
      await tester.tapAt(point);
      await tester.pump(const Duration(milliseconds: 500));
    }

    expect(taps, 4);
  });
}
