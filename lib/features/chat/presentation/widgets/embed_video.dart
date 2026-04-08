import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embed_shared.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

/// A video embed
class EmbedVideo extends StatelessWidget {
  final Embed embed;

  const EmbedVideo({required this.embed, super.key});

  bool get _hasHeader =>
      embed.providerName != null || embed.author != null || embed.title != null;

  @override
  Widget build(BuildContext context) {
    final sideColor = embed.color != null
        ? Color(0xFF000000 | (embed.color! & 0xFFFFFF))
        : context.colors.backgroundSecondaryAlt;

    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: const BoxConstraints(maxWidth: 440),
      decoration: BoxDecoration(
        color: context.colors.embedBackground,
        border: Border(left: BorderSide(color: sideColor, width: 4)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_hasHeader)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (embed.providerName != null)
                    EmbedInlineText(
                      text: embed.providerName!,
                      style: context.textStyles.embedFooter.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  if (embed.author != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: EmbedAuthorRow(author: embed.author!),
                    ),
                  if (embed.title != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: EmbedTitle(title: embed.title!, url: embed.url),
                    ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: _VideoPlayer(embed: embed),
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  final Embed embed;

  const _VideoPlayer({required this.embed});

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late final Player _player;
  late final mkv.VideoController _controller;

  bool _playing = false;
  bool _loading = false;

  double get _aspectRatio {
    final video = widget.embed.video;
    final thumb = widget.embed.thumbnail;
    final w = video?.width?.toDouble() ?? thumb?.width?.toDouble();
    final h = video?.height?.toDouble() ?? thumb?.height?.toDouble();
    if (w != null && h != null && w > 0 && h > 0) {
      return w / h;
    }
    return 16 / 9;
  }

  bool get _isYouTube {
    final url = widget.embed.video?.url ?? widget.embed.url ?? '';
    final host = Uri.tryParse(url)?.host ?? '';
    return host.contains('youtube.com') || host.contains('youtu.be');
  }

  @override
  void initState() {
    super.initState();
    _player = Player();
    _controller = mkv.VideoController(_player);
  }

  @override
  void dispose() {
    unawaited(_player.dispose());
    super.dispose();
  }

  Future<void> _startPlayback() async {
    setState(() {
      _loading = true;
    });

    try {
      if (_isYouTube) {
        await _playYouTube();
      } else {
        await _playDirect();
      }
    } on Exception {
      await _openInBrowser();
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _playYouTube() async {
    final pageUrl = widget.embed.url ?? widget.embed.video?.url;
    if (pageUrl == null) {
      return;
    }
    final yt = YoutubeExplode();
    try {
      final videoId = VideoId(pageUrl);
      final manifest = await yt.videos.streamsClient.getManifest(videoId);
      final stream = manifest.muxed.withHighestBitrate();
      setState(() => _playing = true);
      await _player.open(Media(stream.url.toString()));
    } finally {
      yt.close();
    }
  }

  Future<void> _playDirect() async {
    final url = widget.embed.video?.proxyUrl ?? widget.embed.video?.url;
    if (url == null) {
      return;
    }
    setState(() => _playing = true);
    await _player.open(Media(url));
  }

  Future<void> _openInBrowser() async {
    final url = widget.embed.url ?? widget.embed.video?.url;
    if (url == null || !mounted) {
      return;
    }
    await handleExternalLinkTap(context, url);
  }

  @override
  Widget build(BuildContext context) {
    final ratio = _aspectRatio;

    if (_playing) {
      return AspectRatio(
        aspectRatio: ratio,
        child: mkv.Video(controller: _controller),
      );
    }

    final thumbUrl =
        widget.embed.thumbnail?.proxyUrl ?? widget.embed.thumbnail?.url;

    return GestureDetector(
      onTap: _loading ? null : _startPlayback,
      child: AspectRatio(
        aspectRatio: ratio,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            if (thumbUrl != null)
              ColoredBox(
                color: Colors.black,
                child: CachedNetworkImage(
                  imageUrl: thumbUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (_, e, s) =>
                      Container(color: context.colors.backgroundFloating),
                ),
              )
            else
              Container(color: context.colors.backgroundFloating),
            if (_loading)
              const Center(child: FluxerLoadingSpinner())
            else
              Center(
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: context.colors.textOnBrandPrimary,
                    size: 28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
