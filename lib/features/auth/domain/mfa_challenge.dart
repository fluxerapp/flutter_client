class MfaChallenge {
  final String ticket;
  final bool totp;
  final bool webauthn;

  const MfaChallenge({
    required this.ticket,
    required this.totp,
    required this.webauthn,
  });

  int get methodCount => [totp, webauthn].where((m) => m).length;

  bool get hasMultipleMethods => methodCount > 1;
}
