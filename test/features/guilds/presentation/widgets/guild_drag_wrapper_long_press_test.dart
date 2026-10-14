import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_drag_wrapper.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_gesture_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_long_press_menu_host.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class _TouchInput extends InputModalityNotifier {
  @override
  bool build() => true;
}

const Key _iconKey = Key('rail-community-icon');

Future<void> _pumpRail(WidgetTester tester, VoidCallback onLongPressMenu) {
  final colorTheme = buildDarkColorTheme();
  return tester.pumpWidget(
    ProviderScope(
      overrides: [inputModalityProvider.overrideWith(_TouchInput.new)],
      child: MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: GuildDragWrapper(
              itemId: 'guild-1',
              isFolder: false,
              dragFeedback: const SizedBox.square(dimension: 48),
              onLongPressMenu: () async => onLongPressMenu(),
              child: const SizedBox.square(
                key: _iconKey,
                dimension: 48,
                child: ColoredBox(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  testWidgets('holding a community icon opens its sheet, not a popover', (
    tester,
  ) async {
    var opened = 0;
    await _pumpRail(tester, () => opened++);
    await tester.pumpAndSettle();

    expect(find.byType(GuildLongPressMenuHost), findsOneWidget);
    expect(find.byType(GuildIconPeekGestureHost), findsNothing);

    final TestGesture hold = await tester.startGesture(
      tester.getCenter(find.byKey(_iconKey)),
    );
    await tester.pump(kGuildPeekHoldDelay);
    await tester.pump();
    expect(find.byType(ContextMenuPanel), findsNothing);
    await hold.up();
    await tester.pumpAndSettle();

    expect(opened, 1);
    expect(find.byType(ContextMenuPanel), findsNothing);
  });

  testWidgets('a quick tap on a community icon does not open its sheet', (
    tester,
  ) async {
    var opened = 0;
    await _pumpRail(tester, () => opened++);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(_iconKey));
    await tester.pumpAndSettle();

    expect(opened, 0);
  });
}
