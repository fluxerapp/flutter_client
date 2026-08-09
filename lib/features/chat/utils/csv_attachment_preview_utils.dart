import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';

typedef CsvRows = List<List<String>>;

bool isCsvAttachment(Attachment attachment) {
  final String? extension = attachmentPreviewExtension(attachment);
  final String normalizedType = normalizeAttachmentContentType(
    attachment.contentType,
  );
  return extension == 'csv' ||
      normalizedType == 'text/csv' ||
      normalizedType == 'application/csv';
}

CsvRows? parseCsvRows(String? content) {
  if (content == null) {
    return null;
  }
  if (content.isEmpty) {
    return <List<String>>[];
  }

  final CsvRows rows = <List<String>>[];
  List<String> row = <String>[];
  final StringBuffer cellBuffer = StringBuffer();
  bool inQuotes = false;

  void pushCell() {
    row.add(cellBuffer.toString());
    cellBuffer.clear();
  }

  void pushRow() {
    pushCell();
    rows.add(row);
    row = <String>[];
  }

  for (int index = 0; index < content.length; index++) {
    final String character = content[index];
    if (character == '"') {
      if (inQuotes && index + 1 < content.length && content[index + 1] == '"') {
        cellBuffer.write('"');
        index++;
        continue;
      }
      inQuotes = !inQuotes;
      continue;
    }
    if (!inQuotes && character == ',') {
      pushCell();
      continue;
    }
    if (!inQuotes && (character == '\n' || character == '\r')) {
      pushRow();
      if (character == '\r' &&
          index + 1 < content.length &&
          content[index + 1] == '\n') {
        index++;
      }
      continue;
    }
    cellBuffer.write(character);
  }

  if (cellBuffer.isNotEmpty || row.isNotEmpty) {
    pushRow();
  }
  return rows;
}

int csvColumnCount(CsvRows rows) {
  if (rows.isEmpty) {
    return 1;
  }
  int max = 1;
  for (final List<String> row in rows) {
    if (row.length > max) {
      max = row.length;
    }
  }
  return max;
}

CsvRows truncateCsvRowsForInlineExpand(CsvRows rows) {
  if (rows.length <= kMaxExpandedPreviewLines) {
    return rows;
  }
  return rows.take(kMaxExpandedPreviewLines).toList(growable: false);
}

int remainingCsvRows(CsvRows rows) {
  if (rows.length <= kMaxExpandedPreviewLines) {
    return 0;
  }
  return rows.length - kMaxExpandedPreviewLines;
}
