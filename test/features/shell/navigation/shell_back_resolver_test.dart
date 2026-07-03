import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

void main() {
  group('resolveShellBackAction', () {
    test('popup overlay wins over drawer reveal', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: true,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild/channel',
        ),
        ShellBackAction.popOverlay,
      );
    });

    test('expression panel closes before drawer reveal', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: true,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild/channel',
        ),
        ShellBackAction.closePanel,
      );
    });

    test('favorites channel returns to favorites list', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/@favorites/abc',
        ),
        ShellBackAction.returnToFavorites,
      );
    });

    test('open drawer closes before revealing drawer again', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.left,
          shellLocation: '/channels/guild/channel',
        ),
        ShellBackAction.closeDrawer,
      );
    });

    test('reveals drawer when chat is visible', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild/channel',
        ),
        ShellBackAction.revealDrawer,
      );
    });
  });
}
