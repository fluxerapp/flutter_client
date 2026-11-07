import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_age_range_unlock.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../../helpers/test_l10n.dart';

const String _userId = 'user-1';

class _User extends CurrentUserPrivateRead {
  _User({required this.matureContentUnlocked});

  final bool matureContentUnlocked;

  @override
  UserPrivateResponse? build(String accountUserId) {
    return UserPrivateResponse.fromJson(<String, Object?>{
      'id': _userId,
      'username': 'tester',
      'discriminator': '0001',
      'flags': 0,
      'is_staff': false,
      'acls': <String>[],
      'traits': <String>[],
      'mfa_enabled': false,
      'verified': true,
      'has_verified_phone': false,
      'premium_will_cancel': false,
      'premium_badge_hidden': false,
      'premium_badge_masked': false,
      'premium_badge_timestamp_hidden': false,
      'premium_badge_sequence_hidden': false,
      'premium_purchase_disabled': false,
      'premium_enabled_override': false,
      'premium_discriminator': false,
      'premium_perks_disabled': false,
      'required_actions': <String>[],
      'nsfw_allowed': true,
      'has_dismissed_premium_onboarding': false,
      'has_ever_purchased': false,
      'has_unread_gift_inventory': false,
      'unread_gift_inventory_count': 0,
      'used_mobile_client': true,
      'mature_content_unlocked': matureContentUnlocked,
    });
  }
}

Widget _app({
  bool supported = true,
  MatureGeoStatus geo = MatureGeoStatus.restricted,
  bool matureContentUnlocked = false,
  DeclaredAgeReport? report,
}) {
  final colorTheme = buildDarkColorTheme();
  final ProviderContainer container = ProviderContainer(
    overrides: [
      declaredAgeReportingSupportedProvider.overrideWithValue(supported),
      currentUserIdProvider.overrideWithValue(_userId),
      currentUserPrivateReadProvider(
        _userId,
      ).overrideWith(() => _User(matureContentUnlocked: matureContentUnlocked)),
      matureGeoStatusProvider.overrideWith(
        (Ref ref) => Future<MatureGeoStatus>.value(geo),
      ),
      declaredAgeRequirementProvider.overrideWith(
        (Ref ref) => (available: true, required: false),
      ),
      declaredAgeReportProvider.overrideWithValue(report),
    ],
  );
  addTearDown(container.dispose);
  return UncontrolledProviderScope(
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
      home: const Scaffold(body: PrivacyAgeRangeUnlock()),
    ),
  );
}

void main() {
  testWidgets('offers the button in a restricted region on fluxer.com', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    expect(find.text(testL10n.ageRangeUnlockBody), findsOneWidget);
    expect(find.text(testL10n.ageRangeUnlockHelpLink), findsOneWidget);
    expect(find.text(testL10n.ageRangeUnlockButton), findsOneWidget);
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('shows nothing on a self-hosted instance', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_app(supported: false));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.ageRangeUnlockButton), findsNothing);
    expect(find.text(testL10n.ageRangeUnlockHelpLink), findsNothing);
  });

  testWidgets('shows nothing outside a restricted region', (
    WidgetTester tester,
  ) async {
    for (final MatureGeoStatus geo in <MatureGeoStatus>[
      MatureGeoStatus.none,
      MatureGeoStatus.blocked,
    ]) {
      await tester.pumpWidget(_app(geo: geo));
      await tester.pumpAndSettle();

      expect(find.text(testL10n.ageRangeUnlockButton), findsNothing);
    }
  });

  testWidgets('shows nothing once the server reports an adult', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_app(matureContentUnlocked: true));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.ageRangeUnlockButton), findsNothing);
  });

  testWidgets('says an age range under 18 stays on the device', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    await tester.pumpWidget(_app(report: DeclaredAgeReport.minor));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.ageRangeUnlockUnderAdultGoogle), findsOneWidget);
    expect(find.text(testL10n.ageRangeUnlockButton), findsNothing);
    debugDefaultTargetPlatformOverride = null;
  });
}
