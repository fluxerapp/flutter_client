import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:material_ui/material_ui.dart';

class UserProfileConfirmationSheet {
  UserProfileConfirmationSheet._();

  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String description,
    required String primaryLabel,
    required FluxerButtonVariant primaryVariant,
  }) async {
    final result = await FluxerBottomSheet.show<bool>(
      context,
      title: title,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        final colors = sheetContext.colors;
        final layout = sheetContext.layout;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                description,
                style: sheetContext.textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: layout.s4),
              _buildPrimaryButton(
                variant: primaryVariant,
                label: primaryLabel,
                onPressed: () =>
                    Navigator.of(sheetContext, rootNavigator: true).pop(true),
              ),
            ],
          ),
        );
      },
    );
    return result ?? false;
  }

  static Widget _buildPrimaryButton({
    required FluxerButtonVariant variant,
    required String label,
    required VoidCallback onPressed,
  }) {
    return switch (variant) {
      FluxerButtonVariant.primary => FluxerButton.primary(
        label: label,
        onPressed: onPressed,
      ),
      FluxerButtonVariant.secondary => FluxerButton.secondary(
        label: label,
        onPressed: onPressed,
      ),
      FluxerButtonVariant.dangerPrimary => FluxerButton.dangerPrimary(
        label: label,
        onPressed: onPressed,
      ),
      FluxerButtonVariant.dangerSecondary => FluxerButton.dangerSecondary(
        label: label,
        onPressed: onPressed,
      ),
      FluxerButtonVariant.inverted => FluxerButton.inverted(
        label: label,
        onPressed: onPressed,
      ),
      FluxerButtonVariant.invertedOutline => FluxerButton.invertedOutline(
        label: label,
        onPressed: onPressed,
      ),
      FluxerButtonVariant.ghost => FluxerButton.ghost(
        label: label,
        onPressed: onPressed,
      ),
    };
  }
}
