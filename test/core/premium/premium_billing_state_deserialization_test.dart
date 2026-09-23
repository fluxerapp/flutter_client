import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/premium/premium_state_response_json.dart';
import 'package:fluxer_dart/models/premium_state_response.dart';
import 'package:fluxer_dart/models/premium_state_response_billing.dart';

/// Regression: the live API returns null for several billing fields when the user
/// has no active subscription. The generated SDK still requires some of them as
/// objects, so we normalize payloads before deserialization.
void main() {
  group('premium state billing JSON', () {
    Map<String, Object?> billingJson({
      Object? currentSubscriptionPrice,
      Object? pendingSubscriptionChange,
      Object? listPriceSwitch,
    }) => <String, Object?>{
      'stripe_customer_id': null,
      'current_subscription_price': currentSubscriptionPrice,
      'pending_subscription_change': pendingSubscriptionChange,
      'list_price_switch': listPriceSwitch,
      'subscription': null,
      'invoices': <Object?>[],
      'invoices_has_more': false,
      'payment_methods': <Object?>[],
      'refund_eligibility': <String, Object?>{
        'eligible': false,
        'cancels_subscription': false,
      },
    };

    Map<String, dynamic> premiumStateJson(Map<String, Object?> billing) =>
        <String, dynamic>{
          'actual': <String, Object?>{
            'premium_type': 0,
            'premium_since': null,
            'premium_until': null,
            'premium_will_cancel': false,
            'premium_billing_cycle': null,
            'premium_lifetime_sequence': null,
            'premium_grace_ends_at': null,
            'has_active_paid_premium': false,
            'is_visionary': false,
            'has_ever_purchased': false,
          },
          'effective': <String, Object?>{
            'is_premium': false,
            'premium_type': 0,
            'premium_since': null,
            'premium_until': null,
            'premium_will_cancel': false,
            'premium_billing_cycle': null,
            'premium_lifetime_sequence': null,
            'premium_grace_ends_at': null,
            'premium_enabled_override': false,
            'premium_purchase_disabled': false,
            'premium_perks_disabled': false,
            'self_hosted': false,
            'bot': false,
          },
          'billing': billing,
          'pricing': <String, Object?>{},
        };

    test('tolerates null current_subscription_price and '
        'pending_subscription_change', () {
      final PremiumStateResponseBilling state =
          PremiumStateResponseBilling.fromJson(
            normalizePremiumStateBillingJson(
              Map<String, dynamic>.from(billingJson()),
            ),
          );

      expect(state.currentSubscriptionPrice.toJson(), isEmpty);
      expect(state.pendingSubscriptionChange.toJson(), isEmpty);
      expect(state.invoices, isEmpty);
      expect(state.invoicesHasMore, isFalse);
      expect(state.refundEligibility.eligible, isFalse);
    });

    test('fills a default list_price_switch when absent or null', () {
      final PremiumStateResponse state = decodePremiumStateResponse(
        premiumStateJson(billingJson()),
      );

      expect(state.billing.listPriceSwitch.available, isFalse);
      expect(state.billing.listPriceSwitch.pending, isFalse);
    });
  });
}
