class MfaChallenge {
  final String ticket;
  final bool totp;
  final bool webauthn;

  const MfaChallenge({
    required this.ticket,
    required this.totp,
    required this.webauthn,
  });

  /// Returns the number of MFA methods this client supports.
  int get methodCount => [totp, webauthn].where((m) => m).length;

  /// Whether the user needs to pick between methods.
  bool get hasMultipleMethods => methodCount > 1;
}
