import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_actions.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

ProfileBadgeResponse _badge({
  required String kind,
  ProfileBadgeResponseDetails? details,
  HexString16Type? asset,
}) {
  return ProfileBadgeResponse(
    key: kind,
    kind: kind,
    label: 'Label',
    asset: asset,
    assetUrl: null,
    aspectRatio: null,
    caption: null,
    href: null,
    details: details,
  );
}

void main() {
  group('profileBadgeUsesDetailSheet', () {
    test('is false without details', () {
      expect(profileBadgeUsesDetailSheet(_badge(kind: 'staff')), isFalse);
    });

    test('is true with multiple detail lines', () {
      expect(
        profileBadgeUsesDetailSheet(
          _badge(
            kind: 'operator_pass',
            asset: 'abc',
            details: const ProfileBadgeResponseDetails(
              title: 'Operator',
              lines: <String>['Line one', 'Line two'],
            ),
          ),
        ),
        isTrue,
      );
    });

    test('is true with one line and badge art', () {
      expect(
        profileBadgeUsesDetailSheet(
          _badge(
            kind: 'operator_pass',
            asset: 'abc',
            details: const ProfileBadgeResponseDetails(
              title: 'Operator',
              lines: <String>['Since January 2026'],
            ),
          ),
        ),
        isTrue,
      );
    });

    test('is false with one line and no art', () {
      expect(
        profileBadgeUsesDetailSheet(
          _badge(
            kind: 'staff',
            details: const ProfileBadgeResponseDetails(
              title: 'Staff',
              lines: <String>['Fluxer staff'],
            ),
          ),
        ),
        isFalse,
      );
    });
  });

  group('profileBadgeToastMessage', () {
    test('falls back to label', () {
      expect(profileBadgeToastMessage(_badge(kind: 'staff')), 'Label');
    });

    test('combines title and single line', () {
      expect(
        profileBadgeToastMessage(
          _badge(
            kind: 'staff',
            details: const ProfileBadgeResponseDetails(
              title: 'Staff',
              lines: <String>['Team member'],
            ),
          ),
        ),
        'Staff\nTeam member',
      );
    });
  });

  group('profileBadgeToastLeading', () {
    test('returns null without image or caption', () {
      expect(
        profileBadgeToastLeading(_FakeBuildContext(), _badge(kind: 'staff')),
        isNull,
      );
    });
  });
}

class _FakeBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
