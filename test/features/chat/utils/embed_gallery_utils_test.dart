import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';

const String _postUrl = 'https://example.com/post/1';
const String _otherUrl = 'https://example.com/post/2';

EmbedMedia _media(String path) => EmbedMedia(
  url: 'https://cdn.example/$path',
  proxyUrl: 'https://cdn.example/$path',
  width: 400,
  height: 300,
);

void main() {
  group('normalizeEmbedUrl', () {
    test('strips trailing slash', () {
      expect(
        normalizeEmbedUrl('https://example.com/post/'),
        'https://example.com/post',
      );
    });

    test('returns null for invalid url', () {
      expect(normalizeEmbedUrl('not-a-url'), isNull);
      expect(normalizeEmbedUrl(null), isNull);
    });
  });

  group('collectGalleryImages', () {
    test('aggregates images from same-url embeds', () {
      final List<Embed> embedList = <Embed>[
        Embed(
          type: EmbedType.link,
          url: _postUrl,
          title: 'Post',
          thumbnail: _media('1.png'),
        ),
        Embed(type: EmbedType.rich, url: _postUrl, image: _media('2.png')),
        Embed(type: EmbedType.rich, url: _postUrl, image: _media('3.png')),
      ];
      final List<EmbedMedia> gallery = collectGalleryImages(
        embedIndex: 0,
        embedList: embedList,
      );
      expect(gallery, hasLength(3));
      expect(gallery[0].url, contains('1.png'));
      expect(gallery[1].url, contains('2.png'));
      expect(gallery[2].url, contains('3.png'));
    });

    test('deduplicates images by url', () {
      final EmbedMedia shared = _media('same.png');
      final List<Embed> embedList = <Embed>[
        Embed(type: EmbedType.link, url: _postUrl, thumbnail: shared),
        Embed(type: EmbedType.rich, url: _postUrl, image: shared),
      ];
      final List<EmbedMedia> gallery = collectGalleryImages(
        embedIndex: 0,
        embedList: embedList,
      );
      expect(gallery, hasLength(1));
    });

    test('caps gallery at ten images', () {
      final List<Embed> embedList = <Embed>[
        for (int i = 0; i < 12; i++)
          Embed(
            type: i == 0 ? EmbedType.link : EmbedType.rich,
            url: _postUrl,
            thumbnail: i == 0 ? _media('0.png') : null,
            image: i == 0 ? null : _media('$i.png'),
          ),
      ];
      final List<EmbedMedia> gallery = collectGalleryImages(
        embedIndex: 0,
        embedList: embedList,
      );
      expect(gallery, hasLength(kMaxEmbedGalleryMedia));
    });

    test('returns empty for unrelated embed index', () {
      final List<Embed> embedList = <Embed>[
        Embed(type: EmbedType.link, url: _postUrl, thumbnail: _media('1.png')),
        Embed(type: EmbedType.rich, url: _postUrl, image: _media('2.png')),
      ];
      expect(
        collectGalleryImages(embedIndex: 1, embedList: embedList),
        isEmpty,
      );
    });
  });

  group('isDuplicateEmbedAtIndex', () {
    test('marks later same-url embeds as duplicates', () {
      final List<Embed> embedList = <Embed>[
        Embed(type: EmbedType.link, url: _postUrl, thumbnail: _media('1.png')),
        Embed(type: EmbedType.rich, url: _postUrl, image: _media('2.png')),
        Embed(type: EmbedType.link, url: _otherUrl, thumbnail: _media('3.png')),
      ];
      final EmbedGalleryIndex galleryIndex = EmbedGalleryIndex(embedList);
      expect(galleryIndex.isDuplicateAt(0), isFalse);
      expect(galleryIndex.isDuplicateAt(1), isTrue);
      expect(galleryIndex.isDuplicateAt(2), isFalse);
      expect(isDuplicateEmbedAtIndex(1, embedList), isTrue);
    });

    test('treats trailing slash urls as same', () {
      final List<Embed> embedList = <Embed>[
        Embed(
          type: EmbedType.link,
          url: 'https://example.com/post/',
          thumbnail: _media('1.png'),
        ),
        Embed(
          type: EmbedType.rich,
          url: 'https://example.com/post',
          image: _media('2.png'),
        ),
      ];
      expect(isDuplicateEmbedAtIndex(1, embedList), isTrue);
    });
  });

  group('buildGalleryAttachments', () {
    test('builds synthetic attachments for grid rendering', () {
      final Embed embed = Embed(
        type: EmbedType.link,
        url: _postUrl,
        title: 'Gallery post',
      );
      final List<Attachment> attachments = buildGalleryAttachments(
        images: <EmbedMedia>[_media('a.png'), _media('b.png')],
        embed: embed,
        embedIndex: 0,
      );
      expect(attachments, hasLength(2));
      expect(attachments.first.id, '0-gallery-0');
      expect(attachments.first.filename, 'a.png');
      expect(attachments.first.title, 'Gallery post');
      expect(attachments.first.url, contains('a.png'));
    });
  });

  group('shouldShowEmbedGallery', () {
    test('shows gallery for multiple images', () {
      expect(
        shouldShowEmbedGallery(
          galleryImages: <EmbedMedia>[_media('1.png'), _media('2.png')],
          hasAnyMedia: true,
        ),
        isTrue,
      );
    });

    test('shows gallery for orphan gallery images without local media', () {
      expect(
        shouldShowEmbedGallery(
          galleryImages: <EmbedMedia>[_media('1.png')],
          hasAnyMedia: false,
        ),
        isTrue,
      );
    });

    test('hides gallery for single image when embed already has media', () {
      expect(
        shouldShowEmbedGallery(
          galleryImages: <EmbedMedia>[_media('1.png')],
          hasAnyMedia: true,
        ),
        isFalse,
      );
    });
  });
}
