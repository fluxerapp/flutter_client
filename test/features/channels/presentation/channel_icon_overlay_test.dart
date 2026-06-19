import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';

void main() {
  group('resolveChannelIconAccessOverlay', () {
    Channel makeVoiceChannel({
      String? permissionOverwritesJson,
      bool nsfw = false,
    }) {
      return Channel(
        id: 'voice-1',
        guildId: 'guild-1',
        name: 'Test Voice',
        type: ChannelType.voice,
        nsfw: nsfw,
        permissionOverwritesJson: permissionOverwritesJson,
      );
    }

    test('returns none for channel without overwrites and no connect bits', () {
      final overlay = resolveChannelIconAccessOverlay(
        channel: makeVoiceChannel(),
      );
      expect(overlay, equals(ChannelIconAccessOverlay.none));
    });

    test(
      'returns noConnect for voice channel when channel-local deny CONNECT',
      () {
        final channel = makeVoiceChannel();
        final int deniedBits = Permission.viewChannel.value; // no connect bit

        final overlay = resolveChannelIconAccessOverlay(
          channel: channel,
          canConnectPermissionBits: deniedBits,
        );
        expect(overlay, equals(ChannelIconAccessOverlay.noConnect));
      },
    );

    test(
      'returns none for voice channel when channel-local allows CONNECT',
      () {
        final channel = makeVoiceChannel();
        final int allowedBits =
            Permission.viewChannel.value | Permission.connect.value;

        final overlay = resolveChannelIconAccessOverlay(
          channel: channel,
          canConnectPermissionBits: allowedBits,
        );
        expect(overlay, equals(ChannelIconAccessOverlay.none));
      },
    );

    test(
      'returns none for voice channel with @everyone deny CONNECT when user has role grant',
      () {
        // @everyone deny CONNECT on the channel itself
        final String everyoneDenyConnect =
            '''
[{"id":"guild-1","type":0,"allow":"0","deny":"${Permission.connect.value}"}]
''';
        final channel = Channel(
          id: 'voice-locked',
          guildId: 'guild-1',
          name: 'Locked Voice',
          type: ChannelType.voice,
          permissionOverwritesJson: everyoneDenyConnect,
        );
        // User has CONNECT via role (channel-local allows)
        final int allowedBits = Permission.connect.value;

        final overlay = resolveChannelIconAccessOverlay(
          channel: channel,
          canConnectPermissionBits: allowedBits,
        );
        expect(overlay, equals(ChannelIconAccessOverlay.none));
      },
    );

    test(
      'returns noConnect when channel-level overwrites deny user connect',
      () {
        // Channel @everyone denies CONNECT (no role grant)
        final String everyoneDenyConnect =
            '''
[{"id":"guild-1","type":0,"allow":"0","deny":"${Permission.connect.value}"}]
''';
        final channel = Channel(
          id: 'voice-nodenyc',
          guildId: 'guild-1',
          name: 'Deny Voice',
          type: ChannelType.voice,
          permissionOverwritesJson: everyoneDenyConnect,
        );

        final overlay = resolveChannelIconAccessOverlay(
          channel: channel,
          canConnectPermissionBits: 0, // no permissions
        );
        expect(overlay, equals(ChannelIconAccessOverlay.noConnect));
      },
    );

    test('category returns none regardless of permission bits', () {
      const channel = Channel(
        id: 'cat-1',
        guildId: 'guild-1',
        name: 'Category',
        type: ChannelType.category,
      );
      final overlay = resolveChannelIconAccessOverlay(
        channel: channel,
        effectivePermissionBits: 0,
        canConnectPermissionBits: 0,
      );
      expect(overlay, equals(ChannelIconAccessOverlay.none));
    });

    test(
      'falls back to effectivePermissionBits when canConnectPermissionBits is null',
      () {
        final channel = makeVoiceChannel();
        // Deny via effective bits (backward compat path)
        final int deniedBits = Permission.viewChannel.value;

        final overlay = resolveChannelIconAccessOverlay(
          channel: channel,
          effectivePermissionBits: deniedBits,
        );
        // CONNECT is evaluated using effectivePermissionBits when canConnect is null
        expect(overlay, equals(ChannelIconAccessOverlay.noConnect));
      },
    );

    test('voice noConnect triggers with denied connect bits', () {
      final channel = makeVoiceChannel();
      final int deniedBits = Permission.viewChannel.value;

      final overlay = resolveChannelIconAccessOverlay(
        channel: channel,
        canConnectPermissionBits: deniedBits,
      );
      expect(overlay, equals(ChannelIconAccessOverlay.noConnect));
    });
  });
}
