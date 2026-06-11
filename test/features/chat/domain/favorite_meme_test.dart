import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_dart/export.dart' as sdk;

void main() {
  test('FavoriteMeme decodes persisted JSON and exposes media metadata', () {
    final meme = FavoriteMeme.fromRow(
      db.FavoriteMemesTableData(id: '123', data: jsonEncode(_memeJson())),
    );

    expect(meme.id, '123');
    expect(meme.name, 'Wave Cat');
    expect(meme.tags, ['cat', 'wave']);
    expect(meme.mediaType, FavoriteMemeMediaType.gif);
    expect(meme.isVideoLike, isTrue);
    expect(meme.shareUrl, 'https://klipy.com/gifs/wave-cat');
  });

  test('FavoriteMeme falls back to CDN URL for regular saved media', () {
    final meme = FavoriteMeme.fromJson({
      ..._memeJson(),
      'id': '456',
      'content_type': 'image/png',
      'is_gifv': false,
      'klipy_slug': null,
      'tenor_slug_id': null,
      'url': 'https://cdn.example/image.png',
    });

    expect(meme.mediaType, FavoriteMemeMediaType.image);
    expect(meme.isVideoLike, isFalse);
    expect(meme.shareUrl, 'https://cdn.example/image.png');
  });

  test('FavoriteMeme builds Tenor share URLs from slug ids', () {
    final meme = FavoriteMeme.fromJson({
      ..._memeJson(),
      'klipy_slug': null,
      'tenor_slug_id': 'view/funny-cat-123',
    });

    expect(meme.shareUrl, 'https://tenor.com/view/funny-cat-123');
  });

  test('FavoriteMeme maps generic Tenor GIF source fields from SDK', () {
    const response = sdk.FavoriteMemeResponse(
      id: '1',
      userId: 'user-1',
      name: 'Excited ah',
      tags: [],
      attachmentId: 'attachment-1',
      filename: 'excited.webp',
      contentType: 'image/webp',
      size: 10,
      url: 'https://cdn.example/excited.webp',
      gifSlug: 'view/excited-ah-gif-1',
      gifProvider: 'tenor',
    );

    final meme = FavoriteMeme.fromSdk(response);

    expect(meme.klipySlug, isNull);
    expect(meme.tenorSlugId, 'view/excited-ah-gif-1');
    expect(meme.shareUrl, 'https://tenor.com/view/excited-ah-gif-1');
  });

  test('FavoriteMeme maps generic KLIPY GIF source fields from JSON', () {
    final meme = FavoriteMeme.fromJson({
      ..._memeJson(),
      'klipy_slug': null,
      'tenor_slug_id': null,
      'gif_slug': 'party-parrot',
      'gif_provider': 'klipy',
    });

    expect(meme.klipySlug, 'party-parrot');
    expect(meme.tenorSlugId, isNull);
    expect(meme.shareUrl, 'https://klipy.com/gifs/party-parrot');
  });

  test('FavoriteMeme keeps gifv WebP media on the image render path', () {
    final meme = FavoriteMeme.fromJson({
      ..._memeJson(),
      'filename': 'wave-cat.webp',
      'content_type': 'image/webp',
      'is_gifv': true,
      'url': 'https://cdn.example/wave-cat.webp',
    });

    expect(meme.mediaType, FavoriteMemeMediaType.gif);
    expect(meme.isVideoLike, isFalse);
  });

  test('FavoriteMeme keeps image GIF media on the image render path', () {
    final meme = FavoriteMeme.fromJson({
      ..._memeJson(),
      'filename': 'wave-cat.gif',
      'content_type': 'image/gif',
      'is_gifv': true,
      'url': 'https://cdn.example/wave-cat.gif',
    });

    expect(meme.mediaType, FavoriteMemeMediaType.gif);
    expect(meme.isVideoLike, isFalse);
  });

  test('FavoriteMeme round-trips the provider media map from JSON', () {
    final meme = FavoriteMeme.fromJson({
      ..._memeJson(),
      'media': {
        'webp': {
          'src': 'https://media.example/wave-cat.webp',
          'proxy_src': 'https://cdn.example/wave-cat.webp',
          'width': 320,
          'height': 180,
        },
      },
    });

    expect(meme.media?['webp']?.proxySrc, 'https://cdn.example/wave-cat.webp');

    final restored = FavoriteMeme.fromJson(meme.toJson());
    expect(restored.media?['webp']?.src, 'https://media.example/wave-cat.webp');
  });

  test('FavoriteMeme.fromSdk carries the provider media map', () {
    final favorite = FavoriteMeme.fromSdk(
      const sdk.FavoriteMemeResponse(
        id: 'm1',
        userId: 'u1',
        name: 'cat',
        tags: [],
        attachmentId: 'a1',
        filename: 'cat.webp',
        contentType: 'image/webp',
        size: 10,
        url: 'https://cdn.example/cat.webp',
        isGifv: true,
        media: {
          'webp': sdk.GifMediaFormat(
            src: 'https://media.example/cat.webp',
            proxySrc: 'https://cdn.example/cat.webp',
            width: 1,
            height: 1,
          ),
        },
      ),
    );

    expect(favorite.media?['webp']?.proxySrc, 'https://cdn.example/cat.webp');
  });
}

Map<String, Object?> _memeJson() => {
  'id': '123',
  'user_id': 'user-1',
  'name': 'Wave Cat',
  'alt_text': 'A waving cat',
  'tags': ['cat', 'wave'],
  'attachment_id': 'attachment-1',
  'filename': 'wave-cat.mp4',
  'content_type': 'video/mp4',
  'content_hash': 'hash',
  'size': 1024,
  'width': 320,
  'height': 180,
  'duration': 1.2,
  'is_gifv': true,
  'url': 'https://cdn.example/wave-cat.mp4',
  'klipy_slug': 'wave-cat',
  'tenor_slug_id': null,
};
