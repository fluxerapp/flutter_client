import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/plutonium_store_gate.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_page.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_security_login.dart';
import 'package:fluxer_app/features/settings/providers/commerce/plutonium_store_provider.dart';
import 'package:fluxer_app/features/settings/providers/commerce/store_billing_context_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/services/plutonium_store_products.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_client.dart';
import 'package:fluxer_app/features/settings/services/premium_store_purchase_update.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/test_account_user_id.dart';
import '../../../helpers/test_l10n.dart';

class _FakeStoreClient implements PremiumStorePurchaseClient {
  _FakeStoreClient(this.storefront);

  final String? storefront;
  final StreamController<List<PremiumStorePurchaseUpdate>> updates =
      StreamController<List<PremiumStorePurchaseUpdate>>.broadcast();
  int quietRestores = 0;

  @override
  bool get supportsPurchases => true;

  @override
  PremiumBillingStore get billingStore => PremiumBillingStore.appStore;

  @override
  Future<bool> isStoreAvailable() async => true;

  @override
  Future<PremiumStoreProductSet> loadProducts(
    PremiumStoreCatalog catalog,
  ) async {
    return PremiumStoreProductSet(
      monthly: PremiumStoreProduct(
        id: catalog.monthly!.productId,
        priceLabel: r'$4.99',
        rawPrice: 4.99,
        appAccountToken: catalog.appAccountToken,
      ),
      yearly: PremiumStoreProduct(
        id: catalog.yearly!.productId,
        priceLabel: r'$49.99',
        rawPrice: 49.99,
        appAccountToken: catalog.appAccountToken,
      ),
    );
  }

  @override
  Future<bool> buy(PremiumStoreProduct product) async => true;

  @override
  Stream<List<PremiumStorePurchaseUpdate>> get purchaseUpdates =>
      updates.stream;

  @override
  Future<void> complete(PremiumStorePurchaseUpdate purchase) async {}

  @override
  Future<void> restore({required bool userInitiated}) async {
    if (!userInitiated) {
      quietRestores += 1;
    }
    updates.add(const <PremiumStorePurchaseUpdate>[]);
  }

  @override
  Future<String?> storefrontCountryCode() async => storefront;
}

class _FixedBillingContext extends StoreBillingContextNotifier {
  @override
  Future<StoreBillingContextResponse> build() async {
    return const StoreBillingContextResponse(
      appAccountToken: 'token',
      appStore: StoreBillingContextResponseAppStore(
        enabled: true,
        bundleIds: <String>['com.fluxer'],
        products: <StoreBillingAppStoreProductResponse>[
          StoreBillingAppStoreProductResponse(
            productId: 'plutonium_monthly',
            slot: StoreSlot.monthly,
          ),
          StoreBillingAppStoreProductResponse(
            productId: 'plutonium_yearly',
            slot: StoreSlot.yearly,
          ),
        ],
      ),
      googlePlay: StoreBillingContextResponseGooglePlay(
        enabled: false,
        packageNames: <String>[],
        products: <StoreBillingGooglePlayProductResponse>[],
      ),
      purchaseBlockedReason: null,
      blockingProvider: null,
    );
  }
}

class _SlowBillingContext extends _FixedBillingContext {
  static Completer<void> gate = Completer<void>();

  @override
  Future<StoreBillingContextResponse> build() async {
    await gate.future;
    return super.build();
  }
}

class _FailingBillingContext extends StoreBillingContextNotifier {
  @override
  Future<StoreBillingContextResponse> build() {
    throw StateError('offline');
  }
}

class _User extends UserSettingsViewModel {
  _User({required this.verified});

  final bool verified;

  @override
  UserSettingsViewState build() {
    return UserSettingsViewState(
      userId: '1',
      username: 'user',
      displayName: 'user',
      discriminator: '0001',
      avatar: null,
      avatarColor: null,
      memberSince: null,
      status: 'online',
      messageDisplayCompact: false,
      developerMode: false,
      trustedDomains: <String>[],
      email: 'user@example.com',
      verified: verified,
      isProfileLoaded: true,
    );
  }
}

class _PrivateUser extends CurrentUserPrivateRead {
  _PrivateUser({required this.verified});

  final bool verified;

