import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/utils/csv_attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_content.dart';

class TextualAttachmentFullscreenSnapshot {
  const TextualAttachmentFullscreenSnapshot({
    required this.status,
    required this.selectedLanguage,
    required this.wrapText,
    required this.isCsvPreview,
    required this.lineCount,
    this.textContent,
    this.csvRows,
    this.previewError,
  });

  final TextualAttachmentPreviewStatus status;
  final String selectedLanguage;
  final bool wrapText;
  final bool isCsvPreview;
  final int lineCount;
  final String? textContent;
  final CsvRows? csvRows;
  final TextualAttachmentPreviewError? previewError;
}

typedef TextualAttachmentFullscreenListenable =
    ValueListenable<TextualAttachmentFullscreenSnapshot>;
