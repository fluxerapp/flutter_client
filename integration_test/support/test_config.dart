// ignore_for_file: do_not_use_environment

class IntegrationTestConfig {
  const IntegrationTestConfig._();

  static const String email = String.fromEnvironment('TEST_LAB_EMAIL');
  static const String password = String.fromEnvironment('TEST_LAB_PASSWORD');
  static const String guildId = String.fromEnvironment('TEST_LAB_GUILD_ID');
  static const String channelId = String.fromEnvironment('TEST_LAB_CHANNEL_ID');

  static const String perfStreams = String.fromEnvironment(
    'PERF_STREAMS',
    defaultValue: 'Dart,Embedder,GC',
  );
  static const int perfFlingCount = int.fromEnvironment(
    'PERF_FLING_COUNT',
    defaultValue: 3,
  );

  /// `bool.fromEnvironment` only accepts the literal `true`, so these read the
  /// raw string and treat `1` as set too.
  static bool _flag(String value) => value == '1' || value == 'true';

  /// Set to keep the semantics tree alive while tracing, matching a device
  /// with an accessibility service attached.
  static bool get perfSemantics =>
      _flag(const String.fromEnvironment('PERF_SEMANTICS'));

  /// `builds`, `layouts` or `both`/`1`: which per-widget timeline events to
  /// emit while tracing. Each element costs an event, so `both` truncates the
  /// traced window on the ~32k VM ring.
  static String get perfWidgetEvents {
    const String raw = String.fromEnvironment('PERF_WIDGET_EVENTS');
    return raw == '1' || raw == 'true' ? 'both' : raw;
  }

  static const String personalNotesTitle = 'Personal notes';

  static bool get hasCredentials => email.isNotEmpty && password.isNotEmpty;

  static bool get hasGuildChannel => guildId.isNotEmpty && channelId.isNotEmpty;

  static const Duration shellTimeout = Duration(minutes: 3);
  static const Duration navigationTimeout = Duration(seconds: 30);
}
