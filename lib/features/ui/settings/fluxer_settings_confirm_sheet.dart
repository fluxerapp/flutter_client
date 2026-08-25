import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

Future<bool?> showFluxerSettingsConfirmSheet(
  BuildContext context, {
  required String title,
  required String description,
  required String confirmLabel,
  bool isDanger = false,
}) {
  return FluxerBottomSheet.show<bool>(
    context,
    useRootNavigator: true,
    title: title,
    builder: (sheetContext, close) {
      final layout = sheetContext.layout;
      final colors = sheetContext.colors;

      return Padding(
        padding: settingsSheetScrollPadding(sheetContext),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              description,
              style: sheetContext.textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
                height: 1.4,
              ),
            ),
            SizedBox(height: layout.s5),
            if (isDanger)
              FluxerButton.dangerPrimary(
                onPressed: () => Navigator.of(sheetContext).pop(true),
                label: confirmLabel,
              )
            else
              FluxerButton.primary(
                onPressed: () => Navigator.of(sheetContext).pop(true),
                label: confirmLabel,
              ),
          ],
        ),
      );
    },
  );
}
