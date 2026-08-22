import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluxer_app/features/chat/utils/embed_youtube_utils.dart';
import 'package:material_ui/material_ui.dart';

class ChatYouTubeWebView extends StatelessWidget {
  ChatYouTubeWebView({
    required this.embedUrl,
    String? pageOrigin,
    super.key,
  }) : pageOrigin = pageOrigin ?? youtubeEmbedPageOrigin();

  final String embedUrl;
  final String pageOrigin;

  static final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers =
      <Factory<OneSequenceGestureRecognizer>>{
        const Factory<OneSequenceGestureRecognizer>(EagerGestureRecognizer.new),
      };

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(embedUrl),
        headers: <String, String>{'Referer': pageOrigin},
      ),
      gestureRecognizers: _gestureRecognizers,
      initialSettings: InAppWebViewSettings(
        mediaPlaybackRequiresUserGesture: false,
        allowsInlineMediaPlayback: true,
        supportZoom: false,
      ),
    );
  }
}
