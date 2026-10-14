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
  acceptInvite,
  joinDiscoveryCommunity,
  leaveCommunity,
  createInvite,
  revokeInvite,
  sendMessage,
  editMessage,
  deleteMessage,
  deleteAttachment,
  updateAltText,
  addReaction,
  removeReaction,
  pinMessage,
  unpinMessage,
  saveBookmark,
  saveFavoriteMedia,
  deleteChannel,
  deleteCategory,
  updateChannelPermissions,
  saveChannelSettings,
  deleteCommunity,
  createWebhook,
  updateWebhook,
}

enum ApiErrorChannelKind { guild, dm, groupDm }

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

const String _sudoModeRequiredCode = 'SUDO_MODE_REQUIRED';

typedef _ErrorCopy = ({String title, String body});

ApiErrorPresentation presentApiError(
  FluxerLocalizations l10n,
  ApiErrorAction action, {
  String? code,
  String? apiMessage,
  ApiErrorDetails details = const ApiErrorDetails(),
}) {
  final ApiErrorToast? toast = _toastFor(l10n, action, code, apiMessage);
  if (toast != null) {
    return toast;
  }
  final _ErrorCopy copy =
      _accountStateCopy(l10n, action, code, apiMessage) ??
      _copyFor(l10n, action, code, apiMessage, details);
  return ApiErrorDialog(
    title: copy.title,
    body: copy.body,
    buttonLabel: l10n.uiUnderstood,
  );
}

final class ApiErrorDetails {
  const ApiErrorDetails({
    this.channelKind = ApiErrorChannelKind.guild,
    this.subject,
    this.count,
    this.selfHosted = false,
  });

  final ApiErrorChannelKind channelKind;
  final bool selfHosted;
  final String? subject;
  final int? count;
}

ApiErrorToast? _toastFor(
  FluxerLocalizations l10n,
  ApiErrorAction action,
  String? code,
  String? apiMessage,
) {
  if (action != ApiErrorAction.addReaction &&
      action != ApiErrorAction.removeReaction) {
    return null;
  }
  return switch (code) {
    'MAX_REACTIONS' ||
    'ACCOUNT_LIMITED' ||
    'NEW_CONVERSATIONS_LIMITED' ||
    'FEATURE_TEMPORARILY_DISABLED' => null,
    'COMMUNICATION_DISABLED' => ApiErrorToast(body: l10n.chatReactionTimedOut),
    _ => ApiErrorToast(
      body: _apiMessageOr(
        apiMessage,
        action == ApiErrorAction.addReaction
            ? l10n.chatReactionAddFailed
            : l10n.chatReactionRemoveFailed,
      ),
    ),
  };
}

