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
          hasChannelDetailsDrawerOpen: false,
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
          hasChannelDetailsDrawerOpen: false,
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
          hasChannelDetailsDrawerOpen: false,
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
          hasChannelDetailsDrawerOpen: false,
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
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.left,
          shellLocation: '/channels/@explore',
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
          hasChannelDetailsDrawerOpen: false,
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
          hasChannelDetailsDrawerOpen: false,
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
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/@favorites',
        ),
        ShellBackAction.noop,
      );
    });

    test('system back on a root list exits the app', () {
      for (final String location in <String>[
        '/channels/@me',
        '/channels/@favorites',
        '/channels/guild',
      ]) {
        for (final RevealSide side in RevealSide.values) {
          expect(
            resolveShellBackAction(
              hasPopupOverlay: false,
              hasManualGestureBlock: false,
              hasExpressionPanelOpen: false,
              hasChannelDetailsDrawerOpen: false,
              revealSide: side,
              shellLocation: location,
              isSystemBack: true,
            ),
            ShellBackAction.exitApp,
            reason: '$location $side',
          );
        }
      }
    });

    test('system back on a root list closes overlays before exiting', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: true,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.left,
          shellLocation: '/channels/@me',
          isSystemBack: true,
        ),
        ShellBackAction.popOverlay,
      );
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: true,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.left,
          shellLocation: '/channels/@me',
          isSystemBack: true,
        ),
        ShellBackAction.blockManualGesture,
      );
    });

    test('reveals drawer when chat is visible without a concurrent list', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild/channel',
        ),
        ShellBackAction.revealDrawer,
      );
    });

    test('wide concurrent list chat back is a no-op for a normal channel', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild-1/channel-1',
          chatShowsConcurrentChannelList: true,
        ),
        ShellBackAction.noop,
      );
    });

    test('wide concurrent list thread back leaves chat', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild-1/thread-1',
          chatShowsConcurrentChannelList: true,
          isThreadChat: true,
        ),
        ShellBackAction.leaveChat,
      );
    });

    test('channel details drawer closes before guild drawer reveal', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: true,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild/channel',
        ),
        ShellBackAction.closeChannelDetailsDrawer,
      );
    });

    test('minimizes a phone voice call instead of opening the drawer', () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild/voice',
          minimizePhoneVoiceCall: true,
        ),
        ShellBackAction.minimizePhoneVoiceCall,
      );
    });
  });
}
