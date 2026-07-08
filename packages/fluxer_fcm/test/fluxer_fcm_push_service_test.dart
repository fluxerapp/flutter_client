import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/fluxer_fcm_push_service.dart';

void main() {
  late FluxerFcmPushService service;

  setUp(() {
    service = FluxerFcmPushService.instance;
    service.resetForTesting();
  });

  tearDown(() {
    service.resetForTesting();
  });

  group('setNotificationTapCallback', () {
    test('buffers a tap until a callback is registered', () {
      final List<Map<String, String>> actualPayloads = <Map<String, String>>[];
      final Map<String, String> inputPayload = <String, String>{
        'url': '/channels/1/2/3',
        'channel_id': '2',
      };

      service.dispatchTapPayloadForTesting(inputPayload);

      service.setNotificationTapCallback((Map<String, String> payload) {
        actualPayloads.add(payload);
      });

      expect(actualPayloads, <Map<String, String>>[inputPayload]);
    });

    test(
      'delivers a tap immediately when a callback is already registered',
      () {
        final List<Map<String, String>> actualPayloads =
            <Map<String, String>>[];
        final Map<String, String> inputPayload = <String, String>{
          'message_id': '42',
        };

        service.setNotificationTapCallback((Map<String, String> payload) {
          actualPayloads.add(payload);
        });

        service.dispatchTapPayloadForTesting(inputPayload);

        expect(actualPayloads, <Map<String, String>>[inputPayload]);
      },
    );

    test('flushes a buffered tap only once', () {
      final List<Map<String, String>> firstCallbackPayloads =
          <Map<String, String>>[];
      final List<Map<String, String>> secondCallbackPayloads =
          <Map<String, String>>[];
      final Map<String, String> inputPayload = <String, String>{'id': 'abc'};

      service.dispatchTapPayloadForTesting(inputPayload);

      service.setNotificationTapCallback((Map<String, String> payload) {
        firstCallbackPayloads.add(payload);
      });
      service.setNotificationTapCallback((Map<String, String> payload) {
        secondCallbackPayloads.add(payload);
      });

      expect(firstCallbackPayloads, <Map<String, String>>[inputPayload]);
      expect(secondCallbackPayloads, isEmpty);
    });

    test('keeps only the latest pending tap before registration', () {
      final List<Map<String, String>> actualPayloads = <Map<String, String>>[];
      final Map<String, String> firstPayload = <String, String>{'id': 'first'};
      final Map<String, String> secondPayload = <String, String>{
        'id': 'second',
      };

      service.dispatchTapPayloadForTesting(firstPayload);
      service.dispatchTapPayloadForTesting(secondPayload);

      service.setNotificationTapCallback((Map<String, String> payload) {
        actualPayloads.add(payload);
      });

      expect(actualPayloads, <Map<String, String>>[secondPayload]);
    });

    test('clears subscriptions on reset', () {
      service.resetForTesting();
      service.dispatchTapPayloadForTesting(<String, String>{'id': 'abc'});
      service.resetForTesting();
      final List<Map<String, String>> actualPayloads = <Map<String, String>>[];
      service.setNotificationTapCallback((Map<String, String> payload) {
        actualPayloads.add(payload);
      });
      expect(actualPayloads, isEmpty);
    });
  });

  group('foregroundMessageFilter', () {
    test('blocks foreground messages when filter returns false', () {
      service.setForegroundMessageFilter((FcmPushMessage message) => false);
      const FcmPushMessage message = FcmPushMessage(
        id: '1',
        title: 'Ping',
        body: 'Hello',
        payload: <String, String>{'channel_id': '456'},
      );
      expect(service.shouldProcessForegroundMessage(message), isFalse);
    });

    test('allows clear payloads through policy-style filter', () {
      service.setForegroundMessageFilter((FcmPushMessage message) {
        if (message.payload['type'] == 'notification_clear') {
          return true;
        }
        return false;
      });
      const FcmPushMessage clearMessage = FcmPushMessage(
        id: 'clear',
        title: null,
        body: null,
        payload: <String, String>{'type': 'notification_clear'},
      );
      const FcmPushMessage alertMessage = FcmPushMessage(
        id: 'alert',
        title: 'Ping',
        body: 'Hello',
        payload: <String, String>{'channel_id': '456'},
      );
      expect(service.shouldProcessForegroundMessage(clearMessage), isTrue);
      expect(service.shouldProcessForegroundMessage(alertMessage), isFalse);
    });

    test('clears foreground filter on reset', () {
      service.setForegroundMessageFilter((FcmPushMessage message) => false);
      service.resetForTesting();
      expect(service.foregroundMessageFilterForTesting, isNull);
    });
  });
}
