import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/domain/registration_result.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/register_screen.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/registration_draft_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

const RegistrationDraft _completeDraft = RegistrationDraft(
  email: 'user@example.com',
  password: 'hunter2hunter2',
  confirmPassword: 'hunter2hunter2',
  birthMonth: 1,
  birthDay: 2,
  birthYear: 1990,
  consent: true,
);

void main() {
  testWidgets('omits the consent row when the instance has no legal URLs', (
    tester,
  ) async {
    final ProviderContainer container = _containerFor(
      _snapshot(selfHosted: true),
    );

    await tester.pumpWidget(_app(container));
    await tester.pumpAndSettle();

    expect(find.byType(FluxerCheckbox), findsNothing);
    expect(find.text(testL10n.registerConsentTerms), findsNothing);
    expect(find.text(testL10n.registerConsentPrivacy), findsNothing);
  });

  testWidgets('links the instance legal documents when they are published', (
    tester,
  ) async {
    final ProviderContainer container = _containerFor(
      _snapshot(
        selfHosted: true,
        termsUrl: 'https://self.example/legal/terms',
        privacyUrl: 'https://self.example/legal/privacy',
      ),
    );

    await tester.pumpWidget(_app(container));
    await tester.pumpAndSettle();

    expect(find.byType(FluxerCheckbox), findsOneWidget);
    final Iterable<String?> urls = tester
        .widgetList<FluxerTextLink>(find.byType(FluxerTextLink))
        .map((FluxerTextLink link) => link.url);
    expect(
      urls,
      containsAll(<String>[
        'https://self.example/legal/terms',
        'https://self.example/legal/privacy',
      ]),
    );
  });

  testWidgets(
    'falls back to the instance marketing site when not self-hosted',
    (tester) async {
      final ProviderContainer container = _containerFor(_snapshot());

      await tester.pumpWidget(_app(container));
      await tester.pumpAndSettle();

      final Iterable<String?> urls = tester
          .widgetList<FluxerTextLink>(find.byType(FluxerTextLink))
          .map((FluxerTextLink link) => link.url);
      expect(
        urls,
        containsAll(<String>[
          'https://self.example/terms',
          'https://self.example/privacy',
        ]),
      );
    },
  );

  testWidgets('renders only the terms link when no privacy URL exists', (
    tester,
  ) async {
    final ProviderContainer container = _containerFor(
      _snapshot(selfHosted: true, termsUrl: 'https://self.example/terms'),
    );

    await tester.pumpWidget(_app(container));
    await tester.pumpAndSettle();

    expect(find.byType(FluxerCheckbox), findsOneWidget);
    expect(find.text(testL10n.registerConsentTerms), findsOneWidget);
    expect(find.text(testL10n.registerConsentPrivacy), findsNothing);
  });

  testWidgets('blocks submit with a notice when registration is closed', (
    tester,
  ) async {
    final ProviderContainer container = _containerFor(
      _snapshot(
        selfHosted: true,
        mode: WellKnownFluxerResponseRegistrationModeMode.closed,
      ),
    );
    container.read(registrationDraftProvider.notifier).update(_completeDraft);

    await tester.pumpWidget(_app(container));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.registerClosed), findsOneWidget);
    expect(_submitButton(tester).onPressed, isNull);
  });

  testWidgets('accepts the same draft when registration is open', (
    tester,
  ) async {
    final ProviderContainer container = _containerFor(
      _snapshot(selfHosted: true),
    );
    container.read(registrationDraftProvider.notifier).update(_completeDraft);

    await tester.pumpWidget(_app(container));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.registerClosed), findsNothing);
    expect(_submitButton(tester).onPressed, isNotNull);
  });

  testWidgets('shows the pending notice after an approval-mode signup', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        authInstanceSnapshotProvider.overrideWith(
          (ref) => _snapshot(selfHosted: true),
        ),
        authRepositoryProvider.overrideWithValue(
          _PendingApprovalAuthRepository(),
        ),
      ],
    );
    addTearDown(container.dispose);
    container.read(registrationDraftProvider.notifier).update(_completeDraft);

    await tester.pumpWidget(_app(container));
    await tester.pumpAndSettle();
    final Finder submit = find.widgetWithText(
      FluxerButton,
      testL10n.registerSubmit,
    );
    await tester.ensureVisible(submit);
    await tester.pumpAndSettle();
    await tester.tap(submit);
    await tester.pumpAndSettle();

    expect(find.text(testL10n.registerPendingApproval), findsOneWidget);
    expect(find.text(testL10n.errorUnableToCreateAccount), findsNothing);
    expect(_submitButton(tester).onPressed, isNull);
  });
}

