import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_bottom_input_slot.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/services/composer_keyboard_session.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:fluxer_app/features/input/providers/physical_keyboard_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../helpers/test_l10n.dart';

const Size _kScreen = Size(400, 800);
const double _kNavBar = 24;
const double _kIme = 302;
const double _kNativeGross = 326;
const double _kRestGap = _kNavBar - kMobileComposerBottomGap;
const List<double> _kOpenFrames = <double>[40, 120, 210, 280, _kIme];
const List<double> _kCloseFrames = <double>[280, 210, 120, 40, 0];

final Key _composerKey = UniqueKey();

class _ComposerHarness extends ConsumerStatefulWidget {
  const _ComposerHarness({required this.focusNode});

  final FocusNode focusNode;

  @override
  _ComposerHarnessState createState() => _ComposerHarnessState();
}

class _ComposerHarnessState extends ConsumerState<_ComposerHarness> {
  late final ComposerKeyboardSession session;

  @override
  void initState() {
    super.initState();
    session = ComposerKeyboardSession(
      ref: ref,
      focusNode: widget.focusNode,
      isMounted: () => mounted,
      isMobileLayout: () => true,
      isSlashSessionActive: () => false,
      composerEntryFocused: () => widget.focusNode.hasFocus,
    );
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (!widget.focusNode.hasFocus) {
      session.handleFocusLost();
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    session.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          const Expanded(child: SizedBox()),
          SizedBox(
            key: _composerKey,
            height: 58,
            child: TextField(focusNode: widget.focusNode),
          ),
          const _ComposerSafeBar(),
          const BottomInputSpacer(),
        ],
      ),
    );
  }
}

class _ComposerSafeBar extends ConsumerWidget {
  const _ComposerSafeBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double slotHeight = ref.watch(
      bottomInputSlotProvider.select(
        (BottomInputSlotState state) => state.slotHeight,
      ),
    );
    final bool panelOpen = isComposerPanelOpen(
      expressionPanelOpen: ref.watch(expressionPanelProvider),
      attachmentPanelOpen: ref.watch(attachmentPanelProvider),
    );
    final double safeAreaBottom = MediaQuery.paddingOf(context).bottom;
    final bool show =
        safeAreaBottom > 0 &&
        slotHeight <= 0 &&
        !panelOpen &&
        resolvedKeyboardInsetBottom(context) <= 0;
    return SizedBox(
      height: show ? safeAreaBottom - kMobileComposerBottomGap : 0,
    );
  }
}

double _gapFor(double inset) => math.max(inset, _kRestGap);

class _AndroidKeyboard {
  _AndroidKeyboard(this.tester, this.container);

  final WidgetTester tester;
  final ProviderContainer container;

  MobileKeyboardMetrics get _metrics =>
      container.read(mobileKeyboardMetricsProvider.notifier);

  Future<void> inset(double bottom) async {
    tester.view.viewInsets = FakeViewPadding(bottom: bottom);
    _metrics.syncViewInsets(bottom, safeAreaBottom: _kNavBar);
    await tester.pump(const Duration(milliseconds: 16));
  }

  void native({required bool visible}) {
    _metrics.debugApplyNativeMetrics(
      keyboardHeight: visible ? _kNativeGross : 0,
      isKeyboardVisible: visible,
      nativeSafeAreaBottom: _kNavBar,
    );
  }

  Future<void> insetBeforeSync(double bottom) async {
    tester.view.viewInsets = FakeViewPadding(bottom: bottom);
    await tester.pump(const Duration(milliseconds: 16));
  }

  Future<void> open() async {
    native(visible: true);
    for (final double frame in _kOpenFrames) {
      await inset(frame);
    }
  }

  Future<void> closeWithoutNativeHidden() async {
    for (final double frame in _kCloseFrames) {
      await inset(frame);
    }
  }

  double composerGap() {
    return _kScreen.height - tester.getBottomLeft(find.byKey(_composerKey)).dy;
  }
}