_ErrorCopy _copyFor(
  FluxerLocalizations l10n,
  ApiErrorAction action,
  String? code,
  String? apiMessage,
  ApiErrorDetails details,
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
    ApiErrorAction.acceptInvite => _acceptInviteCopy(l10n, code),
    ApiErrorAction.joinDiscoveryCommunity => _joinDiscoveryCopy(l10n, code),
    ApiErrorAction.leaveCommunity => (
      title: l10n.leaveCommunityFailedTitle,
      body: l10n.leaveCommunityFailedMessage,
    ),
    ApiErrorAction.revokeInvite => (
      title: l10n.guildSettingsInvitesRevokeFailedTitle,
      body: l10n.guildSettingsInvitesRevokeFailedDescription,
    ),
    ApiErrorAction.sendMessage => _sendMessageCopy(l10n, code, details),
    ApiErrorAction.editMessage => switch (code) {
      'RATE_LIMITED' => (
        title: l10n.chatEditTooQuickTitle,
        body: l10n.chatRateLimitedMessage,
      ),
      'CONTENT_BLOCKED' => (
        title: l10n.errorContentBlockedTitle,
        body: details.selfHosted
            ? l10n.errorContentBlockedSelfHostedMessage
            : l10n.errorContentBlockedMessage,
      ),
      _ => (title: l10n.chatEditFailed, body: l10n.chatEditFailedMessage),
    },
    ApiErrorAction.deleteMessage =>
      code == 'RATE_LIMITED'
          ? (
              title: l10n.chatDeleteTooQuickTitle,
              body: l10n.chatDeleteTooQuickMessage,
            )
          : (
              title: l10n.chatDeleteFailedTitle,
              body: l10n.chatDeleteFailedMessage,
            ),
    ApiErrorAction.deleteAttachment => (
      title: l10n.chatAttachmentDeleteFailedTitle,
      body: l10n.chatAttachmentDeleteFailedMessage,
    ),
    ApiErrorAction.updateAltText => (
      title: l10n.chatAltTextFailedTitle,
      body: switch (code) {
        'UNKNOWN_MESSAGE' => l10n.chatAltTextUnknownMessage,
        'MISSING_PERMISSIONS' => l10n.chatAltTextNoPermission,
        'FEATURE_TEMPORARILY_DISABLED' => l10n.chatAltTextUnavailable,
        _ => l10n.chatAltTextFailedMessage,
      },
    ),
    ApiErrorAction.addReaction || ApiErrorAction.removeReaction => (
      title: l10n.chatHeavyTitle,
      body: l10n.chatReactionsHeavyMessage,
    ),
    ApiErrorAction.pinMessage || ApiErrorAction.unpinMessage => (
      title: action == ApiErrorAction.pinMessage
          ? l10n.chatPinFailedTitle
          : l10n.chatUnpinFailedTitle,
      body: code == 'CANNOT_SEND_MESSAGES_TO_USER'
          ? l10n.chatPinBlockedMessage
          : l10n.chatPinFailedMessage,
    ),
    ApiErrorAction.saveBookmark =>
      code == 'MAX_BOOKMARKS'
          ? (
              title: l10n.bookmarkLimitTitle,
              body: l10n.bookmarkLimitMessage(details.count ?? 0),
            )
          : (
              title: l10n.errorSomethingWentWrongTitle,
              body: _apiMessageOr(apiMessage, l10n.errorUnexpectedTryAgain),
            ),
    ApiErrorAction.saveFavoriteMedia =>
      code == 'MAX_FAVORITE_MEMES'
          ? (
              title: l10n.savedMediaLimitTitle,
              body: l10n.savedMediaLimitMessage(details.count ?? 0),
            )
          : (
              title: l10n.errorSomethingWentWrongTitle,
              body: _apiMessageOr(apiMessage, l10n.savedMediaSaveError),
            ),
    ApiErrorAction.deleteChannel => _deleteChannelCopy(
      l10n,
      code,
      isCategory: false,
    ),
    ApiErrorAction.deleteCategory => _deleteChannelCopy(
      l10n,
      code,
      isCategory: true,
    ),
    ApiErrorAction.updateChannelPermissions => (
      title: l10n.channelPermissionsUpdateFailedTitle,
      body: l10n.guildSettingsRolesTryAgainInAMoment,
    ),
    ApiErrorAction.saveChannelSettings => (
      title: l10n.channelSettingsSaveFailedTitle,
      body: _apiMessageOr(apiMessage, l10n.guildSettingsRolesTryAgainInAMoment),
    ),
    ApiErrorAction.deleteCommunity => (
      title: l10n.guildSettingsDeleteCommunityFailed,
      body: _apiMessageOr(apiMessage, l10n.errorUnexpectedTryAgain),
    ),
    ApiErrorAction.createWebhook => (
      title: l10n.channelSettingsWebhookCreateFailed,
      body: l10n.guildSettingsRolesTryAgainInAMoment,
    ),
    ApiErrorAction.updateWebhook => (
      title: l10n.errorSomethingWentWrongTitle,
      body: _apiMessageOr(apiMessage, l10n.guildSettingsWebhooksUpdateFailed),
    ),
    ApiErrorAction.createInvite => (
      title: l10n.groupDmInviteFailedTitle,
      body: switch (code) {
        'MISSING_PERMISSIONS' => l10n.guildNavbarCreateInviteMissingPermissions,
        'MAX_INVITES' => l10n.guildNavbarCreateInviteMaxInvites,
        'INVITES_DISABLED' => l10n.guildNavbarInvitesPaused,
        _ => l10n.guildNavbarCreateInviteFailed,
      },
    ),
  };
}

_ErrorCopy _sendMessageCopy(
  FluxerLocalizations l10n,
  String? code,
  ApiErrorDetails details,
) {
  return switch (code) {
    'RATE_LIMITED' => (
      title: l10n.chatSendTooQuickTitle,
      body: l10n.chatRateLimitedMessage,
    ),
    'EXPLICIT_CONTENT_CANNOT_BE_SENT' => (
      title: l10n.chatMatureContentTitle,
      body: switch (details.channelKind) {
        ApiErrorChannelKind.guild => l10n.chatMatureContentGuildMessage,
        ApiErrorChannelKind.dm => l10n.chatMatureContentDmMessage(
          details.subject ?? '',
        ),
        ApiErrorChannelKind.groupDm => l10n.chatMatureContentGroupDmMessage,
      },
    ),
    'FILE_SIZE_TOO_LARGE' => (
      title: l10n.chatFileTooLargeTitle,
      body: l10n.chatFileTooLargeMessage(details.subject ?? ''),
    ),
    _ => (title: l10n.chatSendFailedTitle, body: l10n.chatSendFailedMessage),
  };
}

_ErrorCopy _deleteChannelCopy(
  FluxerLocalizations l10n,
  String? code, {
  required bool isCategory,
}) {
  return switch (code) {
    'MISSING_PERMISSIONS' => (
      title: l10n.channelDeleteNoPermissionTitle,
      body: isCategory
          ? l10n.channelDeleteNoPermissionCategory
          : l10n.channelDeleteNoPermissionChannel,
    ),
    'UNKNOWN_CHANNEL' => (
      title: l10n.channelDeleteAlreadyDeletedTitle,
      body: isCategory
          ? l10n.channelDeleteAlreadyDeletedCategory
          : l10n.channelDeleteAlreadyDeletedChannel,
    ),
    'RATE_LIMITED' => (
      title: l10n.discoveryJoinErrorRateLimitTitle,
      body: l10n.discoveryJoinErrorRateLimitMessage,
    ),
    _ => (
      title: isCategory
          ? l10n.channelDeleteFailedCategoryTitle
          : l10n.channelDeleteFailedChannelTitle,
      body: l10n.discoveryJoinErrorGenericMessage,
    ),
  };
}

