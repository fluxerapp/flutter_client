import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';

void main() {
  test('pinned hinge chat uses drawer reveal when the list is hidden', () {
    expect(
      resolveShellBackAction(
        hasPopupOverlay: false,
        hasManualGestureBlock: false,
        hasExpressionPanelOpen: false,
        hasChannelDetailsDrawerOpen: false,
        revealSide: RevealSide.main,
        shellLocation: '/channels/guild-1/channel-1',
        pinnedSidebar: true,
      ),
      ShellBackAction.revealDrawer,
    );
  });

  test(
    'pinned flat sidebar does not leave chat for a normal channel or dm',
    () {
      expect(
        resolveShellBackAction(
          hasPopupOverlay: false,
          hasManualGestureBlock: false,
          hasExpressionPanelOpen: false,
          hasChannelDetailsDrawerOpen: false,
          revealSide: RevealSide.main,
          shellLocation: '/channels/guild-1/channel-1',
          pinnedSidebar: true,
          chatShowsConcurrentChannelList: true,
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
          shellLocation: '/channels/guild-1/channel-1',
          pinnedSidebar: true,
          chatShowsConcurrentChannelList: true,
          isSystemBack: true,
        ),
        ShellBackAction.exitApp,
      );
    },
  );

  test('wide concurrent list matches pinned flat sidebar back rules', () {
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

  test('pinned flat sidebar still leaves a thread chat', () {
    expect(
      resolveShellBackAction(
        hasPopupOverlay: false,
        hasManualGestureBlock: false,
        hasExpressionPanelOpen: false,
        hasChannelDetailsDrawerOpen: false,
        revealSide: RevealSide.main,
        shellLocation: '/channels/guild-1/thread-1',
        pinnedSidebar: true,
        chatShowsConcurrentChannelList: true,
        isThreadChat: true,
      ),
      ShellBackAction.leaveChat,
    );
  });
}