Future<(ProviderContainer, FocusNode, _AndroidKeyboard)> _pumpHarness(
  WidgetTester tester,
) async {
  tester.view
    ..physicalSize = _kScreen
    ..devicePixelRatio = 1
    ..viewPadding = const FakeViewPadding(bottom: _kNavBar)
    ..padding = const FakeViewPadding(bottom: _kNavBar);
  addTearDown(tester.view.reset);
  final FocusNode focusNode = FocusNode();
  addTearDown(focusNode.dispose);
  final ComposerFocusCoordinator coordinator = ComposerFocusCoordinator()
    ..register(
      requestFocus: focusNode.requestFocus,
      readText: () => '',
      hasFocus: () => focusNode.hasFocus,
    );
  final ProviderContainer container = ProviderContainer(
    overrides: [
      composerFocusCoordinatorProvider.overrideWith((Ref ref) => coordinator),
      physicalKeyboardConnectedProvider.overrideWith(
        (Ref ref) => Stream<bool>.value(false),
      ),
    ],
  );
  addTearDown(container.dispose);
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: _ComposerHarness(focusNode: focusNode),
      ),
    ),
  );
  await tester.pumpAndSettle();
  container
      .read(mobileKeyboardMetricsProvider.notifier)
      .updateLayout(
        screenHeight: _kScreen.height,
        isPortrait: true,
        isIos: false,
      );
  return (container, focusNode, _AndroidKeyboard(tester, container));
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  testWidgets('focusing the composer does not lift it ahead of the keyboard', (
    tester,
  ) async {
    final (_, FocusNode focusNode, _AndroidKeyboard keyboard) =
        await _pumpHarness(tester);

    focusNode.requestFocus();
    await tester.pump();
    expect(keyboard.composerGap(), _kRestGap);

    keyboard.native(visible: true);
    for (final double frame in _kOpenFrames) {
      await keyboard.inset(frame);
      expect(keyboard.composerGap(), _gapFor(frame));
    }
    await tester.pump(const Duration(seconds: 1));
    expect(keyboard.composerGap(), _kIme);
  });

  testWidgets('focused IME hide without a native hidden event leaves no gap', (
    tester,
  ) async {
    final (_, FocusNode focusNode, _AndroidKeyboard keyboard) =
        await _pumpHarness(tester);

    focusNode.requestFocus();
    await tester.pump();
    await keyboard.open();
    expect(keyboard.composerGap(), _kIme);

    await keyboard.closeWithoutNativeHidden();
    expect(focusNode.hasFocus, isTrue);
    expect(keyboard.composerGap(), _kRestGap);

    await tester.pump(const Duration(seconds: 2));
    expect(keyboard.composerGap(), _kRestGap);
  });

  testWidgets('an instant IME hide drops the composer in the same frame', (
    tester,
  ) async {
    final (_, FocusNode focusNode, _AndroidKeyboard keyboard) =
        await _pumpHarness(tester);

    focusNode.requestFocus();
    await tester.pump();
    await keyboard.open();
    expect(keyboard.composerGap(), _kIme);

    await keyboard.insetBeforeSync(0);
    expect(keyboard.composerGap(), _kRestGap);
    await keyboard.inset(0);
    expect(keyboard.composerGap(), _kRestGap);
    for (int i = 0; i < 15; i++) {
      await tester.pump(const Duration(milliseconds: 16));
      expect(keyboard.composerGap(), _kRestGap);
    }
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('each animated IME frame moves the composer in that frame', (
    tester,
  ) async {
    final (_, FocusNode focusNode, _AndroidKeyboard keyboard) =
        await _pumpHarness(tester);

    focusNode.requestFocus();
    await tester.pump();
    keyboard.native(visible: true);
    for (final double frame in _kOpenFrames) {
      await keyboard.insetBeforeSync(frame);
      expect(keyboard.composerGap(), _gapFor(frame));
      await keyboard.inset(frame);
    }
    for (final double frame in _kCloseFrames) {
      await keyboard.insetBeforeSync(frame);
      expect(keyboard.composerGap(), _gapFor(frame));
      await keyboard.inset(frame);
      expect(keyboard.composerGap(), _gapFor(frame));
    }
    await tester.pump(const Duration(seconds: 1));
    expect(keyboard.composerGap(), _kRestGap);
  });

  testWidgets('a late native hidden event does not hold the composer up', (
    tester,
  ) async {
    final (_, FocusNode focusNode, _AndroidKeyboard keyboard) =
        await _pumpHarness(tester);

    focusNode.requestFocus();
    await tester.pump();
    await keyboard.open();
    await keyboard.closeWithoutNativeHidden();
    expect(keyboard.composerGap(), _kRestGap);

    await tester.pump(const Duration(milliseconds: 300));
    keyboard.native(visible: false);
    await tester.pump();
    expect(keyboard.composerGap(), _kRestGap);
  });

  testWidgets('rapid show hide show with stale native samples is idempotent', (
    tester,
  ) async {
    final (_, FocusNode focusNode, _AndroidKeyboard keyboard) =
        await _pumpHarness(tester);

    focusNode.requestFocus();
    await tester.pump();
    for (int i = 0; i < 6; i++) {
      await keyboard.open();
      expect(keyboard.composerGap(), _kIme);
      await keyboard.closeWithoutNativeHidden();
      keyboard.native(visible: true);
      await tester.pump();
      expect(keyboard.composerGap(), _kRestGap);
      await keyboard.inset(120);
      expect(keyboard.composerGap(), 120);
      await keyboard.closeWithoutNativeHidden();
      expect(keyboard.composerGap(), _kRestGap);
    }
    await keyboard.open();
    expect(keyboard.composerGap(), _kIme);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets(
    'closing the expression panel while the IME hides leaves no gap',
    (tester) async {
      final (ProviderContainer container, FocusNode focusNode, keyboard) =
          await _pumpHarness(tester);

      focusNode.requestFocus();
      await tester.pump();
      await keyboard.open();

      final _ComposerHarnessState harness = tester.state(
        find.byType(_ComposerHarness),
      );
      harness.session.preparePanelFromKeyboard();
      container.read(expressionPanelProvider.notifier).open();
      focusNode.unfocus();
      await tester.pump();
      await keyboard.closeWithoutNativeHidden();
      expect(keyboard.composerGap(), _kIme);

      container.read(expressionPanelProvider.notifier).close();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
      expect(keyboard.composerGap(), _kRestGap);
      await tester.pump(const Duration(seconds: 1));
      expect(keyboard.composerGap(), _kRestGap);
    },
  );
}
