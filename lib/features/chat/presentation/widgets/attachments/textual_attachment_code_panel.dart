import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_code_body.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_surface.dart';
import 'package:fluxer_app/features/chat/utils/attachments/textual_attachment_content.dart';
import 'package:fluxer_app/material_ui.dart';

class TextualAttachmentCodePanel extends StatelessWidget {
  const TextualAttachmentCodePanel({
    required this.status,
    required this.visibleLineCount,
    required this.wrapText,
    this.textContent,
    this.languageCode = 'plaintext',
    this.previewError,
    this.copyTextContent,
    this.fillAvailableSpace = false,
    this.scrollController,
    this.remainingSuffix,
    super.key,
  });

  final TextualAttachmentPreviewStatus status;
  final int visibleLineCount;
  final bool wrapText;
  final String? textContent;
  final String languageCode;
  final TextualAttachmentPreviewError? previewError;
  final String? copyTextContent;
  final bool fillAvailableSpace;
  final ScrollController? scrollController;
  final String? remainingSuffix;

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (status == TextualAttachmentPreviewStatus.error) {
      body = TextualAttachmentPreviewErrorRow(previewError: previewError);
    } else if (textContent == null ||
        status == TextualAttachmentPreviewStatus.loading ||
        status == TextualAttachmentPreviewStatus.idle) {
      body = const TextualAttachmentPreviewLoading();
    } else {
      body = TextualAttachmentCodeBody(
        content: textContent!,
        languageCode: languageCode,
        wrapText: wrapText,
        remainingSuffix: remainingSuffix,
      );
    }

    return RepaintBoundary(
      child: TextualAttachmentPreviewSurface(
        status: status,
        visibleLineCount: visibleLineCount,
        copyTextContent: copyTextContent,
        fillAvailableSpace: fillAvailableSpace,
        scrollController: scrollController,
        child: body,
      ),
    );
  }
}
