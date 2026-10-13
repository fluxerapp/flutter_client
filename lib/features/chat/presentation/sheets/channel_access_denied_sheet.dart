import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showChannelAccessDeniedSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.show<void>(
    context,
    title: l10n.channelAccessDeniedTitle,
    builder: (sheetContext, close) {
      final layout = sheetContext.layout;
      final textStyles = sheetContext.textStyles;
      final colors = sheetContext.colors;
      return Padding(
        padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, 0),
        child: Text(
          l10n.channelAccessDeniedDescription,
          style: textStyles.bodySmall.copyWith(
            color: colors.textSecondary,
            height: 1.4,
          ),
        ),
      );
    },
  );
}
