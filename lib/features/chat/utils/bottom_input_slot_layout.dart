import 'dart:math' as math;

import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet_drag.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

enum BottomInputMode { none, keyboard, panelAnchored, panelExpanded }

enum BottomInputTransition { idle, lockingToPanel, lockingToKeyboard }

enum InlineExpressionPanelSnapTarget { close, anchor, expanded }

const double kKeyboardHeightQuantizeThreshold = 1;
const double kKeyboardAnchorPersistThreshold = 4;
const double kInlineExpressionPanelAnchorMagneticFraction = 0.12;
const double kInlineExpressionPanelDismissHeightFraction = 0.55;
const double kInlineExpressionPanelExpandedSnapMidpointFraction =
    kExpandableSheetSnapMidpointFraction;

const double kIosFallbackKeyboardHeight = 291;
const double kAndroidFallbackKeyboardHeightFraction = 0.38;

double fallbackKeyboardHeightForScreen({
  required double screenHeight,
  required bool isIos,
}) {
  if (isIos) {
    return kIosFallbackKeyboardHeight;
  }
  return (screenHeight * kAndroidFallbackKeyboardHeightFraction).clamp(
    240,
    400,
  );
}

double inlineExpressionPanelAnchorHeight({
  required double? anchoredKeyboardHeight,
  required double fallbackHeight,
}) {
  if (anchoredKeyboardHeight != null && anchoredKeyboardHeight > 0) {
    return anchoredKeyboardHeight;
  }
  return fallbackHeight;
}

double bottomInputSlotContentHeight({
  required double rawHeight,
  required double safeAreaBottom,
}) {
  if (rawHeight <= 0) {
    return 0;
  }
  if (safeAreaBottom <= 0) {
    return rawHeight;
  }
  final double netHeight = rawHeight - safeAreaBottom;
  return netHeight > 0 ? netHeight : rawHeight;
}

double bottomInputSlotAnchorHeight({
  required double? anchoredKeyboardHeight,
  required double fallbackHeight,
  required double safeAreaBottom,
}) {
  final double rawAnchor = inlineExpressionPanelAnchorHeight(
    anchoredKeyboardHeight: anchoredKeyboardHeight,
    fallbackHeight: fallbackHeight,
  );
  return bottomInputSlotContentHeight(
    rawHeight: rawAnchor,
    safeAreaBottom: safeAreaBottom,
  );
}

double bottomInputSlotGrossHeight({
  required double netHeight,
  required double safeAreaBottom,
}) {
  if (netHeight <= 0) {
    return 0;
  }
  return netHeight + safeAreaBottom;
}

double resolveBottomInputSlotHeight({
  required bool isPanelOpen,
  required BottomInputTransition transition,
  required double lockedHeight,
  required double anchorHeight,
  required double panelHeight,
  required double liveKeyboardHeight,
  required bool isKeyboardVisible,
  required double safeAreaBottom,
}) {
  if (transition != BottomInputTransition.idle) {
    return lockedHeight;
  }
  if (isPanelOpen) {
    return bottomInputSlotContentHeight(
      rawHeight: anchorHeight,
      safeAreaBottom: safeAreaBottom,
    );
  }
  if (isKeyboardVisible && liveKeyboardHeight > 0) {
    // Already IME-only; pad fully. Outer SafeArea collapses under the keyboard.
    return liveKeyboardHeight;
  }
  return 0;
}

