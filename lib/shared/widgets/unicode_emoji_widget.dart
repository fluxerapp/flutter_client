import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';

class TwemojiSvgCache {
  TwemojiSvgCache._();

  static final Map<String, Future<Uint8List>> _cache =
      <String, Future<Uint8List>>{};

  static Future<Uint8List> load(String url) {
    return _cache.putIfAbsent(url, () async {
      final uri = Uri.parse(url);
      final response = await HttpClient().getUrl(uri).then((r) => r.close());
      if (response.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Twemoji load failed: ${response.statusCode}',
          uri: uri,
        );
      }
      final builder = BytesBuilder();
      await response.forEach(builder.add);
      return builder.toBytes();
    });
  }

  @visibleForTesting
  static void clearCacheForTesting() {
    _cache.clear();
  }
}

class UnicodeEmojiWidget extends StatelessWidget {
  const UnicodeEmojiWidget({
    required this.emoji,
    required this.size,
    super.key,
  });

  final String emoji;
  final double size;

  Widget _buildSystemEmoji(String unicode) {
    return Text(unicode, style: TextStyle(fontSize: size));
  }

  @override
  Widget build(BuildContext context) {
    final unicode = resolveUnicodeEmoji(emoji);
    final url = getTwemojiUrl(unicode);
    if (url == null) {
      return _buildSystemEmoji(unicode);
    }
    return SizedBox(
      width: size,
      height: size,
      child: FutureBuilder<Uint8List>(
        future: TwemojiSvgCache.load(url),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildSystemEmoji(unicode);
          }
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }
          return SvgPicture.memory(
            snapshot.data!,
            width: size,
            height: size,
            errorBuilder: (_, _, _) => _buildSystemEmoji(unicode),
          );
        },
      ),
    );
  }
}
