import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class SsoAuthCancelledException implements Exception {
  const SsoAuthCancelledException();
}

class SsoAuthService {
  static const String callbackUrlScheme = 'fluxer';

  Future<Uri> authenticate({required String authorizationUrl}) async {
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
