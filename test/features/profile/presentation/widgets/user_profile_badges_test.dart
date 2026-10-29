// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_badges.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../helpers/test_l10n.dart';

Widget _buildApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: FluxerToastOverlay(
        child: Scaffold(body: Center(child: child)),
      ),
    ),
  );
}

ProfileBadgeResponse _badge({
  required String kind,
  String? asset,
  String? caption,
  String label = 'Badge label',
}) {
  return ProfileBadgeResponse(
    key: kind,
    kind: kind,
    label: label,
    asset: asset,
    assetUrl: null,
    aspectRatio: null,
    caption: caption,
    href: null,
  );
}

void main() {
  group('UserProfileBadges', () {
    testWidgets('renders nothing for empty badges', (tester) async {
      await tester.pumpWidget(_buildApp(const UserProfileBadges(badges: [])));
      expect(find.byType(UserProfileBadges), findsOneWidget);
      expect(find.text('Badge label'), findsNothing);
    });

    testWidgets('renders caption badge text', (tester) async {
      await tester.pumpWidget(
        _buildApp(
          UserProfileBadges(
            badges: <ProfileBadgeResponse>[
              _badge(kind: 'visionary_number', caption: '#42'),
            ],
          ),
        ),
      );
      expect(find.text('#42'), findsOneWidget);
    });

    test('hasBadges reflects list length', () {
      expect(UserProfileBadges.hasBadges([]), isFalse);
      expect(
        UserProfileBadges.hasBadges(<ProfileBadgeResponse>[
          _badge(kind: 'staff', asset: 'abc'),
        ]),
        isTrue,
      );
    });
  });
}
