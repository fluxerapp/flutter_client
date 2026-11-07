import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mature_geo_provider.g.dart';

MatureGeoStatus resolveMatureGeoStatus(GeolocationResponse response) {
  final String? country = response.countryCode;
  if (country == null) {
    return MatureGeoStatus.none;
  }
  bool matches(GeoEntry entry) =>
      entry.countryCode == country &&
      (entry.regionCode == null || entry.regionCode == response.regionCode);
  if (response.ageBlockedGeos.any(matches)) {
    return MatureGeoStatus.blocked;
  }
  if (response.ageRestrictedGeos.any(matches)) {
    return MatureGeoStatus.restricted;
  }
  return MatureGeoStatus.none;
}

@Riverpod(keepAlive: true)
Future<MatureGeoStatus> matureGeoStatus(Ref ref) async {
  ref.watch(activeInstanceProvider);
  try {
    final GeolocationResponse response = await ref
        .read(fluxerClientProvider)
        .geolocation
        .getClientGeolocation();
    return resolveMatureGeoStatus(response);
  } on Object catch (error, stackTrace) {
    talker.warning('Failed to resolve the client location', error, stackTrace);
    return MatureGeoStatus.none;
  }
}
