import 'dart:convert';

import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_access_icon_flags.dart';
import 'package:test/test.dart';

void main() {
  group('isChannelEveryonePrivateForIcon', () {
    const String guildId = 'guild-1';

    test('returns false when guildId is empty', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.text,
          guildId: '',
          permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
            <String, Object>{
              'id': guildId,
              'type': 0,
              'allow': '0',
              'deny': '1024',
            },
          ]),
        ),
        isFalse,
      );
    });

    test('returns false when json is null', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.text,
          guildId: guildId,
          permissionOverwritesJson: null,
        ),
        isFalse,
      );
    });

    test('text channel: everyone fully denies VIEW_CHANNEL', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.text,
          guildId: guildId,
          permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
            <String, Object>{
              'id': guildId,
              'type': 0,
              'allow': '0',
              'deny': '1024',
            },
          ]),
        ),
        isTrue,
      );
    });

    test('text channel: everyone partially denies VIEW_CHANNEL', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.text,
          guildId: guildId,
          permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
            <String, Object>{
              'id': guildId,
              'type': 0,
              'allow': '0',
              'deny': '512',
            },
          ]),
        ),
        isFalse,
      );
    });

    test(
      'text channel: member overwrite denies view but everyone does not',
      () {
        expect(
          isChannelEveryonePrivateForIcon(
            type: ChannelType.text,
            guildId: guildId,
            permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
              <String, Object>{
                'id': 'user-9',
                'type': 1,
                'allow': '0',
                'deny': '1024',
              },
            ]),
          ),
          isFalse,
        );
      },
    );

    test('link channel uses VIEW_CHANNEL deny on everyone', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.link,
          guildId: guildId,
          permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
            <String, Object>{
              'id': guildId,
              'type': 0,
              'allow': '0',
              'deny': '1024',
            },
          ]),
        ),
        isTrue,
      );
    });

    test('voice channel: everyone fully denies CONNECT', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.voice,
          guildId: guildId,
          permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
            <String, Object>{
              'id': guildId,
              'type': 0,
              'allow': '0',
              'deny': '1048576',
            },
          ]),
        ),
        isTrue,
      );
    });

    test('stage channel: everyone fully denies CONNECT', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.stage,
          guildId: guildId,
          permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
            <String, Object>{
              'id': guildId,
              'type': 0,
              'allow': '0',
              'deny': '1048576',
            },
          ]),
        ),
        isTrue,
      );
    });

    test('category ignores overwrites', () {
      expect(
        isChannelEveryonePrivateForIcon(
          type: ChannelType.category,
          guildId: guildId,
          permissionOverwritesJson: jsonEncode(<Map<String, Object>>[
            <String, Object>{
              'id': guildId,
              'type': 0,
              'allow': '0',
              'deny': '1024',
            },
          ]),
        ),
        isFalse,
      );
    });
  });
}
