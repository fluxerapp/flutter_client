import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

enum ApiErrorAction {
  generic,
  sendFriendRequest,
  acceptFriendRequest,
  cancelFriendRequest,
  ignoreFriendRequest,
  removeFriend,
  blockUser,
  unblockUser,
  openDm,
  addToGroupDm,
  createGroupDmInvite,
  closeDm,
  leaveGroupDm,
}

sealed class ApiErrorPresentation {
  const ApiErrorPresentation({required this.body});

  final String body;
}

final class ApiErrorDialog extends ApiErrorPresentation {
  const ApiErrorDialog({
    required this.title,
    required super.body,
    required this.buttonLabel,
  });

  final String title;
  final String buttonLabel;
}

final class ApiErrorToast extends ApiErrorPresentation {
  const ApiErrorToast({required super.body});
}

typedef _ErrorCopy = ({String title, String body});

ApiErrorPresentation presentApiError(
  FluxerLocalizations l10n,
  ApiErrorAction action, {
  String? code,
  String? apiMessage,
}) {
  final _ErrorCopy copy =
      _accountStateCopy(l10n, action, code, apiMessage) ??
      _copyFor(l10n, action, code, apiMessage);
  return ApiErrorDialog(
    title: copy.title,
    body: copy.body,
    buttonLabel: l10n.uiUnderstood,
  );
}

_ErrorCopy _copyFor(
  FluxerLocalizations l10n,
  ApiErrorAction action,
  String? code,
  String? apiMessage,
) {
  return switch (action) {
    ApiErrorAction.generic => (
      title: l10n.errorSomethingWentWrongTitle,
      body: _apiMessageOr(apiMessage, l10n.errorUnexpectedTryAgain),
    ),
    ApiErrorAction.sendFriendRequest => (
      title: l10n.addFriendSendFailedTitle,
      body:
          _sendFriendRequestBody(l10n, code) ??
          _apiMessageOr(apiMessage, l10n.addFriendSendFailedMessage),
    ),
    ApiErrorAction.acceptFriendRequest => (
      title: l10n.friendAcceptFailedTitle,
      body: switch (code) {
        'UNKNOWN_USER' ||
        'FRIEND_REQUEST_BLOCKED' => l10n.friendAcceptUnavailable,
        'UNCLAIMED_ACCOUNT_CANNOT_ACCEPT_FRIEND_REQUESTS' =>
          l10n.friendAcceptClaimToAccept,
        'MAX_FRIENDS' => l10n.addFriendFriendsListFull,
        _ => l10n.friendAcceptFailedMessage,
      },
    ),
    ApiErrorAction.cancelFriendRequest => (
      title: l10n.friendCancelFailedTitle,
      body: l10n.addFriendCancelRequestFailed,
    ),
    ApiErrorAction.ignoreFriendRequest => (
      title: l10n.friendIgnoreFailedTitle,
      body: l10n.friendIgnoreFailedMessage,
    ),
    ApiErrorAction.removeFriend => (
      title: l10n.friendRemoveFailedTitle,
      body: l10n.friendRemoveFailedMessage,
    ),
    ApiErrorAction.blockUser => (
      title: l10n.userBlockFailedTitle,
      body: code == 'CANNOT_BLOCK_SYSTEM_USER'
          ? l10n.userBlockSystemAccount
          : l10n.userBlockFailedMessage,
    ),
    ApiErrorAction.unblockUser => (
      title: l10n.userUnblockFailedTitle,
      body: l10n.userUnblockFailedMessage,
    ),
    ApiErrorAction.openDm => _openDmCopy(l10n, code),
    ApiErrorAction.addToGroupDm => (
      title: l10n.groupDmAddFailedTitle,
      body: switch (code) {
        'MAX_GROUP_DM_RECIPIENTS' => l10n.groupDmGroupFull,
        'RATE_LIMITED' => l10n.groupDmRateLimited,
        _ => l10n.groupDmAddFriendFailed,
      },
    ),
    ApiErrorAction.createGroupDmInvite => (
      title: l10n.groupDmInviteFailedTitle,
      body: l10n.groupDmCreateInviteFailedBody,
    ),
    ApiErrorAction.closeDm => (
      title: l10n.dmCloseFailedTitle,
      body: l10n.guildSettingsRolesTryAgainInAMoment,
    ),
    ApiErrorAction.leaveGroupDm => (
      title: l10n.groupDmLeaveFailedTitle,
      body: l10n.guildSettingsRolesTryAgainInAMoment,
    ),
  };
}

const Set<ApiErrorAction> _accountStateActions = <ApiErrorAction>{
  ApiErrorAction.openDm,
  ApiErrorAction.addToGroupDm,
  ApiErrorAction.createGroupDmInvite,
};

