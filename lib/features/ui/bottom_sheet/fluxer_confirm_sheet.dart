import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

// ---------------------------------------------------------------------------
// FluxerConfirmSheet
// ---------------------------------------------------------------------------

/// A confirmation [FluxerBottomSheet] with a single primary (or danger) action.
///
/// Mirrors `FluxerConfirmModal` but renders as a bottom sheet. There is **no
/// Cancel button** — the sheet's drag handle and barrier are the cancel
/// affordance, matching the rest of the mobile sheet UX. Resolves to `true`
/// when the confirm button is tapped and to `null` when the user swipes or
/// taps outside.
class FluxerConfirmSheet {
  FluxerConfirmSheet._();

  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required VoidCallback onConfirm,
    required String confirmLabel,
    String? description,
    Widget? body,
    bool isDanger = false,
    bool useRootNavigator = true,
  }) {
    return FluxerBottomSheet.show<bool>(
      context,
      useRootNavigator: useRootNavigator,
      title: title,
      builder: (sheetContext, close) {
        final textStyles = sheetContext.textStyles;
        final colors = sheetContext.colors;
        final layout = sheetContext.layout;

        final descriptionWidget = description == null
            ? null
            : Text(
                description,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                  height: 1.4,
                ),
              );

        return Padding(
          padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ?descriptionWidget,
                if (descriptionWidget != null && body != null)
                  SizedBox(height: layout.s4),
                ?body,
                SizedBox(height: layout.s4),
                if (isDanger)
                  FluxerButton.dangerPrimary(
                    onPressed: () {
                      FluxerHaptics.heavy();
                      onConfirm();
                      Navigator.of(sheetContext).pop(true);
                    },
                    label: confirmLabel,
                  )
                else
                  FluxerButton.primary(
                    onPressed: () {
                      onConfirm();
                      Navigator.of(sheetContext).pop(true);
                    },
                    label: confirmLabel,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
