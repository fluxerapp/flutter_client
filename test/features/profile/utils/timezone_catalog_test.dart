import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/profile/utils/timezone_catalog.dart';

void main() {
  test('resolves offset for a known timezone', () {
    final int? offset = currentOffsetMinutesForTimezone('America/New_York');
    expect(offset, isNotNull);
    expect(offset!.abs(), greaterThan(0));
  });

  test('returns null when timezone is unset', () {
    expect(currentOffsetMinutesForTimezone(null), isNull);
    expect(currentOffsetMinutesForTimezone(''), isNull);
  });
}
