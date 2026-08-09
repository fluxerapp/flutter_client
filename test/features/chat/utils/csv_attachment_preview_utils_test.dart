import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/csv_attachment_preview_utils.dart';

Attachment _attachment({
  String filename = 'data.csv',
  String? contentType,
  String? title,
}) {
  return Attachment(
    id: '1',
    filename: filename,
    url: 'https://cdn.example/data.csv',
    contentType: contentType,
    title: title,
  );
}

void main() {
  group('isCsvAttachment', () {
    test('detects CSV by extension or content type', () {
      expect(
        isCsvAttachment(_attachment(contentType: 'application/octet-stream')),
        isTrue,
      );
      expect(
        isCsvAttachment(
          _attachment(
            filename: 'data.txt',
            contentType: 'text/csv; charset=utf-8',
          ),
        ),
        isTrue,
      );
      expect(
        isCsvAttachment(
          _attachment(filename: 'data.txt', contentType: 'text/plain'),
        ),
        isFalse,
      );
      expect(
        isCsvAttachment(
          _attachment(
            filename: 'report.csv',
            title: 'Sales Q1',
            contentType: 'application/octet-stream',
          ),
        ),
        isTrue,
      );
    });
  });

  group('parseCsvRows', () {
    test('parses quoted values, escaped quotes, and CRLF rows', () {
      expect(
        parseCsvRows(
          'name,note\r\n"Ada, Lovelace","said ""hello"""\r\nGrace,Compiler',
        ),
        <List<String>>[
          <String>['name', 'note'],
          <String>['Ada, Lovelace', 'said "hello"'],
          <String>['Grace', 'Compiler'],
        ],
      );
    });

    test('preserves empty cells and ignores one trailing row break', () {
      expect(parseCsvRows('a,,c\n1,2,\n'), <List<String>>[
        <String>['a', '', 'c'],
        <String>['1', '2', ''],
      ]);
    });

    test('returns null for null and empty list for empty string', () {
      expect(parseCsvRows(null), isNull);
      expect(parseCsvRows(''), isEmpty);
    });
  });
}
