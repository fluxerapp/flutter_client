import 'package:fluxer_dart/export.dart';

const Map<String, Object> _featureDefaultsForOlderServers = <String, Object>{
  'account_identity': 'email',
  'tag_style': 'random',
  'phone_verification_enabled': false,
};

WellKnownFluxerResponse parseWellKnownFluxer(Map<String, dynamic> json) {
  final Object? features = json['features'];
  if (features is! Map) {
    return WellKnownFluxerResponse.fromJson(json);
  }
  final Map<String, dynamic> filledFeatures = Map<String, dynamic>.from(
    features,
  );
  _featureDefaultsForOlderServers.forEach((String key, Object value) {
    filledFeatures.putIfAbsent(key, () => value);
  });
  return WellKnownFluxerResponse.fromJson(<String, dynamic>{
    ...json,
    'features': filledFeatures,
  });
}
