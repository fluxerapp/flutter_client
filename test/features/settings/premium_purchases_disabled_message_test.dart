import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/constants/contact_emails.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_bar.dart';
import 'package:fluxer_app/features/settings/providers/plutonium_store_provider.dart';
import 'package:fluxer_app/features/settings/services/premium_checkout_service.dart';
import 'package:fluxer_app/features/settings/utils/plutonium_store_bar_mode.dart';
import 'package:fluxer_app/features/settings/utils/premium_purchases_disabled_l10n.dart';
import 'package:fluxer_app/features/settings/utils/premium_subscription_status.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/test_l10n.dart';

const String _hostedBody =
    'Purchases are disabled for this account. '
    'Contact support@fluxer.com if this looks wrong.';
const String _selfHostedBody =
    'Purchases are disabled for this account. '
    "Contact this instance's administrators if this looks wrong.";

const InstanceRuntimeConfig _selfHostedConfig = InstanceRuntimeConfig(
  productName: 'Example',
  selfHosted: true,
  stripeEnabled: true,
  emailsEnabled: true,
  voiceEnabled: true,
  presignedAttachmentUploads: true,
  gifEnabled: true,
  blueskyEnabled: true,
  gifAttributionRequired: false,
  singleCommunity: false,
  directMessagesDisabled: false,
  registrationClosed: false,
  adminRegistrationUrlsEnabled: false,
  collectDateOfBirth: true,
);

const PremiumSubscriptionStatus _status = PremiumSubscriptionStatus(
  isPremium: false,
  isVisionary: false,
  hasEverPurchased: false,
  premiumWillCancel: false,
  billingCycle: null,
  actualPremiumUntil: null,
  isGiftSubscription: false,
  gracePeriodInfo: PremiumGracePeriodInfo(
    isInGracePeriod: false,
    isExpired: false,
    showExpiredState: false,
  ),
  shouldShowPremiumCard: false,
  shouldUseCancelQuickAction: false,
  shouldUseReactivateQuickAction: false,
);

class _PurchaseDisabledBillingApi implements BillingApi {
  @override
  Future<UrlResponse> createCheckoutSession({
    required CreateCheckoutSessionRequest body,
  }) {
    final RequestOptions options = RequestOptions(path: '/checkout');
    throw DioException(
      requestOptions: options,
      response: Response<Object?>(
        requestOptions: options,
        statusCode: 403,
        data: const <String, dynamic>{'reason': 'purchase_disabled'},
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient() : super(Dio());

  final BillingApi _billing = _PurchaseDisabledBillingApi();

  @override
  BillingApi get billing => _billing;
}

Future<void> _pump(
  WidgetTester tester,
  Widget child, {
  required InstanceRuntimeConfig config,
}) {
  final colorTheme = buildDarkColorTheme();
  return tester.pumpWidget(
    ProviderScope(
      overrides: [
        fluxerClientProvider.overrideWithValue(_FakeClient()),
        instanceRuntimeConfigProvider.overrideWithValue(config),
      ],
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(body: child),
      ),
    ),
  );
}

Widget _storeBar() {
  return PremiumStoreBar(
    mode: PremiumStoreBarMode.subscribe,
    status: _status,
    store: const PremiumStoreState(
      purchaseBlockedReason: StorePurchaseBlockedReason.purchaseDisabled,
    ),
    purchaseDisabled: false,
    purchaseDisabledMessage: null,
    onBuy: (_) {},
    onManage: null,
  );
}

Widget _checkoutTrigger() {
  return Consumer(
    builder: (context, ref, _) => TextButton(
      onPressed: () => startPremiumCheckout(
        context: context,
        ref: ref,
        plan: PremiumCheckoutPlan.monthly,
        priceIds: const PriceIdsResponse(
          currency: 'USD',
          giftCurrency: 'USD',
          monthly: 'price_monthly',
        ),
      ),
      child: const Text('checkout'),
    ),
  );
}

void main() {
  test('the hosted message names the fluxer.com support mailbox', () {
    expect(ContactEmails.support, 'support@fluxer.com');
    expect(
      premiumPurchasesDisabledMessage(testL10n, selfHosted: false),
      _hostedBody,
    );
  });

  test('the self-hosted message names no mailbox', () {
    expect(
      premiumPurchasesDisabledMessage(testL10n, selfHosted: true),
      _selfHostedBody,
    );
  });

  test('no locale names a mailbox on a self-hosted instance', () {
    for (final locale in FluxerLocalizations.supportedLocales) {
      final FluxerLocalizations l10n = lookupFluxerLocalizations(locale);
      final String hosted = premiumPurchasesDisabledMessage(
        l10n,
        selfHosted: false,
      );
      final String selfHosted = premiumPurchasesDisabledMessage(
        l10n,
        selfHosted: true,
      );
      expect(hosted, contains(ContactEmails.support), reason: '$locale');
      expect(hosted, isNot(contains('fluxer.app')), reason: '$locale');
      expect(selfHosted, isNot(contains('@')), reason: '$locale');
      expect(selfHosted, isNot(contains('{')), reason: '$locale');
      expect(selfHosted, isNot(hosted), reason: '$locale');
    }
  });

  test(
    'the plan unavailable message drops support on a self-hosted instance',
    () {
      for (final locale in FluxerLocalizations.supportedLocales) {
        final FluxerLocalizations l10n = lookupFluxerLocalizations(locale);
        expect(
          premiumPlanUnavailableMessage(l10n, selfHosted: false),
          l10n.premiumPlanUnavailable,
          reason: '$locale',
        );
        expect(
          premiumPlanUnavailableMessage(l10n, selfHosted: true),
          l10n.premiumPlanUnavailableSelfHosted,
          reason: '$locale',
        );
      }
      expect(
        premiumPlanUnavailableMessage(testL10n, selfHosted: true),
        "This plan isn't available. Contact the administrators of this instance.",
      );
    },
  );

  testWidgets('the store bar names the support mailbox when hosted', (
    tester,
  ) async {
    await _pump(tester, _storeBar(), config: InstanceRuntimeConfig.defaults);

    expect(find.text(_hostedBody), findsOneWidget);
    expect(find.text(_selfHostedBody), findsNothing);
  });

  testWidgets('the store bar names the administrators when self-hosted', (
    tester,
  ) async {
    await _pump(tester, _storeBar(), config: _selfHostedConfig);

    expect(find.text(_selfHostedBody), findsOneWidget);
    expect(find.textContaining('@fluxer'), findsNothing);
  });

  testWidgets('the checkout error names the support mailbox when hosted', (
    tester,
  ) async {
    await _pump(
      tester,
      _checkoutTrigger(),
      config: InstanceRuntimeConfig.defaults,
    );
    await tester.tap(find.text('checkout'));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.premiumPurchasesDisabledTitle), findsOneWidget);
    expect(find.text(_hostedBody), findsOneWidget);
  });

  testWidgets('the checkout error names the administrators when self-hosted', (
    tester,
  ) async {
    await _pump(tester, _checkoutTrigger(), config: _selfHostedConfig);
    await tester.tap(find.text('checkout'));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.premiumPurchasesDisabledTitle), findsOneWidget);
    expect(find.text(_selfHostedBody), findsOneWidget);
    expect(find.textContaining('@fluxer'), findsNothing);
  });
}
