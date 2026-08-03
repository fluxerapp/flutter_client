import 'package:flutter/material.dart';
import 'package:fluxer_app/features/settings/utils/expression_file_picker.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ExpressionUploadSource { gallery, files }

Future<List<ExpressionPickResult>> pickGuildExpressionEmojis(
  BuildContext context,
) async {
  if (!isMobileLayout(context)) {
    return ExpressionFilePicker.pickEmojis();
  }
  final ExpressionUploadSource? source = await _showUploadSourceSheet(context);
  if (source == null) {
    return const <ExpressionPickResult>[];
  }
  return switch (source) {
    ExpressionUploadSource.gallery =>
      ExpressionFilePicker.pickEmojisFromGallery(),
    ExpressionUploadSource.files => ExpressionFilePicker.pickEmojisFromFiles(),
  };
}

Future<List<ExpressionPickResult>> pickGuildExpressionSticker(
  BuildContext context,
) async {
  if (!isMobileLayout(context)) {
    return ExpressionFilePicker.pickSticker();
  }
  final ExpressionUploadSource? source = await _showUploadSourceSheet(context);
  if (source == null) {
    return const <ExpressionPickResult>[];
  }
  return switch (source) {
    ExpressionUploadSource.gallery =>
      ExpressionFilePicker.pickStickerFromGallery(),
    ExpressionUploadSource.files => ExpressionFilePicker.pickStickerFromFiles(),
  };
}

Future<ExpressionUploadSource?> _showUploadSourceSheet(BuildContext context) {
  return FluxerBottomSheet.show<ExpressionUploadSource>(
    context,
    variant: FluxerBottomSheetVariant.menu,
    builder: (BuildContext sheetContext, _) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(sheetContext);
      return FluxerBottomSheetContent(
        scrollable: false,
        child: FluxerBottomSheetGroupColumn(
          children: <Widget>[
            FluxerMenuGroup(
              children: <Widget>[
                FluxerBottomSheetMenuItem(
                  icon: PhosphorIconsFill.image,
                  label: l10n.chatAttachmentSourceGallery,
                  onTap: () => Navigator.of(
                    sheetContext,
                  ).pop(ExpressionUploadSource.gallery),
                ),
                FluxerBottomSheetMenuItem(
                  icon: PhosphorIconsFill.folder,
                  label: l10n.chatAttachmentSourceBrowse,
                  onTap: () => Navigator.of(
                    sheetContext,
                  ).pop(ExpressionUploadSource.files),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
