enum PremiumStorePurchaseStatus {
  pending,
  purchased,
  restored,
  error,
  canceled,
}

class PremiumStorePurchaseUpdate {
  const PremiumStorePurchaseUpdate({
    required this.productId,
    required this.status,
    this.purchaseId,
    this.pendingCompletePurchase = false,
  });

  final String productId;
  final PremiumStorePurchaseStatus status;
  final String? purchaseId;
  final bool pendingCompletePurchase;
}
