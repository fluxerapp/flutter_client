import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/backup_codes_sheet.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../helpers/test_l10n.dart';

class _FailingUsersApi implements UsersApi {
  _FailingUsersApi(this.error);

  final Exception error;
  int calls = 0;

  @override
  Future<MfaBackupCodesResponse> getBackupCodesMfa({
    required MfaBackupCodesRequest body,
  }) {
    calls++;
    return Future<MfaBackupCodesResponse>.error(error);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._users) : super(Dio());

  final UsersApi _users;

  @override
  UsersApi get users => _users;
}

DioException _apiError(int status, Map<String, dynamic> body) {
  final RequestOptions options = RequestOptions(
    path: '/users/@me/mfa/backup-codes',
  );
  return DioException(
    requestOptions: options,
    response: Response<dynamic>(
      requestOptions: options,
      statusCode: status,
      data: body,
    ),
  );
}

Future<ProviderContainer> _pumpAndTapView(
  WidgetTester tester,
  _FailingUsersApi api,
) async {
  final ProviderContainer container = ProviderContainer(
    overrides: [fluxerClientProvider.overrideWithValue(_FakeClient(api))],
  );
  addTearDown(container.dispose);
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
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
            builder: (context, ref, _) => TextButton(
              onPressed: () => BackupCodesSheet.showView(context, ref),
              child: const Text('View codes'),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('View codes'));
  await tester.pump();
  return container;
}

void main() {
  testWidgets('shows the API error in a danger toast when loading fails', (
    tester,
  ) async {
    final api = _FailingUsersApi(
      _apiError(429, <String, dynamic>{
        'code': 'RATE_LIMITED',
        'message': 'You are being rate limited.',
      }),
    );
    final container = await _pumpAndTapView(tester, api);

    expect(api.calls, 1);
    final FluxerToast toast = container.read(toastProvider).single.toast;
    expect(toast.message, 'You are being rate limited.');
    expect(toast.variant, FluxerToastVariant.danger);
    expect(find.byType(BackupCodesSheet), findsNothing);
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('falls back to the localized message without an API message', (
    tester,
  ) async {
    final api = _FailingUsersApi(
      DioException(
        requestOptions: RequestOptions(path: '/users/@me/mfa/backup-codes'),
        type: DioExceptionType.connectionError,
      ),
    );
    final container = await _pumpAndTapView(tester, api);

    final FluxerToast toast = container.read(toastProvider).single.toast;
    expect(toast.message, testL10n.recoveryKitBackupCodesFailed);
    expect(toast.variant, FluxerToastVariant.danger);
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('stays quiet when the sudo prompt is cancelled', (tester) async {
    final api = _FailingUsersApi(
      _apiError(403, <String, dynamic>{
        'code': 'SUDO_MODE_REQUIRED',
        'message': 'Sudo mode required',
      }),
    );
    final container = await _pumpAndTapView(tester, api);

    expect(api.calls, 1);
    expect(container.read(toastProvider), isEmpty);
  });
}
