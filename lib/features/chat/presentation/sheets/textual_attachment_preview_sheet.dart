import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/csv_attachment_table_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_code_panel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_footer.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_fullscreen.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:material_ui/material_ui.dart';

Future<void> showTextualAttachmentPreviewSheet({
  required BuildContext context,
  required Attachment attachment,
  required TextualAttachmentFullscreenListenable snapshot,
  required VoidCallback onSelectLanguage,
  required VoidCallback onMoreOptions,
}) {
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: attachmentPreviewFileName(attachment),
    initialChildSize: 0.85,
    minChildSize: 0.45,
    maxChildSize: 0.92,
    builder: (BuildContext sheetContext, ScrollController scrollController, _) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: FluxerBottomSheet.scrollBottomPaddingOf(sheetContext),
        ),
        child: ValueListenableBuilder<TextualAttachmentFullscreenSnapshot>(
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
                        scrollController: scrollController,
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
                        scrollController: scrollController,
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
      );
    },
  );
}
