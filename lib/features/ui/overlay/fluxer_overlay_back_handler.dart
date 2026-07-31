import 'package:flutter/material.dart';

/// Handles the system back button for modal overlays such as FluxerBottomSheets
/// and models.
Widget wrapFluxerOverlayBackHandler({
  required bool canDismiss,
  required VoidCallback? onBack,
  required VoidCallback? onDismiss,
  required Widget child,
}) {
  if (canDismiss && onBack == null && onDismiss == null) {
    return child;
  }

  return PopScope(
    canPop: false,
    onPopInvokedWithResult: (bool didPop, _) {
      if (didPop || !canDismiss) {
        return;
      }
      if (onBack != null) {
        onBack();
        return;
      }
      onDismiss?.call();
    },
    child: child,
  );
}
