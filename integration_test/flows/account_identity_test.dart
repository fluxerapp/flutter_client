// ignore_for_file: do_not_use_environment -- integration runs are configured through --dart-define

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';
import 'package:integration_test/integration_test.dart';

import '../support/app_launcher.dart';

const String _step = String.fromEnvironment('ACCOUNT_E2E_STEP');
const String _instance = String.fromEnvironment('ACCOUNT_E2E_INSTANCE');
const String _username = String.fromEnvironment('ACCOUNT_E2E_USERNAME');
const String _email = String.fromEnvironment('ACCOUNT_E2E_EMAIL');
const String _password = String.fromEnvironment('ACCOUNT_E2E_PASSWORD');
const String _newPassword = String.fromEnvironment('ACCOUNT_E2E_NEW_PASSWORD');
const String _recoveryKey = String.fromEnvironment('ACCOUNT_E2E_RECOVERY_KEY');

final RegExp _recoveryKeyPattern = RegExp(r'^[0-9A-Z]{4}(-[0-9A-Z]{4}){7}$');

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('account identity: $_step', (WidgetTester tester) async {
    if (kIsWeb || _step.isEmpty) {
      return;
    }
    await launchFluxerApp(tester);
    await waitForAppShell(tester);
    final ProviderContainer container = ProviderScope.containerOf(
      rootNavigatorKey.currentContext!,
      listen: false,
    );
    expect(
      await container
          .read(instanceSelectorProvider.notifier)
          .connectToUrl(_instance),
      isTrue,
    );
    await tester.pump(const Duration(seconds: 2));

    switch (_step) {
      case 'register-username':
        await _registerWithUsername(tester);
      case 'login-username':
        await _loginWithUsername(tester);
      case 'recover':
        await _recoverWithKit(tester);
      case 'register-email':
        await _registerWithEmail(tester);
      case 'login-email':
        await _loginWithEmail(tester);
      default:
        fail('Unknown ACCOUNT_E2E_STEP $_step');
    }
    releaseFinderSemantics();
  });
}

Future<void> _registerWithUsername(WidgetTester tester) async {
  expect(await isOnLoginScreen(tester), isTrue);
  expect(_inputLabeled('Username'), findsOneWidget);
  expect(_inputLabeled('Email'), findsNothing);
  await _tap(tester, find.text('Register'));
  await _pumpUntil(tester, find.text('Create an account'));
  expect(_inputLabeled('Email'), findsNothing);
  expect(
    find.text('A 4-digit tag will be added automatically to ensure uniqueness'),
    findsNothing,
  );
  await _enter(tester, _inputLabeled('Username'), _username);
  await _pumpUntil(tester, find.text('This username is available'));
  await _enter(tester, _inputLabeled('Password'), _password);
  await _enter(tester, _inputLabeled('Confirm password'), _password);
  await _acceptTermsIfShown(tester);
  await _submit(tester, 'Create account');

  await _pumpUntil(tester, find.text('Your recovery kit'), seconds: 90);
  final String key = _visibleRecoveryKey();
  debugPrint('ACCOUNT_E2E_RECOVERY_KEY=$key');
  expect(find.text(_username), findsWidgets);
  _expectNoTaggedName();
  await _finishRecoveryKit(tester);
  await _pumpUntil(tester, find.bySemanticsLabel('Home'));
  _expectNoTaggedName();

  await _openSecuritySettings(tester);
  await _pumpUntil(tester, find.text('Create a new kit'));
  expect(find.text('Email settings'), findsNothing);

  await _tap(tester, find.text('Change password'));
  await _pumpUntil(tester, find.text('Confirm new password'));
  expect(find.text('Send code'), findsNothing);
  await _enter(tester, _inputLabeled('New password'), _newPassword);
  await _enter(tester, _inputLabeled('Confirm new password'), _newPassword);
  await _submit(tester, 'Change password');
  await _pumpUntil(tester, _inputLabeled('Password'));
  await _enter(tester, _inputLabeled('Password'), _password);
  await _submit(tester, 'Continue');
  await _pumpUntil(
    tester,
    find.text(
      'Your old recovery kit no longer works. Store this new one somewhere safe.',
    ),
    seconds: 60,
  );
  debugPrint('ACCOUNT_E2E_RECOVERY_KEY_AFTER_CHANGE=${_visibleRecoveryKey()}');
  await _finishRecoveryKit(tester);
}

