part of 'user_settings_view_model.dart';

JsonNullable<T> _patchField<T>(bool include, T? value) {
  if (include) {
    return JsonNullable.of(value);
  }
  return const JsonNullable.undefined();
}

bool _guildAssetCleared(GuildAssetMode mode) {
  return mode == GuildAssetMode.inherit || mode == GuildAssetMode.unset;
}

UserUpdateWithVerificationRequest buildCurrentUserProfileUpdateRequest(
  UserSettingsViewState state,
) {
  return UserUpdateWithVerificationRequest(
    globalName: _patchField(
      state.isEditedDisplayNameSet &&
          state.editedDisplayName != state.displayName,
      state.editedDisplayName,
    ),
    bio: _patchField(
      state.isEditedBioSet && state.editedBio != state.bio,
      state.editedBio,
    ),
    pronouns: _patchField(
      state.isEditedPronounsSet && state.editedPronouns != state.pronouns,
      state.editedPronouns,
    ),
    accentColor: _patchField(
      state.isEditedAccentColorSet &&
          state.editedAccentColor != state.accentColor,
      state.editedAccentColor,
    ),
    avatar: _patchField(
      state.editedAvatarBase64 != null || state.avatarCleared,
      state.editedAvatarBase64,
    ),
    banner: _patchField(
      state.editedBannerBase64 != null || state.bannerCleared,
      state.editedBannerBase64,
    ),
    premiumBadgeHidden:
        state.isEditedPremiumBadgeHiddenSet &&
            state.editedPremiumBadgeHidden != state.premiumBadgeHidden
        ? state.editedPremiumBadgeHidden
        : null,
    premiumBadgeMasked:
        state.isEditedPremiumBadgeMaskedSet &&
            state.editedPremiumBadgeMasked != state.premiumBadgeMasked
        ? state.editedPremiumBadgeMasked
        : null,
    premiumBadgeTimestampHidden:
        state.isEditedPremiumBadgeTimestampHiddenSet &&
            state.editedPremiumBadgeTimestampHidden !=
                state.premiumBadgeTimestampHidden
        ? state.editedPremiumBadgeTimestampHidden
        : null,
    premiumBadgeSequenceHidden:
        state.isEditedPremiumBadgeSequenceHiddenSet &&
            state.editedPremiumBadgeSequenceHidden !=
                state.premiumBadgeSequenceHidden
        ? state.editedPremiumBadgeSequenceHidden
        : null,
  );
}

MyGuildMemberUpdateRequest buildGuildMemberProfileUpdateRequest(
  UserSettingsViewState state, {
  required int profileFlags,
}) {
  return MyGuildMemberUpdateRequest(
    bio: JsonNullable.of(
      state.isEditedGuildBioSet ? state.editedGuildBio : state.guildBio,
    ),
    pronouns: JsonNullable.of(
      state.isEditedGuildPronounsSet
          ? state.editedGuildPronouns
          : state.guildPronouns,
    ),
    accentColor: JsonNullable.of(
      state.isEditedGuildAccentColorSet
          ? state.editedGuildAccentColor
          : state.guildAccentColor,
    ),
    nick: _patchField(
      state.canChangeNickname,
      state.isEditedNickSet ? state.editedNick : state.guildNick,
    ),
    avatar: _guildAssetCleared(state.guildAvatarMode)
        ? const JsonNullable.of(null)
        : _patchField(
            state.editedGuildAvatarBase64 != null,
            state.editedGuildAvatarBase64,
          ),
    banner: _guildAssetCleared(state.guildBannerMode)
        ? const JsonNullable.of(null)
        : _patchField(
            state.editedGuildBannerBase64 != null,
            state.editedGuildBannerBase64,
          ),
    profileFlags: _patchField(profileFlags != 0, profileFlags),
  );
}
