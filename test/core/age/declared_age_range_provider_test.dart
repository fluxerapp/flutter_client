import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';

void main() {
  test('maps the shared age range to a floor', () {
    expect(declaredAgeFloorFromPayload(null), DeclaredAgeFloor.none);
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{'status': 'declined'}),
      DeclaredAgeFloor.none,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 18,
      }),
      DeclaredAgeFloor.none,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 16,
        'upperBound': 17,
      }),
      DeclaredAgeFloor.minor,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 13,
        'upperBound': 15,
      }),
      DeclaredAgeFloor.minor,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'upperBound': 12,
      }),
      DeclaredAgeFloor.underMinimum,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 0,
        'upperBound': 14,
      }),
      DeclaredAgeFloor.underMinimum,
    );
  });

  test('statuses without an age range produce no report', () {
    for (final String status in <String>[
      'declined',
      'verification_required',
      'not_installed_from_play',
      'unavailable',
    ]) {
      expect(
        declaredAgeReportFromPayload(<Object?, Object?>{'status': status}),
        isNull,
      );
    }
  });

  test('Play age bands map to the same reports as the server floors', () {
    Map<Object?, Object?> sharing(int lower, [int? upper]) {
      return <Object?, Object?>{
        'status': 'sharing',
        'lowerBound': lower,
        'upperBound': ?upper,
        'ageRangeSource': 'tier_a',
      };
    }

    expect(
      declaredAgeReportFromPayload(sharing(0, 12)),
      DeclaredAgeReport.underMinimum,
    );
    expect(
      declaredAgeReportFromPayload(sharing(13, 15)),
      DeclaredAgeReport.minor,
    );
    expect(
      declaredAgeReportFromPayload(sharing(16, 17)),
      DeclaredAgeReport.minor,
    );
    expect(declaredAgeReportFromPayload(sharing(18)), DeclaredAgeReport.adult);
    expect(
      declaredAgeReportFromPayload(sharing(0, 14)),
      DeclaredAgeReport.underMinimum,
    );
  });

  test('verification_required is the Play Store round trip', () {
    expect(
      declaredAgeVerificationRequired(<Object?, Object?>{
        'status': 'verification_required',
      }),
      isTrue,
    );
    expect(
      declaredAgeVerificationRequired(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 18,
      }),
      isFalse,
    );
    expect(declaredAgeVerificationRequired(null), isFalse);
  });

  test('reporting runs on iOS and FCM Android only', () {
    bool supported(
      TargetPlatform platform, {
      bool isWeb = false,
      bool isFirebaseMessaging = false,
    }) {
      return declaredAgeReportingSupported(
        isWeb: isWeb,
        platform: platform,
        isFirebaseMessaging: isFirebaseMessaging,
      );
    }

    expect(supported(TargetPlatform.iOS), isTrue);
    expect(
      supported(TargetPlatform.android, isFirebaseMessaging: true),
      isTrue,
    );
    expect(supported(TargetPlatform.android), isFalse);
    expect(supported(TargetPlatform.macOS), isFalse);
    expect(
      supported(TargetPlatform.android, isWeb: true, isFirebaseMessaging: true),
      isFalse,
    );
    expect(supported(TargetPlatform.iOS, isWeb: true), isFalse);
  });
}
