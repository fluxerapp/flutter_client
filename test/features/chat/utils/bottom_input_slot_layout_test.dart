import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';

void main() {
  group('bottomInputSlotContentHeight', () {
    test('subtracts safe area for panel slot below composer inset', () {
      expect(
        bottomInputSlotContentHeight(rawHeight: 336, safeAreaBottom: 34),
        302,
      );
    });

    test('returns gross height when safe area is zero', () {
      expect(
        bottomInputSlotContentHeight(rawHeight: 336, safeAreaBottom: 0),
        336,
      );
    });

    test('never zeroes out a positive raw height', () {
      expect(
        bottomInputSlotContentHeight(rawHeight: 30, safeAreaBottom: 34),
        30,
      );
    });
  });

  group('resolveBottomInputSlotHeight', () {
    test('locks net slot height during panel transition', () {
      expect(
        resolveBottomInputSlotHeight(
          isPanelOpen: true,
          transition: BottomInputTransition.lockingToPanel,
          lockedHeight: 302,
          anchorHeight: 336,
          panelHeight: 302,
          liveKeyboardHeight: 120,
          isKeyboardVisible: true,
          safeAreaBottom: 34,
        ),
        302,
      );
    });

    test('uses full keyboard height while open (no safe-area netting)', () {
      expect(
        resolveBottomInputSlotHeight(
          isPanelOpen: false,
          transition: BottomInputTransition.idle,
          lockedHeight: 0,
          anchorHeight: 336,
          panelHeight: 0,
          liveKeyboardHeight: 336,
          isKeyboardVisible: true,
          safeAreaBottom: 34,
        ),
        336,
      );
    });

    test('uses full keyboard height when safe area is zero (button nav)', () {
      expect(
        resolveBottomInputSlotHeight(
          isPanelOpen: false,
          transition: BottomInputTransition.idle,
          lockedHeight: 0,
          anchorHeight: 336,
          panelHeight: 0,
          liveKeyboardHeight: 336,
          isKeyboardVisible: true,
          safeAreaBottom: 0,
        ),
        336,
      );
    });

    test(
      'uses full keyboard anchor when panel is open (no safe-area netting)',
      () {
        expect(
          resolveBottomInputSlotHeight(
            isPanelOpen: true,
            transition: BottomInputTransition.idle,
            lockedHeight: 0,
            anchorHeight: 336,
            panelHeight: 640,
            liveKeyboardHeight: 0,
            isKeyboardVisible: false,
            safeAreaBottom: 34,
          ),
          336,
        );
      },
    );

    test('returns zero when panel and keyboard are closed', () {
      expect(
        resolveBottomInputSlotHeight(
          isPanelOpen: false,
          transition: BottomInputTransition.idle,
          lockedHeight: 0,
          anchorHeight: 336,
          panelHeight: 0,
          liveKeyboardHeight: 0,
          isKeyboardVisible: false,
          safeAreaBottom: 34,
        ),
        0,
      );
    });
  });

  group('resolvePanelReservedLayoutHeight', () {
    test('prefers provider slot height when positive', () {
      expect(
        resolvePanelReservedLayoutHeight(
          slotHeight: 336,
          netAnchorHeight: 302,
          grossAnchorHeight: 336,
        ),
        336,
      );
    });

    test('falls back to net anchor when slot height is zero', () {
      expect(
        resolvePanelReservedLayoutHeight(
          slotHeight: 0,
          netAnchorHeight: 302,
          grossAnchorHeight: 336,
        ),
        302,
      );
    });

    test('falls back to gross anchor as last resort', () {
      expect(
        resolvePanelReservedLayoutHeight(
          slotHeight: 0,
          netAnchorHeight: 0,
          grossAnchorHeight: 291,
        ),
        291,
      );
    });
  });

  group('resolveNextAnchoredKeyboardHeight', () {
    test('tracks session max while keyboard is visible', () {
      expect(
        resolveNextAnchoredKeyboardHeight(
          currentAnchored: 336,
          nextHeight: 280,
          nextVisible: true,
        ),
        336,
      );
      expect(
        resolveNextAnchoredKeyboardHeight(
          currentAnchored: 280,
          nextHeight: 336,
          nextVisible: true,
        ),
        336,
      );
    });

    test('keeps stored max when keyboard dismisses', () {
      expect(
        resolveNextAnchoredKeyboardHeight(
          currentAnchored: 336,
          nextHeight: 0,
          nextVisible: false,
        ),
        336,
      );
    });
  });

  group('resolveNativeImeOnlyHeight', () {
    test(
      'strips paired native safe area from Android gross keyboard height',
      () {
        expect(
          resolveNativeImeOnlyHeight(
            nativeKeyboardHeight: 336,
            nativeSafeAreaBottom: 34,
          ),
          302,
        );
      },
    );

    test('returns raw height when native safe area is zero', () {
      expect(
        resolveNativeImeOnlyHeight(
          nativeKeyboardHeight: 336,
          nativeSafeAreaBottom: 0,
        ),
        336,
      );
    });

    test('returns zero for hidden native keyboard', () {
      expect(
        resolveNativeImeOnlyHeight(
          nativeKeyboardHeight: 0,
          nativeSafeAreaBottom: 34,
        ),
        0,
      );
    });
  });

  group('resolveDualSourceLiveKeyboardHeight', () {
    test(
      'gap case: normalized native matches viewInsets → slot 302 not 336',
      () {
        final double nativeIme = resolveNativeImeOnlyHeight(
          nativeKeyboardHeight: 336,
          nativeSafeAreaBottom: 34,
        );
        expect(nativeIme, 302);
        expect(
          resolveDualSourceLiveKeyboardHeight(
            nativeHeight: nativeIme,
            viewInsetsHeight: 302,
          ),
          302,
        );
        expect(
          resolveBottomInputSlotHeight(
            isPanelOpen: false,
            transition: BottomInputTransition.idle,
            lockedHeight: 0,
            anchorHeight: 336,
            panelHeight: 0,
            liveKeyboardHeight: 302,
            isKeyboardVisible: true,
            safeAreaBottom: 0,
          ),
          302,
        );
      },
    );

    test(
      'takes max in IME-only units so stale lower source cannot regress',
      () {
        expect(
          resolveDualSourceLiveKeyboardHeight(
            nativeHeight: 302,
            viewInsetsHeight: 180,
          ),
          302,
        );
        expect(
          resolveDualSourceLiveKeyboardHeight(
            nativeHeight: 120,
            viewInsetsHeight: 302,
          ),
          302,
        );
      },
    );

    test('collapses to zero when both sources report hidden', () {
      expect(
        resolveDualSourceLiveKeyboardHeight(
          nativeHeight: 0,
          viewInsetsHeight: 0,
        ),
        0,
      );
    });

    test('allows close animation as both sources shrink', () {
      expect(
        resolveDualSourceLiveKeyboardHeight(
          nativeHeight: 200,
          viewInsetsHeight: 180,
        ),
        200,
      );
      expect(
        resolveDualSourceLiveKeyboardHeight(
          nativeHeight: 0,
          viewInsetsHeight: 90,
        ),
        90,
      );
      expect(
        resolveDualSourceLiveKeyboardHeight(
          nativeHeight: 0,
          viewInsetsHeight: 0,
        ),
        0,
      );
    });
  });

  group('keyboard panel transition helpers', () {
    test('transition lock uses max of live keyboard and anchor', () {
      expect(
        resolveTransitionLockHeight(liveKeyboardHeight: 336, anchorHeight: 291),
        336,
      );
      expect(
        resolveTransitionLockHeight(liveKeyboardHeight: 200, anchorHeight: 336),
        336,
      );
    });

    test('gross height restores safe area for panel to keyboard swap', () {
      expect(
        bottomInputSlotGrossHeight(netHeight: 302, safeAreaBottom: 34),
        336,
      );
    });

    test('keyboard dismiss waits for inset to settle', () {
      expect(
        hasKeyboardFullyDismissed(
          liveKeyboardHeight: 0,
          isKeyboardVisible: false,
        ),
        isTrue,
      );
      expect(
        hasKeyboardFullyDismissed(
          liveKeyboardHeight: 120,
          isKeyboardVisible: false,
        ),
        isFalse,
      );
      expect(
        hasKeyboardFullyDismissed(
          liveKeyboardHeight: 120,
          isKeyboardVisible: true,
        ),
        isFalse,
      );
    });

    test('keyboard reveal waits for locked net height', () {
      const double safeAreaBottom = 34;
      const double lockedNetHeight = 302;

      expect(
        hasKeyboardReachedLockedNetHeight(
          liveKeyboardHeight: 120,
          lockedNetHeight: lockedNetHeight,
          safeAreaBottom: safeAreaBottom,
          isKeyboardVisible: true,
        ),
        isFalse,
      );
      expect(
        hasKeyboardReachedLockedNetHeight(
          liveKeyboardHeight: 336,
          lockedNetHeight: lockedNetHeight,
          safeAreaBottom: safeAreaBottom,
          isKeyboardVisible: true,
        ),
        isTrue,
      );
      expect(
        hasKeyboardReachedLockedNetHeight(
          liveKeyboardHeight: 335.4,
          lockedNetHeight: 336,
          safeAreaBottom: 0,
          isKeyboardVisible: true,
        ),
        isFalse,
      );
      expect(
        hasKeyboardReachedLockedNetHeight(
          liveKeyboardHeight: 335.6,
          lockedNetHeight: 336,
          safeAreaBottom: 0,
          isKeyboardVisible: true,
        ),
        isTrue,
      );
      expect(
        hasKeyboardReachedLockedNetHeight(
          liveKeyboardHeight: 336,
          lockedNetHeight: lockedNetHeight,
          safeAreaBottom: safeAreaBottom,
          isKeyboardVisible: false,
        ),
        isFalse,
      );
    });

    test('panel open prefers captured panel height over session anchor', () {
      expect(
        resolveBottomInputSlotHeight(
          isPanelOpen: true,
          transition: BottomInputTransition.idle,
          lockedHeight: 0,
          anchorHeight: 336,
          panelHeight: 335,
          liveKeyboardHeight: 0,
          isKeyboardVisible: false,
          safeAreaBottom: 34,
        ),
        335,
      );
    });

    test('slot heights quantize to whole pixels', () {
      expect(quantizeBottomInputHeight(335.4), 335);
      expect(quantizeBottomInputHeight(335.6), 336);
      expect(
        resolveBottomInputSlotHeight(
          isPanelOpen: false,
          transition: BottomInputTransition.idle,
          lockedHeight: 0,
          anchorHeight: 336,
          panelHeight: 0,
          liveKeyboardHeight: 335.6,
          isKeyboardVisible: true,
          safeAreaBottom: 0,
        ),
        336,
      );
    });

    test(
      'locking keyboard transition keeps locked height while inset animates',
      () {
        const double safeAreaBottom = 34;
        const double lockedNetHeight = 302;

        expect(
          resolveBottomInputSlotHeight(
            isPanelOpen: false,
            transition: BottomInputTransition.lockingToKeyboard,
            lockedHeight: lockedNetHeight,
            anchorHeight: 336,
            panelHeight: lockedNetHeight,
            liveKeyboardHeight: 180,
            isKeyboardVisible: true,
            safeAreaBottom: safeAreaBottom,
          ),
          lockedNetHeight,
        );
      },
    );
  });

  group('inlineExpressionPanelSnapTarget', () {
    test('resolves snap targets', () {
      const double anchorHeight = 291;
      const double expandedHeight = 640;
      const double midpoint =
          anchorHeight +
          (expandedHeight - anchorHeight) *
              kInlineExpressionPanelExpandedSnapMidpointFraction;

      expect(
        inlineExpressionPanelSnapTarget(
          currentHeight: 120,
          velocity: 0,
          anchorHeight: anchorHeight,
          expandedHeight: expandedHeight,
        ),
        InlineExpressionPanelSnapTarget.close,
      );
      expect(
        inlineExpressionPanelSnapTarget(
          currentHeight: 250,
          velocity: 400,
          anchorHeight: anchorHeight,
          expandedHeight: expandedHeight,
        ),
        InlineExpressionPanelSnapTarget.anchor,
      );
      expect(
        inlineExpressionPanelSnapTarget(
          currentHeight: midpoint - 1,
          velocity: 0,
          anchorHeight: anchorHeight,
          expandedHeight: expandedHeight,
        ),
        InlineExpressionPanelSnapTarget.anchor,
      );
      expect(
        inlineExpressionPanelSnapTarget(
          currentHeight: midpoint + 1,
          velocity: 0,
          anchorHeight: anchorHeight,
          expandedHeight: expandedHeight,
        ),
        InlineExpressionPanelSnapTarget.expanded,
      );
      expect(
        inlineExpressionPanelSnapTarget(
          currentHeight: anchorHeight,
          velocity: -700,
          anchorHeight: anchorHeight,
          expandedHeight: expandedHeight,
        ),
        InlineExpressionPanelSnapTarget.expanded,
      );
      expect(
        inlineExpressionPanelSnapTarget(
          currentHeight: anchorHeight + 20,
          velocity: 700,
          anchorHeight: anchorHeight,
          expandedHeight: expandedHeight,
        ),
        InlineExpressionPanelSnapTarget.anchor,
      );
    });
  });
}
