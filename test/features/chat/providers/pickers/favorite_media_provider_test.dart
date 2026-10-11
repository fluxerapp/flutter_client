import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';

void main() {
  test('filterFavoriteMemes filters by media type', () {
    final memes = [
      _meme(id: '1'),
      _meme(id: '2', contentType: 'video/mp4'),
      _meme(id: '3', contentType: 'audio/mpeg'),
      _meme(id: '4', contentType: 'video/mp4', isGifv: true),
    ];

    expect(
      filterFavoriteMemes(
        memes,
        query: '',
        filter: FavoriteMemeMediaFilter.images,
      ).map((meme) => meme.id),
      ['1'],
    );
    expect(
      filterFavoriteMemes(
        memes,
        query: '',
        filter: FavoriteMemeMediaFilter.videos,
      ).map((meme) => meme.id),
      ['2'],
    );
    expect(
      filterFavoriteMemes(
        memes,
        query: '',
        filter: FavoriteMemeMediaFilter.audio,
      ).map((meme) => meme.id),
      ['3'],
    );
    expect(
      filterFavoriteMemes(
        memes,
        query: '',
        filter: FavoriteMemeMediaFilter.gifs,
      ).map((meme) => meme.id),
      ['4'],
    );
  });

  test('filterFavoriteMemes searches name alt text filename and tags', () {
    final memes = [
      _meme(id: '1', name: 'Party Parrot', tags: ['dance']),
      _meme(id: '2', altText: 'A sleepy cat'),
      _meme(id: '3', filename: 'wave.png'),
    ];

    expect(
      filterFavoriteMemes(
        memes,
        query: 'party',
        filter: FavoriteMemeMediaFilter.all,
      ).map((meme) => meme.id),
      ['1'],
    );
    expect(
      filterFavoriteMemes(
        memes,
        query: 'sleepy',
        filter: FavoriteMemeMediaFilter.all,
      ).map((meme) => meme.id),
      ['2'],
    );
    expect(
      filterFavoriteMemes(
        memes,
        query: 'wave',
        filter: FavoriteMemeMediaFilter.all,
      ).map((meme) => meme.id),
      ['3'],
    );
    expect(
      filterFavoriteMemes(
        memes,
        query: 'dance',
        filter: FavoriteMemeMediaFilter.all,
      ).map((meme) => meme.id),
      ['1'],
    );
  });

  test('sortFavoriteMemesByNewest sorts newest snowflake first', () {
    final memes = [_meme(id: '100'), _meme(id: '300'), _meme(id: '200')];

    expect(sortFavoriteMemesByNewest(memes).map((meme) => meme.id), [
      '300',
      '200',
      '100',
    ]);
  });

  test('sortFavoriteMemesForSearchFrecency orders by score like web', () {
    final memes = [_meme(id: '100'), _meme(id: '300'), _meme(id: '200')];

    expect(
      sortFavoriteMemesForSearchFrecency(memes, const {
        '200': 2.0,
        '300': 0.5,
      }).map((meme) => meme.id),
      ['200', '300', '100'],
    );
    expect(
      sortFavoriteMemesForSearchFrecency(
        memes,
        const {},
      ).map((meme) => meme.id),
      ['100', '300', '200'],
    );
  });
}

FavoriteMeme _meme({
  required String id,
  String name = 'Meme',
  String? altText,
  List<String> tags = const [],
  String filename = 'meme.png',
  String contentType = 'image/png',
  bool isGifv = false,
}) => FavoriteMeme(
  id: id,
  userId: 'user-1',
  name: name,
  altText: altText,
  tags: tags,
  attachmentId: 'attachment-$id',
  filename: filename,
  contentType: contentType,
  contentHash: null,
  size: 1,
  width: 100,
  height: 100,
  duration: null,
  isGifv: isGifv,
  url: 'https://cdn.example/$filename',
  klipySlug: null,
  tenorSlugId: null,
);
