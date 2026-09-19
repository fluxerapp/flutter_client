import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/assistant/assistant_entities.dart';
import 'package:fluxer_app/core/assistant/assistant_entity_index.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';

void main() {
  tearDown(InstanceEndpoints.resetToDefaults);

  group('assistantFriendAvatarUrl', () {
    test('uses the media proxy when a hash is present', () {
      expect(
        assistantFriendAvatarUrl(userId: '1', hash: 'deadbeef'),
        'https://fluxerusercontent.com/avatars/1/deadbeef.webp?size=160',
      );
    });

    test('falls back to the default avatar', () {
      expect(
        assistantFriendAvatarUrl(userId: '7', hash: null),
        'https://fluxerstatic.com/avatars/1.png',
      );
      expect(
        assistantFriendAvatarUrl(userId: '7', hash: ''),
        'https://fluxerstatic.com/avatars/1.png',
      );
    });

    test('includes avatarUrl in donation maps', () {
      const AssistantFriendEntity friend = AssistantFriendEntity(
        id: '1',
        name: 'Ada',
        username: 'ada',
        avatarUrl: 'https://cdn/a.png',
      );
      expect(friend.toMap()['avatarUrl'], 'https://cdn/a.png');
    });

    test('includes accountUserId in donation maps', () {
      const AssistantEntityDonation donation = AssistantEntityDonation(
        accountUserId: '42',
        friends: <AssistantFriendEntity>[],
        guilds: <AssistantGuildEntity>[],
        channels: <AssistantChannelEntity>[],
      );
      expect(donation.toMap()['accountUserId'], '42');
    });
  });

  group('AssistantEntityIndex', () {
    test('indexes donated voice channels', () {
      const AssistantEntityDonation donation = AssistantEntityDonation(
        friends: <AssistantFriendEntity>[],
        guilds: <AssistantGuildEntity>[],
        channels: <AssistantChannelEntity>[
          AssistantChannelEntity(
            id: 'v-1',
            name: 'Voice',
            kind: assistantChannelKindVoice,
            guildId: 'g-1',
          ),
        ],
      );
      final AssistantEntityIndex index = AssistantEntityIndex.fromDonation(
        donation,
      );
      expect(index.voiceChannelIds, <String>{'v-1'});
      expect(index.voiceChannelGuildIds, <String, String>{'v-1': 'g-1'});
    });
  });
}