Future<void> _loginWithUsername(WidgetTester tester) async {
  expect(await isOnLoginScreen(tester), isTrue);
  await _enter(tester, _inputLabeled('Username'), _username);
  await _enter(tester, _inputLabeled('Password'), 'wrong-password-123');
  await _submit(tester, 'Log in');
  await _pumpUntil(tester, find.text('Invalid username or password.'));

  await _enter(tester, _inputLabeled('Username'), _username);
  await _enter(tester, _inputLabeled('Password'), _password);
  await _submit(tester, 'Log in');
  await _pumpUntil(tester, find.bySemanticsLabel('Home'), seconds: 90);
  _expectNoTaggedName();
  await _openSecuritySettings(tester);
  await _pumpUntil(tester, find.text('Recovery kit'));
  expect(find.text('Email settings'), findsNothing);
}

Future<void> _recoverWithKit(WidgetTester tester) async {
  expect(await isOnLoginScreen(tester), isTrue);
  await _tap(tester, find.text('Forgot your password?'));
  await _pumpUntil(tester, find.text('Recover your account'));
  await _enter(tester, _inputLabeled('Username'), _username);
  await _enter(tester, _inputLabeled('Recovery key'), _recoveryKey);
  await _enter(tester, _inputLabeled('New password'), _newPassword);
  await _enter(tester, _inputLabeled('Confirm new password'), _newPassword);
  await _submit(tester, 'Reset password');
  await _pumpUntil(
    tester,
    find.text(
      'Your password is reset. Your old recovery kit no longer works. '
      'Store this new one somewhere safe.',
    ),
    seconds: 90,
  );
  final String key = _visibleRecoveryKey();
  expect(key, isNot(_recoveryKey));
  debugPrint('ACCOUNT_E2E_RECOVERY_KEY_AFTER_RECOVER=$key');
  await _finishRecoveryKit(tester);
  await _pumpUntil(tester, find.bySemanticsLabel('Home'));
}

Future<void> _registerWithEmail(WidgetTester tester) async {
  expect(await isOnLoginScreen(tester), isTrue);
  expect(_inputLabeled('Email'), findsOneWidget);
  await _tap(tester, find.text('Register'));
  await _pumpUntil(tester, find.text('Create an account'));
  expect(
    find.text('A 4-digit tag will be added automatically to ensure uniqueness'),
    findsOneWidget,
  );
  await _enter(tester, _inputLabeled('Email'), _email);
  await _enter(tester, _inputLabeled('Username (optional)'), _username);
  await _enter(tester, _inputLabeled('Password'), _password);
  await _enter(tester, _inputLabeled('Confirm password'), _password);
  await _acceptTermsIfShown(tester);
  await _submit(tester, 'Create account');
  await _pumpUntil(tester, find.bySemanticsLabel('Home'), seconds: 90);
  await tester.pump(const Duration(seconds: 8));
  expect(find.text('Your recovery kit'), findsNothing);
  await _openSecuritySettings(tester);
  await _pumpUntil(tester, find.text('Email settings'));
  expect(find.text('Recovery kit'), findsNothing);
  final ProviderContainer container = ProviderScope.containerOf(
    rootNavigatorKey.currentContext!,
    listen: false,
  );
  final UserSettingsViewState settings = container.read(
    userSettingsViewModelProvider,
  );
  final String tag = formatUserTag(
    settings.username,
    settings.discriminator,
    uniqueUsernames: container.read(uniqueUsernamesProvider),
  );
  debugPrint('ACCOUNT_E2E_EMAIL_TAG=$tag');
  expect(tag, matches(RegExp('^$_username#[0-9]{4}\$')));
}

