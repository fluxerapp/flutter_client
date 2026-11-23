import 'package:fluxer_app/features/chat/utils/messages/url_sanitization_utils.dart';
import 'package:test/test.dart';

void main() {
  group('sanitizeUrlsInContent', () {
    test('strips is from a youtu.be link', () {
      expect(
        sanitizeUrlsInContent('https://youtu.be/dQw4w9WgXcQ?is=12345'),
        'https://youtu.be/dQw4w9WgXcQ',
      );
    });

    test('strips is from a youtube.com watch link while keeping v', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ&is=12345',
        ),
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      );
    });

    test('strips si from a youtube-nocookie.com link', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ?si=abc123',
        ),
        'https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ',
      );
    });

    test('keeps is on a non-YouTube host', () {
      expect(
        sanitizeUrlsInContent('https://example.com/page?is=12345'),
        'https://example.com/page?is=12345',
      );
    });

    test('strips feature from a youtube.com link', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ&feature=shared',
        ),
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      );
    });

    test('strips app from a youtube.com link', () {
      expect(
        sanitizeUrlsInContent(
          'https://m.youtube.com/watch?v=dQw4w9WgXcQ&app=desktop',
        ),
        'https://m.youtube.com/watch?v=dQw4w9WgXcQ',
      );
    });

    test('strips src from a youtube.com link', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ&src=email',
        ),
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      );
    });

    test('strips lId from a youtube.com link', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ&lId=123',
        ),
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      );
    });

    test('strips cId from a youtube.com link', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/watch?v=dQw4w9WgXcQ&cId=456',
        ),
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      );
    });

    test('strips embeds_referring_euri from a youtube.com link', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/embed/dQw4w9WgXcQ?embeds_referring_euri=https%3A%2F%2Fexample.com%2F',
        ),
        'https://www.youtube.com/embed/dQw4w9WgXcQ',
      );
    });

    test('unwraps a youtube.com redirect link to its encoded target', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?event=video_description&redir_token=abc&q=https%3A%2F%2Fexample.com%2Fpage',
        ),
        'https://example.com/page',
      );
    });

    test('keeps a youtube.com link whose q is not a URL', () {
      expect(
        sanitizeUrlsInContent('https://www.youtube.com/results?q=cats'),
        'https://www.youtube.com/results?q=cats',
      );
    });

    test('strips tracking params from the unwrapped target', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?q=https%3A%2F%2Fexample.com%2Fpage%3Futm_source%3Dyt%26id%3D7',
        ),
        'https://example.com/page?id=7',
      );
    });

    test('keeps a q URL param on a non-YouTube host', () {
      expect(
        sanitizeUrlsInContent(
          'https://example.com/redirect?q=https%3A%2F%2Fother.com%2F',
        ),
        'https://example.com/redirect?q=https%3A%2F%2Fother.com%2F',
      );
    });

    test('keeps a youtube.com redirect whose target is not http', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?q=javascript%3Aalert%281%29',
        ),
        'https://www.youtube.com/redirect?q=javascript%3Aalert%281%29',
      );
    });

    test('unwraps a doubly encoded redirect target', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?q=https%253A%252F%252Fexample.com%252F',
        ),
        'https://example.com/',
      );
    });

    test('carries the redirect link fragment over to the target', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?q=https%3A%2F%2Fexample.com%2Fpage#t=10',
        ),
        'https://example.com/page#t=10',
      );
    });

    test('matches the redirect param name case-insensitively', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?Q=https%3A%2F%2Fexample.com%2F',
        ),
        'https://example.com/',
      );
    });

    test('uses only the first q param of a redirect link', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?q=cats&q=https%3A%2F%2Fexample.com%2F',
        ),
        'https://www.youtube.com/redirect?q=cats&q=https%3A%2F%2Fexample.com%2F',
      );
    });

    test('unwraps a redirect nested inside another redirect', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?q=https%3A%2F%2Fwww.youtube.com%2Fredirect%3Fq%3Dhttps%253A%252F%252Fexample.com%252F',
        ),
        'https://example.com/',
      );
    });

    test('stops unwrapping after two nested redirects', () {
      expect(
        sanitizeUrlsInContent(
          'https://www.youtube.com/redirect?q=https%3A%2F%2Fwww.youtube.com%2Fredirect%3Fq%3Dhttps%253A%252F%252Fwww.youtube.com%252Fredirect%253Fq%253Dhttps%25253A%25252F%25252Fexample.com%25252F',
        ),
        'https://www.youtube.com/redirect?q=https%3A%2F%2Fexample.com%2F',
      );
    });

    test('keeps trailing punctuation after an unwrapped redirect link', () {
      expect(
        sanitizeUrlsInContent(
          'See https://www.youtube.com/redirect?q=https%3A%2F%2Fexample.com%2F.',
        ),
        'See https://example.com/.',
      );
    });

    test('keeps a link whose param name has a malformed percent escape', () {
      expect(
        sanitizeUrlsInContent('https://example.com/?a%zz=1'),
        'https://example.com/?a%zz=1',
      );
    });
  });
}
