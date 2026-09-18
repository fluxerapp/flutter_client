import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_chat_jump.dart';

void main() {
  const String channelId = 'voice-1';
  const ChannelJumpTargetConsumption none = ChannelJumpTargetConsumption();

  group('resolveVoiceChannelChatJumpTarget', () {
    test('honours a route target when it is the latest intent', () {
      expect(
        resolveVoiceChannelChatJumpTarget(
          channelId: channelId,
          routeTarget: 'route-msg',
          consumption: const ChannelJumpTargetConsumption(
            latestIntentByChannel: <String, String>{channelId: 'route-msg'},
          ),
        ),
        'route-msg',
      );
    });

    test('drops a consumed route target', () {
      expect(
        resolveVoiceChannelChatJumpTarget(
          channelId: channelId,
          routeTarget: 'route-msg',
          consumption: ChannelJumpTargetConsumption(
            consumedKeys: <String>{
              ChannelJumpTargetConsumption.keyFor(
                channelId: channelId,
                messageId: 'route-msg',
              ),
            },
            latestIntentByChannel: const <String, String>{channelId: 'route-msg'},
          ),
        ),
        isNull,
      );
    });

    test('uses the ledger intent when the route has no message id', () {
      expect(
        resolveVoiceChannelChatJumpTarget(
          channelId: channelId,
          routeTarget: null,
          consumption: const ChannelJumpTargetConsumption(
            latestIntentByChannel: <String, String>{channelId: 'ledger-msg'},
          ),
        ),
        'ledger-msg',
      );
    });

    test('uses a newer ledger intent when the route target is superseded', () {
      expect(
        resolveVoiceChannelChatJumpTarget(
          channelId: channelId,
          routeTarget: 'old-msg',
          consumption: const ChannelJumpTargetConsumption(
            latestIntentByChannel: <String, String>{channelId: 'new-msg'},
          ),
        ),
        'new-msg',
      );
    });

    test('has nothing to apply without a route or ledger target', () {
      expect(
        resolveVoiceChannelChatJumpTarget(
          channelId: channelId,
          routeTarget: null,
          consumption: none,
        ),
        isNull,
      );
    });
  });
}
