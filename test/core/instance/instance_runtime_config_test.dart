import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';

import '../../helpers/well_known_fixture.dart';

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

  group('account identity', () {
    InstanceRuntimeConfig configFor({
      String? accountIdentity,
      String? tagStyle,
    }) {
      return InstanceRuntimeConfig.fromWellKnown(
        wellKnownFixture(
          media: 'https://chat.example/media',
          staticCdn: 'https://chat.example/static',
          accountIdentity: accountIdentity,
          tagStyle: tagStyle,
        ),
      );
    }

    test('reads an older server without the fields as email with tags', () {
      final InstanceRuntimeConfig config = configFor();
      expect(config.usernameSignIn, isFalse);
      expect(config.uniqueUsernames, isFalse);
    });

    test('username sign-in always hides tags', () {
      final InstanceRuntimeConfig config = configFor(
        accountIdentity: 'username',
        tagStyle: 'random',
      );
      expect(config.usernameSignIn, isTrue);
      expect(config.uniqueUsernames, isTrue);
    });

    test('email sign-in with no tags hides tags', () {
      final InstanceRuntimeConfig config = configFor(
        accountIdentity: 'email',
        tagStyle: 'none',
      );
      expect(config.usernameSignIn, isFalse);
      expect(config.uniqueUsernames, isTrue);
    });

    test('email sign-in with random tags keeps tags', () {
      final InstanceRuntimeConfig config = configFor(
        accountIdentity: 'email',
        tagStyle: 'random',
      );
      expect(config.uniqueUsernames, isFalse);
    });

    test('unknown values from a newer server fall back to email with tags', () {
      final InstanceRuntimeConfig config = configFor(
        accountIdentity: 'passkey',
        tagStyle: 'emoji',
      );
      expect(config.usernameSignIn, isFalse);
      expect(config.uniqueUsernames, isFalse);
    });
  });
}
