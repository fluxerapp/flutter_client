import 'package:dio/dio.dart';

const String kSkipAuthKey = 'skipAuth';

const Set<String> _kPublicAuthPaths = {
  '/auth/login',
  '/auth/register',
  '/auth/forgot',
  '/auth/reset',
  '/auth/authorize-ip',
  '/auth/sso/start',
  '/auth/sso/complete',
  '/auth/sso/status',
  '/auth/username-suggestions',
  '/auth/verify',
  '/auth/email-revert',
  '/auth/handoff/complete',
};

bool isPublicAuthPath(String path) {
  if (_kPublicAuthPaths.contains(path)) {
    return true;
  }
  if (path.startsWith('/auth/login/mfa/')) {
    return true;
  }
  if (path.startsWith('/auth/reset/')) {
    return true;
  }
  if (path.startsWith('/auth/ip-authorization/')) {
    return true;
  }
  if (path.startsWith('/auth/webauthn/')) {
    return true;
  }
  if (path.startsWith('/auth/handoff/') &&
      (path.endsWith('/info') || path.endsWith('/status'))) {
    return true;
  }
  return false;
}

bool shouldSkipAuth(RequestOptions options) {
  if (options.extra[kSkipAuthKey] == true) {
    return true;
  }
  return isPublicAuthPath(options.path);
}

class SkipAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (shouldSkipAuth(options)) {
      options.headers.remove('Authorization');
    }
    handler.next(options);
  }
}
