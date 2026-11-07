import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/api/skip_auth_interceptor.dart';

class SessionAuthInterceptor extends Interceptor {
  SessionAuthInterceptor({required this.readToken, this.readTokenBaseUrl});

  final String? Function() readToken;
  final String? Function()? readTokenBaseUrl;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (shouldSkipAuth(options)) {
      handler.next(options);
      return;
    }
    final String? token = readToken();
    if (token != null && token.isNotEmpty && _targetsTokenInstance(options)) {
      options.headers['Authorization'] = formatSessionAuthorizationHeader(
        token,
      );
    } else {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }

  bool _targetsTokenInstance(RequestOptions options) {
    final String? Function()? readTokenBaseUrl = this.readTokenBaseUrl;
    if (readTokenBaseUrl == null) {
      return true;
    }
    final String? tokenBaseUrl = readTokenBaseUrl();
    if (tokenBaseUrl == null) {
      return false;
    }
    final Uri? base = Uri.tryParse(tokenBaseUrl.trim());
    if (base == null || !base.hasScheme || base.host.isEmpty) {
      return false;
    }
    return isRequestUnderBaseUrl(options.uri, base);
  }
}

bool isRequestUnderBaseUrl(Uri request, Uri base) {
  if (request.scheme.toLowerCase() != base.scheme.toLowerCase() ||
      request.host.toLowerCase() != base.host.toLowerCase() ||
      request.port != base.port) {
    return false;
  }
  String basePath = base.path;
  while (basePath.endsWith('/')) {
    basePath = basePath.substring(0, basePath.length - 1);
  }
  if (basePath.isEmpty) {
    return true;
  }
  final String path = request.path;
  return path == basePath || path.startsWith('$basePath/');
}

bool isSameBaseUrl(String first, String second) {
  final Uri? a = Uri.tryParse(first.trim());
  final Uri? b = Uri.tryParse(second.trim());
  return a != null &&
      b != null &&
      isRequestUnderBaseUrl(a, b) &&
      isRequestUnderBaseUrl(b, a);
}
