import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_dart/export.dart';

GeolocationResponse _response({
  String? countryCode,
  String? regionCode,
  List<GeoEntry> restricted = const <GeoEntry>[],
  List<GeoEntry> blocked = const <GeoEntry>[],
}) {
  return GeolocationResponse(
    countryCode: countryCode,
    regionCode: regionCode,
    latitude: null,
    longitude: null,
    ageRestrictedGeos: restricted,
    ageBlockedGeos: blocked,
  );
}

void main() {
  test('a restricted country is restricted', () {
    expect(
      resolveMatureGeoStatus(
        _response(
          countryCode: 'GB',
          restricted: const <GeoEntry>[
            GeoEntry(countryCode: 'GB', regionCode: null),
          ],
        ),
      ),
      MatureGeoStatus.restricted,
    );
  });

  test('a blocked country is blocked', () {
    expect(
      resolveMatureGeoStatus(
        _response(
          countryCode: 'BR',
          blocked: const <GeoEntry>[
            GeoEntry(countryCode: 'BR', regionCode: null),
          ],
        ),
      ),
      MatureGeoStatus.blocked,
    );
  });

  test('a region-scoped entry needs a matching region', () {
    const List<GeoEntry> restricted = <GeoEntry>[
      GeoEntry(countryCode: 'US', regionCode: 'TX'),
    ];
    expect(
      resolveMatureGeoStatus(
        _response(countryCode: 'US', regionCode: 'CA', restricted: restricted),
      ),
      MatureGeoStatus.none,
    );
    expect(
      resolveMatureGeoStatus(
        _response(countryCode: 'US', regionCode: 'TX', restricted: restricted),
      ),
      MatureGeoStatus.restricted,
    );
  });

  test('an unknown country is not locked', () {
    expect(
      resolveMatureGeoStatus(
        _response(
          blocked: const <GeoEntry>[
            GeoEntry(countryCode: 'BR', regionCode: null),
          ],
        ),
      ),
      MatureGeoStatus.none,
    );
  });
}