  @override
  UserPrivateResponse? build(String accountUserId) {
    return UserPrivateResponse(
      hasVerifiedPhone: false,
      username: 'user',
      discriminator: '0001',
      globalName: null,
      avatar: null,
      avatarColor: null,
      privacyAgreedAt: null,
      termsAgreedAt: null,
      pendingBulkMessageDeletion: null,
      flags: 0,
      unreadGiftInventoryCount: 0,
      isStaff: false,
      acls: [],
      traits: [],
      email: 'user@example.com',
      hasUnreadGiftInventory: false,
      hasEverPurchased: false,
      id: '1',
      bio: null,
      pronouns: null,
      accentColor: null,
      banner: null,
      hasDismissedPremiumOnboarding: true,
      bannerColor: null,
      mfaEnabled: false,
      nsfwAllowed: true,
      verified: verified,
      premiumType: null,
      premiumSince: null,
      premiumUntil: null,
      premiumWillCancel: false,
      premiumBillingCycle: null,
      premiumLifetimeSequence: null,
      premiumGraceEndsAt: null,
      premiumDiscriminator: false,
      requiredActions: [],
      premiumBadgeMasked: false,
      premiumBadgeTimestampHidden: false,
      premiumBadgeSequenceHidden: false,
      premiumPurchaseDisabled: false,
      premiumEnabledOverride: false,
      passwordLastChangedAt: null,
      lastVoiceActivitySharingChangeAt: null,
      premiumBadgeHidden: false,
      premiumPerksDisabled: false,
      hiddenProfileBadges: <String>[],
    );
  }
}

class _OfflineClient implements FluxerClient {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw DioException(
    requestOptions: RequestOptions(path: '/'),
    type: DioExceptionType.connectionError,
  );
}

Future<_FakeStoreClient> _pumpPage(
  WidgetTester tester, {
  required String? storefront,
  bool billingFails = false,
  bool billingSlow = false,
  bool verified = true,
}) async {
  tester.view
    ..physicalSize = const Size(1179, 2556)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  final _FakeStoreClient client = _FakeStoreClient(storefront);
  addTearDown(client.updates.close);
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerClientProvider.overrideWithValue(_OfflineClient()),
        isActiveInstanceOfficialProvider.overrideWithValue(true),
        premiumStorePurchasesEnabledProvider.overrideWithValue(true),
        premiumStorePurchaseClientProvider.overrideWithValue(client),
        storeBillingContextProvider.overrideWith(
          billingFails
              ? _FailingBillingContext.new
              : billingSlow
              ? _SlowBillingContext.new
              : _FixedBillingContext.new,
        ),
        userSettingsViewModelProvider.overrideWith(
          () => _User(verified: verified),
        ),
        currentUserPrivateReadProvider(
          kTestAccountUserId,
        ).overrideWith(() => _PrivateUser(verified: verified)),
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
        home: const FluxerToastOverlay(
          child: Scaffold(body: PremiumStorePage()),
        ),
      ),
    ),
  );
  for (int i = 0; i < 5; i++) {
    await tester.pump(const Duration(milliseconds: 50));
  }
  return client;
}

Future<void> _unmount(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  debugDefaultTargetPlatformOverride = null;
}

void main() {
  testWidgets('iOS hides the donate link in every storefront', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    await _pumpPage(tester, storefront: 'USA');
    expect(find.textContaining('Donate instead.'), findsNothing);
    expect(find.text(testL10n.storePlutoniumAppleEula), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await _pumpPage(tester, storefront: 'SWE');
    expect(find.textContaining('Donate instead.'), findsNothing);
    await _unmount(tester);
  });

  testWidgets('iOS offers to try again when the plans fail to load', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    await _pumpPage(tester, storefront: 'USA', billingFails: true);
    expect(find.text(testL10n.storePlutoniumLoadFailed), findsOneWidget);
    expect(find.text(testL10n.storePlutoniumRetry), findsOneWidget);
    await _unmount(tester);
  });

  testWidgets('iOS checks ownership once the plans finish loading', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    _SlowBillingContext.gate = Completer<void>();
    final _FakeStoreClient client = await _pumpPage(
      tester,
      storefront: 'USA',
      billingSlow: true,
    );
    expect(client.quietRestores, 0);

    _SlowBillingContext.gate.complete();
    for (int i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(client.quietRestores, 1);
    await _unmount(tester);
  });

  testWidgets('iOS sends an unverified user to settings to verify', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    await _pumpPage(tester, storefront: 'USA', verified: false);
    expect(find.text(testL10n.premiumVerifyEmailToPurchase), findsOneWidget);
    final Finder openSettings = find.text(testL10n.nagbarOpenSettings);
    expect(openSettings, findsOneWidget);

    await tester.tap(openSettings);
    for (int i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.byType(UserSecurityLogin), findsOneWidget);
    await _unmount(tester);
  });
}
