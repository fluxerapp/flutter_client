// ignore_for_file: do_not_use_environment

class IntegrationTestConfig {
  const IntegrationTestConfig._();

  static const String email = String.fromEnvironment('TEST_LAB_EMAIL');
  static const String password = String.fromEnvironment('TEST_LAB_PASSWORD');
  static const String guildId = String.fromEnvironment('TEST_LAB_GUILD_ID');
  static const String channelId = String.fromEnvironment('TEST_LAB_CHANNEL_ID');
  static const String dmChannelId = String.fromEnvironment(
    'TEST_LAB_DM_CHANNEL_ID',
  );

  static bool get hasCredentials => email.isNotEmpty && password.isNotEmpty;

  static bool get hasGuildChannel => guildId.isNotEmpty && channelId.isNotEmpty;

  static bool get hasDmChannel => dmChannelId.isNotEmpty;

  static const Duration shellTimeout = Duration(minutes: 3);
  static const Duration navigationTimeout = Duration(seconds: 30);
}
