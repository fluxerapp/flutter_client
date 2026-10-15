import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';

void main() {
  Message msg(String content) => Message(
    id: '1',
    channelId: '2',
    authorId: '3',
    authorName: 'author',
    content: content,
    timestamp: DateTime.utc(2026),
  );

  setUp(InstanceEndpoints.resetToDefaults);

  tearDown(InstanceEndpoints.resetToDefaults);

  group('Message.gifts', () {
    test('returns empty when no gift links', () {
      expect(msg('hello world').gifts, isEmpty);
    });

    test('extracts codes from the instance gift base', () {
      expect(
        msg('claim https://fluxer.app/gift/ABCD-1234 please').gifts,
        <String>['ABCD-1234'],
      );
    });

    test('uses well-known gift base host and path', () {
      InstanceEndpoints.selfHosted = true;
      InstanceEndpoints.gift = 'https://gifts.example.test/claim';
      expect(msg('https://gifts.example.test/claim/SELFHOST1').gifts, <String>[
        'SELFHOST1',
      ]);
      expect(msg('https://fluxer.app/gift/OLD').gifts, isEmpty);
    });

    test('supports gift bases without a path segment', () {
      InstanceEndpoints.gift = 'https://gifts.example.test';
      expect(msg('https://gifts.example.test/CODE99').gifts, <String>[
        'CODE99',
      ]);
    });

    test('keeps the port of a self-hosted gift base', () {
      InstanceEndpoints.selfHosted = true;
      InstanceEndpoints.gift = 'http://192.168.0.145:38480/gift';
      InstanceEndpoints.webApp = 'http://192.168.0.145:38480';
      expect(
        msg('gift http://192.168.0.145:38480/gift/s3FS84mYpJYo8j3dqVY').gifts,
        <String>['s3FS84mYpJYo8j3dqVY'],
      );
      expect(msg('http://192.168.0.145:9999/gift/OTHERPORT').gifts, isEmpty);
    });

    test('matches the web app host and its hash route', () {
      InstanceEndpoints.selfHosted = true;
      InstanceEndpoints.gift = 'https://gifts.example.test';
      InstanceEndpoints.webApp = 'https://chat.example.test:8443';
      expect(
        msg(
          'https://chat.example.test:8443/gift/WEB1 '
          'https://chat.example.test:8443/#/gift/HASH1',
        ).gifts,
        <String>['WEB1', 'HASH1'],
      );
    });

    test('matches official gift hosts only off self-hosted instances', () {
      const content = 'https://fluxer.gift/OFFICIAL1';
      InstanceEndpoints.gift = 'https://gifts.example.test';
      expect(msg(content).gifts, <String>['OFFICIAL1']);
      InstanceEndpoints.selfHosted = true;
      expect(msg(content).gifts, isEmpty);
    });

    test('dedupes repeated codes', () {
      expect(
        msg('https://fluxer.app/gift/dup https://fluxer.app/gift/dup').gifts,
        <String>['dup'],
      );
    });

    test('caps at 10 codes', () {
      final content = List<String>.generate(
        15,
        (int i) => 'https://fluxer.app/gift/code$i',
      ).join(' ');
      expect(msg(content).gifts, hasLength(10));
    });

    test('ignores gift inside fenced code block', () {
      expect(msg('```\nhttps://fluxer.app/gift/abcd\n```').gifts, isEmpty);
    });

    test('ignores gift inside inline code', () {
      expect(msg('use `https://fluxer.app/gift/abcd` here').gifts, isEmpty);
    });

    test('still extracts gift outside code block', () {
      expect(
        msg(
          '```https://fluxer.app/gift/hidden``` '
          'open https://fluxer.app/gift/plain',
        ).gifts,
        <String>['plain'],
      );
    });
  });

  group('findGiftCodes', () {
    test('accepts an explicit gift base override', () {
      expect(
        findGiftCodes(
          'https://other.test/gift/XYZ',
          giftBaseUrl: 'https://other.test/gift',
        ),
        <String>['XYZ'],
      );
    });
  });

  group('extractGiftCode', () {
    test('returns bare code unchanged', () {
      expect(extractGiftCode('ABC-123'), 'ABC-123');
    });

    test('strips URL path', () {
      expect(extractGiftCode('https://fluxer.app/gift/ABC-123'), 'ABC-123');
    });
  });

  group('giftShareUrl', () {
    test('joins base and code without duplicate slashes', () {
      expect(
        giftShareUrl(giftBaseUrl: 'https://example.test/gift/', code: 'ABC'),
        'https://example.test/gift/ABC',
      );
    });
  });
}
