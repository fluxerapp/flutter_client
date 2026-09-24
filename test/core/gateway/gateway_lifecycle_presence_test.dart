import 'package:fluxer_app/core/gateway/gateway_lifecycle_presence.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:test/test.dart';

void main() {
  group('buildGatewayLifecyclePresence', () {
    test('marks AFK when the mobile app is backgrounded', () {
      final GatewayPresence presence = buildGatewayLifecyclePresence(
        isForeground: false,
        status: 'online',
        mobile: true,
        markAfkWhenBackgrounded: true,
      );
      expect(presence.afk, isTrue);
      expect(presence.status, 'online');
      expect(presence.mobile, isTrue);
    });

    test('clears AFK in the foreground', () {
      final GatewayPresence presence = buildGatewayLifecyclePresence(
        isForeground: true,
        status: 'dnd',
        mobile: true,
        markAfkWhenBackgrounded: true,
      );
      expect(presence.afk, isFalse);
      expect(presence.status, 'dnd');
    });

    test('does not mark AFK when the platform should stay engaged', () {
      final GatewayPresence presence = buildGatewayLifecyclePresence(
        isForeground: false,
        status: 'online',
        mobile: false,
        markAfkWhenBackgrounded: false,
      );
      expect(presence.afk, isFalse);
    });
  });

  group('gatewayCustomStatusFromSettings', () {
    test('maps a visible custom status', () {
      final GatewayCustomStatus? custom = gatewayCustomStatusFromSettings(
        const CustomStatusResponse(text: 'coding', emojiAnimated: false),
      );
      expect(custom, isNotNull);
      expect(custom!.text, 'coding');
    });

    test('drops empty custom status', () {
      expect(
        gatewayCustomStatusFromSettings(
          const CustomStatusResponse(text: '  ', emojiAnimated: false),
        ),
        isNull,
      );
    });
  });

  group('sameGatewayPresence', () {
    test('treats identical payloads as equal', () {
      const GatewayPresence a = GatewayPresence(
        status: 'online',
        afk: true,
        mobile: true,
      );
      const GatewayPresence b = GatewayPresence(
        status: 'online',
        afk: true,
        mobile: true,
      );
      expect(sameGatewayPresence(a, b), isTrue);
    });

    test('detects AFK changes', () {
      const GatewayPresence a = GatewayPresence(
        status: 'online',
        afk: true,
        mobile: true,
      );
      const GatewayPresence b = GatewayPresence(status: 'online', mobile: true);
      expect(sameGatewayPresence(a, b), isFalse);
    });
  });
}
