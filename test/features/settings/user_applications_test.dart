import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_applications.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/test_l10n.dart';

class _FakeOAuth2Api implements OAuth2Api {
  _FakeOAuth2Api({this.listError});

  Object? listError;

  @override
  Future<List<ApplicationResponse>> listUserApplications() async {
    if (listError != null) {
      // ignore: only_throw_errors -- test helper rethrows arbitrary objects
      throw listError!;
    }
    return const <ApplicationResponse>[];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._oauth) : super(Dio());

  final OAuth2Api _oauth;

  @override
  OAuth2Api get oAuth2 => _oauth;
}

class _FakeUserSettings extends UserSettingsViewModel {
  _FakeUserSettings({required this.unclaimed});

  final bool unclaimed;

  @override
  UserSettingsViewState build() => UserSettingsViewState(
    userId: 'u1',
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: const <String>[],
    isProfileLoaded: true,
    email: unclaimed ? null : 'tester@example.com',
  );
}

Widget _wrap(Widget child, {required OAuth2Api api, bool unclaimed = false}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      fluxerClientProvider.overrideWithValue(_FakeClient(api)),
      instanceRuntimeConfigProvider.overrideWithValue(
        InstanceRuntimeConfig.defaults,
      ),
      userSettingsViewModelProvider.overrideWith(
        () => _FakeUserSettings(unclaimed: unclaimed),
      ),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('shows empty state after a successful load', (tester) async {
    await tester.pumpWidget(
      _wrap(const UserApplications(), api: _FakeOAuth2Api()),
    );
    await tester.pumpAndSettle();

    expect(find.text(testL10n.applicationsEmptyTitle), findsOneWidget);
    expect(
      find.text(
        testL10n.applicationsEmptyDescription(
          '${InstanceRuntimeConfig.defaults.productName} API',
        ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('shows load error with retry after failure', (tester) async {
    final api = _FakeOAuth2Api(
      listError: DioException(requestOptions: RequestOptions()),
    );
    await tester.pumpWidget(_wrap(const UserApplications(), api: api));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.applicationsLoadError), findsOneWidget);
    expect(
      find.text(testL10n.applicationsLoadErrorDescription),
      findsOneWidget,
    );
    expect(find.text(testL10n.retry), findsOneWidget);
    expect(find.byType(FluxerLoadingSpinner), findsNothing);

    api.listError = null;
    await tester.tap(find.text(testL10n.retry));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.applicationsEmptyTitle), findsOneWidget);
  });

  testWidgets('disables create when the account is unclaimed', (tester) async {
    await tester.pumpWidget(
      _wrap(const UserApplications(), api: _FakeOAuth2Api(), unclaimed: true),
    );
    await tester.pumpAndSettle();

    final FluxerButton button = tester.widget<FluxerButton>(
      find.widgetWithText(FluxerButton, testL10n.applicationsCreate),
    );
    expect(button.onPressed, isNull);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is FluxerTooltip &&
            widget.message == testL10n.applicationsCreateClaimTooltip,
      ),
      findsOneWidget,
    );
  });
}
