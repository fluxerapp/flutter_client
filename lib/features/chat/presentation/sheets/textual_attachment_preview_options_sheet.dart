import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum TextualAttachmentPreviewOption { download, wrapText }

Future<TextualAttachmentPreviewOption?>
showTextualAttachmentPreviewOptionsSheet({
  required BuildContext context,
  required bool wrapText,
  required bool showWrapText,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.show<TextualAttachmentPreviewOption>(
    context,
    title: l10n.chatTextualPreviewMoreOptions,
    variant: FluxerBottomSheetVariant.menu,
    builder: (BuildContext sheetContext, VoidCallback close) {
      return FluxerBottomSheetContent(
        scrollable: false,
        child: FluxerMenuGroup(
          children: [
            FluxerBottomSheetMenuItem(
              label: l10n.chatAttachmentDownload,
              icon: PhosphorIconsBold.downloadSimple,
              onTap: () => Navigator.of(
                sheetContext,
              ).pop(TextualAttachmentPreviewOption.download),
            ),
            if (showWrapText)
              FluxerBottomSheetMenuItem(
                label: l10n.chatTextualPreviewWrapText,
                icon: PhosphorIconsBold.textAa,
                isSelected: wrapText,
                onTap: () => Navigator.of(
                  sheetContext,
                ).pop(TextualAttachmentPreviewOption.wrapText),
              ),
          ],
        ),
      );
    },
  );
}
