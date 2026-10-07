import 'package:flutter_test/flutter_test.dart';
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
}
