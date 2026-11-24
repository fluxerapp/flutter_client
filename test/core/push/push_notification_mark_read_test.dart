import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/notification/mark_read.dart';
import 'package:fluxer_app/core/push/notification/reply.dart';

void main() {
  const Map<String, String> payload = <String, String>{
    'channel_id': 'c/1',
    'message_id': 'm',
    'target_user_id': 'user-b',
  };
  const PushReplyAccount accountB = PushReplyAccount(
    token: 'token-b',
    apiBaseUrl: 'https://example.test/v1',
  );

  test('acks the notification message as the notification account', () async {
    String? lookedUpUser;
    PushMarkReadSend? sent;
    final PushMarkReadResult result = await sendPushNotificationMarkRead(
      payload: payload,
      lookupAccount: (String userId) async {
        lookedUpUser = userId;
        return accountB;
      },
      post: (PushMarkReadSend send) async {
        sent = send;
      },
    );
    expect(result, PushMarkReadResult.sent);
    expect(lookedUpUser, 'user-b');
    expect(sent?.token, 'token-b');
    expect(sent?.apiBaseUrl, 'https://example.test/v1');
    expect(sent?.path, '/channels/c%2F1/messages/m/ack');
  });

  test('skips clears and incomplete payloads', () async {
    var lookups = 0;
    Future<PushReplyAccount?> lookup(String userId) async {
      lookups++;
      return accountB;
    }

    final List<Map<String, String>> payloads = <Map<String, String>>[
      <String, String>{...payload, 'type': 'notification_clear'},
      for (final String key in payload.keys)
        <String, String>{...payload}..remove(key),
    ];
    for (final Map<String, String> incomplete in payloads) {
      expect(
        await sendPushNotificationMarkRead(
          payload: incomplete,
          lookupAccount: lookup,
        ),
        PushMarkReadResult.skipped,
      );
    }
    expect(lookups, 0);
  });

  test('fails when that account has no token', () async {
    var posted = false;
    final PushMarkReadResult result = await sendPushNotificationMarkRead(
      payload: payload,
      lookupAccount: (String userId) async => null,
      post: (PushMarkReadSend send) async {
        posted = true;
      },
    );
    expect(result, PushMarkReadResult.failed);
    expect(posted, isFalse);
  });

  test('fails when the account lookup throws', () async {
    expect(
      await sendPushNotificationMarkRead(
        payload: payload,
        lookupAccount: (String userId) async => throw StateError('locked'),
      ),
      PushMarkReadResult.failed,
    );
  });

  test('fails when the request throws', () async {
    expect(
      await sendPushNotificationMarkRead(
        payload: payload,
        lookupAccount: (String userId) async => accountB,
        post: (PushMarkReadSend send) async => throw StateError('offline'),
      ),
      PushMarkReadResult.failed,
    );
  });

  test('both notification actions are recognised', () {
    expect(isPushNotificationActionId(kPushReplyActionId), isTrue);
    expect(isPushNotificationActionId(kPushMarkReadActionId), isTrue);
    expect(isPushNotificationActionId(null), isFalse);
  });
}
