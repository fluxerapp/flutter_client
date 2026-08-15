import 'dart:ui';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/csv_attachment_table_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_code_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_footer.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_fullscreen.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:material_ui/material_ui.dart';

const double _kPreviewModalMaxWidth = 1278;
const double _kPreviewModalMaxHeight = 1200;
const double _kPreviewModalInset = 16;

Future<void> showTextualAttachmentPreviewModal({
  required BuildContext context,
  required Attachment attachment,
  required TextualAttachmentFullscreenListenable snapshot,
  required VoidCallback onSelectLanguage,
  required VoidCallback onMoreOptions,
}) {
  return showDialog<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext dialogContext) {
      void close() => Navigator.of(dialogContext).pop();
      final MediaQueryData mediaQuery = MediaQuery.of(dialogContext);
      final colors = dialogContext.colors;
      final dialogTheme = DialogTheme.of(dialogContext);
      final double width = (mediaQuery.size.width - (_kPreviewModalInset * 2))
          .clamp(280.0, _kPreviewModalMaxWidth);
      final double height =
          (mediaQuery.size.height -
                  mediaQuery.viewPadding.top -
                  mediaQuery.viewPadding.bottom -
                  (_kPreviewModalInset * 2))
              .clamp(320.0, _kPreviewModalMaxHeight);

      return wrapFluxerOverlayBackHandler(
        canDismiss: true,
        onBack: null,
        onDismiss: close,
        child: Stack(
          children: [
            Positioned.fill(
              child: FluxerGestureDetector(
                onTap: close,
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: 0.35),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: const SizedBox.expand(),
                  ),
                ),
              ),
            ),
            Center(
              child: Material(
                color:
                    dialogTheme.backgroundColor ?? colors.backgroundSecondary,
                surfaceTintColor: Colors.transparent,
                elevation: dialogTheme.elevation ?? 16,
                shadowColor: Colors.black.withValues(alpha: 0.25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: colors.backgroundHeaderSecondary),
                ),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: width,
                  height: height,
                  child:
                      ValueListenableBuilder<
                        TextualAttachmentFullscreenSnapshot
                      >(
                        valueListenable: snapshot,
                        builder:
                            (
                              BuildContext context,
                              TextualAttachmentFullscreenSnapshot view,
                              _,
                            ) {
                              final Widget panel = view.isCsvPreview
                                  ? CsvAttachmentTablePanel(
                                      status: view.status,
                                      visibleLineCount: 40,
                                      rows: view.csvRows,
                                      previewError: view.previewError,
                                      copyTextContent: view.textContent,
                                      fillAvailableSpace: true,
                                    )
                                  : TextualAttachmentCodePanel(
                                      status: view.status,
                                      visibleLineCount: 40,
                                      wrapText: view.wrapText,
                                      textContent: view.textContent,
                                      languageCode: view.selectedLanguage,
                                      previewError: view.previewError,
                                      copyTextContent: view.textContent,
                                      fillAvailableSpace: true,
                                    );
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(child: panel),
                                  TextualAttachmentPreviewFooter(
                                    attachment: attachment,
                                    canExpand: false,
                                    isExpanded: true,
                                    itemCount: view.isCsvPreview
                                        ? (view.csvRows?.length ?? 0)
                                        : view.lineCount,
                                    onToggleExpanded: () {},
                                    onSelectLanguage: onSelectLanguage,
                                    onMoreOptions: onMoreOptions,
                                    countKind: view.isCsvPreview
                                        ? TextualPreviewCountKind.row
                                        : TextualPreviewCountKind.line,
                                    showLanguageButton: !view.isCsvPreview,
                                    showFullscreenButton: false,
                                    constrainWidth: false,
                                  ),
                                ],
                              );
                            },
                      ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
