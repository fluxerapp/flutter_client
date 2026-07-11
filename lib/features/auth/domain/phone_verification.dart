enum PhoneVerificationStep { phone, code, inboundWaiting }

class InboundChallengeState {
  const InboundChallengeState({
    required this.challengeCode,
    required this.ourNumber,
    required this.expiresAt,
    this.reason,
  });

  final String challengeCode;
  final String ourNumber;
  final DateTime expiresAt;
  final String? reason;
}
