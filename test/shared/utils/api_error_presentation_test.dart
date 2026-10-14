import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
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
}
