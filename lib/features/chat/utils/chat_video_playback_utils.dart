import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';

enum ChatInlineVideoOffscreenAction { none, pause, resume }

ChatInlineVideoOffscreenAction resolveInlineVideoOffscreenAction({
  required bool visible,
  required bool isPlaying,
  required bool pausedOffscreen,
}) {
  if (!visible) {
    return isPlaying
        ? ChatInlineVideoOffscreenAction.pause
        : ChatInlineVideoOffscreenAction.none;
  }
  return pausedOffscreen
      ? ChatInlineVideoOffscreenAction.resume
      : ChatInlineVideoOffscreenAction.none;
}

const double kDefaultChatVideoAspectRatio = 16 / 9;

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

Future<String> resolvePlaybackUrl(ChatVideoSource source) async {
  final String? directMediaUrl = source.directMediaUrl;
  if (directMediaUrl != null && !isYouTubeUrl(directMediaUrl)) {
    return directMediaUrl;
  }
  if (_resolveYouTubePageUrl(source) != null) {
    throw StateError('YouTube videos must use the embed player');
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
