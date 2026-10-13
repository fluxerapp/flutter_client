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
