import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/utils/shell_bottom_nav_visibility.dart';

void main() {
  group('shellBottomNavWouldBeVisible', () {
    test('locked dm list route always exposes nav', () {
      expect(
        shellBottomNavWouldBeVisible(
          shellLocation: '/channels/@me',
          revealSide: RevealSide.main,
        ),
        isTrue,
      );
    });

    test('chat route hides nav while drawer is closed', () {
      expect(
        shellBottomNavWouldBeVisible(
          shellLocation: '/channels/guild/channel',
          revealSide: RevealSide.main,
        ),
        isFalse,
      );
    });

    test('chat route exposes nav when drawer is revealed', () {
      expect(
        shellBottomNavWouldBeVisible(
          shellLocation: '/channels/guild/channel',
          revealSide: RevealSide.left,
        ),
        isTrue,
      );
    });
  });

  group('shouldHideShellBottomNavOverlay', () {
    test('ignores keyboard while nav is covered by slider', () {
      expect(
        shouldHideShellBottomNavOverlay(
          navWouldBeVisible: false,
          keyboardOpen: true,
          isOnChatRoute: true,
          isExpressionPanelOpen: false,
        ),
        isFalse,
      );
    });

    test('hides for keyboard when nav is visible', () {
      expect(
        shouldHideShellBottomNavOverlay(
          navWouldBeVisible: true,
          keyboardOpen: true,
          isOnChatRoute: false,
          isExpressionPanelOpen: false,
        ),
        isTrue,
      );
    });

    test('hides expression panel only on chat routes', () {
      expect(
        shouldHideShellBottomNavOverlay(
          navWouldBeVisible: true,
          keyboardOpen: false,
          isOnChatRoute: true,
          isExpressionPanelOpen: true,
        ),
        isTrue,
      );
      expect(
        shouldHideShellBottomNavOverlay(
          navWouldBeVisible: true,
          keyboardOpen: false,
          isOnChatRoute: false,
          isExpressionPanelOpen: true,
        ),
        isFalse,
      );
    });
  });

  group('showShellBottomNav', () {
    test('keeps nav mounted in chat while keyboard is up', () {
      expect(
        showShellBottomNav(
          shellLocation: '/channels/guild/channel',
          revealSide: RevealSide.main,
          keyboardOpen: true,
          isOnChatRoute: true,
          isExpressionPanelOpen: false,
        ),
        isTrue,
      );
    });

    test('hides nav on list routes while keyboard is up', () {
      expect(
        showShellBottomNav(
          shellLocation: '/channels/@me',
          revealSide: RevealSide.left,
          keyboardOpen: true,
          isOnChatRoute: false,
          isExpressionPanelOpen: false,
        ),
        isFalse,
      );
    });
  });
}
