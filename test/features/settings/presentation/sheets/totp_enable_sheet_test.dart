// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/totp_enable_sheet.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/qr_code/fluxer_qr_code.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

class _FixedUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() {
    return const UserSettingsViewState(
      userId: '1',
      username: 'alice',
      displayName: 'Alice',
      discriminator: '0',
      avatar: null,
      avatarColor: null,
      memberSince: null,
      status: 'offline',
      messageDisplayCompact: false,
      developerMode: false,
      trustedDomains: <String>[],
      email: 'alice@example.com',
    );
  }
}

Widget _wrap({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      instanceRuntimeConfigProvider.overrideWithValue(
        InstanceRuntimeConfig.defaults,
      ),
      userSettingsViewModelProvider.overrideWith(_FixedUserSettings.new),
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
  testWidgets('shows a scannable QR code above the setup secret', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap(child: const TotpEnableSheet()));
    await tester.pumpAndSettle();

    expect(find.byType(FluxerQrCode), findsOneWidget);
    expect(find.textContaining('scan with authenticator'), findsNothing);

    final FluxerQrCode qr = tester.widget(find.byType(FluxerQrCode));
    expect(qr.data, startsWith('otpauth://totp/'));
    expect(qr.data, contains('alice%40example.com'));
    expect(qr.data, contains('secret='));
    expect(qr.data, contains('issuer=Fluxer'));

    final SelectableText secret = tester.widget(find.byType(SelectableText));
    expect(secret.data, hasLength(32));

    expect(
      tester.getTopLeft(find.byType(FluxerQrCode)).dy,
      lessThan(tester.getTopLeft(find.byType(SelectableText)).dy),
    );
  });
}