_ErrorCopy? _accountStateCopy(
  FluxerLocalizations l10n,
  ApiErrorAction action,
  String? code,
  String? apiMessage,
) {
  if (!_accountStateActions.contains(action)) {
    return null;
  }
  return switch (code) {
    'ACCOUNT_LIMITED' => (
      title: l10n.errorMessagingPausedTitle,
      body: _apiMessageOr(apiMessage, l10n.errorMessagingPausedMessage),
    ),
    'NEW_CONVERSATIONS_LIMITED' => (
      title: l10n.dmErrorStartConversationTitle,
      body: _apiMessageOr(apiMessage, l10n.discoveryJoinErrorGenericMessage),
    ),
    'FEATURE_TEMPORARILY_DISABLED' => (
      title: l10n.errorFeatureDisabledTitle,
      body: l10n.errorFeatureDisabledMessage,
    ),
    _ => null,
  };
}

_ErrorCopy _openDmCopy(FluxerLocalizations l10n, String? code) {
  return switch (code) {
    'CANNOT_SEND_MESSAGES_TO_USER' => (
      title: l10n.createDmUnaddableBlocked,
      body: l10n.dmErrorCannotMessageMessage,
    ),
    'UNKNOWN_USER' => (
      title: l10n.createDmUnaddableUserNotFound,
      body: l10n.dmErrorUnknownUserMessage,
    ),
    'RATE_LIMITED' => (
      title: l10n.discoveryJoinErrorRateLimitTitle,
      body: l10n.discoveryJoinErrorRateLimitMessage,
    ),
    'UNCLAIMED_ACCOUNT_CANNOT_SEND_DIRECT_MESSAGES' => (
      title: l10n.addFriendClaimTitle,
      body: l10n.dmErrorClaimMessage,
    ),
    'DIRECT_MESSAGE_EMAIL_VERIFICATION_REQUIRED' => (
      title: l10n.addFriendVerifyTitle,
      body: l10n.dmErrorVerifyEmailMessage,
    ),
    'MAX_GROUP_DM_RECIPIENTS' => (
      title: l10n.dmErrorTooManyRecipientsTitle,
      body: l10n.dmErrorTooManyRecipientsMessage,
    ),
    'MAX_GROUP_DMS' => (
      title: l10n.dmErrorMaxGroupDmsTitle,
      body: l10n.dmErrorMaxGroupDmsMessage,
    ),
    _ => (
      title: l10n.dmErrorStartConversationTitle,
      body: l10n.discoveryJoinErrorGenericMessage,
    ),
  };
}

ApiErrorPresentation presentApiErrorFrom(
  FluxerLocalizations l10n,
  ApiErrorAction action,
  Object error,
) {
  final ApiException details = ApiException.from(error);
  return presentApiError(
    l10n,
    action,
    code: details.code,
    apiMessage: details.message,
  );
}

Future<void> showApiErrorFromRoot(ApiErrorAction action, Object error) async {
  final BuildContext? context = rootNavigatorKey.currentContext;
  if (context == null || !context.mounted) {
    return;
  }
  await showApiError(context, action, error);
}

Future<void> showApiError(
  BuildContext context,
  ApiErrorAction action,
  Object error,
) async {
  final ApiErrorPresentation presentation = presentApiErrorFrom(
    FluxerLocalizations.of(context),
    action,
    error,
  );
  switch (presentation) {
    case ApiErrorDialog():
      await showErrorDialog(
        context,
        title: presentation.title,
        body: presentation.body,
      );
    case ApiErrorToast():
      ProviderScope.containerOf(context, listen: false)
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: presentation.body,
              variant: FluxerToastVariant.danger,
            ),
          );
  }
}

Future<void> showErrorDialog(
  BuildContext context, {
  required String title,
  required String body,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerModal.show<void>(
    context,
    title: title,
    centered: true,
    useRootNavigator: true,
    builder: (BuildContext dialogContext, VoidCallback close) => Text(
      body,
      style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
    ),
    actionsBuilder: (void Function([void result]) pop) => [
      FluxerButton.primary(onPressed: () => pop(), label: l10n.uiUnderstood),
    ],
  );
}

String? _sendFriendRequestBody(FluxerLocalizations l10n, String? code) {
  return switch (code) {
    'FRIEND_REQUEST_BLOCKED' => l10n.addFriendNotAcceptingRequests,
    'CANNOT_SEND_FRIEND_REQUEST_TO_BLOCKED_USER' => l10n.addFriendUnblockFirst,
    'CANNOT_SEND_FRIEND_REQUEST_TO_SELF' => l10n.addFriendCannotSendToSelf,
    'ALREADY_FRIENDS' => l10n.addFriendAlreadyFriends,
    'UNCLAIMED_ACCOUNT_CANNOT_SEND_FRIEND_REQUESTS' =>
      l10n.addFriendClaimToSend,
    'FRIEND_REQUEST_EMAIL_VERIFICATION_REQUIRED' => l10n.addFriendVerifyToSend,
    'MAX_FRIENDS' => l10n.addFriendFriendsListFull,
    'NO_USERS_WITH_FLUXERTAG_EXIST' => l10n.addFriendNoUserFound,
    'DISCRIMINATOR_REQUIRED' => l10n.addFriendInvalidUsername,
    _ => null,
  };
}

String _apiMessageOr(String? apiMessage, String fallback) {
  if (apiMessage != null && apiMessage.isNotEmpty) {
    return apiMessage;
  }
  return fallback;
}
