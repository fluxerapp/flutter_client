typedef FcmCiphertextHandler =
    Future<void> Function({
      required String ciphertextBase64,
      required bool backgroundMode,
    });

class FcmCiphertextHooks {
  FcmCiphertextHooks._();

  static FcmCiphertextHandler? onCiphertext;

  static void resetForTesting() {
    onCiphertext = null;
  }
}
