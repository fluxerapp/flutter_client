import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:fluxer_captcha/src/captcha_exception.dart';
import 'package:fluxer_captcha/src/captcha_provider.dart';
import 'package:fluxer_captcha/src/controller/interface.dart' as i;
import 'package:material_ui/material_ui.dart';
import 'package:meta/meta.dart';

/// Captcha controller for web platforms.
class CaptchaController extends ChangeNotifier
    implements i.CaptchaController<dynamic> {
  @override
  late dynamic connector;

  /// The captcha provider this controller is configured for.
  CaptchaProvider provider = CaptchaProvider.turnstile;

  String? _token;
  CaptchaException? _error;
  String? _widgetId = '';
  bool _isReady = false;

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
  void setConnector(dynamic newConnector) {}

  @internal
  @override
  set token(String? token) {
    _token = token;

    if (token != null && token.isNotEmpty) {
      _onTokenReceived?.call(token);
    }

    notifyListeners();
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
    _token = null;
    globalContext
        .getProperty<JSObject>(_jsGlobal.toJS)
        .callMethod('reset'.toJS, _widgetId?.toJS);
  }

  @override
  Future<bool> isExpired() async {
    if (!_isReady || _widgetId == null || token == null || token!.isEmpty) {
      return true;
    }

    final jsObj = globalContext.getProperty<JSObject>(_jsGlobal.toJS);

    if (provider == CaptchaProvider.hcaptcha) {
      final response = jsObj.callMethod<JSString>(
        'getResponse'.toJS,
        _widgetId?.toJS,
      );
      return response.toDart.isEmpty;
    }

    final expired = jsObj.callMethod<JSBoolean>(
      'isExpired'.toJS,
      _widgetId?.toJS,
    );
    return expired.toDart;
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
