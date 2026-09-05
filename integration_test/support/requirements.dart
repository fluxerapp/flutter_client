import 'package:flutter_test/flutter_test.dart';

import 'test_config.dart';

void requireTestLabCredentials() {
  if (!IntegrationTestConfig.hasCredentials) {
    fail('Set TEST_LAB_EMAIL and TEST_LAB_PASSWORD dart-defines');
  }
}

void requireGuildChannelConfig() {
  if (!IntegrationTestConfig.hasGuildChannel) {
    fail('Set TEST_LAB_GUILD_ID and TEST_LAB_CHANNEL_ID dart-defines');
  }
}
