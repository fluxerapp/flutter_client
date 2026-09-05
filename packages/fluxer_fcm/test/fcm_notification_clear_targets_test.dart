import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_notification_clear_targets.dart';

void main() {
  group('resolveFcmClearChannelTag', () {
    test('prefers channel_id', () {
      expect(
        resolveFcmClearChannelTag(<String, String>{
          'channel_id': '42',
          'notification_tag': 'channel:99',
        }),
        'channel:42',
      );
    });

    test('falls back to a channel-prefixed notification_tag', () {
      expect(
        resolveFcmClearChannelTag(<String, String>{
          'notification_tag': 'channel:99',
        }),
        'channel:99',
      );
    });

    test('falls back to a channel-prefixed tag', () {
      expect(
        resolveFcmClearChannelTag(<String, String>{'tag': 'channel:7:1234'}),
        'channel:7',
      );
    });

    test('returns null when no channel can be resolved', () {
      expect(resolveFcmClearChannelTag(<String, String>{}), isNull);
      expect(
        resolveFcmClearChannelTag(<String, String>{'tag': 'fluxer-message'}),
        isNull,
      );
      expect(
        resolveFcmClearChannelTag(<String, String>{'channel_id': ''}),
        isNull,
      );
    });
  });

  group('fcmClearTargetMatches', () {
    test('matches the exact channel tag', () {
      expect(
        fcmClearTargetMatches(channelTag: 'channel:5', activeTag: 'channel:5'),
        isTrue,
      );
    });

    test('matches a per-message tag under the channel', () {
      expect(
        fcmClearTargetMatches(
          channelTag: 'channel:5',
          activeTag: 'channel:5:9001',
        ),
        isTrue,
      );
    });

    test('matches on group key', () {
      expect(
        fcmClearTargetMatches(
          channelTag: 'channel:5',
          activeGroupKey: 'channel:5',
        ),
        isTrue,
      );
    });

    test('matches the literal tag the clear push carries', () {
      expect(
        fcmClearTargetMatches(
          channelTag: 'channel:5',
          literalTag: 'fluxer-message',
          activeTag: 'fluxer-message',
        ),
        isTrue,
      );
    });

    test('does not match a different channel', () {
      expect(
        fcmClearTargetMatches(channelTag: 'channel:5', activeTag: 'channel:50'),
        isFalse,
      );
      expect(
        fcmClearTargetMatches(channelTag: 'channel:5', activeTag: 'channel:6'),
        isFalse,
      );
    });

    test('does not match when nothing is tagged', () {
      expect(fcmClearTargetMatches(channelTag: 'channel:5'), isFalse);
      expect(
        fcmClearTargetMatches(channelTag: 'channel:5', activeTag: ''),
        isFalse,
      );
    });
  });
}
