import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/declared_age_range_gate.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/age/play_integrity_age_service.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/mature_content_gate_copy.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

void main() {
  group('gate copy', () {
    String body({
      bool playInstallRequired = false,
      bool playVerificationRequired = false,
    }) {
      return resolveMatureContentGateCopy(
        l10n: testL10n,
        reason: MatureContentGateReason.regionLocked,
        context: groupDmMatureGateContext('channel-1'),
        playInstallRequired: playInstallRequired,
        playVerificationRequired: playVerificationRequired,
      ).body;
    }

    test('region lock asks for a Play install when required', () {
      expect(
        body(playInstallRequired: true),
        testL10n.matureContentInstallFromPlayBody,
      );
    });

    test('region lock asks for a Play Store check when required', () {
      expect(
        body(playVerificationRequired: true),
        testL10n.matureContentVerifyInPlayBody,
      );
    });

    test('a missing Play install wins over a pending Play Store check', () {
      expect(
        body(playInstallRequired: true, playVerificationRequired: true),
        testL10n.matureContentInstallFromPlayBody,
      );
    });

    test('region lock keeps the legal copy otherwise', () {
      expect(body(), testL10n.matureContentRegionLockedBody);
    });

    test('other reasons ignore the flag', () {
      expect(
        resolveMatureContentGateCopy(
          l10n: testL10n,
          reason: MatureContentGateReason.minorBlocked,
          context: groupDmMatureGateContext('channel-1'),
          playInstallRequired: true,
        ).body,
        isNot(testL10n.matureContentInstallFromPlayBody),
      );
    });
  });

  group('matureGatePlayInstallRequiredProvider', () {
    Future<bool> resolve({
      required bool playInstallRequired,
      required MatureGeoStatus geo,
    }) async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          playInstallRequiredProvider.overrideWithValue(playInstallRequired),
          matureGeoStatusProvider.overrideWith((Ref ref) => geo),
        ],
      );
      addTearDown(container.dispose);
      await container.read(matureGeoStatusProvider.future);
      return container.read(matureGatePlayInstallRequiredProvider);
    }

    test('is true in a restricted region', () async {
      expect(
        await resolve(
          playInstallRequired: true,
          geo: MatureGeoStatus.restricted,
        ),
        isTrue,
      );
    });

    test(
      'is false in a blocked region, where verifying would not help',
      () async {
        expect(
          await resolve(
            playInstallRequired: true,
            geo: MatureGeoStatus.blocked,
          ),
          isFalse,
        );
      },
    );

    test('is false in an unrestricted region', () async {
      expect(
        await resolve(playInstallRequired: true, geo: MatureGeoStatus.none),
        isFalse,
      );
    });

    test('is false for a Play install', () async {
      expect(
        await resolve(
          playInstallRequired: false,
          geo: MatureGeoStatus.restricted,
        ),
        isFalse,
      );
    });
  });

  group('matureGatePlayVerificationRequiredProvider', () {
    Future<bool> resolve({
      required bool playVerificationRequired,
      required MatureGeoStatus geo,
    }) async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          playVerificationRequiredProvider.overrideWithValue(
            playVerificationRequired,
          ),
          matureGeoStatusProvider.overrideWith((Ref ref) => geo),
        ],
      );
      addTearDown(container.dispose);
      await container.read(matureGeoStatusProvider.future);
      return container.read(matureGatePlayVerificationRequiredProvider);
    }

    test('is true in a restricted region', () async {
      expect(
        await resolve(
          playVerificationRequired: true,
          geo: MatureGeoStatus.restricted,
        ),
        isTrue,
      );
    });

    test('is false in a blocked region', () async {
      expect(
        await resolve(
          playVerificationRequired: true,
          geo: MatureGeoStatus.blocked,
        ),
        isFalse,
      );
    });
  });

  group('under minimum lock screen', () {
    Widget app() {
      final colorTheme = buildDarkColorTheme();
      return ProviderScope(
        overrides: [
          declaredAgeFloorProvider.overrideWith(
            (Ref ref) => DeclaredAgeFloor.underMinimum,
          ),
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
          home: const DeclaredAgeRangeGate(child: SizedBox.shrink()),
        ),
      );
    }

    for (final (TargetPlatform platform, String expected)
        in <(TargetPlatform, String)>[
          (TargetPlatform.android, testL10n.ageRangeUnderMinimumBodyGoogle),
          (TargetPlatform.iOS, testL10n.ageRangeUnderMinimumBody),
        ]) {
      testWidgets('names the right account on ${platform.name}', (
        WidgetTester tester,
      ) async {
        debugDefaultTargetPlatformOverride = platform;
        addTearDown(() => debugDefaultTargetPlatformOverride = null);
        await tester.pumpWidget(app());
        await tester.pumpAndSettle();
        expect(find.text(expected), findsOneWidget);
        debugDefaultTargetPlatformOverride = null;
      });
    }
  });
}
