import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/client_nonce.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';

Message createClientSystemMessage({
  required String channelId,
  required String content,
}) {
  final String messageId = clientNonceGenerator.next();
  return Message(
    id: messageId,
    channelId: channelId,
    authorId: fluxerBotUserId,
    authorName: 'Fluxerbot',
    authorIsBot: true,
    authorIsSystem: true,
    content: content,
    timestamp: DateTime.now(),
    type: messageTypeClientSystem,
    clientNonce: messageId,
    deliveryState: MessageDeliveryState.sent,
  );
}
