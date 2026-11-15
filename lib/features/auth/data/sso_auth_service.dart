import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/sign_in_webview_dialog.dart';

class SsoAuthCancelledException implements Exception {
  const SsoAuthCancelledException();
}

class SsoAuthService {
  static const String callbackUrlScheme = 'fluxer';

  Future<Uri> authenticate({required String authorizationUrl}) async {
    if (Platform.isLinux) {
      // flutter_web_auth_2 opens a WebKitGTK window on Linux, which cannot
      // share a process with the WPE WebKit of flutter_inappwebview.
      final Uri? callback = await showSignInWebViewDialog(
        rootNavigatorKey.currentContext!,
        url: authorizationUrl,
        callbackScheme: callbackUrlScheme,
      );
      if (callback == null) {
        throw const SsoAuthCancelledException();
      }
      return callback;
    }
    try {
      final String result = await FlutterWebAuth2.authenticate(
        url: authorizationUrl,
        callbackUrlScheme: callbackUrlScheme,
      );
      return Uri.parse(result);
    } on PlatformException catch (error) {
      if (error.code == 'CANCELED') {
        throw const SsoAuthCancelledException();
      }
      rethrow;
    }
  }
}
