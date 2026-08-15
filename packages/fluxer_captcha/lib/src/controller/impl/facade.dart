import 'package:fluxer_captcha/src/captcha_exception.dart';
import 'package:fluxer_captcha/src/controller/interface.dart' as i;
import 'package:material_ui/material_ui.dart';

/// Facade class — platform-specific implementations are selected at compile
/// time via conditional exports.
class CaptchaController extends ChangeNotifier
    implements i.CaptchaController<dynamic> {
  @override
  late dynamic connector;

  @override
  String? get token {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  void setConnector(dynamic newConnector) {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  set token(String? token) {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  set error(CaptchaException? error) {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  String? get widgetId {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  bool get isWidgetReady {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  set isWidgetReady(bool isReady) {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  set widgetId(String? id) {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  CaptchaException? get error {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  Future<void> refreshToken() async {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  Future<bool> isExpired() {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  void onError(void Function(CaptchaException error) callback) {
    throw UnimplementedError('Cannot call this function on the facade.');
  }

  @override
  void onTokenReceived(void Function(String token) callback) {
    throw UnimplementedError('Cannot call this function on the facade.');
  }
}
