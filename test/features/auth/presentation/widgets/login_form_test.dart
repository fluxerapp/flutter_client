import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/login_form.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  testWidgets('entering email and password syncs to the view model', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authInstanceSnapshotProvider.overrideWith(
            (ref) => InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: _app(const LoginForm(showBrowserLogin: false)),
      ),
    );
    await tester.pumpAndSettle();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(LoginForm)),
    );

    expect(container.read(loginViewModelProvider).canLogin, isFalse);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'user@example.com');
    await tester.enterText(fields.at(1), 'secret-password');
    await tester.pump();

    final state = container.read(loginViewModelProvider);
    expect(state.email, 'user@example.com');
    expect(state.password, 'secret-password');
    expect(state.canLogin, isTrue);
  });

  testWidgets('updating email in the view model syncs to the input field', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authInstanceSnapshotProvider.overrideWith(
            (ref) => InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: _app(const LoginForm(showBrowserLogin: false)),
      ),
    );
    await tester.pumpAndSettle();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(LoginForm)),
    );
    container
        .read(loginViewModelProvider.notifier)
        .updateEmail('expired@example.com');
    await tester.pump();

    final TextFormField emailField = tester.widget(
      find.byType(TextFormField).at(0),
    );
    expect(emailField.controller?.text, 'expired@example.com');
  });

  testWidgets('context menu paste fills email and password', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authInstanceSnapshotProvider.overrideWith(
            (ref) => InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: _app(const LoginForm(showBrowserLogin: false)),
      ),
    );
    await tester.pumpAndSettle();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(LoginForm)),
    );
    final Finder editables = find.byType(EditableText);

    _mockClipboardText('user@example.com');
    await _pasteViaToolbar(tester, editables.at(0));

    _mockClipboardText('secret-password');
    await _pasteViaToolbar(tester, editables.at(1));

    final state = container.read(loginViewModelProvider);
    expect(state.email, 'user@example.com');
    expect(state.password, 'secret-password');
  });

  testWidgets('context menu paste shows feedback when clipboard is empty', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authInstanceSnapshotProvider.overrideWith(
            (ref) => InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: _app(const LoginForm(showBrowserLogin: false)),
      ),
    );
    await tester.pumpAndSettle();

    _mockClipboardText('');
    await _pasteViaToolbar(tester, find.byType(EditableText).first);

    expect(find.text(testL10n.clipboardPasteFailed), findsOneWidget);
  });

  testWidgets('restores email focus when app resumes from background', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authInstanceSnapshotProvider.overrideWith(
            (ref) => InstanceConfigSnapshot.officialDefault(),
          ),
        ],
        child: _app(const LoginForm(showBrowserLogin: false)),
      ),
    );
    await tester.pumpAndSettle();

    final EditableText editable = tester.widget<EditableText>(
      find.byType(EditableText).first,
    );
    final FocusNode focusNode = editable.focusNode;

    focusNode.requestFocus();
    await tester.pumpAndSettle();
    expect(focusNode.hasFocus, isTrue);

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    focusNode.unfocus();
    await tester.pump();

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(kKeyboardFocusRestoreRetryDelay);

    expect(focusNode.hasFocus, isTrue);
  });
}

void _mockClipboardText(String text) {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(SystemChannels.platform, (
        MethodCall methodCall,
      ) async {
        if (methodCall.method == 'Clipboard.getData') {
          return <String, String>{'text': text};
        }
        if (methodCall.method == 'Clipboard.hasStrings') {
          return <String, bool>{'value': true};
        }
        return null;
      });
}

Future<void> _pasteViaToolbar(
  WidgetTester tester,
  Finder editableFinder,
) async {
  await tester.longPress(editableFinder);
  await tester.pumpAndSettle();
  await tester.tap(find.text('Paste'));
  await tester.pumpAndSettle();
}