InlineExpressionPanelSnapTarget inlineExpressionPanelSnapTarget({
  required double currentHeight,
  required double velocity,
  required double anchorHeight,
  required double expandedHeight,
  double dismissVelocity = kFluxerBottomSheetDismissVelocity,
  double expandVelocity = -kExpandableSheetFlingVelocityThreshold,
}) {
  final double magneticZone =
      anchorHeight * kInlineExpressionPanelAnchorMagneticFraction;
  final double dismissThreshold =
      anchorHeight * kInlineExpressionPanelDismissHeightFraction;
  final double expandedMidpoint =
      anchorHeight +
      (expandedHeight - anchorHeight) *
          kInlineExpressionPanelExpandedSnapMidpointFraction;

  if (velocity < expandVelocity) {
    return InlineExpressionPanelSnapTarget.expanded;
  }
  if (velocity > dismissVelocity) {
    if (currentHeight < dismissThreshold) {
      return InlineExpressionPanelSnapTarget.close;
    }
    return InlineExpressionPanelSnapTarget.anchor;
  }
  if (currentHeight < dismissThreshold) {
    return InlineExpressionPanelSnapTarget.close;
  }
  if ((currentHeight - anchorHeight).abs() <= magneticZone) {
    return InlineExpressionPanelSnapTarget.anchor;
  }
  if (currentHeight >= expandedMidpoint) {
    return InlineExpressionPanelSnapTarget.expanded;
  }
  return InlineExpressionPanelSnapTarget.anchor;
}

bool shouldEmitKeyboardHeightUpdate({
  required double previousHeight,
  required double nextHeight,
  required bool previousVisible,
  required bool nextVisible,
}) {
  if (previousVisible != nextVisible) {
    return true;
  }
  return (nextHeight - previousHeight).abs() >=
      kKeyboardHeightQuantizeThreshold;
}

/// Android native keyboardHeight includes systemBars; strip the same event's
/// [nativeSafeAreaBottom] to IME-only units (do not use MediaQuery.padding).
double resolveNativeImeOnlyHeight({
  required double nativeKeyboardHeight,
  required double nativeSafeAreaBottom,
}) {
  if (nativeKeyboardHeight <= 0) {
    return 0;
  }
  if (nativeSafeAreaBottom <= 0) {
    return nativeKeyboardHeight;
  }
  final double imeOnly = nativeKeyboardHeight - nativeSafeAreaBottom;
  return imeOnly > 0 ? imeOnly : 0;
}

/// Max of IME-normalized native height and Flutter viewInsets.bottom.
double resolveDualSourceLiveKeyboardHeight({
  required double nativeHeight,
  required double viewInsetsHeight,
}) {
  return math.max(nativeHeight, viewInsetsHeight);
}

bool shouldPersistKeyboardAnchor({
  required double storedHeight,
  required double nextHeight,
}) {
  return (nextHeight - storedHeight).abs() >= kKeyboardAnchorPersistThreshold;
}

double resolveNextAnchoredKeyboardHeight({
  required double? currentAnchored,
  required double nextHeight,
  required bool nextVisible,
}) {
  if (!nextVisible || nextHeight <= 0) {
    return currentAnchored ?? 0;
  }
  return math.max(currentAnchored ?? 0, nextHeight);
}

double resolveTransitionLockHeight({
  required double liveKeyboardHeight,
  required double anchorHeight,
}) {
  return math.max(liveKeyboardHeight, anchorHeight);
}

bool hasKeyboardFullyDismissed({
  required double liveKeyboardHeight,
  required bool isKeyboardVisible,
}) {
  return !isKeyboardVisible &&
      liveKeyboardHeight <= kKeyboardHeightQuantizeThreshold;
}

bool hasKeyboardReachedLockedNetHeight({
  required double liveKeyboardHeight,
  required double lockedNetHeight,
  required double safeAreaBottom,
  required bool isKeyboardVisible,
}) {
  if (!isKeyboardVisible || lockedNetHeight <= 0) {
    return false;
  }
  final double liveNetHeight = bottomInputSlotContentHeight(
    rawHeight: liveKeyboardHeight,
    safeAreaBottom: safeAreaBottom,
  );
  return liveNetHeight >= lockedNetHeight - kKeyboardHeightQuantizeThreshold;
}

double resolvePanelReservedLayoutHeight({
  required double slotHeight,
  required double netAnchorHeight,
  required double grossAnchorHeight,
}) {
  if (slotHeight > 0) {
    return slotHeight;
  }
  if (netAnchorHeight > 0) {
    return netAnchorHeight;
  }
  if (grossAnchorHeight > 0) {
    return grossAnchorHeight;
  }
  return 0;
}
