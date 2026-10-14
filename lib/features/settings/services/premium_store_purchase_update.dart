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
    this.serverVerificationData = '',
  });

  final String productId;
  final PremiumStorePurchaseStatus status;
  final String? purchaseId;
  final bool pendingCompletePurchase;
  final String serverVerificationData;
}