FluxerButton _submitButton(WidgetTester tester) {
  return tester.widget<FluxerButton>(
    find.widgetWithText(FluxerButton, testL10n.registerSubmit),
  );
}

class _PendingApprovalAuthRepository implements AuthRepository {
  @override
  Future<RegistrationResult> register({
    required String email,
    required String password,
    required String dateOfBirth,
    String? username,
    String? displayName,
    String? inviteCode,
  }) async {
    return const RegistrationPendingApproval('900000000000000001');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

ProviderContainer _containerFor(InstanceConfigSnapshot snapshot) {
  final ProviderContainer container = ProviderContainer(
    overrides: [authInstanceSnapshotProvider.overrideWith((ref) => snapshot)],
  );
  addTearDown(container.dispose);
  return container;
}

Widget _app(ProviderContainer container) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: SingleChildScrollView(child: RegisterScreen(onBack: () {})),
      ),
    ),
  );
}

InstanceConfigSnapshot _snapshot({
  bool selfHosted = false,
  String? termsUrl,
  String? privacyUrl,
  WellKnownFluxerResponseRegistrationModeMode mode =
      WellKnownFluxerResponseRegistrationModeMode.open,
}) {
  return InstanceConfigSnapshot(
    apiBaseUrl: 'https://self.example/api',
    gatewayUrl: 'wss://self.example/gateway',
    displayDomain: 'self.example',
    wellKnown: WellKnownFluxerResponse(
      apiCodeVersion: 1,
      endpoints: const WellKnownFluxerResponseEndpoints(
        api: 'https://self.example/api',
        apiClient: 'https://self.example/api/client',
        apiPublic: 'https://self.example/api/public',
        gateway: 'wss://self.example/gateway',
        media: 'https://self.example/media',
        staticCdn: 'https://self.example/static',
        marketing: 'https://self.example',
        admin: 'https://self.example/admin',
        invite: 'https://self.example/invite',
        gift: 'https://self.example/gift',
        webapp: 'https://self.example/webapp',
      ),
      captcha: const WellKnownFluxerResponseCaptcha(
        provider: 'none',
        hcaptchaSiteKey: null,
        turnstileSiteKey: null,
      ),
      features: WellKnownFluxerResponseFeatures(
        voiceEnabled: true,
        stripeEnabled: false,
        selfHosted: selfHosted,
        presignedAttachmentUploads: false,
        emailsEnabled: true,
      ),
      gif: const WellKnownFluxerResponseGif(
        provider: 'tenor',
        displayName: 'Tenor',
        attributionRequired: false,
      ),
      sso: const WellKnownFluxerResponseSso(
        enabled: false,
        enforced: false,
        displayName: null,
        redirectUri: 'https://self.example/sso',
      ),
      registration: WellKnownFluxerResponseRegistration(
        mode: mode,
        adminRegistrationUrlsEnabled: false,
      ),
      community: const WellKnownFluxerResponseCommunity(
        singleCommunity: false,
        singleCommunityGuildId: null,
        directMessagesDisabled: false,
      ),
      services: const WellKnownFluxerResponseServices(
        gifEnabled: true,
        youtubeEnabled: true,
        blueskyEnabled: false,
      ),
      limits: const WellKnownFluxerResponseLimits(
        version: WellKnownFluxerResponseLimitsVersionVersion.value2,
        traitDefinitions: <String>[],
        defaultsHash: 'test',
        rules: <WellKnownFluxerResponseLimitsRules>[],
      ),
      push: const WellKnownFluxerResponsePush(publicVapidKey: null),
      appPublic: WellKnownFluxerResponseAppPublic(
        branding: const WellKnownFluxerResponseAppPublicBranding(
          productName: 'Fluxer',
          iconUrl: null,
          symbolUrl: null,
          logoUrl: null,
          wordmarkUrl: null,
          faviconUrl: null,
          themeColor: null,
        ),
        setup: const WellKnownFluxerResponseAppPublicSetup(
          configured: true,
          adminUrl: null,
        ),
        legal: WellKnownFluxerResponseAppPublicLegal(
          termsUrl: termsUrl,
          privacyUrl: privacyUrl,
        ),
        registration: const WellKnownFluxerResponseAppPublicRegistration(
          collectDateOfBirth: true,
        ),
      ),
    ),
  );
}
