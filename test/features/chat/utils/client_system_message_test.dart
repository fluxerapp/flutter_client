import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/client_system_message.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';

void main() {
  test('createClientSystemMessage uses Fluxerbot author and type 99', () {
    final Message message = createClientSystemMessage(
      channelId: 'channel-1',
      content: 'Delivery failed.',
    );
    expect(message.type, messageTypeClientSystem);
    expect(message.authorId, fluxerBotUserId);
    expect(message.authorName, 'Fluxer');
    expect(message.authorIsBot, isTrue);
    expect(message.authorIsSystem, isTrue);
    expect(message.isClientSystemMessage, isTrue);
    expect(message.content, 'Delivery failed.');
    expect(message.deliveryState, MessageDeliveryState.sent);
    expect(message.clientNonce, message.id);
  });

  test('createClientSystemMessage brands the system bot with productName', () {
    final Message message = createClientSystemMessage(
      channelId: 'channel-1',
      content: 'Delivery failed.',
      productName: 'Acme',
    );
    expect(message.authorName, 'Acme');
  });
}
