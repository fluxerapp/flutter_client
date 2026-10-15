import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/observability/measure_log_redaction.dart';
import 'package:test/test.dart';

const String _channelId = '1558633981610557440';
const String _gatewayUrl =
    'wss://gateway.chat.example.org:443/?v=1&encoding=json';
const String _chatPageFile = 'package:fluxer_app/features/chat/chat_page.dart';

void main() {
  group('redactMeasureHttpUrl', () {
    test('drops host, port and query', () {
      expect(
        redactMeasureHttpUrl(
          'https://secret.example.com:8443/api/v9/users/@me?token=abc',
        ),
        'https://instance/api/v9/users/@me',
      );
    });

    test('replaces snowflake ids in paths', () {
      expect(
        redactMeasureHttpUrl(
          'https://chat.example.org/api/v1/channels/1558633981610557440/'
          'messages/1558635549802102784',
        ),
        'https://instance/api/v1/channels/:id/messages/:id',
      );
    });

    test('replaces invite codes, emoji and tokens', () {
      expect(
        redactMeasureHttpUrl(
          'https://chat.example.org/api/v1/invites/fluxer-hq',
        ),
        'https://instance/api/v1/invites/:value',
      );
      expect(
        redactMeasureHttpUrl(
          'https://chat.example.org/api/v1/channels/1558633981610557440/'
          'messages/1558635549802102784/reactions/party/@me',
        ),
        'https://instance/api/v1/channels/:id/messages/:id/reactions/:value/@me',
      );
      expect(
        redactMeasureHttpUrl(
          'https://chat.example.org/api/v1/webhooks/1558633981610557440/'
          'aB3dE5fG7hI9',
        ),
        'https://instance/api/v1/webhooks/:id/:value',
      );
    });
  });

  group('scrubForMeasure', () {
    test('scrubs http and websocket urls', () {
      expect(
        scrubForMeasure('GET https://my.guild.host/channels failed'),
        'GET https://instance/channels failed',
      );
      expect(
        scrubForMeasure(
          "WebSocketException: Connection to '$_gatewayUrl' was not "
          'upgraded to websocket',
        ),
        "WebSocketException: Connection to 'wss://instance/' was not "
        'upgraded to websocket',
      );
      expect(
        scrubForMeasure('ws://192.168.0.145:38480/gateway closed'),
        'ws://instance/gateway closed',
      );
    });

    test('scrubs bare host mentions', () {
      expect(
        scrubForMeasure(
          "SocketException: Failed host lookup: 'chat.example.org' "
          '(OS Error: nodename nor servname provided, errno = 8)',
        ),
        "SocketException: Failed host lookup: 'instance' "
        '(OS Error: nodename nor servname provided, errno = 8)',
      );
      expect(
        scrubForMeasure(
          'SocketException: Connection refused (OS Error: Connection '
          'refused, errno = 61), address = 192.168.0.145, port = 51234',
        ),
        'SocketException: Connection refused (OS Error: Connection '
        'refused, errno = 61), address = instance, port = 51234',
      );
      expect(
        scrubForMeasure('Instance discovery failed for chat.example.org'),
        'Instance discovery failed for instance',
      );
      expect(
        scrubForMeasure('Could not reach [fd00::1] or 10.0.0.2'),
        'Could not reach instance or instance',
      );
      expect(
        scrubForMeasure('HandshakeException: subject: CN=chat.example.org'),
        'HandshakeException: subject: CN=instance',
      );
    });

    test('scrubs snowflake ids and email addresses', () {
      expect(
        scrubForMeasure(
          'Message 1558635549802102784 not found for someone@example.com',
        ),
        'Message :id not found for email',
      );
    });

    test('keeps Dart stack frames readable', () {
      const String frame = '#0      ChatPage.build ($_chatPageFile:42:7)';
      expect(scrubForMeasure(frame), frame);
      expect(
        scrubForMeasure('#1      _rootRun (dart:async/zone.dart:1525:47)'),
        '#1      _rootRun (dart:async/zone.dart:1525:47)',
      );
    });
  });

  test('uncaught error details are scrubbed with their stack', () {
    final FlutterErrorDetails details = sanitizeErrorDetailsForMeasure(
      FlutterErrorDetails(
        exception: Exception(
          "Failed host lookup: 'chat.example.org' for channel "
          '1558633981610557440',
        ),
        stack: StackTrace.fromString(
          '#0      fetch (https://chat.example.org/api/v1/channels/$_channelId)',
        ),
        library: 'platform_dispatcher',
      ),
    );

    expect(
      details.exception.toString(),
      "Exception: Failed host lookup: 'instance' for channel :id",
    );
    expect(
      details.stack.toString(),
      '#0      fetch (https://instance/api/v1/channels/:id)',
    );
    expect(details.library, 'platform_dispatcher');
  });
}
