import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/chat_floating_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/mobile_composer_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/neko_sprite.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class _ScrolledViewport extends ChatReadViewport {
  @override
  ChatReadViewportState build() => const ChatReadViewportState(
    channelId: 'c1',
    viewportActive: true,
    distanceFromBottom: 2000,
  );
}

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
        kChatFloatingButtonGap - MobileComposerLayout.topInset,
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

  testWidgets('ChannelChatComposerBoundary hides the fade with no status', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final FluxerColorTheme colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(
            body: SizedBox(
              height: WideComposerLayout.statusOverlayHeight,
              width: 390,
              child: ChannelChatComposerBoundary(
                channelId: '',
                applyWallpaper: false,
                leadingStatus: Text('typing'),
                trailingStatuses: <Widget>[Text('slowmode')],
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(WideComposerFade), findsNothing);
    expect(find.text('typing'), findsOneWidget);
    expect(find.text('slowmode'), findsOneWidget);
  });

  testWidgets('status fade stays short and translucent while scrolled up', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final FluxerColorTheme colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          chatReadViewportProvider.overrideWith(_ScrolledViewport.new),
          presentableTypingUsersInChannelProvider(
            'c1',
          ).overrideWith((ref) => const <String>['u1']),
        ],
        child: MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(
            body: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: WideComposerLayout.statusOverlayHeight,
                width: 390,
                child: ChannelChatComposerBoundary(
                  channelId: 'c1',
                  applyWallpaper: false,
                  leadingStatus: Text('typing'),
                  trailingStatuses: <Widget>[Text('slowmode')],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final Finder fade = find.byType(WideComposerFade);
    expect(fade, findsOneWidget);
    final Rect fadeRect = tester.getRect(fade);
    final Rect label = tester.getRect(find.text('slowmode'));
    expect(fadeRect.height, WideComposerLayout.statusFadeHeight);
    expect(fadeRect.top, lessThan(label.top));
    final DecoratedBox box = tester.widget<DecoratedBox>(
      find.descendant(of: fade, matching: find.byType(DecoratedBox)),
    );
    final Gradient gradient = (box.decoration as BoxDecoration).gradient!;
    for (final Color color in gradient.colors) {
      expect(color.a, lessThanOrEqualTo(WideComposerLayout.statusFadeOpacity));
    }
  });

  testWidgets('neko sits over the mobile composer bar end corner', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final FluxerColorTheme colorTheme = buildDarkColorTheme();
    const Key nekoKey = Key('neko');
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(
            body: SizedBox(
              height: WideComposerLayout.statusOverlayHeight,
              width: 390,
              child: ChannelChatComposerBoundary(
                channelId: '',
                applyWallpaper: false,
                leadingStatus: SizedBox.shrink(),
                trailingStatuses: <Widget>[],
                neko: SizedBox(
                  key: nekoKey,
                  width: kNekoSpriteSize,
                  height: kNekoSpriteSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final Rect neko = tester.getRect(find.byKey(nekoKey));
    const double barEnd = 390 - MobileComposerLayout.sideInset;
    expect(neko.right, 390 - MobileComposerLayout.nekoInsetEnd);
    expect(neko.right, lessThan(barEnd));
    expect(barEnd - neko.right, lessThan(MobileComposerLayout.radius));
  });
}
