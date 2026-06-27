import 'package:fluxer_captcha/src/captcha_provider.dart';
import 'package:fluxer_captcha/src/widget/captcha_options.dart';

/// Shared assertion logic for Turnstile-specific constructor parameters.
abstract final class CaptchaValidation {
  static void assertTurnstileParams({
    required CaptchaProvider provider,
    required CaptchaOptions options,
    String? action,
    String? cData,
  }) {
    if (provider != CaptchaProvider.turnstile) return;

    if (action != null) {
      final hasValidActionCharacters = RegExp(
        r'^[a-zA-Z0-9_-]*$',
      ).hasMatch(action);
      assert(
        action.length <= 32 && hasValidActionCharacters,
        'action must contain up to 32 alphanumeric characters '
        'including _ and -.',
      );
    }

    if (cData != null) {
      final hasValidCDataCharacters = RegExp(
        r'^[a-zA-Z0-9_-]*$',
      ).hasMatch(cData);
      assert(
        cData.length <= 255 && hasValidCDataCharacters,
        'cData must contain up to 255 alphanumeric characters '
        'including _ and -.',
      );
    }

    assert(
      options.retryInterval.inMilliseconds > 0 &&
          options.retryInterval.inMilliseconds <= 900000,
      'retryInterval must be between 1 and 900000 milliseconds.',
    );
  }
}
