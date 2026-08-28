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

    test('favorites channel reveals drawer like guild chat', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/@favorites/abc',
        ),
        ShellBackAction.revealDrawer,
      );
    });

    test('open drawer on chat returns to dm home', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.left,
          shellLocation: '/channels/guild/channel',
        ),
        ShellBackAction.leaveChat,
      );
    });

    test('open drawer on non-chat routes still closes the drawer', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.left,
          shellLocation: '/channels/@discover',
        ),
        ShellBackAction.closeDrawer,
      );
    });

    test('does not open or close a locked drawer', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild',
        ),
        ShellBackAction.noop,
      );
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.left,
          shellLocation: '/channels/@me',
        ),
        ShellBackAction.noop,
      );
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/@favorites',
        ),
        ShellBackAction.noop,
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

    test('minimizes a phone voice call instead of opening the drawer', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild/voice',
          minimizePhoneVoiceCall: true,
        ),
        ShellBackAction.minimizePhoneVoiceCall,
      );
    });
  });
}
