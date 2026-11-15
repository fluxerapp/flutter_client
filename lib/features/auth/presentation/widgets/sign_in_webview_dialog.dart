import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers =
    <Factory<OneSequenceGestureRecognizer>>{
      const Factory<OneSequenceGestureRecognizer>(EagerGestureRecognizer.new),
    };

/// Opens [url] in an in-app webview and completes with the first navigation to
/// a [callbackScheme] URL, or with null when the user closes the dialog.
Future<Uri?> showSignInWebViewDialog(
  BuildContext context, {
  required String url,
  required String callbackScheme,
}) {
  bool completed = false;
  return FluxerModal.show<Uri>(
    context,
    title: FluxerLocalizations.of(context).logIn,
    useRootNavigator: true,
    builder: (dialogContext, _) => SizedBox(
      height: (MediaQuery.sizeOf(dialogContext).height - 200).clamp(240, 640),
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
        gestureRecognizers: _gestureRecognizers,
        initialSettings: InAppWebViewSettings(
          incognito: true,
          useShouldOverrideUrlLoading: true,
        ),
        shouldOverrideUrlLoading: (controller, action) {
          final WebUri? uri = action.request.url;
          if (uri == null || !uri.isScheme(callbackScheme)) {
            return Future<NavigationActionPolicy>.value(
              NavigationActionPolicy.ALLOW,
            );
          }
          if (!completed) {
            completed = true;
            Navigator.of(dialogContext).pop(uri.uriValue);
          }
          return Future<NavigationActionPolicy>.value(
            NavigationActionPolicy.CANCEL,
          );
        },
      ),
    ),
  );
}
