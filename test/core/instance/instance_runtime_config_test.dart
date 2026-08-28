import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';

void main() {
  group('parseCssHexColor', () {
    test('parses 6-digit hex', () {
      expect(parseCssHexColor('#5865F2'), const Color(0xFF5865F2));
    });

    test('parses 3-digit hex', () {
      expect(parseCssHexColor('#abc'), const Color(0xFFAABBCC));
    });

    test('parses 8-digit CSS rgba hex', () {
      expect(parseCssHexColor('#5865F2FF'), const Color(0xFF5865F2));
      expect(parseCssHexColor('#5865F280'), const Color(0x805865F2));
    });

    test('returns null for invalid values', () {
      expect(parseCssHexColor(''), isNull);
      expect(parseCssHexColor('blue'), isNull);
    });
  });

  group('parseRegistrationUrlCode', () {
    test('reads the registration_url query parameter', () {
      expect(
        parseRegistrationUrlCode(
          'https://chat.example/register?registration_url=abc-123',
        ),
        'abc-123',
      );
    });

    test('accepts host-only input', () {
      expect(
        parseRegistrationUrlCode('chat.example/?registration_url=invite'),
        'invite',
      );
    });

    test('returns null when missing', () {
      expect(parseRegistrationUrlCode('https://chat.example'), isNull);
    });
  });

  group('InstanceRuntimeConfig', () {
    test('defaults product name', () {
      expect(
        InstanceRuntimeConfig.defaults.productName,
        InstanceConstants.defaultProductName,
      );
    });

    test('blocks public register when closed unless a URL code is present', () {
      const InstanceRuntimeConfig closed = InstanceRuntimeConfig(
        productName: 'Acme',
        selfHosted: true,
        stripeEnabled: false,
        emailsEnabled: false,
        voiceEnabled: true,
        presignedAttachmentUploads: false,
        gifEnabled: false,
        blueskyEnabled: false,
        gifAttributionRequired: false,
        singleCommunity: true,
        singleCommunityGuildId: 'g1',
        directMessagesDisabled: true,
        registrationClosed: true,
        adminRegistrationUrlsEnabled: true,
        collectDateOfBirth: false,
      );
      expect(closed.canPublicRegister(), isFalse);
      expect(closed.canPublicRegister(registrationUrlCode: 'code'), isTrue);
      expect(
        const InstanceRuntimeConfig(
          productName: 'Acme',
          selfHosted: true,
          stripeEnabled: false,
          emailsEnabled: false,
          voiceEnabled: true,
          presignedAttachmentUploads: false,
          gifEnabled: false,
          blueskyEnabled: false,
          gifAttributionRequired: false,
          singleCommunity: true,
          singleCommunityGuildId: 'g1',
          directMessagesDisabled: true,
          registrationClosed: true,
          adminRegistrationUrlsEnabled: false,
          collectDateOfBirth: false,
        ).canPublicRegister(registrationUrlCode: 'code'),
        isFalse,
      );
      expect(closed.isStockCommunityGuild('g1'), isTrue);
      expect(closed.isStockCommunityGuild('g2'), isFalse);
      expect(closed.giftsEnabled, isFalse);
    });

    test('treats equal configs as equal', () {
      expect(
        InstanceRuntimeConfig.defaults,
        InstanceRuntimeConfig.fromWellKnown(null),
      );
    });
  });
}
