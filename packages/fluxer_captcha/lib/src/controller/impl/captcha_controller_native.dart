import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluxer_captcha/src/captcha_exception.dart';
import 'package:fluxer_captcha/src/captcha_provider.dart';
import 'package:fluxer_captcha/src/controller/interface.dart' as i;
import 'package:material_ui/material_ui.dart';
import 'package:meta/meta.dart';

/// Captcha controller for native (mobile/desktop) platforms.
class CaptchaController extends ChangeNotifier
    implements i.CaptchaController<InAppWebViewController> {
  @override
  late InAppWebViewController connector;

  /// The captcha provider this controller is configured for.
  CaptchaProvider provider = CaptchaProvider.turnstile;

  String? _token;
  CaptchaException? _error;
  String? _widgetId = '';
  bool _isReady = false;
  bool _isDisposed = false;

  String get _jsGlobal =>
      provider == CaptchaProvider.turnstile ? 'turnstile' : 'hcaptcha';

  @override
  String? get token => _token;

  @override
  String? get widgetId => _widgetId;

  @override
  bool get isWidgetReady => _isReady;

  @override
  CaptchaException? get error => _error;

  @internal
  @override
  void setConnector(InAppWebViewController newConnector) {
    connector = newConnector;
  }

  @internal
  @override
  set token(String? newToken) {
    if (_token != newToken) {
      _token = newToken;

      if (newToken != null && newToken.isNotEmpty) {
        _onTokenReceived?.call(newToken);
      }

      notifyListeners();
    }
  }

  @internal
  @override
  set widgetId(String? id) {
    if (_widgetId != id) {
      _widgetId = id;
      notifyListeners();
    }
  }

  @internal
  @override
  set isWidgetReady(bool isReady) {
    if (_isReady != isReady) {
      _isReady = isReady;
      notifyListeners();
    }
  }

  @internal
  @override
  set error(CaptchaException? error) {
    _error = error;
    if (error != null) {
      _onError?.call(error);
    }
    notifyListeners();
  }

  @override
  Future<void> refreshToken() async {
    if (_isDisposed) return;
    _token = null;
    if (!_isReady || _error != null) {
      await connector.reload();
      return;
    }
    await connector.evaluateJavascript(
      source: '''$_jsGlobal.reset(`$_widgetId`);''',
    );
  }

  @override
  Future<bool> isExpired() async {
    if (_isDisposed ||
        !_isReady ||
        _widgetId == null ||
        token == null ||
        token!.isEmpty) {
      return true;
    }

    if (provider == CaptchaProvider.hcaptcha) {
      final response = await connector.evaluateJavascript(
        source: '''hcaptcha.getResponse(`$_widgetId`);''',
      );
      return response == null || response.toString().isEmpty;
    }

    final result = await connector.evaluateJavascript(
      source: '''turnstile.isExpired(`$_widgetId`);''',
    );

    // JS eval may return a non-bool type; default to expired.
    // ignore: avoid_bool_literals_in_conditional_expressions
    return result is bool ? result : true;
  }

  @override
  void dispose() {
    _isDisposed = true;
    _onError = null;
    _onTokenReceived = null;
    super.dispose();
  }

  void Function(CaptchaException error)? _onError;
  void Function(String token)? _onTokenReceived;

  @override
  void onError(void Function(CaptchaException error) callback) {
    _onError = callback;
  }

  @override
  void onTokenReceived(void Function(String token) callback) {
    _onTokenReceived = callback;
  }
}
