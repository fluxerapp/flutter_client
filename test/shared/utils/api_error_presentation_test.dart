import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/core/router/shell_navigator_keys.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';

import '../../helpers/test_l10n.dart';

ApiErrorDialog _dialog(String? code, {String? apiMessage}) {
  return _dialogFor(
    ApiErrorAction.sendFriendRequest,
    code,
    apiMessage: apiMessage,
  );
}

ApiErrorDialog _dialogFor(
  ApiErrorAction action,
  String? code, {
  String? apiMessage,
}) {
  final ApiErrorPresentation presentation = presentApiError(
    testL10n,
    action,
    code: code,
    apiMessage: apiMessage,
  );
  expect(presentation, isA<ApiErrorDialog>());
  final ApiErrorDialog dialog = presentation as ApiErrorDialog;
  expect(dialog.buttonLabel, 'Understood');
  return dialog;
}

void _expectCopy(
  ApiErrorAction action,
  String? code,
  String title,
  String body, {
  String? apiMessage,
}) {
  final ApiErrorDialog dialog = _dialogFor(
    action,
    code,
    apiMessage: apiMessage,
  );
  expect(dialog.title, title, reason: '$action $code title');
  expect(dialog.body, body, reason: '$action $code body');
}

void main() {
  group('send friend request errors', () {
    const Map<String, String> expectedBodies = <String, String>{
      'FRIEND_REQUEST_BLOCKED':
          "They're not accepting friend requests right now.",
      'CANNOT_SEND_FRIEND_REQUEST_TO_BLOCKED_USER':
          'Unblock them first to send a friend request.',
      'CANNOT_SEND_FRIEND_REQUEST_TO_SELF':
          "You can't send a friend request to yourself.",
      'ALREADY_FRIENDS': "You're already friends with this user.",
      'UNCLAIMED_ACCOUNT_CANNOT_SEND_FRIEND_REQUESTS':
          'Finish signing up to send friend requests.',
      'FRIEND_REQUEST_EMAIL_VERIFICATION_REQUIRED':
          'Verify your email before sending friend requests.',
      'MAX_FRIENDS':
          'Your friends list is full, or theirs is. Remove someone and try again.',
      'NO_USERS_WITH_FLUXERTAG_EXIST': 'No user found with that username.',
      'DISCRIMINATOR_REQUIRED': 'Enter a valid username (Username#0000).',
    };

    for (final MapEntry<String, String> entry in expectedBodies.entries) {
      test('${entry.key} shows the web dialog copy', () {
        final ApiErrorDialog dialog = _dialog(
          entry.key,
          apiMessage: 'Server text that should not win',
        );
        expect(dialog.title, "Couldn't send friend request");
        expect(dialog.body, entry.value);
        expect(dialog.buttonLabel, 'Understood');
      });
    }

    test('unknown code without a message falls back to a generic body', () {
      final ApiErrorDialog dialog = _dialog('SOMETHING_NEW');
      expect(dialog.title, "Couldn't send friend request");
      expect(dialog.body, "Couldn't send the friend request. Try again.");
      expect(dialog.buttonLabel, 'Understood');
    });

    test('missing code and message falls back to a generic body', () {
      expect(
        _dialog(null, apiMessage: '').body,
        "Couldn't send the friend request. Try again.",
      );
    });

    test('unknown code uses the localized API message when present', () {
      expect(
        _dialog(
          'NEW_CONVERSATIONS_LIMITED',
          apiMessage: 'You are starting new conversations too quickly.',
        ).body,
        'You are starting new conversations too quickly.',
      );
    });

    test('reads code and message from a DioException', () {
      final RequestOptions options = RequestOptions(path: '/users/@me');
      final DioException error = DioException(
        requestOptions: options,
        response: Response<Map<String, dynamic>>(
          requestOptions: options,
          statusCode: 400,
          data: <String, dynamic>{
            'code': 'FRIEND_REQUEST_BLOCKED',
            'message': 'Friend request blocked',
          },
        ),
      );
      final ApiErrorPresentation presentation = presentApiErrorFrom(
        testL10n,
        ApiErrorAction.sendFriendRequest,
        error,
      );
      expect(
        presentation.body,
        "They're not accepting friend requests right now.",
      );
    });

    test('reads code from an ApiException', () {
      expect(
        presentApiErrorFrom(
          testL10n,
          ApiErrorAction.sendFriendRequest,
          const ApiException(code: 'ALREADY_FRIENDS'),
        ).body,
        "You're already friends with this user.",
      );
    });

    test('a non-API error gets the generic body', () {
      expect(
        presentApiErrorFrom(
          testL10n,
          ApiErrorAction.sendFriendRequest,
          StateError('offline'),
        ).body,
        "Couldn't send the friend request. Try again.",
      );
    });
  });

  group('relationship action errors', () {
    test('accept maps each code to the web copy', () {
      const String title = "Couldn't accept friend request";
      const String unavailable =
          'That friend request is no longer available. Refresh and try again.';
      _expectCopy(
        ApiErrorAction.acceptFriendRequest,
        'UNKNOWN_USER',
        title,
        unavailable,
      );
      _expectCopy(
        ApiErrorAction.acceptFriendRequest,
        'FRIEND_REQUEST_BLOCKED',
        title,
        unavailable,
      );
      _expectCopy(
        ApiErrorAction.acceptFriendRequest,
        'UNCLAIMED_ACCOUNT_CANNOT_ACCEPT_FRIEND_REQUESTS',
        title,
        'Finish signing up to accept friend requests.',
      );
      _expectCopy(
        ApiErrorAction.acceptFriendRequest,
        'MAX_FRIENDS',
        title,
        'Your friends list is full, or theirs is. Remove someone and try again.',
      );
      _expectCopy(
        ApiErrorAction.acceptFriendRequest,
        'SOMETHING_NEW',
        title,
        "Couldn't accept the friend request. Try again.",
        apiMessage: 'Server text',
      );
    });

    test('block explains system accounts and falls back otherwise', () {
      _expectCopy(
        ApiErrorAction.blockUser,
        'CANNOT_BLOCK_SYSTEM_USER',
        "Couldn't block user",
        "This account can't be blocked.",
      );
      _expectCopy(
        ApiErrorAction.blockUser,
        null,
        "Couldn't block user",
        "Couldn't block this user. Try again.",
      );
    });

    test('other relationship actions use their own title and body', () {
      _expectCopy(
        ApiErrorAction.cancelFriendRequest,
        null,
        "Couldn't cancel friend request",
        "Couldn't cancel the friend request. Try again.",
      );
      _expectCopy(
        ApiErrorAction.ignoreFriendRequest,
        null,
        "Couldn't ignore friend request",
        "Couldn't ignore the friend request. Try again.",
      );
      _expectCopy(
        ApiErrorAction.removeFriend,
        null,
        "Couldn't remove friend",
        "Couldn't remove this friend. Try again.",
      );
      _expectCopy(
        ApiErrorAction.unblockUser,
        null,
        "Couldn't unblock user",
        "Couldn't unblock this user. Try again.",
      );
    });

    test('generic shows the server message or an unexpected error', () {
      _expectCopy(
        ApiErrorAction.generic,
        'INVALID_FORM_BODY',
        'Something went wrong',
        'Nickname is too long.',
        apiMessage: 'Nickname is too long.',
      );
      _expectCopy(
        ApiErrorAction.generic,
        null,
        'Something went wrong',
        'An unexpected error occurred. Try again.',
      );
    });
  });

  group('direct message errors', () {
    test('open DM maps each code to the web copy', () {
      const Map<String, (String, String)> expected = <String, (String, String)>{
        'CANNOT_SEND_MESSAGES_TO_USER': (
          "You can't message this user",
          'They might not be accepting messages from you, or you no longer share a community.',
        ),
        'UNKNOWN_USER': (
          'User not found',
          'This user no longer exists. Refresh and try again.',
        ),
        'RATE_LIMITED': (
          "You're going too fast",
          'Please wait a moment and try again.',
        ),
        'UNCLAIMED_ACCOUNT_CANNOT_SEND_DIRECT_MESSAGES': (
          'Claim your account',
          'You need to claim your account before you can start a direct message.',
        ),
        'DIRECT_MESSAGE_EMAIL_VERIFICATION_REQUIRED': (
          'Verify your email',
          'You need to verify your email address before you can start a direct message.',
        ),
        'MAX_GROUP_DM_RECIPIENTS': (
          'This group has too many people',
          "You've added more people than a group DM allows. Remove a few and try again.",
        ),
        'MAX_GROUP_DMS': (
          "You've reached the group DM limit",
          "You or someone you're adding already has the maximum number of group DMs open. Leave one and try again.",
        ),
        'SOMETHING_NEW': (
          "Couldn't start this conversation",
          'Something went wrong. Please try again in a moment.',
        ),
      };
      for (final MapEntry<String, (String, String)> entry in expected.entries) {
        _expectCopy(
          ApiErrorAction.openDm,
          entry.key,
          entry.value.$1,
          entry.value.$2,
        );
      }
    });

    test('account state codes use the server message when present', () {
      _expectCopy(
        ApiErrorAction.openDm,
        'ACCOUNT_LIMITED',
        'Messaging is paused',
        'Check your inbox.',
        apiMessage: 'Check your inbox.',
      );
      _expectCopy(
        ApiErrorAction.openDm,
        'ACCOUNT_LIMITED',
        'Messaging is paused',
        'Messaging is paused on your account. Check your email for a quick step to continue.',
      );
      _expectCopy(
        ApiErrorAction.openDm,
        'NEW_CONVERSATIONS_LIMITED',
        "Couldn't start this conversation",
        'Slow down on new conversations.',
        apiMessage: 'Slow down on new conversations.',
      );
      _expectCopy(
        ApiErrorAction.addToGroupDm,
        'FEATURE_TEMPORARILY_DISABLED',
        'Feature temporarily disabled',
        'This feature is paused. Try again later.',
      );
    });

    test('add to group maps full, rate limited and fallback', () {
      const String title = "Couldn't add to group";
      _expectCopy(
        ApiErrorAction.addToGroupDm,
        'MAX_GROUP_DM_RECIPIENTS',
        title,
        'This group is full. Remove someone before adding more people.',
      );
      _expectCopy(
        ApiErrorAction.addToGroupDm,
        'RATE_LIMITED',
        title,
        "You're going too fast. Wait a moment and try again.",
      );
      _expectCopy(
        ApiErrorAction.addToGroupDm,
        null,
        title,
        "Couldn't add this friend to the group. Please try again.",
      );
    });

    test('invite, close and leave use their own copy', () {
      _expectCopy(
        ApiErrorAction.createGroupDmInvite,
        null,
        "Couldn't create invite link",
        "Couldn't generate an invite link. Please try again.",
      );
      _expectCopy(
        ApiErrorAction.closeDm,
        null,
        "Couldn't close DM",
        'Try again in a moment.',
      );
      _expectCopy(
        ApiErrorAction.leaveGroupDm,
        null,
        "Couldn't leave group",
        'Try again in a moment.',
      );
    });
  });

  group('invite and community errors', () {
    test('accept invite maps each code to the web copy', () {
      const Map<String?, (String, String)>
      expected = <String?, (String, String)>{
        'INVITES_DISABLED': (
          'Invites paused',
          "Admins paused invites — you can't join right now.",
        ),
        'MAX_GUILD_MEMBERS': (
          'Community at capacity',
          'This community has reached its maximum member limit and is not accepting new members at this time.',
        ),
        'MAX_GUILDS': (
          "You've reached the community limit",
          "You're in the maximum number of communities. Leave one and try again.",
        ),
        'TEMPORARY_INVITE_REQUIRES_PRESENCE': (
          'Gateway connection required',
          'Temporary invites need a live connection. Check yours and try again.',
        ),
        'USER_BANNED_FROM_GUILD': (
          "You're banned",
          'You are banned from this community and cannot join.',
        ),
        'USER_IP_BANNED_FROM_GUILD': (
          'Your IP is banned',
          'Your IP address is banned from this community and you cannot join.',
        ),
        'UNCLAIMED_ACCOUNT_CANNOT_JOIN_GROUP_DMS': (
          'Account verification required',
          'Add an email and password to your account first.',
        ),
        'UNKNOWN_INVITE': (
          'Invite not found',
          'This invite may have expired or been deleted.',
        ),
        'FEATURE_TEMPORARILY_DISABLED': (
          'Feature temporarily disabled',
          'This feature is paused. Try again later.',
        ),
        null: ("Couldn't join community", 'Try again in a moment.'),
      };
      for (final MapEntry<String?, (String, String)> entry
          in expected.entries) {
        _expectCopy(
          ApiErrorAction.acceptInvite,
          entry.key,
          entry.value.$1,
          entry.value.$2,
        );
      }
    });

    test('discovery join keeps its own copy and handles limits', () {
      _expectCopy(
        ApiErrorAction.joinDiscoveryCommunity,
        'USER_IP_BANNED_FROM_GUILD',
        "You can't join this community",
        'You have been banned from this community.',
      );
      _expectCopy(
        ApiErrorAction.joinDiscoveryCommunity,
        'ACCOUNT_LIMITED',
        'Messaging is paused',
        'Messaging is paused on your account. Check your email for a quick step to continue.',
      );
      _expectCopy(
        ApiErrorAction.joinDiscoveryCommunity,
        null,
        "Couldn't join this community",
        'Something went wrong. Please try again in a moment.',
      );
    });

    test('leave, create and revoke use their own copy', () {
      _expectCopy(
        ApiErrorAction.leaveCommunity,
        null,
        'Failed to leave community',
        "Couldn't leave right now. Try again in a moment.",
      );
      _expectCopy(
        ApiErrorAction.createInvite,
        'MAX_INVITES',
        "Couldn't create invite link",
        'This community has reached its invite limit.',
      );
      _expectCopy(
        ApiErrorAction.createInvite,
        null,
        "Couldn't create invite link",
        "Couldn't create an invite link. Please try again.",
      );
      _expectCopy(
        ApiErrorAction.revokeInvite,
        null,
        "Couldn't revoke invite",
        'The link may still work. Try again in a moment.',
      );
    });
  });

  group('message errors', () {
    test('send failures explain mature content per channel kind', () {
      final ApiErrorDialog guild =
          presentApiError(
                testL10n,
                ApiErrorAction.sendMessage,
                code: 'EXPLICIT_CONTENT_CANNOT_BE_SENT',
              )
              as ApiErrorDialog;
      expect(guild.title, 'Mature content not allowed');
      expect(guild.body, startsWith('This channel is not marked'));
      final ApiErrorDialog dm =
          presentApiError(
                testL10n,
                ApiErrorAction.sendMessage,
                code: 'EXPLICIT_CONTENT_CANNOT_BE_SENT',
                details: const ApiErrorDetails(
                  channelKind: ApiErrorChannelKind.dm,
                  subject: 'Settings > Sensitive content',
                ),
              )
              as ApiErrorDialog;
      expect(dm.body, endsWith('change this in Settings > Sensitive content.'));
      final ApiErrorDialog group =
          presentApiError(
                testL10n,
                ApiErrorAction.sendMessage,
                code: 'EXPLICIT_CONTENT_CANNOT_BE_SENT',
                details: const ApiErrorDetails(
                  channelKind: ApiErrorChannelKind.groupDm,
                ),
              )
              as ApiErrorDialog;
      expect(group.body, startsWith('This group is not marked'));
    });

    test('send failures map size, rate limits and pauses', () {
      final ApiErrorDialog size =
          presentApiError(
                testL10n,
                ApiErrorAction.sendMessage,
                code: 'FILE_SIZE_TOO_LARGE',
                details: const ApiErrorDetails(subject: '25 MB'),
              )
              as ApiErrorDialog;
      expect(size.title, 'File size too large');
      expect(size.body, contains('25 MB'));
      _expectCopy(
        ApiErrorAction.sendMessage,
        'RATE_LIMITED',
        "You're sending messages too quickly",
        'Slow down — wait a moment before trying again.',
      );
      _expectCopy(
        ApiErrorAction.sendMessage,
        'FEATURE_TEMPORARILY_DISABLED',
        'Feature temporarily disabled',
        'This feature is paused. Try again later.',
      );
      _expectCopy(
        ApiErrorAction.sendMessage,
        'SOMETHING_NEW',
        "Your message didn't send",
        'Try sending your message again.',
      );
    });

    test('edit, delete and alt text use the web copy', () {
      _expectCopy(
        ApiErrorAction.editMessage,
        'RATE_LIMITED',
        "You're editing messages too quickly",
        'Slow down — wait a moment before trying again.',
      );
      _expectCopy(
        ApiErrorAction.editMessage,
        'CONTENT_BLOCKED',
        'Content blocked',
        'Your action could not be completed because it was flagged by our safety systems. If you believe this is a mistake, please contact support.',
      );
      _expectCopy(
        ApiErrorAction.editMessage,
        null,
        "Your message didn't update",
        'Try editing your message again.',
      );
      _expectCopy(
        ApiErrorAction.deleteMessage,
        'RATE_LIMITED',
        "You're deleting messages too quickly",
        'Wait a moment before deleting more messages.',
      );
      _expectCopy(
        ApiErrorAction.deleteMessage,
        null,
        "That message couldn't be deleted",
        'Try deleting that message again.',
      );
      _expectCopy(
        ApiErrorAction.updateAltText,
        'UNKNOWN_MESSAGE',
        "Couldn't update alt text",
        'This message no longer exists.',
      );
      _expectCopy(
        ApiErrorAction.updateAltText,
        'MISSING_PERMISSIONS',
        "Couldn't update alt text",
        "You can't edit this message.",
      );
      _expectCopy(
        ApiErrorAction.updateAltText,
        null,
        "Couldn't update alt text",
        "Couldn't update the alt text. Please try again.",
      );
    });

    test('reactions use a dialog for limits and a toast otherwise', () {
      _expectCopy(
        ApiErrorAction.addReaction,
        'MAX_REACTIONS',
        'Whoa, this is heavy',
        'This is one heavy message. Some reactions need to be removed before you can add more.',
      );
      final ApiErrorPresentation timedOut = presentApiError(
        testL10n,
        ApiErrorAction.addReaction,
        code: 'COMMUNICATION_DISABLED',
      );
      expect(timedOut, isA<ApiErrorToast>());
      expect(
        timedOut.body,
        "You can't add new reactions while you're timed out.",
      );
      final ApiErrorPresentation other = presentApiError(
        testL10n,
        ApiErrorAction.removeReaction,
        code: 'MISSING_PERMISSIONS',
      );
      expect(other, isA<ApiErrorToast>());
      expect(other.body, 'Failed to remove reaction');
    });

    test('pins, bookmarks and saved media name the limit', () {
      _expectCopy(
        ApiErrorAction.pinMessage,
        null,
        'Failed to pin message',
        'Something went wrong. Try again later.',
      );
      _expectCopy(
        ApiErrorAction.unpinMessage,
        'CANNOT_SEND_MESSAGES_TO_USER',
        'Failed to unpin message',
        'You cannot interact with this user right now.',
      );
      final ApiErrorDialog bookmarks =
          presentApiError(
                testL10n,
                ApiErrorAction.saveBookmark,
                code: 'MAX_BOOKMARKS',
                details: const ApiErrorDetails(count: 50),
              )
              as ApiErrorDialog;
      expect(bookmarks.title, 'Bookmark limit reached');
      expect(
        bookmarks.body,
        "You're at 50 bookmarks. Remove one to add another.",
      );
      final ApiErrorDialog media =
          presentApiError(
                testL10n,
                ApiErrorAction.saveFavoriteMedia,
                code: 'MAX_FAVORITE_MEMES',
                details: const ApiErrorDetails(count: 1),
              )
              as ApiErrorDialog;
      expect(media.title, 'Saved media limit reached');
      expect(
        media.body,
        "You're at the cap of 1 saved media item. Remove one to add another.",
      );
    });
  });

  group('settings errors', () {
    test('channel and category delete map each code', () {
      _expectCopy(
        ApiErrorAction.deleteChannel,
        'MISSING_PERMISSIONS',
        "You can't delete this",
        "You don't have permission to delete this channel.",
      );
      _expectCopy(
        ApiErrorAction.deleteCategory,
        'MISSING_PERMISSIONS',
        "You can't delete this",
        "You don't have permission to delete this category.",
      );
      _expectCopy(
        ApiErrorAction.deleteChannel,
        'UNKNOWN_CHANNEL',
        'Already deleted',
        'This channel no longer exists. It may have already been deleted.',
      );
      _expectCopy(
        ApiErrorAction.deleteCategory,
        'RATE_LIMITED',
        "You're going too fast",
        'Please wait a moment and try again.',
      );
      _expectCopy(
        ApiErrorAction.deleteCategory,
        null,
        "Couldn't delete this category",
        'Something went wrong. Please try again in a moment.',
      );
    });

    test('moving a channel into a full category uses the web copy', () {
      final ApiErrorPresentation presentation = presentApiError(
        testL10n,
        ApiErrorAction.moveChannel,
        code: 'MAX_CATEGORY_CHANNELS',
        details: const ApiErrorDetails(count: 50),
      );
      expect(presentation, isA<ApiErrorDialog>());
      final ApiErrorDialog dialog = presentation as ApiErrorDialog;
      expect(dialog.title, 'Category full');
      expect(
        dialog.body,
        'This category already contains the maximum of 50 channels.',
      );
      _expectCopy(
        ApiErrorAction.moveChannel,
        'MISSING_PERMISSIONS',
        'Something went wrong',
        'Missing permissions',
        apiMessage: 'Missing permissions',
      );
    });

    test('saves show the server reason or a fallback', () {
      _expectCopy(
        ApiErrorAction.updateChannelPermissions,
        'MISSING_PERMISSIONS',
        "Couldn't update channel permissions",
        'Try again in a moment.',
      );
      _expectCopy(
        ApiErrorAction.saveChannelSettings,
        'INVALID_FORM_BODY',
        "Couldn't save channel settings",
        'Topic is too long.',
        apiMessage: 'Topic is too long.',
      );
      _expectCopy(
        ApiErrorAction.deleteCommunity,
        null,
        "Couldn't delete this community",
        'An unexpected error occurred. Try again.',
      );
      _expectCopy(
        ApiErrorAction.createWebhook,
        'ACCOUNT_LIMITED',
        'Messaging is paused',
        'Messaging is paused on your account. Check your email for a quick step to continue.',
      );
      _expectCopy(
        ApiErrorAction.createWebhook,
        'MAX_WEBHOOKS_PER_CHANNEL',
        'Failed to create webhook',
        'Try again in a moment.',
      );
      _expectCopy(
        ApiErrorAction.updateWebhook,
        null,
        'Something went wrong',
        'Failed to update webhooks',
      );
    });
  });

  group('emoji and sticker errors', () {
    test('rename and delete map each code', () {
      _expectCopy(
        ApiErrorAction.renameEmoji,
        'UNKNOWN_EMOJI',
        'This emoji no longer exists',
        'It may have been deleted. The name was reverted to what it was before.',
      );
      _expectCopy(
        ApiErrorAction.renameEmoji,
        'MISSING_ACCESS',
        "You can't rename this emoji",
        "You don't have permission to rename this emoji. The name was reverted to what it was before.",
      );
      _expectCopy(
        ApiErrorAction.renameEmoji,
        'RATE_LIMITED',
        "You're going too fast",
        'Please wait a moment and try renaming again.',
      );
      _expectCopy(
        ApiErrorAction.renameEmoji,
        null,
        "Couldn't rename this emoji",
        'The name was reverted to what it was before. Please try again in a moment.',
      );
      _expectCopy(
        ApiErrorAction.deleteEmoji,
        'UNKNOWN_EMOJI',
        'This emoji no longer exists',
        'It looks like it was already deleted.',
      );
      _expectCopy(
        ApiErrorAction.deleteEmoji,
        'MISSING_PERMISSIONS',
        "You can't delete this emoji",
        "You don't have permission to delete this emoji.",
      );
      _expectCopy(
        ApiErrorAction.deleteEmoji,
        null,
        "Couldn't delete this emoji",
        'Something went wrong. Please try again in a moment.',
      );
    });

    test('stickers name the size limit or show the server reason', () {
      final ApiErrorDialog tooLarge =
          presentApiError(
                testL10n,
                ApiErrorAction.createSticker,
                code: 'FILE_SIZE_TOO_LARGE',
                details: const ApiErrorDetails(subject: '512 KB'),
              )
              as ApiErrorDialog;
      expect(tooLarge.title, 'Sticker is too large');
      expect(tooLarge.body, contains('larger than 512 KB.'));
      _expectCopy(
        ApiErrorAction.createSticker,
        null,
        "Couldn't create this sticker",
        'Something went wrong while preparing this sticker. Try another file or try again in a moment.',
      );
      _expectCopy(
        ApiErrorAction.updateSticker,
        'INVALID_FORM_BODY',
        "Couldn't update this sticker",
        'Name is too short.',
        apiMessage: 'Name is too short.',
      );
      _expectCopy(
        ApiErrorAction.deleteSticker,
        null,
        "Couldn't delete this sticker",
        'Something went wrong. Please try again in a moment.',
      );
    });
  });

  group('moderation errors', () {
    test('member actions name what failed', () {
      _expectCopy(
        ApiErrorAction.kickMember,
        'MISSING_PERMISSIONS',
        'Something went wrong',
        'Failed to kick member. Try again.',
      );
      _expectCopy(
        ApiErrorAction.banMember,
        null,
        'Something went wrong',
        'Failed to ban member. Try again.',
      );
      _expectCopy(
        ApiErrorAction.timeoutMember,
        null,
        'Something went wrong',
        'Failed to time out member. Try again.',
      );
      _expectCopy(
        ApiErrorAction.removeTimeout,
        null,
        'Something went wrong',
        'Failed to remove timeout. Try again.',
      );
      _expectCopy(
        ApiErrorAction.revokeBan,
        null,
        "Couldn't revoke ban",
        'Try again in a moment.',
      );
      final ApiErrorDialog transfer =
          presentApiError(
                testL10n,
                ApiErrorAction.transferOwnership,
                details: const ApiErrorDetails(subject: 'kozi'),
              )
              as ApiErrorDialog;
      expect(transfer.title, 'Failed to transfer ownership');
      expect(
        transfer.body,
        'Ownership could not be transferred to kozi at this time.',
      );
    });

    test('voice moderation maps codes and falls back to the action', () {
      _expectCopy(
        ApiErrorAction.moderateVoiceMember,
        'MISSING_PERMISSIONS',
        "You can't do that",
        "You don't have permission to do this to this member.",
      );
      _expectCopy(
        ApiErrorAction.moderateVoiceMember,
        'USER_NOT_IN_VOICE',
        'They left the call',
        "This member isn't connected to voice anymore.",
      );
      _expectCopy(
        ApiErrorAction.moderateVoiceMember,
        'UNKNOWN_MEMBER',
        'Member not found',
        'This member is no longer in the community. Refresh and try again.',
      );
      final ApiErrorDialog fallback =
          presentApiError(
                testL10n,
                ApiErrorAction.moderateVoiceMember,
                details: const ApiErrorDetails(subject: 'Disconnect'),
              )
              as ApiErrorDialog;
      expect(fallback.title, 'Disconnect');
      expect(
        fallback.body,
        'Something went wrong. Please try again in a moment.',
      );
    });
  });

  group('account errors', () {
    test('account actions keep a title and prefer the server reason', () {
      _expectCopy(
        ApiErrorAction.deletePasskey,
        null,
        "Couldn't delete passkey",
        'An unexpected error occurred. Try again.',
      );
      _expectCopy(
        ApiErrorAction.regenerateApplicationSecret,
        'MISSING_PERMISSIONS',
        "Couldn't regenerate secret",
        'Only owners can do that.',
        apiMessage: 'Only owners can do that.',
      );
      _expectCopy(
        ApiErrorAction.deleteApplication,
        null,
        "Couldn't delete application",
        'An unexpected error occurred. Try again.',
      );
      _expectCopy(
        ApiErrorAction.revokeSessions,
        null,
        'Something went wrong',
        "Couldn't sign out. Try again.",
      );
      _expectCopy(
        ApiErrorAction.privacyDataRequest,
        'HARVEST_ON_COOLDOWN',
        'Something went wrong',
        'You already requested an export recently.',
        apiMessage: 'You already requested an export recently.',
      );
    });
  });

  group('billing errors', () {
    test('subscription actions share the billing codes', () {
      _expectCopy(
        ApiErrorAction.cancelSubscription,
        'STRIPE_SUBSCRIPTION_ALREADY_CANCELING',
        'Already set to cancel',
        'Your subscription is already set to cancel at the end of your billing period.',
      );
      _expectCopy(
        ApiErrorAction.reactivateSubscription,
        'STRIPE_SUBSCRIPTION_NOT_CANCELING',
        'Subscription is not scheduled to cancel',
        "Your subscription isn't set to cancel, so there's nothing to reactivate.",
      );
      _expectCopy(
        ApiErrorAction.openBillingPortal,
        'STRIPE_PAYMENT_NOT_AVAILABLE',
        'Payments are unavailable',
        'Payments are temporarily unavailable. Please try again in a moment.',
      );
      _expectCopy(
        ApiErrorAction.cancelSubscription,
        'STRIPE_NO_SUBSCRIPTION',
        'No active subscription',
        "We couldn't find an active subscription on this account. Refresh and try again.",
      );
      _expectCopy(
        ApiErrorAction.cancelSubscription,
        null,
        "Couldn't cancel your subscription",
        'Something went wrong while canceling your subscription. Please try again in a moment.',
      );
    });

    test('refunds explain each refusal', () {
      _expectCopy(
        ApiErrorAction.refundPurchase,
        'STRIPE_REFUND_OUTSIDE_WINDOW',
        'Outside the refund window',
        'Your most recent purchase is no longer within the refund window. Contact support for billing issues.',
      );
      _expectCopy(
        ApiErrorAction.refundPurchase,
        'STRIPE_REFUND_COOLDOWN_ACTIVE',
        'You have refunded recently',
        "You've already used a self-serve refund recently. You can refund again once the cooldown ends.",
      );
      _expectCopy(
        ApiErrorAction.refundPurchase,
        'STRIPE_NO_PURCHASE_HISTORY',
        'Nothing to refund',
        "We couldn't find a recent purchase to refund on this account.",
      );
      _expectCopy(
        ApiErrorAction.refundPurchase,
        null,
        "Couldn't refund this purchase",
        'Something went wrong while issuing your refund. Contact support if this keeps happening.',
      );
    });
  });

  testWidgets('showApiError opens a dialog with one Understood button', (
    WidgetTester tester,
  ) async {
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: Consumer(
              builder: (BuildContext context, WidgetRef ref, _) {
                return ElevatedButton(
                  onPressed: () => unawaited(
                    showApiError(
                      context,
                      ApiErrorAction.sendFriendRequest,
                      const ApiException(code: 'FRIEND_REQUEST_BLOCKED'),
                    ),
                  ),
                  child: const Text('Send'),
                );
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Send'));
    await tester.pumpAndSettle();

    expect(find.text("Couldn't send friend request"), findsOneWidget);
    expect(
      find.text("They're not accepting friend requests right now."),
      findsOneWidget,
    );
    expect(find.text('Understood'), findsOneWidget);

    await tester.tap(find.text('Understood'));
    await tester.pumpAndSettle();

    expect(find.text("Couldn't send friend request"), findsNothing);
  });

  Widget buildApp(Widget home) {
    final colorTheme = buildDarkColorTheme();
    return ProviderScope(
      child: MaterialApp(
        navigatorKey: rootNavigatorKey,
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(body: home),
      ),
    );
  }

  testWidgets('showApiErrorFromRoot opens the dialog without a local context', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(buildApp(const SizedBox.shrink()));

    unawaited(
      showApiErrorFromRoot(
        ApiErrorAction.leaveCommunity,
        const ApiException(code: 'UNKNOWN_GUILD'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Failed to leave community'), findsOneWidget);
    expect(
      find.text("Couldn't leave right now. Try again in a moment."),
      findsOneWidget,
    );
  });

  testWidgets('a cancelled sudo prompt shows no error', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(buildApp(const SizedBox.shrink()));

    unawaited(
      showApiErrorFromRoot(
        ApiErrorAction.deleteCommunity,
        const ApiException(code: 'SUDO_MODE_REQUIRED'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text("Couldn't delete this community"), findsNothing);
    expect(find.text('Understood'), findsNothing);
  });

  testWidgets('reaction failures use a toast instead of a dialog', (
    WidgetTester tester,
  ) async {
    late ProviderContainer container;
    await tester.pumpWidget(
      buildApp(
        Consumer(
          builder: (BuildContext context, WidgetRef ref, _) {
            container = ProviderScope.containerOf(context);
            return ElevatedButton(
              onPressed: () => unawaited(
                showApiError(
                  context,
                  ApiErrorAction.addReaction,
                  const ApiException(code: 'COMMUNICATION_DISABLED'),
                ),
              ),
              child: const Text('React'),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('React'));
    await tester.pump();

    expect(find.text('Understood'), findsNothing);
    expect(
      container.read(toastProvider).map((ToastEntry e) => e.toast.message),
      contains("You can't add new reactions while you're timed out."),
    );
  });
}
