import 'package:flutter_thumbhash/flutter_thumbhash.dart';
import 'package:fluxer_app/material_ui.dart';

Duration mediaPlaceholderFadeOutOf(BuildContext context) =>
    MediaQuery.disableAnimationsOf(context)
    ? Duration.zero
    : const Duration(milliseconds: 200);

class MediaThumbHashPlaceholder extends StatefulWidget {
  const MediaThumbHashPlaceholder({
    required this.thumbHash,
    this.fallback = const SizedBox.shrink(),
    super.key,
  });

  final String? thumbHash;
  final Widget fallback;

  @override
  State<MediaThumbHashPlaceholder> createState() =>
      _MediaThumbHashPlaceholderState();
}

class _MediaThumbHashPlaceholderState extends State<MediaThumbHashPlaceholder> {
  ImageProvider? _image;

  @override
  void initState() {
    super.initState();
    _image = _decode(widget.thumbHash);
  }

  @override
  void didUpdateWidget(MediaThumbHashPlaceholder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.thumbHash != widget.thumbHash) {
      _image = _decode(widget.thumbHash);
    }
  }

  static const int _maxDecoded = 256;
  static final Map<String, ImageProvider> _decoded = <String, ImageProvider>{};

  static ImageProvider? _decode(String? thumbHash) {
    if (thumbHash == null || thumbHash.isEmpty) {
      return null;
    }
    final ImageProvider? cached = _decoded.remove(thumbHash);
    if (cached != null) {
      _decoded[thumbHash] = cached;
      return cached;
    }
    try {
      final ImageProvider image = ThumbHash.fromBase64(thumbHash).toImage();
      if (_decoded.length >= _maxDecoded) {
        _decoded.remove(_decoded.keys.first);
      }
      _decoded[thumbHash] = image;
      return image;
    } on FormatException {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider? image = _image;
    return SizedBox.expand(
      child: image == null
          ? widget.fallback
          : Image(
              image: image,
              fit: BoxFit.cover,
              gaplessPlayback: true,
              excludeFromSemantics: true,
              errorBuilder: (_, _, _) => widget.fallback,
            ),
    );
  }
}
