import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  test('profileBadgeImageUrl builds static CDN path', () {
    expect(
      profileBadgeImageUrl('42cd5fbc480b7847'),
      contains('/badges/42cd5fbc480b7847.webp'),
    );
  });

  test('profileBadgeImageHash prefers small asset at low height', () {
    const ProfileBadgeResponse badge = ProfileBadgeResponse(
      key: 'operator_pass',
      kind: 'operator_pass',
      label: 'Operator',
      asset: 'fullhash',
      assetUrl: null,
      smallAsset: 'smallhash',
      aspectRatio: null,
      caption: null,
      href: null,
    );
    expect(profileBadgeImageHash(badge, displayHeight: 20), 'smallhash');
    expect(profileBadgeImageHash(badge, displayHeight: 24), 'fullhash');
  });
}
