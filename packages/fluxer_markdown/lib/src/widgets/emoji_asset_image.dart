import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_markdown/src/utils/emoji_asset_cache.dart';
import 'package:fluxer_markdown/src/utils/emoji_asset_format.dart';

class EmojiAssetImage extends StatelessWidget {
  const EmojiAssetImage({
    required this.bytes,
    required this.size,
    required this.fallback,
    super.key,
  });

  final Uint8List bytes;
  final double size;
  final Widget fallback;

  @override
  Widget build(BuildContext context) {
    if (isWebpEmojiAsset(bytes)) {
      return Image.memory(
        bytes,
        width: size,
        height: size,
        filterQuality: FilterQuality.high,
        errorBuilder: (_, _, _) => fallback,
      );
    }
    if (isSvgEmojiAsset(bytes)) {
      return SvgPicture.memory(
        bytes,
        width: size,
        height: size,
        errorBuilder: (_, _, _) => fallback,
      );
    }
    return fallback;
  }
}

class CachedEmojiAssetImage extends StatelessWidget {
  const CachedEmojiAssetImage({
    required this.url,
    required this.size,
    required this.fallback,
    super.key,
  });

  final String url;
  final double size;
  final Widget fallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FutureBuilder<Uint8List>(
        future: EmojiAssetCache.loadBytes(url),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return fallback;
          }
          if (!snapshot.hasData) {
            return SizedBox(width: size, height: size);
          }
          return EmojiAssetImage(
            bytes: snapshot.data!,
            size: size,
            fallback: fallback,
          );
        },
      ),
    );
  }
}
