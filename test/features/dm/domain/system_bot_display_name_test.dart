import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';

void main() {
  group('resolveSystemBotDisplayName', () {
    test('returns productName for the system bot user id', () {
      expect(
        resolveSystemBotDisplayName(
          userId: fluxerBotUserId,
          fallbackName: 'Fluxer',
          productName: 'Acme',
        ),
        'Acme',
      );
    });

    test('keeps the existing name for other users', () {
      expect(
        resolveSystemBotDisplayName(
          userId: '42',
          fallbackName: 'Ada',
          productName: 'Acme',
        ),
        'Ada',
      );
    });
  });
}
