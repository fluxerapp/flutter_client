import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'own_profile_badges_provider.g.dart';

const Duration _kProfileBadgesPreviewDebounce = Duration(milliseconds: 250);

ProfileBadgePreviewRequest profileBadgePreviewRequestFrom(
  UserSettingsViewState settings,
) {
  return ProfileBadgePreviewRequest(
    premiumBadgeHidden: settings.effectivePremiumBadgeHidden,
    premiumBadgeMasked: settings.effectivePremiumBadgeMasked,
    premiumBadgeTimestampHidden: settings.effectivePremiumBadgeTimestampHidden,
    premiumBadgeSequenceHidden: settings.effectivePremiumBadgeSequenceHidden,
    operatorPassBadgeHidden: settings.effectiveOperatorPassBadgeHidden,
    operatorPassBadgeTimestampHidden:
        settings.effectiveOperatorPassBadgeTimestampHidden,
    operatorPassBadgeCountHidden:
        settings.effectiveOperatorPassBadgeCountHidden,
  );
}

@riverpod
List<ProfileBadgeResponse> ownProfileBadges(Ref ref) {
  final UserProfileFullResponse? profile = ref.watch(
    currentUserFullProfileProvider,
  );
  return profile?.profileBadges ?? const <ProfileBadgeResponse>[];
}

@riverpod
class OwnProfileBadgesPreview extends _$OwnProfileBadgesPreview {
  @override
  Future<List<ProfileBadgeResponse>> build() async {
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    if (settings.userId.isEmpty || !settings.isProfileLoaded) {
      return const <ProfileBadgeResponse>[];
    }

    await Future<void>.delayed(_kProfileBadgesPreviewDebounce);
    if (!ref.mounted) {
      return const <ProfileBadgeResponse>[];
    }

    final UserSettingsViewState latest = ref.read(
      userSettingsViewModelProvider,
    );
    if (latest.userId.isEmpty || !latest.isProfileLoaded) {
      return const <ProfileBadgeResponse>[];
    }

    final ProfileBadgePreviewRequest body = profileBadgePreviewRequestFrom(
      latest,
    );

    try {
      final ProfileBadgePreviewResponse response = await ref
          .read(fluxerClientProvider)
          .users
          .previewProfileBadges(body: body);
      return response.profileBadges;
    } on Object catch (e, st) {
      talker.error('Failed to preview profile badges', e, st);
      return const <ProfileBadgeResponse>[];
    }
  }
}
