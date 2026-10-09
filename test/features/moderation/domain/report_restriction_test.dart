import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/moderation/domain/report_restriction.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';

UserSettingsViewState _settings({
  required bool isProfileLoaded,
  String? email,
  bool verified = false,
}) {
  return UserSettingsViewState(
    userId: 'u1',
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
    isProfileLoaded: isProfileLoaded,
    email: email,
    verified: verified,
  );
}

void main() {
  test('an unknown profile is not restricted', () {
    expect(getReportRestriction(_settings(isProfileLoaded: false)), isNull);
    expect(
      getReportRestriction(
        _settings(isProfileLoaded: false, email: 'tester@example.com'),
      ),
      isNull,
    );
  });

  test('an account without an email is unclaimed', () {
    expect(
      getReportRestriction(_settings(isProfileLoaded: true)),
      ReportRestriction.unclaimed,
    );
    expect(
      getReportRestriction(_settings(isProfileLoaded: true, verified: true)),
      ReportRestriction.unclaimed,
    );
  });

  test('a claimed account with an unverified email is unverified', () {
    expect(
      getReportRestriction(
        _settings(isProfileLoaded: true, email: 'tester@example.com'),
      ),
      ReportRestriction.unverified,
    );
  });

  test('a claimed and verified account is not restricted', () {
    expect(
      getReportRestriction(
        _settings(
          isProfileLoaded: true,
          email: 'tester@example.com',
          verified: true,
        ),
      ),
      isNull,
    );
  });
}
