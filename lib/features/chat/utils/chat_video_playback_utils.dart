import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

const double kDefaultChatVideoAspectRatio = 16 / 9;

const Duration kYouTubeStreamResolveTimeout = Duration(seconds: 25);

const Duration kYouTubeStreamResolveRetryDelay = Duration(milliseconds: 500);

typedef YouTubeStreamResolver = Future<String> Function(String pageUrl);

@visibleForTesting
YouTubeStreamResolver? debugYouTubeStreamResolver;

@visibleForTesting
Duration? debugYouTubeStreamResolveTimeout;

double resolveChatVideoAspectRatio({int? width, int? height}) {
  if (width != null && height != null && width > 0 && height > 0) {
    return width / height;
  }
  return kDefaultChatVideoAspectRatio;
}

bool isYouTubeUrl(String url) {
  final String host = Uri.tryParse(url)?.host ?? '';
  return host.contains('youtube.com') || host.contains('youtu.be');
}

Future<String> resolveYouTubeStreamUrl(String pageUrl) async {
  final Duration timeout =
      debugYouTubeStreamResolveTimeout ?? kYouTubeStreamResolveTimeout;
  Object? lastError;
  for (int attempt = 0; attempt < 2; attempt++) {
    if (attempt > 0) {
      await Future<void>.delayed(kYouTubeStreamResolveRetryDelay);
    }
    try {
      final Future<String> resolveFuture = () {
        final YouTubeStreamResolver? debugResolver = debugYouTubeStreamResolver;
        if (debugResolver != null) {
          return debugResolver(pageUrl);
        }
        return _fetchYouTubeStreamUrl(pageUrl);
      }();
      return await resolveFuture.timeout(timeout);
    } on Object catch (error) {
      lastError = error;
    }
  }
  Error.throwWithStackTrace(
    lastError ?? StateError('YouTube stream resolution failed'),
    StackTrace.current,
  );
}

Future<String> _fetchYouTubeStreamUrl(String pageUrl) async {
  final YoutubeExplode yt = YoutubeExplode();
  try {
    final VideoId videoId = VideoId(pageUrl);
    final StreamManifest manifest = await yt.videos.streamsClient.getManifest(
      videoId,
    );
    final StreamInfo stream = manifest.muxed.withHighestBitrate();
    return stream.url.toString();
  } finally {
    yt.close();
  }
}

Future<String> resolvePlaybackUrl(ChatVideoSource source) async {
  final String? directMediaUrl = source.directMediaUrl;
  if (directMediaUrl != null && !isYouTubeUrl(directMediaUrl)) {
    return directMediaUrl;
  }
  final String? youtubeUrl = _resolveYouTubePageUrl(source);
  if (youtubeUrl != null) {
    return resolveYouTubeStreamUrl(youtubeUrl);
  }
  if (directMediaUrl != null) {
    return directMediaUrl;
  }
  throw StateError('No playable video URL available');
}

String? _resolveYouTubePageUrl(ChatVideoSource source) {
  final String? pageUrl = source.pageUrl;
  if (pageUrl != null && isYouTubeUrl(pageUrl)) {
    return pageUrl;
  }
  final String? directMediaUrl = source.directMediaUrl;
  if (directMediaUrl != null && isYouTubeUrl(directMediaUrl)) {
    return directMediaUrl;
  }
  return null;
}
