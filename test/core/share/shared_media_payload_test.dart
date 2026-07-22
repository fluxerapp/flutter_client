import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/share/shared_media_payload.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

void main() {
  group('SharedMediaPayload', () {
    test('toXFiles returns only image and video files', () {
      final SharedMediaPayload payload = SharedMediaPayload(
        files: <SharedMediaFile>[
          SharedMediaFile(path: '/tmp/photo.jpg', type: SharedMediaType.image),
          SharedMediaFile(path: '/tmp/movie.mp4', type: SharedMediaType.video),
          SharedMediaFile(path: '/tmp/note.txt', type: SharedMediaType.text),
        ],
      );

      final List<XFile> result = payload.toXFiles();

      expect(result.length, 2);
      expect(result.map((XFile f) => f.path).toList(), <String>[
        '/tmp/photo.jpg',
        '/tmp/movie.mp4',
      ]);
    });

    test('hasMedia is true when at least one image or video is present', () {
      final SharedMediaPayload payload = SharedMediaPayload(
        files: <SharedMediaFile>[
          SharedMediaFile(path: '/tmp/photo.jpg', type: SharedMediaType.image),
        ],
      );

      expect(payload.hasMedia, isTrue);
    });

    test('hasMedia is false when only unsupported types are present', () {
      final SharedMediaPayload payload = SharedMediaPayload(
        files: <SharedMediaFile>[
          SharedMediaFile(path: '/tmp/note.txt', type: SharedMediaType.text),
          SharedMediaFile(path: '/tmp/link.url', type: SharedMediaType.url),
        ],
      );

      expect(payload.hasMedia, isFalse);
    });

    test('sharedText combines text and url items', () {
      final SharedMediaPayload payload = SharedMediaPayload(
        files: <SharedMediaFile>[
          SharedMediaFile(path: 'Hello', type: SharedMediaType.text),
          SharedMediaFile(path: 'https://fluxer.gg', type: SharedMediaType.url),
        ],
      );

      expect(payload.sharedText, 'Hello\nhttps://fluxer.gg');
      expect(payload.hasContent, isTrue);
    });

    test('initialMessage prefers caption over shared text', () {
      final SharedMediaPayload payload = SharedMediaPayload(
        files: <SharedMediaFile>[
          SharedMediaFile(path: 'shared body', type: SharedMediaType.text),
        ],
        message: 'caption',
      );

      expect(payload.initialMessage, 'caption');
    });

    test('hasContent is true for text-only shares', () {
      final SharedMediaPayload payload = SharedMediaPayload(
        files: <SharedMediaFile>[
          SharedMediaFile(path: 'Hello world', type: SharedMediaType.text),
        ],
      );

      expect(payload.hasContent, isTrue);
      expect(payload.initialMessage, 'Hello world');
    });

    test('exposes an optional message passed to the payload', () {
      final SharedMediaPayload payload = SharedMediaPayload(
        files: <SharedMediaFile>[
          SharedMediaFile(
            path: '/tmp/photo.jpg',
            type: SharedMediaType.image,
            message: 'hello',
          ),
        ],
        message: 'hello',
      );

      expect(payload.message, 'hello');
    });
  });
}
