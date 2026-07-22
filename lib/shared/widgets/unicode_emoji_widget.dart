import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class UnicodeEmojiWidget extends StatelessWidget {
  const UnicodeEmojiWidget({
    required this.emoji,
    required this.size,
    super.key,
  });

  final String emoji;
  final double size;

  @override
  Widget build(BuildContext context) {
    final unicode = resolveUnicodeEmoji(emoji);
    final url = getTwemojiUrl(unicode);
    if (url == null) {
      return SystemEmojiFallback(emoji: unicode, size: size);
    }
    return SizedBox(
      width: size,
      height: size,
      child: FutureBuilder<Uint8List>(
        future: EmojiAssetCache.loadBytes(url),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SystemEmojiFallback(emoji: unicode, size: size);
          }
          if (!snapshot.hasData) {
            return SizedBox(width: size, height: size);
          }
          return SvgPicture.memory(
            snapshot.data!,
            width: size,
            height: size,
            errorBuilder: (_, _, _) =>
                SystemEmojiFallback(emoji: unicode, size: size),
          );
        },
      ),
    );
  }
}
