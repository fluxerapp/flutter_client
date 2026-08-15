import 'package:material_ui/material_ui.dart';

/// Configuration options for the captcha widget.
///
/// Supports both Cloudflare Turnstile and hCaptcha. Fields marked as
/// "Turnstile only" are ignored when using hCaptcha.
class CaptchaOptions {
  CaptchaOptions({
    this.size = CaptchaSize.normal,
    this.theme = CaptchaTheme.auto,
    this.language = 'auto',
    this.retryAutomatically = true,
    this.retryInterval = const Duration(milliseconds: 8000),
    this.refreshExpired = CaptchaRefreshExpired.auto,
    this.refreshTimeout = CaptchaRefreshTimeout.auto,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.animationDuration = const Duration(milliseconds: 500),
    this.curves = Curves.linearToEaseOut,
  });

  /// The widget size.
  final CaptchaSize size;

  /// The widget theme. [CaptchaTheme.auto] adjusts based on device brightness.
  final CaptchaTheme theme;

  /// The language to display. ISO 639-1 code (e.g., 'en', 'en-US') or 'auto'.
  final String language;

  /// Whether to automatically retry on challenge failure. Turnstile only.
  final bool retryAutomatically;

  /// Interval between retry attempts. Must be between 0 and 900000ms.
  /// Turnstile only.
  final Duration retryInterval;

  /// Token refresh behavior on expiry. Turnstile only.
  final CaptchaRefreshExpired refreshExpired;

  /// Widget behavior on interactive challenge timeout. Turnstile only.
  final CaptchaRefreshTimeout refreshTimeout;

  /// Border radius applied to the widget.
  final BorderRadiusGeometry? borderRadius;

  /// Duration of show/hide animations.
  final Duration? animationDuration;

  /// Curve applied to show/hide animations.
  final Curve? curves;
}

/// Defines the sizes for the captcha widget.
enum CaptchaSize {
  /// Normal size for the widget.
  ///
  /// Dimensions: width 300px, height 65px.
  normal(300, 65),

  /// Compact size for the widget.
  ///
  /// Dimensions: width 150px, height 140px.
  compact(150, 140),

  /// Flexible size for the widget.
  ///
  /// Width is flexible (min 300px), and height is fixed at 65px.
  flexible(double.maxFinite, 65);

  /// Creates a [CaptchaSize] with the specified [width] and [height].
  const CaptchaSize(this.width, this.height);

  /// The width of the widget.
  final double width;

  /// The height of the widget.
  final double height;
}

/// Theme for the captcha widget.
enum CaptchaTheme {
  /// Automatically selected based on device brightness.
  auto,
  dark,
  light,
}

/// Refresh behavior when the token expires. Turnstile only.
enum CaptchaRefreshExpired { auto, manual, never }

/// Refresh behavior when the token times out. Turnstile only.
enum CaptchaRefreshTimeout { auto, manual, never }
