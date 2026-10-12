import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';

const Set<String> _signatureFieldNames = {'ex', 'is', 'hm', 'uc'};

String _formDecodeName(String name) {
  try {
    return Uri.decodeComponent(name.replaceAll('+', ' '));
  } on FormatException {
    return name;
  }
}

String _fieldName(String field) {
  final int separator = field.indexOf('=');
  return _formDecodeName(separator < 0 ? field : field.substring(0, separator));
}

String stripAttachmentSignature(String url) {
  final int fragmentIndex = url.indexOf('#');
  final String head = fragmentIndex < 0 ? url : url.substring(0, fragmentIndex);
  final String fragment = fragmentIndex < 0 ? '' : url.substring(fragmentIndex);
  final int queryIndex = head.indexOf('?');
  if (queryIndex < 0) {
    return '$head$fragment';
  }
  final String base = head.substring(0, queryIndex);
  final List<String> preserved = [
    for (final String field in head.substring(queryIndex + 1).split('&'))
      if (field.isNotEmpty &&
          field != '=' &&
          !_signatureFieldNames.contains(_fieldName(field)))
        field,
  ];
  if (preserved.isEmpty) {
    return '$base$fragment';
  }
  return '$base?${preserved.join('&')}$fragment';
}

FavoriteGifEntry stripFavoriteGifEntrySignatures(FavoriteGifEntry entry) =>
    FavoriteGifEntry(
      url: stripAttachmentSignature(entry.url),
      proxyUrl: stripAttachmentSignature(entry.proxyUrl),
      width: entry.width,
      height: entry.height,
      contentType: entry.contentType,
      placeholder: entry.placeholder,
      media: {
        for (final MapEntry(:key, :value) in entry.media.entries)
          key: FavoriteGifMediaFormat(
            src: stripAttachmentSignature(value.src),
            proxySrc: stripAttachmentSignature(value.proxySrc),
            width: value.width,
            height: value.height,
          ),
      },
    );