_ErrorCopy _acceptInviteCopy(FluxerLocalizations l10n, String? code) {
  return switch (code) {
    'INVITES_DISABLED' => (
      title: l10n.inviteAcceptInvitesPaused,
      body: l10n.inviteErrorPausedMessage,
    ),
    'MAX_GUILD_MEMBERS' => (
      title: l10n.inviteErrorAtCapacityTitle,
      body: l10n.inviteErrorAtCapacityMessage,
    ),
    'MAX_GUILDS' => (
      title: l10n.discoveryJoinErrorMaxGuildsTitle,
      body: l10n.discoveryJoinErrorMaxGuildsMessage,
    ),
    'TEMPORARY_INVITE_REQUIRES_PRESENCE' => (
      title: l10n.inviteErrorPresenceTitle,
      body: l10n.inviteErrorPresenceMessage,
    ),
    'USER_BANNED_FROM_GUILD' => (
      title: l10n.inviteErrorBannedTitle,
      body: l10n.inviteErrorBannedMessage,
    ),
    'USER_IP_BANNED_FROM_GUILD' => (
      title: l10n.inviteErrorIpBannedTitle,
      body: l10n.inviteErrorIpBannedMessage,
    ),
    'UNCLAIMED_ACCOUNT_CANNOT_JOIN_GROUP_DMS' => (
      title: l10n.inviteErrorClaimTitle,
      body: l10n.inviteErrorClaimMessage,
    ),
    'UNKNOWN_INVITE' => (
      title: l10n.inviteAcceptNotFoundTitle,
      body: l10n.inviteAcceptNotFoundDescription,
    ),
    _ => (
      title: l10n.inviteJoinFailedTitle,
      body: l10n.guildSettingsRolesTryAgainInAMoment,
    ),
  };
}

_ErrorCopy _joinDiscoveryCopy(FluxerLocalizations l10n, String? code) {
  return switch (code) {
    'MAX_GUILD_MEMBERS' => (
      title: l10n.discoveryJoinErrorFullTitle,
      body: l10n.discoveryJoinErrorFullMessage,
    ),
    'MAX_GUILDS' => (
      title: l10n.discoveryJoinErrorMaxGuildsTitle,
      body: l10n.discoveryJoinErrorMaxGuildsMessage,
    ),
    'USER_BANNED_FROM_GUILD' || 'USER_IP_BANNED_FROM_GUILD' => (
      title: l10n.discoveryJoinErrorBannedTitle,
      body: l10n.discoveryJoinErrorBannedMessage,
    ),
    'DISCOVERY_NOT_DISCOVERABLE' ||
    'DISCOVERY_DISABLED' ||
    'INVITES_DISABLED' => (
      title: l10n.discoveryJoinErrorNotAvailableTitle,
      body: l10n.discoveryJoinErrorNotAvailableMessage,
    ),
    'RATE_LIMITED' => (
      title: l10n.discoveryJoinErrorRateLimitTitle,
      body: l10n.discoveryJoinErrorRateLimitMessage,
    ),
    _ => (
      title: l10n.discoveryJoinErrorGenericTitle,
      body: l10n.discoveryJoinErrorGenericMessage,
    ),
  };
}

const Set<ApiErrorAction> _accountStateActions = <ApiErrorAction>{
  ApiErrorAction.sendMessage,
  ApiErrorAction.editMessage,
  ApiErrorAction.deleteMessage,
  ApiErrorAction.addReaction,
  ApiErrorAction.removeReaction,
  ApiErrorAction.openDm,
  ApiErrorAction.addToGroupDm,
  ApiErrorAction.createGroupDmInvite,
  ApiErrorAction.acceptInvite,
  ApiErrorAction.joinDiscoveryCommunity,
  ApiErrorAction.createInvite,
  ApiErrorAction.createWebhook,
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
  Object error, {
  ApiErrorDetails details = const ApiErrorDetails(),
}) {
  final ApiException exception = ApiException.from(error);
  return presentApiError(
    l10n,
    action,
    code: exception.code,
    apiMessage: exception.message,
    details: details,
  );
}

Future<void> showApiErrorFromRoot(
  ApiErrorAction action,
  Object error, {
  ApiErrorDetails details = const ApiErrorDetails(),
}) async {
  final BuildContext? context = rootNavigatorKey.currentContext;
  if (context == null || !context.mounted) {
    return;
  }
  await showApiError(context, action, error, details: details);
}

Future<void> showApiError(
  BuildContext context,
  ApiErrorAction action,
  Object error, {
  ApiErrorDetails details = const ApiErrorDetails(),
}) async {
  if (ApiException.from(error).code == _sudoModeRequiredCode) {
    return;
  }
  final ApiErrorPresentation presentation = presentApiErrorFrom(
    FluxerLocalizations.of(context),
    action,
    error,
    details: details,
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
