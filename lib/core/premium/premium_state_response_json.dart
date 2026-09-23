import 'package:fluxer_dart/models/premium_state_response.dart';

/// Normalizes premium state JSON before SDK deserialization.
///
/// The API may omit or null out billing fields that the generated SDK still
/// treats as required objects. Patch those payloads until dart_sdk catches up.
Map<String, dynamic> normalizePremiumStateResponseJson(
  Map<String, dynamic> json,
) {
  final Object? billing = json['billing'];
  if (billing is! Map) {
    return json;
  }
  final Map<String, dynamic> normalized = Map<String, dynamic>.from(json);
  normalized['billing'] = normalizePremiumStateBillingJson(
    Map<String, dynamic>.from(billing),
  );
  return normalized;
}

Map<String, dynamic> normalizePremiumStateBillingJson(
  Map<String, dynamic> billing,
) {
  final Map<String, dynamic> normalized = Map<String, dynamic>.from(billing);
  if (normalized['current_subscription_price'] == null) {
    normalized['current_subscription_price'] = <String, dynamic>{};
  }
  if (normalized['pending_subscription_change'] == null) {
    normalized['pending_subscription_change'] = <String, dynamic>{};
  }
  if (normalized['list_price_switch'] == null) {
    normalized['list_price_switch'] = <String, dynamic>{
      'available': false,
      'pending': false,
    };
  }
  return normalized;
}

PremiumStateResponse decodePremiumStateResponse(Map<String, dynamic> json) {
  return PremiumStateResponse.fromJson(normalizePremiumStateResponseJson(json));
}
