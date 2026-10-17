import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/shell_transition_page.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/material_ui.dart';

const Key _listKey = ValueKey<String>('list');
const Key _chatKey = ValueKey<String>('chat');

class _Host extends StatefulWidget {
  const _Host({required this.pageBuilder, super.key});

  final Page<void> Function(BuildContext context, LocalKey key, Widget child)
  pageBuilder;

  @override
  State<_Host> createState() => _HostState();
}

class _HostState extends State<_Host> {
  bool showChat = false;

  void openChat() => setState(() => showChat = true);

  void closeChat() => setState(() => showChat = false);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: <Page<void>>[
        widget.pageBuilder(
          context,
          const ValueKey<String>('list-page'),
          const ColoredBox(color: Color(0xFF000000), key: _listKey),
        ),
        if (showChat)
          widget.pageBuilder(
            context,
            const ValueKey<String>('chat-page'),
            const ColoredBox(color: Color(0xFFFFFFFF), key: _chatKey),
          ),
      ],
      onDidRemovePage: (Page<Object?> page) {},
    );
  }
}

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: child,
  );
}

Page<void> _slidePage(BuildContext context, LocalKey key, Widget child) =>
    shellSlideTransitionPage(context: context, key: key, child: child);

void main() {
  testWidgets('slide push follows the motion push timing', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final GlobalKey<_HostState> host = GlobalKey<_HostState>();
    await tester.pumpWidget(_app(_Host(key: host, pageBuilder: _slidePage)));

    host.currentState!.openChat();
    await tester.pump();
    final double width = tester.getSize(find.byKey(_listKey)).width;

    await tester.pump(FluxerMotionTheme.pushDuration ~/ 7);
    final double firstFrameProgress =
        1 - tester.getTopLeft(find.byKey(_chatKey)).dx / width;
    expect(firstFrameProgress, closeTo(0.30, 0.05));
    expect(tester.getTopLeft(find.byKey(_listKey)).dx, 0);

    await tester.pump(FluxerMotionTheme.pushDuration);
    expect(tester.getTopLeft(find.byKey(_chatKey)).dx, 0);

    final ModalRoute<dynamic> route = ModalRoute.of(
      tester.element(find.byKey(_chatKey)),
    )!;
    expect(route.transitionDuration, FluxerMotionTheme.pushDuration);
    expect(route.reverseTransitionDuration, FluxerMotionTheme.popDuration);
  });

  testWidgets('slide page stays put while the drawer presents it', (
    tester,
  ) async {
    final AnimationController drawer = AnimationController.unbounded(
      vsync: const TestVSync(),
      value: 300,
    );
    addTearDown(drawer.dispose);
    final GlobalKey<_HostState> host = GlobalKey<_HostState>();
    await tester.pumpWidget(
      _app(
        SidebarDrawerSliderScope(
          translate: drawer,
          child: _Host(key: host, pageBuilder: _slidePage),
        ),
      ),
    );

    host.currentState!.openChat();
    await tester.pump();
    await tester.pump(FluxerMotionTheme.pushDuration ~/ 3);

    expect(tester.getTopLeft(find.byKey(_chatKey)).dx, 0);
  });

  testWidgets('iOS root pushes use the tuned Cupertino page', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    final GlobalKey<_HostState> host = GlobalKey<_HostState>();
    await tester.pumpWidget(
      _app(
        _Host(
          key: host,
          pageBuilder: (context, key, child) =>
              shellMobileRootPushPage(context: context, key: key, child: child),
        ),
      ),
    );

    host.currentState!.openChat();
    await tester.pumpAndSettle();

    final ModalRoute<dynamic> route = ModalRoute.of(
      tester.element(find.byKey(_chatKey)),
    )!;
    expect(route.settings, isA<ShellCupertinoPushPage>());
    expect(route, isA<CupertinoRouteTransitionMixin<void>>());
    expect(route.transitionDuration, FluxerMotionTheme.pushDuration);
    expect(route.reverseTransitionDuration, FluxerMotionTheme.popDuration);
    debugDefaultTargetPlatformOverride = null;
  });
}
