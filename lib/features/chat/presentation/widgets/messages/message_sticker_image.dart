import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const double _kStickerBox = 160;
const int _kStickerRequestSize = 320;
const String _kAspectRatiosKey = 'message_sticker_aspect_ratios';
const int _kMaxPersistedAspectRatios = 512;
const Duration _kPersistDelay = Duration(seconds: 2);

Size _stickerDisplaySize(double? aspectRatio) {
  if (aspectRatio == null || !aspectRatio.isFinite || aspectRatio <= 0) {
    return const Size.square(_kStickerBox);
  }
  return aspectRatio >= 1
      ? Size(_kStickerBox, _kStickerBox / aspectRatio)
      : Size(_kStickerBox * aspectRatio, _kStickerBox);
}

ImageProvider _stickerStillProvider(MessageSticker sticker) =>
    CachedNetworkImageProvider(
      FluxerMediaUrl.sticker(id: sticker.id),
      cacheKey: 'message_sticker_${sticker.id}_s_$_kStickerRequestSize',
    );

final Map<String, double> _stickerAspectRatios = <String, double>{};
final Map<String, Future<double?>> _pendingStickerAspectRatios =
    <String, Future<double?>>{};
Timer? _persistTimer;

Future<void> loadMessageStickerAspectRatios() async {
  try {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? raw = preferences.getString(_kAspectRatiosKey);
    if (raw == null) {
      return;
    }
    final Object? decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      return;
    }
    for (final MapEntry<String, dynamic> entry in decoded.entries) {
      final Object? value = entry.value;
      if (value is num && value > 0) {
        _stickerAspectRatios.putIfAbsent(entry.key, value.toDouble);
      }
    }
  } on Object catch (_) {}
}

void _rememberStickerAspectRatio(String stickerId, double aspectRatio) {
  _stickerAspectRatios
    ..remove(stickerId)
    ..[stickerId] = aspectRatio;
  _persistTimer?.cancel();
  _persistTimer = Timer(_kPersistDelay, () async {
    final Iterable<MapEntry<String, double>> entries =
        _stickerAspectRatios.entries;
    final int skip = entries.length - _kMaxPersistedAspectRatios;
    final Map<String, double> kept = Map<String, double>.fromEntries(
      skip > 0 ? entries.skip(skip) : entries,
    );
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      await preferences.setString(_kAspectRatiosKey, jsonEncode(kept));
    } on Object catch (_) {}
  });
}

Future<void> prefetchMessageStickerAspectRatios(
  Iterable<Message> messages, {
  Duration timeout = const Duration(seconds: 2),
}) async {
  final List<Future<double?>> loads = <Future<double?>>[
    for (final Message message in messages)
      for (final MessageSticker sticker in <MessageSticker>[
        ...message.stickers,
        for (final MessageSnapshot snapshot in message.messageSnapshots)
          ...snapshot.stickers,
      ])
        if (!_stickerAspectRatios.containsKey(sticker.id))
          _resolveStickerAspectRatio(sticker),
  ];
  if (loads.isEmpty) {
    return;
  }
  await Future.wait(loads).timeout(timeout, onTimeout: () => const []);
}

Future<double?> _resolveStickerAspectRatio(MessageSticker sticker) {
  final double? known = _stickerAspectRatios[sticker.id];
  if (known != null) {
    return SynchronousFuture<double?>(known);
  }
  return _pendingStickerAspectRatios[sticker.id] ??=
      _loadStickerAspectRatio(sticker).whenComplete(() {
        unawaited(_pendingStickerAspectRatios.remove(sticker.id));
      });
}

Future<double?> _loadStickerAspectRatio(MessageSticker sticker) {
  final Completer<double?> completer = Completer<double?>();
  final ImageStream stream = _stickerStillProvider(
    sticker,
  ).resolve(ImageConfiguration.empty);
  late final ImageStreamListener listener;
  listener = ImageStreamListener(
    (ImageInfo info, bool _) {
      final int width = info.image.width;
      final int height = info.image.height;
      info.dispose();
      stream.removeListener(listener);
      if (width > 0 && height > 0) {
        _rememberStickerAspectRatio(sticker.id, width / height);
      }
      if (!completer.isCompleted) {
        completer.complete(_stickerAspectRatios[sticker.id]);
      }
    },
    onError: (Object _, StackTrace? _) {
      stream.removeListener(listener);
      if (!completer.isCompleted) {
        completer.complete(null);
      }
    },
  );
  stream.addListener(listener);
  return completer.future;
}

class MessageStickerImage extends StatefulWidget {
  const MessageStickerImage({required this.sticker, super.key});

  final MessageSticker sticker;

  @override
  State<MessageStickerImage> createState() => _MessageStickerImageState();
}

class _MessageStickerImageState extends State<MessageStickerImage> {
  double? _aspectRatio;

  @override
  void initState() {
    super.initState();
    _syncAspectRatio();
  }

  @override
  void didUpdateWidget(MessageStickerImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sticker.id != widget.sticker.id) {
      _syncAspectRatio();
    }
  }

  void _syncAspectRatio() {
    final MessageSticker sticker = widget.sticker;
    _aspectRatio = _stickerAspectRatios[sticker.id];
    if (_aspectRatio != null) {
      return;
    }
    unawaited(
      _resolveStickerAspectRatio(sticker).then((double? aspectRatio) {
        if (mounted &&
            widget.sticker.id == sticker.id &&
            aspectRatio != _aspectRatio) {
          setState(() => _aspectRatio = aspectRatio);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MessageSticker sticker = widget.sticker;
    final Widget image;
    if (sticker.animated) {
      image = EmbedAnimatedImage(
        animatedUrl: sticker.urlForSize(_kStickerRequestSize),
        staticUrl: FluxerMediaUrl.sticker(id: sticker.id),
        useStickerAnimationPreference: true,
        fit: BoxFit.contain,
      );
    } else {
      image = Image(
        image: _stickerStillProvider(sticker),
        fit: BoxFit.contain,
        gaplessPlayback: true,
        errorBuilder: (BuildContext context, Object _, StackTrace? _) => Center(
          child: PhosphorIcon(
            PhosphorIconsDuotone.sticker,
            size: 48,
            color: context.colors.textTertiaryMuted,
          ),
        ),
      );
    }
    return Semantics(
      label: sticker.name,
      image: true,
      child: SizedBox.fromSize(
        size: _stickerDisplaySize(_aspectRatio),
        child: image,
      ),
    );
  }
}
