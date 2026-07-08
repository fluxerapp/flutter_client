import 'package:fluxer_app/core/push/fcm/fcm_tap_binding_host.dart';
import 'package:fluxer_app/core/push/push_message.dart';
import 'package:fluxer_app/core/push/push_service.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/fluxer_fcm_push_service.dart';

class FirebaseMessagingPushService implements PushService {
  const FirebaseMessagingPushService();

  static final FluxerFcmPushService _delegate = FluxerFcmPushService.instance;

  static FcmTapBindingHost get tapHost => _FcmTapBindingHostAdapter(_delegate);

  static FluxerFcmPushService get delegate => _delegate;

  static Stream<String> get tokenRefreshStream => _delegate.tokenRefreshStream;

  static Future<void> bootstrapAfterAuth() => _delegate.initialize();

  @override
  Future<void> requestPermissions() => _delegate.requestPermissions();

  @override
  Future<void> initialize() => _delegate.initialize();

  @override
  Future<String?> getToken() => _delegate.getToken();

  @override
  Stream<PushMessage> watchMessages() {
    return _delegate.watchMessages().map(_toPushMessage);
  }

  static PushMessage _toPushMessage(FcmPushMessage message) {
    return PushMessage(
      id: message.id,
      title: message.title,
      body: message.body,
      payload: message.payload,
    );
  }

  static void configureForegroundMessageFilter(
    bool Function(Map<String, String> payload)? filter,
  ) {
    _delegate.setForegroundMessageFilter(
      filter == null
          ? null
          : (FcmPushMessage message) => filter(message.payload),
    );
  }
}

final class _FcmTapBindingHostAdapter implements FcmTapBindingHost {
  const _FcmTapBindingHostAdapter(this._delegate);

  final FluxerFcmPushService _delegate;

  @override
  void setNotificationTapCallback(FcmNotificationTapCallback? callback) {
    _delegate.setNotificationTapCallback(
      callback == null
          ? null
          : (Map<String, String> payload) => callback(payload),
    );
  }
}