Future<void> _loginWithEmail(WidgetTester tester) async {
  expect(await isOnLoginScreen(tester), isTrue);
  expect(find.text('Forgot your password?'), findsNothing);
  expect(_inputLabeled('Email'), findsOneWidget);
  await _enter(tester, _inputLabeled('Email'), _username);
  await _enter(tester, _inputLabeled('Password'), _password);
  await _submit(tester, 'Log in');
  await tester.pump(const Duration(seconds: 2));
  expect(find.bySemanticsLabel('Home'), findsNothing);
  await _enter(tester, _inputLabeled('Email'), _email);
  await _submit(tester, 'Log in');
  await _pumpUntil(tester, find.bySemanticsLabel('Home'), seconds: 90);
}

Finder _inputLabeled(String label) {
  return find.descendant(
    of: find.ancestor(of: find.text(label), matching: find.byType(FluxerInput)),
    matching: find.byType(EditableText),
  );
}

Iterable<String> _texts() sync* {
  for (final Element element in find.byType(Text).evaluate()) {
    final String? data = (element.widget as Text).data;
    if (data != null) {
      yield data;
    }
  }
}

String _visibleRecoveryKey() {
  return _texts().firstWhere(_recoveryKeyPattern.hasMatch);
}

void _expectNoTaggedName() {
  expect(
    _texts().where((String text) => text.contains('$_username#')),
    isEmpty,
  );
}

Future<void> _finishRecoveryKit(WidgetTester tester) async {
  await _tap(tester, find.text("I've stored my recovery kit somewhere safe"));
  await _tap(tester, find.text('Done'));
  await _pumpUntil(tester, find.text('Your recovery kit'), absent: true);
}

Future<void> _openSecuritySettings(WidgetTester tester) async {
  final BuildContext? context = rootNavigatorKey.currentContext;
  expect(context, isNotNull);
  unawaited(UserSettingsModal.show(context!, openSecuritySection: true));
  await tester.pump(const Duration(seconds: 1));
}

Future<void> _enter(WidgetTester tester, Finder finder, String text) async {
  await _pumpUntil(tester, finder);
  await tester.ensureVisible(finder.first);
  await tester.enterText(finder.first, text);
  await tester.pump(const Duration(milliseconds: 300));
}

Future<void> _submit(WidgetTester tester, String label) async {
  final Finder button = find.ancestor(
    of: find.text(label),
    matching: find.byType(FluxerButton),
  );
  await _pumpUntil(tester, button);
  final FluxerButton widget = tester.widget<FluxerButton>(button.last);
  expect(
    widget.onPressed != null || widget.onPressedAsync != null,
    isTrue,
    reason: '$label is disabled',
  );
  await tester.ensureVisible(button.last);
  await tester.pump(const Duration(milliseconds: 300));
  await tester.tap(button.last);
  await tester.pump(const Duration(milliseconds: 500));
}

Future<void> _acceptTermsIfShown(WidgetTester tester) async {
  final Finder checkbox = find.byType(FluxerCheckbox);
  if (checkbox.evaluate().isNotEmpty) {
    await tester.ensureVisible(checkbox.first);
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tapAt(
      tester.getTopLeft(checkbox.first) + const Offset(12, 12),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(tester.widget<FluxerCheckbox>(checkbox.first).value, isTrue);
  }
}

Future<void> _tap(WidgetTester tester, Finder finder) async {
  await _pumpUntil(tester, finder);
  await tester.ensureVisible(finder.last);
  await tester.pump(const Duration(milliseconds: 200));
  await tester.tap(finder.last, warnIfMissed: false);
  await tester.pump(const Duration(milliseconds: 500));
}

Future<void> _pumpUntil(
  WidgetTester tester,
  Finder finder, {
  int seconds = 30,
  bool absent = false,
}) async {
  final DateTime deadline = DateTime.now().add(Duration(seconds: seconds));
  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 250));
    if (finder.evaluate().isEmpty == absent) {
      return;
    }
  }
  fail('Timed out waiting for ${absent ? 'absence of ' : ''}$finder');
}
