/// Transition durations and curves for shell and content routes.
abstract final class ShellTransitionPolicy {
  static const Duration shellEntryDuration = Duration(milliseconds: 150);

  static const Duration channelSlideDuration = Duration(milliseconds: 200);

  static const Duration rootOverlayFadeDuration = Duration(milliseconds: 150);

  static const double channelOutgoingParallaxFactor = 0.3;
}
