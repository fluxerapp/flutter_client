import 'package:fluxer_app/core/push/push_message.dart';

abstract interface class PushService {
  Future<void> initialize();
  Future<String?> getToken();
  Stream<PushMessage> watchMessages();
}
