import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/auth/domain/required_action_flow.dart';

void main() {
  group('resolveRequiredActionFlow', () {
    test('returns null for empty actions', () {
      expect(resolveRequiredActionFlow(const <String>[]), isNull);
    });

    test('phone-only flow sets inbound flag', () {
      final RequiredActionFlow? flow = resolveRequiredActionFlow(const <String>[
        'REQUIRE_INBOUND_PHONE_VERIFICATION',
      ]);
      expect(flow, isNotNull);
      expect(flow!.mode, VerificationMode.phone);
      expect(flow.requiresInboundPhone, isTrue);
      expect(flow.phone?.requiresInboundPhone, isTrue);
    });

    test('email_or_phone mode when both channels clear all actions', () {
      final RequiredActionFlow? flow = resolveRequiredActionFlow(const <String>[
        'REQUIRE_VERIFIED_EMAIL_OR_VERIFIED_PHONE',
      ]);
      expect(flow, isNotNull);
      expect(flow!.mode, VerificationMode.emailOrPhone);
      expect(flow.email?.clearsAll, isTrue);
      expect(flow.phone?.clearsAll, isTrue);
      expect(flow.defaultTab, VerificationChannel.email);
    });

    test('email_and_phone mode when both required separately', () {
      final RequiredActionFlow? flow = resolveRequiredActionFlow(const <String>[
        'REQUIRE_VERIFIED_EMAIL',
        'REQUIRE_VERIFIED_PHONE',
      ]);
      expect(flow, isNotNull);
      expect(flow!.mode, VerificationMode.emailAndPhone);
      expect(flow.email?.clearsAll, isFalse);
      expect(flow.phone?.clearsAll, isFalse);
    });
  });
}
