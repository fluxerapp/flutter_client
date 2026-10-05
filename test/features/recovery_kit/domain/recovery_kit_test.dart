import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/recovery_kit/domain/recovery_kit.dart';

void main() {
  group('formatRecoveryKeyInput', () {
    test('groups a pasted key and drops separators and spaces', () {
      expect(
        formatRecoveryKeyInput('abcd efgh-jkmn–pqrs tvwx yz01 2345 6789'),
        'ABCD-EFGH-JKMN-PQRS-TVWX-YZ01-2345-6789',
      );
    });

    test('maps look-alike letters and stops at the key length', () {
      expect(
        formatRecoveryKeyInput('OIL0' * 9),
        '0110-0110-0110-0110-0110-0110-0110-0110',
      );
    });

    test('drops characters outside the alphabet', () {
      expect(formatRecoveryKeyInput('AU!B'), 'AB');
    });
  });

  test('isCompleteRecoveryKey needs all 32 characters', () {
    expect(isCompleteRecoveryKey('ABCD-EFGH'), isFalse);
    expect(
      isCompleteRecoveryKey('ABCD-EFGH-JKMN-PQRS-TVWX-YZ01-2345-6789'),
      isTrue,
    );
  });

  group('buildRecoverAccountUrl', () {
    test('points at the recover page', () {
      expect(
        buildRecoverAccountUrl(
          webAppBaseUrl: 'https://chat.example/',
        ).toString(),
        'https://chat.example/recover',
      );
    });

    test('puts the account and key in the fragment', () {
      final Uri url = buildRecoverAccountUrl(
        webAppBaseUrl: 'https://chat.example',
        account: 'alice',
        recoveryKey: 'ABCD-EFGH',
      );
      expect(url.path, '/recover');
      expect(url.query, isEmpty);
      expect(Uri.splitQueryString(url.fragment), {
        'username': 'alice',
        'key': 'ABCD-EFGH',
      });
    });
  });
}
