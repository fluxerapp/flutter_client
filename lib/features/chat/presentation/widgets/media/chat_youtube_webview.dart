import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_youtube_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatYouTubeWebView extends StatelessWidget {
  ChatYouTubeWebView({required this.embedUrl, String? pageOrigin, super.key})
    : pageOrigin = pageOrigin ?? youtubeEmbedPageOrigin();

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
        incognito: true,
        mediaPlaybackRequiresUserGesture: false,
        allowsInlineMediaPlayback: true,
        supportZoom: false,
        useShouldOverrideUrlLoading: true,
        supportMultipleWindows: true,
      ),
      shouldOverrideUrlLoading: (controller, action) {
        final Uri? uri = action.request.url;
        if (!action.isForMainFrame ||
            uri == null ||
            isYouTubeEmbedNavigation(uri)) {
          return Future<NavigationActionPolicy>.value(
            NavigationActionPolicy.ALLOW,
          );
        }
        unawaited(launchUrl(uri, mode: LaunchMode.externalApplication));
        return Future<NavigationActionPolicy>.value(
          NavigationActionPolicy.CANCEL,
        );
      },
      onCreateWindow: (controller, action) {
        final Uri? uri = action.request.url;
        if (uri != null) {
          unawaited(launchUrl(uri, mode: LaunchMode.externalApplication));
        }
        return Future<bool>.value(false);
      },
    );
  }
}
