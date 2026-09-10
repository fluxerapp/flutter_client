import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String inviteCreateFailureMessage({
  required Object error,
  required FluxerLocalizations l10n,
  bool isGroupDm = false,
}) {
  if (error is DioException) {
    final String? code = apiErrorCodeFromDioException(error);
    switch (code) {
      case 'MISSING_PERMISSIONS':
        return l10n.guildNavbarCreateInviteMissingPermissions;
      case 'MAX_INVITES':
        return l10n.guildNavbarCreateInviteMaxInvites;
      case 'FEATURE_TEMPORARILY_DISABLED':
        return l10n.guildNavbarCreateInviteTemporarilyDisabled;
      case 'INVITES_DISABLED':
        return l10n.guildNavbarInvitesPaused;
    }
  }
  if (isGroupDm) {
    return l10n.groupDmCreateInviteFailedBody;
  }
  return l10n.guildNavbarCreateInviteFailed;
}
