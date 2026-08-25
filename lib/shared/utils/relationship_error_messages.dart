import 'package:fluxer_app/features/friends/domain/friend_request_exception.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String getSendFriendRequestErrorMessage(
  FluxerLocalizations l10n, {
  String? code,
  String? apiMessage,
}) {
  final String? mappedMessage = switch (code) {
    'NO_USERS_WITH_FLUXERTAG_EXIST' => l10n.addFriendNoUserFound,
    'DISCRIMINATOR_REQUIRED' => l10n.addFriendInvalidUsername,
    'FRIEND_REQUEST_BLOCKED' => l10n.addFriendNotAcceptingRequests,
    'CANNOT_SEND_FRIEND_REQUEST_TO_BLOCKED_USER' => l10n.addFriendUnblockFirst,
    'CANNOT_SEND_FRIEND_REQUEST_TO_SELF' => l10n.addFriendCannotSendToSelf,
    'ALREADY_FRIENDS' => l10n.addFriendAlreadyFriends,
    'UNCLAIMED_ACCOUNT_CANNOT_SEND_FRIEND_REQUESTS' =>
      l10n.addFriendClaimToSend,
    'FRIEND_REQUEST_EMAIL_VERIFICATION_REQUIRED' => l10n.addFriendVerifyToSend,
    'MAX_FRIENDS' => l10n.addFriendFriendsListFull,
    _ => null,
  };
  if (mappedMessage != null) {
    return mappedMessage;
  }
  if (apiMessage != null && apiMessage.isNotEmpty) {
    return apiMessage;
  }
  return code ?? '';
}

String getSendFriendRequestErrorFromException(
  FluxerLocalizations l10n,
  FriendRequestException exception,
) {
  return getSendFriendRequestErrorMessage(
    l10n,
    code: exception.code,
    apiMessage: exception.message,
  );
}
