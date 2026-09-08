import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recorder.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_controller.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _buildRecorderTestApp({
  required ProviderContainer container,
  required Widget child,
}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

class _RecorderHarness extends ConsumerStatefulWidget {
  const _RecorderHarness({this.onCreated});

  final ValueChanged<VoiceMessageRecordingController>? onCreated;

  @override
  ConsumerState<_RecorderHarness> createState() => _RecorderHarnessState();
}

class _RecorderHarnessState extends ConsumerState<_RecorderHarness> {
  late final VoiceMessageRecordingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VoiceMessageRecordingController(ref: ref, onPrepareUi: () {});
    widget.onCreated?.call(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VoiceMessageRecorder(
      channelId: 'channel',
      disabled: false,
      controller: _controller,
    );
  }
}

Color? _micFill(WidgetTester tester) {
  final AnimatedContainer container = tester.widget<AnimatedContainer>(
    find.descendant(
      of: find.byType(VoiceMessageRecorder),
      matching: find.byType(AnimatedContainer),
    ),
  );
  return (container.decoration! as BoxDecoration).color;
}

void main() {
  testWidgets('shell gesture block is off before recording', (tester) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      _buildRecorderTestApp(
        container: container,
        child: const _RecorderHarness(),
      ),
    );
    await tester.pump();
    expect(container.read(shellManualGestureBlockProvider), isFalse);
  });

  testWidgets('mic uses brand primary while recording', (tester) async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    late VoiceMessageRecordingController controller;
    await tester.pumpWidget(
      _buildRecorderTestApp(
        container: container,
        child: _RecorderHarness(
          onCreated: (VoiceMessageRecordingController value) {
            controller = value;
          },
        ),
      ),
    );
    await tester.pump();

    final colors = buildDarkColorTheme();
    expect(_micFill(tester), colors.backgroundTertiary);

    controller.debugSetActive(value: true);
    await tester.pump();
    expect(_micFill(tester), colors.brandPrimary);
  });
}
