import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _reveal({required bool visible}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Center(
      child: ChannelChatJumpToBottomReveal(
        visible: visible,
        child: const SizedBox.square(dimension: 40),
      ),
    ),
  );
}

double _opacity(WidgetTester tester) => tester
    .widget<FadeTransition>(
      find.descendant(
        of: find.byType(AnimatedOpacity),
        matching: find.byType(FadeTransition),
      ),
    )
    .opacity
    .value;

void main() {
  testWidgets('jump to bottom fades and scales instead of cutting', (
    tester,
  ) async {
    await tester.pumpWidget(_reveal(visible: false));
    expect(_opacity(tester), 0);

    await tester.pumpWidget(_reveal(visible: true));
    await tester.pump(FluxerMotionTheme.fastDuration ~/ 2);
    expect(_opacity(tester), inExclusiveRange(0, 1));

    await tester.pumpAndSettle();
    expect(_opacity(tester), 1);

    await tester.pumpWidget(_reveal(visible: false));
    await tester.pump(FluxerMotionTheme.fastDuration ~/ 2);
    expect(_opacity(tester), inExclusiveRange(0, 1));
    expect(
      tester.widget<IgnorePointer>(
        find
            .ancestor(
              of: find.byType(AnimatedOpacity),
              matching: find.byType(IgnorePointer),
            )
            .first,
      ).ignoring,
      isTrue,
    );

    await tester.pumpAndSettle();
    expect(_opacity(tester), 0);
  });
}
