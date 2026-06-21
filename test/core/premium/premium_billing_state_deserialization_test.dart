import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_dart/models/premium_billing_state.dart';

/// Regression test: the live API returns `null` for `current_subscription_price`
/// and `pending_subscription_change` when the user has no active subscription /
/// no pending change. The spec marks those fields as required non-nullable refs,
/// so the generated SDK threw `CheckedFromJsonException`
/// (`Null is not a subtype of Map<String, dynamic>`) while deserializing the premium
/// state, leaving entitlements unrefreshed. The fields are now nullable.
void main() {
  group('PremiumBillingState.fromJson', () {
    Map<String, Object?> billingJson({
      Object? currentSubscriptionPrice,
      Object? pendingSubscriptionChange,
    }) => <String, Object?>{
      'stripe_customer_id': null,
      'current_subscription_price': currentSubscriptionPrice,
      'pending_subscription_change': pendingSubscriptionChange,
      'subscription': null,
      'invoices': <Object?>[],
      'invoices_has_more': false,
      'payment_methods': <Object?>[],
      'refund_eligibility': <String, Object?>{
        'eligible': false,
        'cancels_subscription': false,
      },
    };

    test('tolerates null current_subscription_price and '
        'pending_subscription_change', () {
      final PremiumBillingState state = PremiumBillingState.fromJson(
        billingJson(),
      );

      expect(state.currentSubscriptionPrice, isNull);
      expect(state.pendingSubscriptionChange, isNull);
      expect(state.invoices, isEmpty);
      expect(state.invoicesHasMore, isFalse);
      expect(state.refundEligibility.eligible, isFalse);
    });
  });
}
