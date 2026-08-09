import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';

Attachment _attachment({
  String id = '1',
  String filename = 'file.txt',
  String url = 'https://cdn.example/file.txt',
  String? contentType,
  int? size,
  bool? expired,
  String? title,
}) {
  return Attachment(
    id: id,
    filename: filename,
    url: url,
    contentType: contentType,
    size: size,
    expired: expired,
    title: title,
  );
}

void main() {
  group('isTextualAttachment', () {
    test('rejects empty url and expired attachments', () {
      expect(
        isTextualAttachment(_attachment(url: '', filename: 'a.py')),
        isFalse,
      );
      expect(
        isTextualAttachment(_attachment(filename: 'a.py', expired: true)),
        isFalse,
      );
    });

    test('accepts textual MIME prefixes and exact types', () {
      expect(
        isTextualAttachment(
          _attachment(filename: 'a.bin', contentType: 'text/plain'),
        ),
        isTrue,
      );
      expect(
        isTextualAttachment(
          _attachment(filename: 'a.bin', contentType: 'application/json'),
        ),
        isTrue,
      );
      expect(
        isTextualAttachment(
          _attachment(filename: 'a.bin', contentType: 'application/x-sh'),
        ),
        isTrue,
      );
    });

    test('accepts known textual extensions', () {
      expect(isTextualAttachment(_attachment(filename: 'main.py')), isTrue);
      expect(isTextualAttachment(_attachment(filename: 'App.tsx')), isTrue);
      expect(isTextualAttachment(_attachment(filename: 'data.csv')), isTrue);
      expect(isTextualAttachment(_attachment(filename: 'photo.png')), isFalse);
    });

    test('rust extension is textual but rs is not unless MIME matches', () {
      expect(isTextualAttachment(_attachment(filename: 'lib.rust')), isTrue);
      expect(isTextualAttachment(_attachment(filename: 'lib.rs')), isFalse);
      expect(
        isTextualAttachment(
          _attachment(filename: 'lib.rs', contentType: 'text/x-rust'),
        ),
        isTrue,
      );
    });
  });

  group('shouldPreviewAttachment', () {
    test('rejects files over 128KB', () {
      expect(
        shouldPreviewAttachment(
          _attachment(filename: 'a.py', size: kTextPreviewMaxBytes + 1),
        ),
        isFalse,
      );
      expect(
        shouldPreviewAttachment(
          _attachment(filename: 'a.py', size: kTextPreviewMaxBytes),
        ),
        isTrue,
      );
    });
  });

  group('language inference', () {
    test('maps extension and MIME to language codes', () {
      expect(
        getLanguageFromAttachment(_attachment(filename: 'a.ts')),
        'typescript',
      );
      expect(
        getLanguageFromAttachment(_attachment(filename: 'a.py')),
        'python',
      );
      expect(
        getLanguageFromAttachment(
          _attachment(filename: 'a.bin', contentType: 'application/json'),
        ),
        'json',
      );
    });

    test('prefers filename over title for detection and display', () {
      final Attachment titledCsv = _attachment(
        filename: 'report.csv',
        title: 'Sales Q1',
        contentType: 'application/octet-stream',
      );
      expect(attachmentPreviewFileName(titledCsv), 'report.csv');
      expect(attachmentPreviewExtension(titledCsv), 'csv');
      expect(isTextualAttachment(titledCsv), isTrue);
      expect(getLanguageFromAttachment(titledCsv), 'plaintext');

      final Attachment titledPython = _attachment(
        filename: 'main.py',
        title: 'Helper script',
      );
      expect(inferLanguageCodeFromAttachment(titledPython), 'python');
      expect(
        getInitialSelectedLanguage(
          titledPython,
          inferLanguageCodeFromAttachment(titledPython),
        ),
        'python',
      );
    });

    test('getInitialSelectedLanguage falls back to plaintext', () {
      expect(
        getInitialSelectedLanguage(
          _attachment(filename: 'notes.txt'),
          inferLanguageCodeFromAttachment(_attachment(filename: 'notes.txt')),
        ),
        'plaintext',
      );
      expect(
        getInitialSelectedLanguage(
          _attachment(filename: 'main.py'),
          inferLanguageCodeFromAttachment(_attachment(filename: 'main.py')),
        ),
        'python',
      );
    });
  });

  group('line helpers', () {
    test('counts and truncates expanded preview lines', () {
      expect(getLineCount(null), 0);
      expect(getLineCount('a\nb\nc'), 3);
      expect(getVisibleLineCount(20, isExpanded: false), kDefaultPreviewLines);
      expect(getVisibleLineCount(20, isExpanded: true), 20);
      expect(
        getVisibleLineCount(200, isExpanded: true),
        kMaxExpandedPreviewLines,
      );

      final String long = List<String>.generate(
        105,
        (i) => 'line$i',
      ).join('\n');
      expect(remainingPreviewLines(long), 5);
      expect(
        truncatePreviewTextForInlineExpand(long).split('\n').length,
        kMaxExpandedPreviewLines,
      );
    });
  });
}
