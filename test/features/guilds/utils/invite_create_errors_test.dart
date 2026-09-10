import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/invite_create_errors.dart';
import '../../../helpers/test_l10n.dart';

DioException _dioWithCode(String code) {
  return DioException(
    requestOptions: RequestOptions(path: '/channels/1/invites'),
    response: Response<dynamic>(
      requestOptions: RequestOptions(path: '/channels/1/invites'),
      data: <String, dynamic>{'code': code},
    ),
  );
}

void main() {
  final FluxerLocalizations l10n = testL10n;

  group('inviteCreateFailureMessage', () {
    test('maps missing permissions', () {
      expect(
        inviteCreateFailureMessage(
          error: _dioWithCode('MISSING_PERMISSIONS'),
          l10n: l10n,
        ),
        l10n.guildNavbarCreateInviteMissingPermissions,
      );
    });

    test('maps max invites', () {
      expect(
        inviteCreateFailureMessage(
          error: _dioWithCode('MAX_INVITES'),
          l10n: l10n,
        ),
        l10n.guildNavbarCreateInviteMaxInvites,
      );
    });

    test('maps temporarily disabled', () {
      expect(
        inviteCreateFailureMessage(
          error: _dioWithCode('FEATURE_TEMPORARILY_DISABLED'),
          l10n: l10n,
        ),
        l10n.guildNavbarCreateInviteTemporarilyDisabled,
      );
    });

    test('maps invites disabled', () {
      expect(
        inviteCreateFailureMessage(
          error: _dioWithCode('INVITES_DISABLED'),
          l10n: l10n,
        ),
        l10n.guildNavbarInvitesPaused,
      );
    });

    test('uses guild fallback for unknown errors', () {
      expect(
        inviteCreateFailureMessage(error: Exception('nope'), l10n: l10n),
        l10n.guildNavbarCreateInviteFailed,
      );
    });

    test('uses group DM fallback', () {
      expect(
        inviteCreateFailureMessage(
          error: Exception('nope'),
          l10n: l10n,
          isGroupDm: true,
        ),
        l10n.groupDmCreateInviteFailedBody,
      );
    });
  });
}
