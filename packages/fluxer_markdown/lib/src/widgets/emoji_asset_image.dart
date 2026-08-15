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

class CachedEmojiAssetImage extends StatefulWidget {
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
  State<CachedEmojiAssetImage> createState() => _CachedEmojiAssetImageState();
}

class _CachedEmojiAssetImageState extends State<CachedEmojiAssetImage> {
  late Future<Uint8List> _bytesFuture;

  @override
  void initState() {
    super.initState();
    _bytesFuture = EmojiAssetCache.loadBytes(widget.url);
  }

  @override
  void didUpdateWidget(covariant CachedEmojiAssetImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _bytesFuture = EmojiAssetCache.loadBytes(widget.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: FutureBuilder<Uint8List>(
        future: _bytesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return widget.fallback;
          }
          if (!snapshot.hasData) {
            return SizedBox(width: widget.size, height: widget.size);
          }
          return EmojiAssetImage(
            bytes: snapshot.data!,
            size: widget.size,
            fallback: widget.fallback,
          );
        },
      ),
    );
  }
}
