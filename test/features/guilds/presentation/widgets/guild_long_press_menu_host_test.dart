import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_long_press_menu_host.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

const Key _iconKey = Key('rail-community-icon');
const String _sheetTitle = 'Community sheet';

class _Menu implements GuildLongPressMenu {
  _Menu(this.navigatorContext, {this.loadDelay = Duration.zero});

  final BuildContext Function() navigatorContext;
  final Duration loadDelay;
  int prepared = 0;
  int opened = 0;
  int dismissed = 0;
  Future<void>? _data;
  Route<void>? _route;

  @override
  void prepareMenu() {
    prepared++;
    _data = Future<void>.delayed(loadDelay);
  }

  @override
  void openMenu() {
    opened++;
    unawaited(_open());
  }

  Future<void> _open() async {
    await (_data ?? Future<void>.value());
    final Route<void> route = PageRouteBuilder<void>(
      opaque: false,
      pageBuilder: (_, _, _) =>
          const Material(child: Center(child: Text(_sheetTitle))),
    );
    _route = route;
    Navigator.of(navigatorContext()).push(route);
  }

  @override
  void dismissMenu() {
    dismissed++;
    final Route<void>? route = _route;
    if (route != null && route.isActive) {
      Navigator.of(navigatorContext()).removeRoute(route);
    }
  }
}

Future<_Menu> _pump(
  WidgetTester tester, {
  Duration loadDelay = Duration.zero,
}) async {
  late BuildContext hostContext;
  final _Menu menu = _Menu(() => hostContext, loadDelay: loadDelay);
  await tester.pumpWidget(
    pumpFluxerApp(
      child: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            hostContext = context;
            return Align(
              alignment: Alignment.topLeft,
              child: GuildLongPressMenuHost(
                itemId: 'guild-1',
                menu: () => menu,
                child: const SizedBox.square(
                  key: _iconKey,
                  dimension: 48,
                  child: ColoredBox(color: Colors.blue),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return menu;
}

void main() {
  final List<String> haptics = <String>[];

  setUp(() {
    haptics.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (
          MethodCall call,
        ) async {
          if (call.method == 'HapticFeedback.vibrate') {
            haptics.add(call.arguments as String);
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null);
  });

  testWidgets('a release before the hold delay opens nothing', (
    WidgetTester tester,
  ) async {
    final _Menu menu = await _pump(tester);

    final TestGesture hold = await tester.startGesture(
      tester.getCenter(find.byKey(_iconKey)),
    );
    await tester.pump(kGuildPeekHoldDelay - const Duration(milliseconds: 50));
    await hold.up();
    await tester.pumpAndSettle();

    expect(menu.prepared, 1);
    expect(menu.opened, 0);
    expect(haptics, isEmpty);
    expect(find.text(_sheetTitle), findsNothing);
  });

  testWidgets('the sheet starts opening on the haptic frame', (
    WidgetTester tester,
  ) async {
    final _Menu menu = await _pump(
      tester,
      loadDelay: const Duration(milliseconds: 120),
    );

    final TestGesture hold = await tester.startGesture(
      tester.getCenter(find.byKey(_iconKey)),
    );
    await tester.pump(kGuildPeekHoldDelay - const Duration(milliseconds: 1));
    expect(haptics, isEmpty);
    expect(find.text(_sheetTitle), findsNothing);

    await tester.pump(const Duration(milliseconds: 1));
    expect(haptics, hasLength(1));
    expect(menu.opened, 1);
    expect(find.text(_sheetTitle, skipOffstage: false), findsOneWidget);

    await hold.up();
    await tester.pumpAndSettle();
    expect(menu.opened, 1);
    expect(menu.dismissed, 0);
    expect(find.text(_sheetTitle), findsOneWidget);
  });

  testWidgets('moving before the hold delay cancels the menu', (
    WidgetTester tester,
  ) async {
    final _Menu menu = await _pump(tester);

    final TestGesture hold = await tester.startGesture(
      tester.getCenter(find.byKey(_iconKey)),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await hold.moveBy(const Offset(0, kGuildPeekHoldCancelThreshold + 1));
    await tester.pump(kGuildPeekHoldDelay);
    await hold.up();
    await tester.pumpAndSettle();

    expect(menu.opened, 0);
    expect(haptics, isEmpty);
  });
}
