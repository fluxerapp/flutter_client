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
  final ApiErrorPresentation presentation = presentApiError(
    testL10n,
    ApiErrorAction.sendFriendRequest,
    code: code,
    apiMessage: apiMessage,
  );
  expect(presentation, isA<ApiErrorDialog>());
  return presentation as ApiErrorDialog;
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
                      ref,
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
