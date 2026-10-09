import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet_drag.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

enum BottomInputTransition { idle, lockingToPanel, lockingToKeyboard }

enum InlineExpressionPanelSnapTarget { close, anchor, expanded }

const double kKeyboardHeightQuantizeThreshold = 1;
const double kKeyboardAnchorPersistThreshold = 4;
const double kShortKeyboardInsetGap = 48;
const double kMinImeKeyboardHeight = 120;
const double kInlineExpressionPanelAnchorMagneticFraction = 0.12;
const double kInlineExpressionPanelDismissHeightFraction = 0.55;
const double kInlineExpressionPanelExpandedSnapMidpointFraction =
    kExpandableSheetSnapMidpointFraction;

const double kIosFallbackKeyboardHeight = 291;
const double kAndroidFallbackKeyboardHeightFraction = 0.38;

double quantizeBottomInputHeight(double height) {
  if (height <= 0) {
    return 0;
  }
  return height.roundToDouble();
}

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

bool isImeKeyboardHeight(double height) {
  return height >= kMinImeKeyboardHeight;
}

double inlineExpressionPanelAnchorHeight({
  required double? anchoredKeyboardHeight,
  required double fallbackHeight,
}) {
  if (anchoredKeyboardHeight != null &&
      isImeKeyboardHeight(anchoredKeyboardHeight)) {
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

double resolveBottomInputSlotHeight({
  required bool isPanelOpen,
  required BottomInputTransition transition,
  required double lockedHeight,
  required double anchorHeight,
  required double panelHeight,
  required double liveKeyboardHeight,
  required bool isKeyboardVisible,
  double? heldSlotHeightOverride,
  bool unmeasuredKeyboardReserved = false,
}) {
  if (heldSlotHeightOverride != null) {
    return heldSlotHeightOverride;
  }
  if (transition != BottomInputTransition.idle) {
    return quantizeBottomInputHeight(lockedHeight);
  }
  if (isPanelOpen) {
    if (panelHeight > 0 &&
        panelHeight <= anchorHeight + kKeyboardHeightQuantizeThreshold) {
      return quantizeBottomInputHeight(panelHeight);
    }
    return quantizeBottomInputHeight(anchorHeight);
  }
  if (isKeyboardVisible && liveKeyboardHeight > 0) {
    return quantizeBottomInputHeight(liveKeyboardHeight);
  }
  if (unmeasuredKeyboardReserved &&
      liveKeyboardHeight <= 0 &&
      anchorHeight > 0) {
    return quantizeBottomInputHeight(anchorHeight);
  }
  return 0;
}

bool shouldClearUnmeasuredKeyboardReservation({
  required bool unmeasuredKeyboardReserved,
  required double previousLiveHeight,
  required double mergedHeight,
  required bool hadKeyboardInsetWhileReserved,
  bool composerEntryFocused = false,
}) {
  if (!unmeasuredKeyboardReserved) {
    return false;
  }
  if (mergedHeight > 0) {
    return true;
  }
  if (previousLiveHeight > 0 && mergedHeight <= 0) {
    return !composerEntryFocused;
  }
  if (composerEntryFocused) {
    return false;
  }
  return hadKeyboardInsetWhileReserved && mergedHeight <= 0;
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

double resolvedKeyboardInsetBottomFrom({
  required double mediaQueryInsetBottom,
  required double physicalViewInsetBottom,
  required double devicePixelRatio,
}) {
  if (devicePixelRatio <= 0) {
    return mediaQueryInsetBottom;
  }
  final double viewInsetLogical = physicalViewInsetBottom / devicePixelRatio;
  return math.max(mediaQueryInsetBottom, viewInsetLogical);
}

double resolvedKeyboardInsetBottom(BuildContext context) {
  final MediaQueryData mediaQuery = MediaQuery.of(context);
  return resolvedKeyboardInsetBottomFrom(
    mediaQueryInsetBottom: mediaQuery.viewInsets.bottom,
    physicalViewInsetBottom: View.of(context).viewInsets.bottom,
    devicePixelRatio: mediaQuery.devicePixelRatio,
  );
}

/// viewInsets when it is non-zero, otherwise the native height.
double resolveDualSourceLiveKeyboardHeight({
  required double nativeHeight,
  required double viewInsetsHeight,
}) {
  if (viewInsetsHeight > 0) {
    return viewInsetsHeight;
  }
  if (nativeHeight > 0) {
    return nativeHeight;
  }
  return 0;
}

bool shouldPersistKeyboardAnchor({
  required double storedHeight,
  required double nextHeight,
}) {
  return (nextHeight - storedHeight).abs() >= kKeyboardAnchorPersistThreshold;
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
  return quantizeBottomInputHeight(liveNetHeight) >=
      quantizeBottomInputHeight(lockedNetHeight);
}

double resolvePanelReservedLayoutHeight({
  required double slotHeight,
  required double netAnchorHeight,
  required double grossAnchorHeight,
  bool useExactSlotHeight = false,
}) {
  if (useExactSlotHeight || slotHeight > 0) {
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

double bottomInputHomeIndicatorInset(MediaQueryData mediaQuery) {
  return mediaQuery.viewPadding.bottom;
}

double bottomInputKeyboardSpacerHeight({
  required double slotHeight,
  required double homeIndicatorInset,
}) {
  return math.max(slotHeight, homeIndicatorInset);
}

bool chatLayoutReservesBottomSafeArea({
  required bool isMobile,
  required bool keyboardSlotOccupied,
}) {
  return !isMobile && !keyboardSlotOccupied;
}
