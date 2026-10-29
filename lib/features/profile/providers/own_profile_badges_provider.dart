import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_keys.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'own_profile_badges_provider.g.dart';

const Duration _kProfileBadgesPreviewDebounce = Duration(milliseconds: 250);

ProfileBadgePreviewRequest profileBadgePreviewRequestFrom(
  UserSettingsViewState settings,
) {
  return ProfileBadgePreviewRequest(
    hiddenProfileBadges: sortedProfileBadgeKeys(
      settings.effectiveHiddenProfileBadges,
    ),
    premiumBadgeMasked: settings.effectivePremiumBadgeMasked,
    premiumBadgeTimestampHidden: settings.effectivePremiumBadgeTimestampHidden,
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
class OwnProfileBadgesSettingsPreview
    extends _$OwnProfileBadgesSettingsPreview {
  @override
  Future<ProfileBadgePreviewResponse?> build() async {
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    if (settings.userId.isEmpty || !settings.isProfileLoaded) {
      return null;
    }

    await Future<void>.delayed(_kProfileBadgesPreviewDebounce);
    if (!ref.mounted) {
      return null;
    }

    final UserSettingsViewState latest = ref.read(
      userSettingsViewModelProvider,
    );
    if (latest.userId.isEmpty || !latest.isProfileLoaded) {
      return null;
    }

    final ProfileBadgePreviewRequest body = profileBadgePreviewRequestFrom(
      latest,
    );

    try {
      return await ref
          .read(fluxerClientProvider)
          .users
          .previewProfileBadges(body: body);
    } on Object catch (e, st) {
      talker.error('Failed to preview profile badges', e, st);
      return null;
    }
  }
}

@riverpod
class OwnProfileBadgesPreview extends _$OwnProfileBadgesPreview {
  @override
  Future<List<ProfileBadgeResponse>> build() async {
    final AsyncValue<ProfileBadgePreviewResponse?> settingsPreview = ref.watch(
      ownProfileBadgesSettingsPreviewProvider,
    );
    return settingsPreview.value?.profileBadges ??
        const <ProfileBadgeResponse>[];
  }
}
