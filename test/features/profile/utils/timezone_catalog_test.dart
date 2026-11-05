import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/profile/utils/supported_timezone_ids.dart';
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

  test('offers every zone the server accepts and nothing else', () {
    final List<String> ids = buildTimezoneCatalogOptions()
        .map((TimezoneCatalogOption option) => option.id)
        .toList();

    expect(ids.toSet(), kSupportedTimezoneIds);
    expect(ids, contains('Europe/Stockholm'));
    expect(ids, isNot(contains('Etc/GMT+12')));
  });

  test('city names are searchable with spaces or underscores', () {
    String searchTextFor(String id) => buildTimezoneCatalogOptions()
        .firstWhere((TimezoneCatalogOption option) => option.id == id)
        .searchText
        .toLowerCase();

    expect(searchTextFor('Europe/Stockholm'), contains('stock'));
    expect(searchTextFor('America/New_York'), contains('new york'));
    expect(searchTextFor('America/New_York'), contains('new_york'));
  });
}
