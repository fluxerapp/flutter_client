import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('channelChatJumpToBottomBottomOffset', () {
    test('uses fade height when neko is disabled', () {
      expect(
        channelChatJumpToBottomBottomOffset(
          isMobile: false,
          showNeko: false,
          showSlowmode: false,
        ),
        WideComposerLayout.fadeHeight,
      );
      expect(
        channelChatJumpToBottomBottomOffset(
          isMobile: true,
          showNeko: false,
          showSlowmode: false,
        ),
        WideComposerLayout.mobileFadeHeight,
      );
    });

    test('raises only enough to clear neko when enabled', () {
      const double buttonPaddingBottom = 10;
      expect(
        channelChatJumpToBottomBottomOffset(
          isMobile: false,
          showNeko: true,
          showSlowmode: false,
        ),
        WideComposerLayout.fadeHeight +
            (kNekoSpriteSize -
                (WideComposerLayout.fadeHeight - buttonPaddingBottom)) -
            10,
      );
    });

    test('raises for neko above slowmode when both are enabled', () {
      const double buttonPaddingBottom = 10;
      const double fadeHeight = WideComposerLayout.mobileFadeHeight;
      const double nekoTop =
          WideComposerLayout.statusLineHeight + kNekoSpriteSize;
      const double defaultButtonBottom = fadeHeight - buttonPaddingBottom;
      expect(
        channelChatJumpToBottomBottomOffset(
          isMobile: true,
          showNeko: true,
          showSlowmode: true,
        ),
        fadeHeight + (nekoTop - defaultButtonBottom) - 10,
      );
    });
  });

  testWidgets('ChannelChatComposerBoundary paints the composer fade overlay', (
    WidgetTester tester,
  ) async {
    final FluxerColorTheme colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const Scaffold(
          body: SizedBox(
            height: WideComposerLayout.fadeHeight,
            width: 400,
            child: ChannelChatComposerBoundary(
              leadingStatus: Text('typing'),
              trailingStatuses: <Widget>[],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(WideComposerFade), findsOneWidget);
    expect(find.text('typing'), findsOneWidget);
  });

  testWidgets('paints the fade overlay at the mobile status-safe height', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final FluxerColorTheme colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      MaterialApp(
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const Scaffold(
          body: SizedBox(
            height: WideComposerLayout.mobileFadeHeight,
            width: 390,
            child: ChannelChatComposerBoundary(
              leadingStatus: Text('typing'),
              trailingStatuses: <Widget>[Text('slowmode')],
            ),
          ),
        ),
      ),
    );

    expect(find.byType(WideComposerFade), findsOneWidget);
    expect(find.text('typing'), findsOneWidget);
    expect(find.text('slowmode'), findsOneWidget);
    final Size fadeSize = tester.getSize(find.byType(WideComposerFade));
    expect(fadeSize.height, WideComposerLayout.mobileFadeHeight);
  });
}
