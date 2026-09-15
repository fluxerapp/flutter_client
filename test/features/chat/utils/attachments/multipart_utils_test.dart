import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/multipart_utils.dart';

void main() {
  group('computeMultipartPartByteRange', () {
    test('computes full middle part', () {
      final ({int startInclusive, int endExclusive}) actual =
          computeMultipartPartByteRange(
            partNumberOneBased: 2,
            partSizeBytes: 100,
            totalFileBytes: 500,
          );
      expect(actual.startInclusive, 100);
      expect(actual.endExclusive, 200);
    });

    test('clips last part to file size', () {
      final ({int startInclusive, int endExclusive}) actual =
          computeMultipartPartByteRange(
            partNumberOneBased: 3,
            partSizeBytes: 100,
            totalFileBytes: 250,
          );
      expect(actual.startInclusive, 200);
      expect(actual.endExclusive, 250);
    });

    test('first part when file is smaller than one part', () {
      final ({int startInclusive, int endExclusive}) actual =
          computeMultipartPartByteRange(
            partNumberOneBased: 1,
            partSizeBytes: 1024,
            totalFileBytes: 10,
          );
      expect(actual.startInclusive, 0);
      expect(actual.endExclusive, 10);
    });
  });

  group('isMultipartMessageRequestTooLarge', () {
    test('returns false when file list is empty', () {
      final bool actual = isMultipartMessageRequestTooLarge(
        payload: const <String, dynamic>{'content': 'x'},
        files: const <({String name, int size, String contentType})>[],
        maxRequestBytes: kNonPremiumMaxAttachmentBytes,
      );
      expect(actual, false);
    });

    test('returns true when combined size estimate exceeds cap', () {
      final List<({String name, int size, String contentType})> inputFiles =
          <({String name, int size, String contentType})>[
            (
              name: 'a.bin',
              size: 10 * 1024 * 1024,
              contentType: 'application/octet-stream',
            ),
            (
              name: 'b.bin',
              size: 10 * 1024 * 1024,
              contentType: 'application/octet-stream',
            ),
            (
              name: 'c.bin',
              size: 10 * 1024 * 1024,
              contentType: 'application/octet-stream',
            ),
          ];
      final bool actual = isMultipartMessageRequestTooLarge(
        payload: const <String, dynamic>{'content': 'hello'},
        files: inputFiles,
        maxRequestBytes: kNonPremiumMaxAttachmentBytes,
      );
      expect(actual, true);
    });
  });
}
