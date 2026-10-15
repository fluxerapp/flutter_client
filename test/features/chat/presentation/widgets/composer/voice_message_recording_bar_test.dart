import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/mobile_composer_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_controller.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class _Harness extends ConsumerStatefulWidget {
  const _Harness({required this.hasHeader});

  final bool hasHeader;

  @override
  ConsumerState<_Harness> createState() => _HarnessState();
}

class _HarnessState extends ConsumerState<_Harness> {
  late final VoiceMessageRecordingController _controller =
      VoiceMessageRecordingController(ref: ref, onPrepareUi: () {});

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MobileComposerBar(
      header: widget.hasHeader ? const SizedBox(height: 24) : null,
      child: VoiceMessageRecordingBar(
        controller: _controller,
        actionSize: FluxerButtonSize.compact,
        rowExtent: MobileComposerLayout.sendExtent,
        contentPadding: MobileComposerLayout.rowPadding,
        backgroundShape: VoiceMessageRecordingBar.mobileBackgroundShape(
          hasHeader: widget.hasHeader,
        ),
        trailing: const SizedBox.square(dimension: 32),
      ),
    );
  }
}

Future<void> _pump(WidgetTester tester, {required bool hasHeader}) async {
  final ProviderContainer container = ProviderContainer();
  addTearDown(container.dispose);
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        home: Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _Harness(hasHeader: hasHeader),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

void _expectFillFollowsBarInnerEdge(WidgetTester tester) {
  final Finder barFinder = find.byType(MobileComposerBar);
  final Container bar = tester.widget<Container>(
    find.descendant(of: barFinder, matching: find.byType(Container)).first,
  );
  final ShapeBorder barShape = (bar.decoration! as ShapeDecoration).shape;
  final Rect barRect = tester.getRect(barFinder);
  final Path inner = barShape.getInnerPath(barRect);

  final Finder clipFinder = find.descendant(
    of: find.byType(VoiceMessageRecordingBar),
    matching: find.byType(ClipPath),
  );
  expect(clipFinder, findsWidgets);
  final ClipPath clip = tester.widget<ClipPath>(clipFinder.first);
  final Rect fillRect = tester.getRect(clipFinder.first);
  final Path fill = clip.clipper!.getClip(fillRect.size);

  int mismatches = 0;
  for (double y = 0.25; y < fillRect.height; y += 0.5) {
    for (double x = 0.25; x < fillRect.width; x += 0.5) {
      final bool inFill = fill.contains(Offset(x, y));
      final bool inBar = inner.contains(fillRect.topLeft + Offset(x, y));
      if (inFill != inBar) {
        mismatches++;
      }
    }
  }
  expect(mismatches, lessThanOrEqualTo(4));
}

void main() {
  testWidgets('recording fill uses the composer bar inner corners', (
    WidgetTester tester,
  ) async {
    await _pump(tester, hasHeader: false);
    _expectFillFollowsBarInnerEdge(tester);
  });

  testWidgets('recording fill under a header keeps the bar bottom corners', (
    WidgetTester tester,
  ) async {
    await _pump(tester, hasHeader: true);
    _expectFillFollowsBarInnerEdge(tester);
  });
}
