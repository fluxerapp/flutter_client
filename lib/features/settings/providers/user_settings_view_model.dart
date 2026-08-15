import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/premium/user_entitlements.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/settings/domain/guild_asset_mode.dart';
import 'package:fluxer_app/shared/external_links/external_link_utils.dart'
    as external_link_utils;
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_view_model.g.dart';

const int _kGuildProfileFlagAvatarUnset = 1 << 0;
const int _kGuildProfileFlagBannerUnset = 1 << 1;

class _ResetEdited {
  const _ResetEdited();
}

class UserSettingsViewState {
  static const _unset = Object();
  static const _resetEdited = _ResetEdited();

  final String userId;
  final String username;
  final String displayName;
  final String discriminator;
  final String? avatar;
  final int? avatarColor;
  final DateTime? memberSince;
  final String status;
  final bool messageDisplayCompact;
  final bool developerMode;
  final List<String> trustedDomains;
  final bool inlineEmbedMedia;
  final bool inlineAttachmentMedia;
  final bool renderEmbeds;
  final bool renderReactions;
  final RenderSpoilers renderSpoilers;
  final bool gifAutoPlay;
  final bool animateEmoji;
  final StickerAnimationOptions animateStickers;
  final bool defaultHideMutedChannels;

  // TODO(M0n7y5): server-sync once the SDK ships
  // `show_faded_unread_on_muted_channels`. For now this is an in-memory
  // accessibility toggle (resets on app restart) so we can ship the indicator
  // parity work without blocking on the SDK regen.
  final bool showFadedUnreadOnMutedChannels;

  final int publicFlags;

  final String? bio;
  final String? pronouns;
  final int? accentColor;
  final String? banner;
  final String? email;
  final bool verified;
  final bool isProfileLoaded;
  final String? passwordLastChangedAt;
  final bool mfaEnabled;
  final String? phone;
  final bool hasVerifiedPhone;
  final List<String> requiredActions;
  final List<int> authenticatorTypes;
  final bool premiumWillCancel;

  final int? premiumType;
  final List<String> traits;
  final bool premiumPerksDisabled;
  final String? premiumSince;
  final int? premiumLifetimeSequence;
  final bool premiumBadgeHidden;
  final bool premiumBadgeMasked;
  final bool premiumBadgeTimestampHidden;
  final bool premiumBadgeSequenceHidden;
  final bool premiumDiscriminator;
  final String? premiumUntil;
  final String? premiumBillingCycle;

  final Object? _editedPremiumBadgeHidden;
  final Object? _editedPremiumBadgeMasked;
  final Object? _editedPremiumBadgeTimestampHidden;
  final Object? _editedPremiumBadgeSequenceHidden;

  final Object? _editedDisplayName;
  final Object? _editedBio;
  final Object? _editedPronouns;
  final Object? _editedAccentColor;
  final String? editedAvatarBase64;
  final String? editedBannerBase64;
  final bool avatarCleared;
  final bool bannerCleared;

  final bool isSaving;
  final String? error;

  final String? selectedGuildId;
  final bool isLoadingGuildProfile;
  final String? guildNick;
  final String? guildBio;
  final String? guildPronouns;
  final int? guildAccentColor;
  final String? guildAvatar;
  final String? guildBanner;
  final int guildProfileFlags;
  final int guildPermissions;

  final Object? _editedNick;
  final Object? _editedGuildBio;
  final Object? _editedGuildPronouns;
  final Object? _editedGuildAccentColor;
  final String? editedGuildAvatarBase64;
  final String? editedGuildBannerBase64;
  final bool guildAvatarCleared;
  final bool guildBannerCleared;
  final GuildAssetMode guildAvatarMode;
  final GuildAssetMode guildBannerMode;
  final GuildAssetMode initialGuildAvatarMode;
  final GuildAssetMode initialGuildBannerMode;

  const UserSettingsViewState({
    required this.userId,
    required this.username,
    required this.displayName,
    required this.discriminator,
    required this.avatar,
    required this.avatarColor,
    required this.memberSince,
    required this.status,
    required this.messageDisplayCompact,
    required this.developerMode,
    required this.trustedDomains,
    this.inlineEmbedMedia = true,
    this.inlineAttachmentMedia = true,
    this.renderEmbeds = true,
    this.renderReactions = true,
    this.renderSpoilers = RenderSpoilers.onClick,
    this.gifAutoPlay = true,
    this.animateEmoji = true,
    this.animateStickers = StickerAnimationOptions.alwaysAnimate,
    this.defaultHideMutedChannels = false,
    this.showFadedUnreadOnMutedChannels = false,
    this.publicFlags = 0,
    this.bio,
    this.pronouns,
    this.accentColor,
    this.banner,
    this.email,
    this.verified = false,
    this.isProfileLoaded = false,
    this.passwordLastChangedAt,
    this.mfaEnabled = false,
    this.phone,
    this.hasVerifiedPhone = false,
    this.requiredActions = const <String>[],
    this.authenticatorTypes = const [],
    this.premiumWillCancel = false,
    this.premiumType,
    this.traits = const <String>[],
    this.premiumPerksDisabled = false,
    this.premiumSince,
    this.premiumLifetimeSequence,
    this.premiumBadgeHidden = false,
    this.premiumBadgeMasked = false,
    this.premiumBadgeTimestampHidden = false,
    this.premiumBadgeSequenceHidden = false,
    this.premiumDiscriminator = false,
    this.premiumUntil,
    this.premiumBillingCycle,
    this._editedPremiumBadgeHidden = _unset,
    this._editedPremiumBadgeMasked = _unset,
    this._editedPremiumBadgeTimestampHidden = _unset,
    this._editedPremiumBadgeSequenceHidden = _unset,
    this._editedDisplayName = _unset,
    this._editedBio = _unset,
    this._editedPronouns = _unset,
    this._editedAccentColor = _unset,
    this.editedAvatarBase64,
    this.editedBannerBase64,
    this.avatarCleared = false,
    this.bannerCleared = false,
    this.isSaving = false,
    this.error,
    this.selectedGuildId,
    this.isLoadingGuildProfile = false,
    this.guildNick,
    this.guildBio,
    this.guildPronouns,
    this.guildAccentColor,
    this.guildAvatar,
    this.guildBanner,
    this.guildProfileFlags = 0,
    this.guildPermissions = 0,
    this._editedNick = _unset,
    this._editedGuildBio = _unset,
    this._editedGuildPronouns = _unset,
    this._editedGuildAccentColor = _unset,
    this.editedGuildAvatarBase64,
    this.editedGuildBannerBase64,
    this.guildAvatarCleared = false,
    this.guildBannerCleared = false,
    this.guildAvatarMode = GuildAssetMode.inherit,
    this.guildBannerMode = GuildAssetMode.inherit,
    this.initialGuildAvatarMode = GuildAssetMode.inherit,
    this.initialGuildBannerMode = GuildAssetMode.inherit,
  });

  String? get editedDisplayName =>
      _editedDisplayName == _unset ? null : _editedDisplayName as String?;
  bool get isEditedDisplayNameSet => _editedDisplayName != _unset;

  String? get editedBio => _editedBio == _unset ? null : _editedBio as String?;
  bool get isEditedBioSet => _editedBio != _unset;

  String? get editedPronouns =>
      _editedPronouns == _unset ? null : _editedPronouns as String?;
  bool get isEditedPronounsSet => _editedPronouns != _unset;

  int? get editedAccentColor =>
      _editedAccentColor == _unset ? null : _editedAccentColor as int?;
  bool get isEditedAccentColorSet => _editedAccentColor != _unset;

  bool? get editedPremiumBadgeHidden => _editedPremiumBadgeHidden == _unset
      ? null
      : _editedPremiumBadgeHidden as bool?;
  bool get isEditedPremiumBadgeHiddenSet => _editedPremiumBadgeHidden != _unset;

  bool? get editedPremiumBadgeMasked => _editedPremiumBadgeMasked == _unset
      ? null
      : _editedPremiumBadgeMasked as bool?;
  bool get isEditedPremiumBadgeMaskedSet => _editedPremiumBadgeMasked != _unset;

  bool? get editedPremiumBadgeTimestampHidden =>
      _editedPremiumBadgeTimestampHidden == _unset
      ? null
      : _editedPremiumBadgeTimestampHidden as bool?;
  bool get isEditedPremiumBadgeTimestampHiddenSet =>
      _editedPremiumBadgeTimestampHidden != _unset;

  bool? get editedPremiumBadgeSequenceHidden =>
      _editedPremiumBadgeSequenceHidden == _unset
      ? null
      : _editedPremiumBadgeSequenceHidden as bool?;
  bool get isEditedPremiumBadgeSequenceHiddenSet =>
      _editedPremiumBadgeSequenceHidden != _unset;

  bool get isPremium => computeIsEffectivelyPremium(
    premiumType: premiumType,
    traits: traits,
    premiumPerksDisabled: premiumPerksDisabled,
  );

  bool get hasLifetimePremium => premiumType == UserPremiumTypes.lifetime.json;

  bool get hasVerifiedEmail => email != null;

  bool get isKnownUnclaimed => isProfileLoaded && !hasVerifiedEmail;

  bool get needsKnownEmailVerification =>
      isProfileLoaded && hasVerifiedEmail && !verified;

  bool get hasTotpMfa => authenticatorTypes.contains(0);
  bool get hasWebauthnMfa => authenticatorTypes.contains(2);

  bool get hasActiveSubscription =>
      premiumType == UserPremiumTypes.subscription.json && !premiumWillCancel;

  bool get trustAllDomains =>
      external_link_utils.trustAllDomains(trustedDomains);

  int get trustedDomainsCount => trustAllDomains ? 0 : trustedDomains.length;

  bool get effectivePremiumBadgeHidden =>
      editedPremiumBadgeHidden ?? premiumBadgeHidden;

  bool get effectivePremiumBadgeMasked =>
      editedPremiumBadgeMasked ?? premiumBadgeMasked;

  bool get effectivePremiumBadgeTimestampHidden =>
      editedPremiumBadgeTimestampHidden ?? premiumBadgeTimestampHidden;

  bool get effectivePremiumBadgeSequenceHidden =>
      editedPremiumBadgeSequenceHidden ?? premiumBadgeSequenceHidden;

  bool get isPerGuildProfile => selectedGuildId != null;

  String? get editedNick =>
      _editedNick == _unset ? null : _editedNick as String?;
  bool get isEditedNickSet => _editedNick != _unset;

  String? get editedGuildBio =>
      _editedGuildBio == _unset ? null : _editedGuildBio as String?;
  bool get isEditedGuildBioSet => _editedGuildBio != _unset;

  String? get editedGuildPronouns =>
      _editedGuildPronouns == _unset ? null : _editedGuildPronouns as String?;
  bool get isEditedGuildPronounsSet => _editedGuildPronouns != _unset;

  int? get editedGuildAccentColor => _editedGuildAccentColor == _unset
      ? null
      : _editedGuildAccentColor as int?;
  bool get isEditedGuildAccentColorSet => _editedGuildAccentColor != _unset;

  bool get canChangeNickname =>
      hasPermission(guildPermissions, Permission.changeNickname);

  String? get avatarUrl {
    return FluxerMediaUrl.userAvatar(userId: userId, hash: avatar);
  }

  String? get bannerUrl {
    return FluxerMediaUrl.userBanner(userId: userId, hash: banner);
  }

  String? get previewAvatarBase64 {
    if (!isPerGuildProfile) {
      return editedAvatarBase64;
    }
    return switch (guildAvatarMode) {
      GuildAssetMode.unset => null,
      GuildAssetMode.custom => editedGuildAvatarBase64,
      GuildAssetMode.inherit => editedAvatarBase64,
    };
  }

  String? get previewBannerBase64 {
    if (!isPerGuildProfile) {
      return editedBannerBase64;
    }
    return switch (guildBannerMode) {
      GuildAssetMode.unset => null,
      GuildAssetMode.custom => editedGuildBannerBase64,
      GuildAssetMode.inherit => editedBannerBase64,
    };
  }

  bool get previewAvatarCleared {
    if (!isPerGuildProfile) {
      return avatarCleared;
    }
    return switch (guildAvatarMode) {
      GuildAssetMode.unset => true,
      GuildAssetMode.custom =>
        !(editedGuildAvatarBase64 != null) && guildAvatarCleared,
      GuildAssetMode.inherit => avatarCleared,
    };
  }

  bool get previewBannerCleared {
    if (!isPerGuildProfile) {
      return bannerCleared;
    }
    return switch (guildBannerMode) {
      GuildAssetMode.unset => true,
      GuildAssetMode.custom =>
        !(editedGuildBannerBase64 != null) && guildBannerCleared,
      GuildAssetMode.inherit => bannerCleared,
    };
  }

  String? get previewAvatarUrl {
    if (!isPerGuildProfile) {
      return avatarUrl;
    }
    return switch (guildAvatarMode) {
      GuildAssetMode.unset => null,
      GuildAssetMode.custom => _previewGuildAvatarUrl(),
      GuildAssetMode.inherit => avatarUrl,
    };
  }

  String? get previewBannerUrl {
    if (!isPerGuildProfile) {
      return bannerUrl;
    }
    return switch (guildBannerMode) {
      GuildAssetMode.unset => null,
      GuildAssetMode.custom => _previewGuildBannerUrl(),
      GuildAssetMode.inherit => bannerUrl,
    };
  }

  String? _previewGuildAvatarUrl() {
    if (editedGuildAvatarBase64 != null || guildAvatarCleared) {
      return null;
    }
    final String? guildId = selectedGuildId;
    final String? hash = guildAvatar;
    if (guildId == null || hash == null) {
      return null;
    }
    return FluxerMediaUrl.guildMemberMedia(
      guildId: guildId,
      userId: userId,
      type: GuildMemberMediaType.avatar,
      hash: hash,
    );
  }

  String? _previewGuildBannerUrl() {
    if (editedGuildBannerBase64 != null || guildBannerCleared) {
      return null;
    }
    final String? guildId = selectedGuildId;
    final String? hash = guildBanner;
    if (guildId == null || hash == null) {
      return null;
    }
    return FluxerMediaUrl.guildMemberMedia(
      guildId: guildId,
      userId: userId,
      type: GuildMemberMediaType.banner,
      hash: hash,
      size: MediaProxySizes.profileBannerModal,
    );
  }

  DateTime get resolvedMemberSince {
    final DateTime? stored = memberSince;
    if (stored != null) {
      return stored;
    }
    return dateTimeFromUserSnowflakeOrNull(userId) ??
        DateTime.fromMillisecondsSinceEpoch(kSnowflakeEpochMs, isUtc: true);
  }

  bool get isDirty {
    if (isPerGuildProfile) {
      return _isGuildDirty;
    }
    if (isEditedDisplayNameSet && editedDisplayName != displayName) {
      return true;
    }
    if (isEditedBioSet && editedBio != bio) {
      return true;
    }
    if (isEditedPronounsSet && editedPronouns != pronouns) {
      return true;
    }
    if (isEditedAccentColorSet && editedAccentColor != accentColor) {
      return true;
    }
    if (editedAvatarBase64 != null || avatarCleared) {
      return true;
    }
    if (editedBannerBase64 != null || bannerCleared) {
      return true;
    }
    if (isEditedPremiumBadgeHiddenSet &&
        editedPremiumBadgeHidden != premiumBadgeHidden) {
      return true;
    }
    if (isEditedPremiumBadgeMaskedSet &&
        editedPremiumBadgeMasked != premiumBadgeMasked) {
      return true;
    }
    if (isEditedPremiumBadgeTimestampHiddenSet &&
        editedPremiumBadgeTimestampHidden != premiumBadgeTimestampHidden) {
      return true;
    }
    if (isEditedPremiumBadgeSequenceHiddenSet &&
        editedPremiumBadgeSequenceHidden != premiumBadgeSequenceHidden) {
      return true;
    }
    return false;
  }

  bool get _isGuildDirty {
    if (isEditedNickSet && editedNick != guildNick) {
      return true;
    }
    if (isEditedGuildBioSet && editedGuildBio != guildBio) {
      return true;
    }
    if (isEditedGuildPronounsSet && editedGuildPronouns != guildPronouns) {
      return true;
    }
    if (isEditedGuildAccentColorSet &&
        editedGuildAccentColor != guildAccentColor) {
      return true;
    }
    if (editedGuildAvatarBase64 != null || guildAvatarCleared) {
      return true;
    }
    if (editedGuildBannerBase64 != null || guildBannerCleared) {
      return true;
    }
    if (guildAvatarMode != initialGuildAvatarMode) {
      return true;
    }
    if (guildBannerMode != initialGuildBannerMode) {
      return true;
    }
    return false;
  }

  UserSettingsViewState copyWith({
    String? userId,
    String? username,
    String? displayName,
    String? discriminator,
    Object? avatar = _unset,
    Object? avatarColor = _unset,
    Object? memberSince = _unset,
    String? status,
    bool? messageDisplayCompact,
    bool? developerMode,
    List<String>? trustedDomains,
    bool? inlineEmbedMedia,
    bool? inlineAttachmentMedia,
    bool? renderEmbeds,
    bool? renderReactions,
    RenderSpoilers? renderSpoilers,
    bool? gifAutoPlay,
    bool? animateEmoji,
    StickerAnimationOptions? animateStickers,
    bool? defaultHideMutedChannels,
    bool? showFadedUnreadOnMutedChannels,
    int? publicFlags,
    Object? bio = _unset,
    Object? pronouns = _unset,
    Object? accentColor = _unset,
    Object? banner = _unset,
    Object? email = _unset,
    bool? verified,
    bool? isProfileLoaded,
    Object? passwordLastChangedAt = _unset,
    bool? mfaEnabled,
    Object? phone = _unset,
    bool? hasVerifiedPhone,
    List<String>? requiredActions,
    List<int>? authenticatorTypes,
    bool? premiumWillCancel,
    Object? premiumType = _unset,
    List<String>? traits,
    bool? premiumPerksDisabled,
    Object? premiumSince = _unset,
    Object? premiumLifetimeSequence = _unset,
    bool? premiumBadgeHidden,
    bool? premiumBadgeMasked,
    bool? premiumBadgeTimestampHidden,
    bool? premiumBadgeSequenceHidden,
    bool? premiumDiscriminator,
    Object? premiumUntil = _unset,
    Object? premiumBillingCycle = _unset,
    Object? editedPremiumBadgeHidden = _unset,
    Object? editedPremiumBadgeMasked = _unset,
    Object? editedPremiumBadgeTimestampHidden = _unset,
    Object? editedPremiumBadgeSequenceHidden = _unset,
    Object? editedDisplayName = _unset,
    Object? editedBio = _unset,
    Object? editedPronouns = _unset,
    Object? editedAccentColor = _unset,
    Object? editedAvatarBase64 = _unset,
    Object? editedBannerBase64 = _unset,
    bool? avatarCleared,
    bool? bannerCleared,
    bool? isSaving,
    Object? error = _unset,
    Object? selectedGuildId = _unset,
    bool? isLoadingGuildProfile,
    Object? guildNick = _unset,
    Object? guildBio = _unset,
    Object? guildPronouns = _unset,
    Object? guildAccentColor = _unset,
    Object? guildAvatar = _unset,
    Object? guildBanner = _unset,
    int? guildProfileFlags,
    int? guildPermissions,
    Object? editedNick = _unset,
    Object? editedGuildBio = _unset,
    Object? editedGuildPronouns = _unset,
    Object? editedGuildAccentColor = _unset,
    Object? editedGuildAvatarBase64 = _unset,
    Object? editedGuildBannerBase64 = _unset,
    bool? guildAvatarCleared,
    bool? guildBannerCleared,
    GuildAssetMode? guildAvatarMode,
    GuildAssetMode? guildBannerMode,
    GuildAssetMode? initialGuildAvatarMode,
    GuildAssetMode? initialGuildBannerMode,
  }) {
    return UserSettingsViewState(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      discriminator: discriminator ?? this.discriminator,
      avatar: avatar == _unset ? this.avatar : avatar as String?,
      avatarColor: avatarColor == _unset
          ? this.avatarColor
          : avatarColor as int?,
      memberSince: memberSince == _unset
          ? this.memberSince
          : memberSince as DateTime?,
      status: status ?? this.status,
      messageDisplayCompact:
          messageDisplayCompact ?? this.messageDisplayCompact,
      developerMode: developerMode ?? this.developerMode,
      trustedDomains: trustedDomains ?? this.trustedDomains,
      inlineEmbedMedia: inlineEmbedMedia ?? this.inlineEmbedMedia,
      inlineAttachmentMedia:
          inlineAttachmentMedia ?? this.inlineAttachmentMedia,
      renderEmbeds: renderEmbeds ?? this.renderEmbeds,
      renderReactions: renderReactions ?? this.renderReactions,
      renderSpoilers: renderSpoilers ?? this.renderSpoilers,
      gifAutoPlay: gifAutoPlay ?? this.gifAutoPlay,
      animateEmoji: animateEmoji ?? this.animateEmoji,
      animateStickers: animateStickers ?? this.animateStickers,
      defaultHideMutedChannels:
          defaultHideMutedChannels ?? this.defaultHideMutedChannels,
      showFadedUnreadOnMutedChannels:
          showFadedUnreadOnMutedChannels ?? this.showFadedUnreadOnMutedChannels,
      publicFlags: publicFlags ?? this.publicFlags,
      bio: bio == _unset ? this.bio : bio as String?,
      pronouns: pronouns == _unset ? this.pronouns : pronouns as String?,
      accentColor: accentColor == _unset
          ? this.accentColor
          : accentColor as int?,
      banner: banner == _unset ? this.banner : banner as String?,
      email: email == _unset ? this.email : email as String?,
      verified: verified ?? this.verified,
      isProfileLoaded: isProfileLoaded ?? this.isProfileLoaded,
      passwordLastChangedAt: passwordLastChangedAt == _unset
          ? this.passwordLastChangedAt
          : passwordLastChangedAt as String?,
      mfaEnabled: mfaEnabled ?? this.mfaEnabled,
      phone: phone == _unset ? this.phone : phone as String?,
      hasVerifiedPhone: hasVerifiedPhone ?? this.hasVerifiedPhone,
      requiredActions: requiredActions ?? this.requiredActions,
      authenticatorTypes: authenticatorTypes ?? this.authenticatorTypes,
      premiumWillCancel: premiumWillCancel ?? this.premiumWillCancel,
      premiumType: premiumType == _unset
          ? this.premiumType
          : premiumType as int?,
      traits: traits ?? this.traits,
      premiumPerksDisabled: premiumPerksDisabled ?? this.premiumPerksDisabled,
      premiumSince: premiumSince == _unset
          ? this.premiumSince
          : premiumSince as String?,
      premiumLifetimeSequence: premiumLifetimeSequence == _unset
          ? this.premiumLifetimeSequence
          : premiumLifetimeSequence as int?,
      premiumBadgeHidden: premiumBadgeHidden ?? this.premiumBadgeHidden,
      premiumBadgeMasked: premiumBadgeMasked ?? this.premiumBadgeMasked,
      premiumBadgeTimestampHidden:
          premiumBadgeTimestampHidden ?? this.premiumBadgeTimestampHidden,
      premiumBadgeSequenceHidden:
          premiumBadgeSequenceHidden ?? this.premiumBadgeSequenceHidden,
      premiumDiscriminator: premiumDiscriminator ?? this.premiumDiscriminator,
      premiumUntil: premiumUntil == _unset
          ? this.premiumUntil
          : premiumUntil as String?,
      premiumBillingCycle: premiumBillingCycle == _unset
          ? this.premiumBillingCycle
          : premiumBillingCycle as String?,
      editedPremiumBadgeHidden: editedPremiumBadgeHidden == _unset
          ? _editedPremiumBadgeHidden
          : editedPremiumBadgeHidden == _resetEdited
          ? _unset
          : editedPremiumBadgeHidden,
      editedPremiumBadgeMasked: editedPremiumBadgeMasked == _unset
          ? _editedPremiumBadgeMasked
          : editedPremiumBadgeMasked == _resetEdited
          ? _unset
          : editedPremiumBadgeMasked,
      editedPremiumBadgeTimestampHidden:
          editedPremiumBadgeTimestampHidden == _unset
          ? _editedPremiumBadgeTimestampHidden
          : editedPremiumBadgeTimestampHidden == _resetEdited
          ? _unset
          : editedPremiumBadgeTimestampHidden,
      editedPremiumBadgeSequenceHidden:
          editedPremiumBadgeSequenceHidden == _unset
          ? _editedPremiumBadgeSequenceHidden
          : editedPremiumBadgeSequenceHidden == _resetEdited
          ? _unset
          : editedPremiumBadgeSequenceHidden,
      editedDisplayName: editedDisplayName == _unset
          ? _editedDisplayName
          : editedDisplayName == _resetEdited
          ? _unset
          : editedDisplayName,
      editedBio: editedBio == _unset
          ? _editedBio
          : editedBio == _resetEdited
          ? _unset
          : editedBio,
      editedPronouns: editedPronouns == _unset
          ? _editedPronouns
          : editedPronouns == _resetEdited
          ? _unset
          : editedPronouns,
      editedAccentColor: editedAccentColor == _unset
          ? _editedAccentColor
          : editedAccentColor == _resetEdited
          ? _unset
          : editedAccentColor,
      editedAvatarBase64: editedAvatarBase64 == _unset
          ? this.editedAvatarBase64
          : editedAvatarBase64 as String?,
      editedBannerBase64: editedBannerBase64 == _unset
          ? this.editedBannerBase64
          : editedBannerBase64 as String?,
      avatarCleared: avatarCleared ?? this.avatarCleared,
      bannerCleared: bannerCleared ?? this.bannerCleared,
      isSaving: isSaving ?? this.isSaving,
      error: error == _unset ? this.error : error as String?,
      selectedGuildId: selectedGuildId == _unset
          ? this.selectedGuildId
          : selectedGuildId as String?,
      isLoadingGuildProfile:
          isLoadingGuildProfile ?? this.isLoadingGuildProfile,
      guildNick: guildNick == _unset ? this.guildNick : guildNick as String?,
      guildBio: guildBio == _unset ? this.guildBio : guildBio as String?,
      guildPronouns: guildPronouns == _unset
          ? this.guildPronouns
          : guildPronouns as String?,
      guildAccentColor: guildAccentColor == _unset
          ? this.guildAccentColor
          : guildAccentColor as int?,
      guildAvatar: guildAvatar == _unset
          ? this.guildAvatar
          : guildAvatar as String?,
      guildBanner: guildBanner == _unset
          ? this.guildBanner
          : guildBanner as String?,
      guildProfileFlags: guildProfileFlags ?? this.guildProfileFlags,
      guildPermissions: guildPermissions ?? this.guildPermissions,
      editedNick: editedNick == _unset
          ? _editedNick
          : editedNick == _resetEdited
          ? _unset
          : editedNick,
      editedGuildBio: editedGuildBio == _unset
          ? _editedGuildBio
          : editedGuildBio == _resetEdited
          ? _unset
          : editedGuildBio,
      editedGuildPronouns: editedGuildPronouns == _unset
          ? _editedGuildPronouns
          : editedGuildPronouns == _resetEdited
          ? _unset
          : editedGuildPronouns,
      editedGuildAccentColor: editedGuildAccentColor == _unset
          ? _editedGuildAccentColor
          : editedGuildAccentColor == _resetEdited
          ? _unset
          : editedGuildAccentColor,
      editedGuildAvatarBase64: editedGuildAvatarBase64 == _unset
          ? this.editedGuildAvatarBase64
          : editedGuildAvatarBase64 as String?,
      editedGuildBannerBase64: editedGuildBannerBase64 == _unset
          ? this.editedGuildBannerBase64
          : editedGuildBannerBase64 as String?,
      guildAvatarCleared: guildAvatarCleared ?? this.guildAvatarCleared,
      guildBannerCleared: guildBannerCleared ?? this.guildBannerCleared,
      guildAvatarMode: guildAvatarMode ?? this.guildAvatarMode,
      guildBannerMode: guildBannerMode ?? this.guildBannerMode,
      initialGuildAvatarMode:
          initialGuildAvatarMode ?? this.initialGuildAvatarMode,
      initialGuildBannerMode:
          initialGuildBannerMode ?? this.initialGuildBannerMode,
    );
  }
}

@Riverpod(keepAlive: true)
class UserSettingsViewModel extends _$UserSettingsViewModel {
  @override
  UserSettingsViewState build() {
    final userId = ref.watch(currentUserIdProvider);
    if (userId != null) {
      _watchUser(userId);
      _watchSettings(userId);
    }

    return UserSettingsViewState(
      userId: userId ?? '',
      username: '',
      displayName: '',
      discriminator: '0',
      avatar: null,
      avatarColor: null,
      memberSince: null,
      status: 'offline',
      messageDisplayCompact: false,
      developerMode: false,
      trustedDomains: const [],
    );
  }

  RenderSpoilers _parseRenderSpoilers(Object? value) {
    if (value is int) {
      final parsed = RenderSpoilers.fromJson(value);
      return parsed == RenderSpoilers.$unknown
          ? RenderSpoilers.onClick
          : parsed;
    }
    return RenderSpoilers.onClick;
  }

  StickerAnimationOptions _parseStickerAnimation(Object? value) {
    if (value is int) {
      final parsed = StickerAnimationOptions.fromJson(value);
      return parsed == StickerAnimationOptions.$unknown
          ? StickerAnimationOptions.alwaysAnimate
          : parsed;
    }
    return StickerAnimationOptions.alwaysAnimate;
  }

  void _watchUser(String userId) {
    final db = ref.read(fluxerDatabaseProvider);
    // Project to only the fields this view state consumes, then dedupe: a
    // presence-only write (status/customStatus) re-emits the user row but
    // yields an equal record, so `.distinct()` filters it out and avoids a
    // needless `state=` notification storm on every PRESENCE_UPDATE.
    final subscription = db.userDao
        .watchUserById(userId)
        .map(
          (user) => user == null
              ? null
              : (
                  username: user.username,
                  displayName: user.globalName ?? user.username,
                  discriminator: user.discriminator,
                  avatar: user.avatar,
                  avatarColor: user.avatarColor,
                  bio: user.bio,
                  pronouns: user.pronouns,
                  accentColor: user.accentColor,
                  banner: user.banner,
                  premiumBadgeHidden: user.premiumBadgeHidden ?? false,
                  premiumBadgeMasked: user.premiumBadgeMasked ?? false,
                  premiumBadgeTimestampHidden:
                      user.premiumBadgeTimestampHidden ?? false,
                  premiumBadgeSequenceHidden:
                      user.premiumBadgeSequenceHidden ?? false,
                ),
        )
        .distinct()
        .listen((fields) {
          if (fields == null) {
            return;
          }
          state = state.copyWith(
            username: fields.username,
            displayName: fields.displayName,
            discriminator: fields.discriminator,
            avatar: fields.avatar,
            avatarColor: fields.avatarColor,
            bio: fields.bio,
            pronouns: fields.pronouns,
            accentColor: fields.accentColor,
            banner: fields.banner,
            premiumBadgeHidden: fields.premiumBadgeHidden,
            premiumBadgeMasked: fields.premiumBadgeMasked,
            premiumBadgeTimestampHidden: fields.premiumBadgeTimestampHidden,
            premiumBadgeSequenceHidden: fields.premiumBadgeSequenceHidden,
          );
        });
    ref.onDispose(subscription.cancel);
  }

  void _watchSettings(String userId) {
    final db = ref.read(fluxerDatabaseProvider);
    final subscription = db.userSettingsDao.watchSettings(userId).listen((row) {
      if (row == null) {
        return;
      }
      final data = jsonDecode(row.data) as Map<String, dynamic>;
      final developerMode = data['developer_mode'] as bool? ?? false;
      final trustedDomains =
          (data['trusted_domains'] as List<dynamic>? ?? const [])
              .whereType<String>()
              .toList(growable: false);
      state = state.copyWith(
        developerMode: developerMode,
        trustedDomains: trustedDomains,
        inlineEmbedMedia: data['inline_embed_media'] as bool? ?? true,
        inlineAttachmentMedia: data['inline_attachment_media'] as bool? ?? true,
        renderEmbeds: data['render_embeds'] as bool? ?? true,
        renderReactions: data['render_reactions'] as bool? ?? true,
        renderSpoilers: _parseRenderSpoilers(data['render_spoilers']),
        gifAutoPlay: data['gif_auto_play'] as bool? ?? true,
        animateEmoji: data['animate_emoji'] as bool? ?? true,
        animateStickers: _parseStickerAnimation(data['animate_stickers']),
        defaultHideMutedChannels:
            data['default_hide_muted_channels'] as bool? ?? false,
        messageDisplayCompact:
            data['message_display_compact'] as bool? ?? false,
      );
    });
    ref.onDispose(subscription.cancel);
  }

  Future<void> loadProfile() async {
    try {
      final client = ref.read(fluxerClientProvider);
      final profile = await client.users.getCurrentUser();
      applyPrivateProfile(profile);
    } on Exception catch (e) {
      talker.error('Failed to load profile', e);
      state = state.copyWith(error: 'Failed to load profile');
    }
  }

  void applyStartupProfile(UserPrivateResponse profile) {
    if (profile.id != state.userId) {
      return;
    }
    applyPrivateProfile(profile);
  }

  void applyPrivateProfile(UserPrivateResponse profile) {
    final db = ref.read(fluxerDatabaseProvider);
    unawaited(
      db.userDao.upsertUser(
        UsersCompanion(
          id: Value(profile.id),
          username: Value(profile.username),
          bio: Value(profile.bio),
          pronouns: Value(profile.pronouns),
          accentColor: Value(profile.accentColor),
          banner: Value(profile.banner),
          premiumBadgeHidden: Value(profile.premiumBadgeHidden),
          premiumBadgeMasked: Value(profile.premiumBadgeMasked),
          premiumBadgeTimestampHidden: Value(
            profile.premiumBadgeTimestampHidden,
          ),
          premiumBadgeSequenceHidden: Value(profile.premiumBadgeSequenceHidden),
        ),
      ),
    );

    state = state.copyWith(
      publicFlags: profile.flags,
      bio: profile.bio,
      pronouns: profile.pronouns,
      accentColor: profile.accentColor,
      banner: profile.banner,
      email: profile.email,
      verified: profile.verified,
      passwordLastChangedAt: profile.passwordLastChangedAt,
      mfaEnabled: profile.mfaEnabled,
      phone: profile.phone,
      hasVerifiedPhone: profile.hasVerifiedPhone,
      requiredActions: List<String>.from(profile.requiredActions),
      authenticatorTypes:
          profile.authenticatorTypes
              ?.map((t) => t.json)
              .whereType<int>()
              .toList(growable: false) ??
          const [],
      premiumWillCancel: profile.premiumWillCancel,
      premiumType: profile.premiumType?.json,
      traits: List<String>.from(profile.traits),
      premiumPerksDisabled: profile.premiumPerksDisabled,
      premiumSince: profile.premiumSince,
      premiumLifetimeSequence: profile.premiumLifetimeSequence,
      premiumBadgeHidden: profile.premiumBadgeHidden,
      premiumBadgeMasked: profile.premiumBadgeMasked,
      premiumBadgeTimestampHidden: profile.premiumBadgeTimestampHidden,
      premiumBadgeSequenceHidden: profile.premiumBadgeSequenceHidden,
      premiumDiscriminator: profile.premiumDiscriminator,
      premiumUntil: profile.premiumUntil,
      premiumBillingCycle: profile.premiumBillingCycle,
      isProfileLoaded: true,
    );
    ref
        .read(currentUserEntitlementsProvider.notifier)
        .applyUserProfile(profile);
    ref
        .read(currentUserPremiumTypeProvider.notifier)
        .set(profile.premiumType?.json ?? 0);
  }

  void updateDisplayName(String value) {
    state = state.copyWith(editedDisplayName: value);
  }

  void updateBio(String value) {
    state = state.copyWith(editedBio: value);
  }

  void updatePronouns(String value) {
    state = state.copyWith(editedPronouns: value);
  }

  void updateAccentColor(int value) {
    state = state.copyWith(editedAccentColor: value);
  }

  void resetAccentColor() {
    state = state.copyWith(editedAccentColor: null);
  }

  void setPremiumBadgeHidden({required bool value}) {
    state = state.copyWith(editedPremiumBadgeHidden: value);
  }

  void setPremiumBadgeTimestampHidden({required bool value}) {
    state = state.copyWith(editedPremiumBadgeTimestampHidden: value);
  }

  void setPremiumBadgeMasked({required bool value}) {
    state = state.copyWith(editedPremiumBadgeMasked: value);
    if (value) {
      state = state.copyWith(editedPremiumBadgeSequenceHidden: true);
    }
  }

  void setPremiumBadgeSequenceHidden({required bool value}) {
    state = state.copyWith(editedPremiumBadgeSequenceHidden: value);
  }

  void setAvatar(String base64) {
    state = state.copyWith(editedAvatarBase64: base64, avatarCleared: false);
  }

  void clearAvatar() {
    state = state.copyWith(avatarCleared: true, editedAvatarBase64: null);
  }

  void setBanner(String base64) {
    state = state.copyWith(editedBannerBase64: base64, bannerCleared: false);
  }

  void clearBanner() {
    state = state.copyWith(bannerCleared: true, editedBannerBase64: null);
  }

  Future<void> selectGuild(String? guildId) async {
    if (guildId == null) {
      state = state.copyWith(
        selectedGuildId: null,
        isLoadingGuildProfile: false,
        guildNick: null,
        guildBio: null,
        guildPronouns: null,
        guildAccentColor: null,
        guildAvatar: null,
        guildBanner: null,
        guildProfileFlags: 0,
        guildPermissions: 0,
        guildAvatarMode: GuildAssetMode.inherit,
        guildBannerMode: GuildAssetMode.inherit,
        initialGuildAvatarMode: GuildAssetMode.inherit,
        initialGuildBannerMode: GuildAssetMode.inherit,
      );
      _resetGuildEdits();
      return;
    }

    state = state.copyWith(
      selectedGuildId: guildId,
      isLoadingGuildProfile: true,
    );
    _resetGuildEdits();

    try {
      final client = ref.read(fluxerClientProvider);
      final profile = await client.users.getUserProfile(
        targetId: state.userId,
        guildId: guildId,
      );

      final member = profile.guildMember;
      final guildProfile = profile.guildMemberProfile;

      final flags = member?.profileFlags ?? 0;

      GuildAssetMode avatarMode;
      if (flags & _kGuildProfileFlagAvatarUnset != 0) {
        avatarMode = GuildAssetMode.unset;
      } else if (member?.avatar != null) {
        avatarMode = GuildAssetMode.custom;
      } else {
        avatarMode = GuildAssetMode.inherit;
      }

      GuildAssetMode bannerMode;
      if (flags & _kGuildProfileFlagBannerUnset != 0) {
        bannerMode = GuildAssetMode.unset;
      } else if (guildProfile?.banner != null) {
        bannerMode = GuildAssetMode.custom;
      } else {
        bannerMode = GuildAssetMode.inherit;
      }

      final permissions = await ref
          .read(guildPermissionsProvider.notifier)
          .getPermissions(guildId);

      state = state.copyWith(
        isLoadingGuildProfile: false,
        guildNick: member?.nick,
        guildBio: guildProfile?.bio,
        guildPronouns: guildProfile?.pronouns,
        guildAccentColor: guildProfile?.accentColor,
        guildAvatar: member?.avatar,
        guildBanner: guildProfile?.banner,
        guildProfileFlags: flags,
        guildPermissions: permissions,
        guildAvatarMode: avatarMode,
        guildBannerMode: bannerMode,
        initialGuildAvatarMode: avatarMode,
        initialGuildBannerMode: bannerMode,
      );
    } on Exception catch (e) {
      talker.error('Failed to load guild profile', e);
      state = state.copyWith(
        isLoadingGuildProfile: false,
        error: 'Failed to load guild profile',
      );
    }
  }

  void updateNick(String value) {
    state = state.copyWith(editedNick: value);
  }

  void updateGuildBio(String value) {
    state = state.copyWith(editedGuildBio: value);
  }

  void updateGuildPronouns(String value) {
    state = state.copyWith(editedGuildPronouns: value);
  }

  void updateGuildAccentColor(int value) {
    state = state.copyWith(editedGuildAccentColor: value);
  }

  void resetGuildAccentColor() {
    state = state.copyWith(editedGuildAccentColor: null);
  }

  void setGuildAvatar(String base64) {
    state = state.copyWith(
      editedGuildAvatarBase64: base64,
      guildAvatarCleared: false,
      guildAvatarMode: GuildAssetMode.custom,
    );
  }

  void clearGuildAvatar() {
    state = state.copyWith(
      guildAvatarCleared: true,
      editedGuildAvatarBase64: null,
    );
  }

  void setGuildBanner(String base64) {
    state = state.copyWith(
      editedGuildBannerBase64: base64,
      guildBannerCleared: false,
      guildBannerMode: GuildAssetMode.custom,
    );
  }

  void clearGuildBanner() {
    state = state.copyWith(
      guildBannerCleared: true,
      editedGuildBannerBase64: null,
    );
  }

  void setGuildAvatarMode(GuildAssetMode mode) {
    if (mode != GuildAssetMode.custom) {
      state = state.copyWith(
        guildAvatarMode: mode,
        editedGuildAvatarBase64: null,
        guildAvatarCleared: mode == GuildAssetMode.unset,
      );
    } else {
      state = state.copyWith(guildAvatarMode: mode);
    }
  }

  void setGuildBannerMode(GuildAssetMode mode) {
    if (mode != GuildAssetMode.custom) {
      state = state.copyWith(
        guildBannerMode: mode,
        editedGuildBannerBase64: null,
        guildBannerCleared: mode == GuildAssetMode.unset,
      );
    } else {
      state = state.copyWith(guildBannerMode: mode);
    }
  }

  Future<void> saveGuildProfile() async {
    final guildId = state.selectedGuildId;
    if (guildId == null || !state._isGuildDirty) {
      return;
    }

    state = state.copyWith(isSaving: true, error: null);

    try {
      final s = state;

      var profileFlags = 0;
      if (s.guildAvatarMode == GuildAssetMode.unset) {
        profileFlags |= _kGuildProfileFlagAvatarUnset;
      }
      if (s.guildBannerMode == GuildAssetMode.unset) {
        profileFlags |= _kGuildProfileFlagBannerUnset;
      }

      String? avatarValue;
      if (s.guildAvatarMode == GuildAssetMode.custom &&
          s.editedGuildAvatarBase64 != null) {
        avatarValue = s.editedGuildAvatarBase64;
      }

      String? bannerValue;
      if (s.guildBannerMode == GuildAssetMode.custom &&
          s.editedGuildBannerBase64 != null) {
        bannerValue = s.editedGuildBannerBase64;
      }

      final body = MyGuildMemberUpdateRequest(
        nick: s.canChangeNickname
            ? (s.isEditedNickSet ? s.editedNick : s.guildNick)
            : null,
        avatar:
            s.guildAvatarMode == GuildAssetMode.inherit ||
                s.guildAvatarMode == GuildAssetMode.unset
            ? null
            : avatarValue,
        banner:
            s.guildBannerMode == GuildAssetMode.inherit ||
                s.guildBannerMode == GuildAssetMode.unset
            ? null
            : bannerValue,
        bio: s.isEditedGuildBioSet ? s.editedGuildBio : s.guildBio,
        pronouns: s.isEditedGuildPronounsSet
            ? s.editedGuildPronouns
            : s.guildPronouns,
        accentColor: s.isEditedGuildAccentColorSet
            ? s.editedGuildAccentColor
            : s.guildAccentColor,
        profileFlags: profileFlags,
      );

      final needsExplicitNulls =
          s.guildAvatarMode != GuildAssetMode.custom ||
          s.guildBannerMode != GuildAssetMode.custom;

      if (needsExplicitNulls) {
        final json = body.toJson();
        if (s.guildAvatarMode == GuildAssetMode.inherit ||
            s.guildAvatarMode == GuildAssetMode.unset) {
          json['avatar'] = null;
        }
        if (s.guildBannerMode == GuildAssetMode.inherit ||
            s.guildBannerMode == GuildAssetMode.unset) {
          json['banner'] = null;
        }
        final dio = ref.read(fluxerDioProvider);
        await dio.patch<dynamic>('/guilds/$guildId/members/@me', data: json);
      } else {
        final client = ref.read(fluxerClientProvider);
        await client.guilds.updateCurrentGuildMember(
          guildId: guildId,
          body: body,
        );
      }

      await selectGuild(guildId);
      await ref
          .read(fluxerDatabaseProvider)
          .memberDao
          .upsertMember(
            MembersCompanion.insert(
              userId: state.userId,
              guildId: guildId,
              serverAvatar: state.guildAvatarMode == GuildAssetMode.custom
                  ? Value(state.guildAvatar)
                  : const Value(null),
              profileFlags: Value(state.guildProfileFlags),
            ),
          );
      reset();
    } on Exception catch (e) {
      talker.error('Failed to save guild profile', e);
      state = state.copyWith(
        isSaving: false,
        error: 'Failed to save guild profile',
      );
    }
  }

  void _resetGuildEdits() {
    state = state.copyWith(
      editedNick: UserSettingsViewState._resetEdited,
      editedGuildBio: UserSettingsViewState._resetEdited,
      editedGuildPronouns: UserSettingsViewState._resetEdited,
      editedGuildAccentColor: UserSettingsViewState._resetEdited,
      editedGuildAvatarBase64: null,
      editedGuildBannerBase64: null,
      guildAvatarCleared: false,
      guildBannerCleared: false,
    );
  }

  Future<void> save() async {
    if (state.isPerGuildProfile) {
      return saveGuildProfile();
    }

    if (!state.isDirty) {
      return;
    }

    state = state.copyWith(isSaving: true, error: null);

    try {
      final s = state;

      String? globalName;
      if (s.isEditedDisplayNameSet && s.editedDisplayName != s.displayName) {
        globalName = s.editedDisplayName;
      }

      String? bio;
      if (s.isEditedBioSet && s.editedBio != s.bio) {
        bio = s.editedBio;
      }

      String? pronouns;
      if (s.isEditedPronounsSet && s.editedPronouns != s.pronouns) {
        pronouns = s.editedPronouns;
      }

      int? accentColor;
      if (s.isEditedAccentColorSet && s.editedAccentColor != s.accentColor) {
        accentColor = s.editedAccentColor;
      }

      String? avatarValue;
      if (s.editedAvatarBase64 != null) {
        avatarValue = s.editedAvatarBase64;
      }

      String? bannerValue;
      if (s.editedBannerBase64 != null) {
        bannerValue = s.editedBannerBase64;
      }

      bool? premiumBadgeHidden;
      if (s.isEditedPremiumBadgeHiddenSet &&
          s.editedPremiumBadgeHidden != s.premiumBadgeHidden) {
        premiumBadgeHidden = s.editedPremiumBadgeHidden;
      }

      bool? premiumBadgeMasked;
      if (s.isEditedPremiumBadgeMaskedSet &&
          s.editedPremiumBadgeMasked != s.premiumBadgeMasked) {
        premiumBadgeMasked = s.editedPremiumBadgeMasked;
      }

      bool? premiumBadgeTimestampHidden;
      if (s.isEditedPremiumBadgeTimestampHiddenSet &&
          s.editedPremiumBadgeTimestampHidden !=
              s.premiumBadgeTimestampHidden) {
        premiumBadgeTimestampHidden = s.editedPremiumBadgeTimestampHidden;
      }

      bool? premiumBadgeSequenceHidden;
      if (s.isEditedPremiumBadgeSequenceHiddenSet &&
          s.editedPremiumBadgeSequenceHidden != s.premiumBadgeSequenceHidden) {
        premiumBadgeSequenceHidden = s.editedPremiumBadgeSequenceHidden;
      }

      final body = UserUpdateWithVerificationRequest(
        globalName: globalName,
        bio: bio,
        pronouns: pronouns,
        accentColor: accentColor,
        avatar: s.avatarCleared ? null : avatarValue,
        banner: s.bannerCleared ? null : bannerValue,
        premiumBadgeHidden: premiumBadgeHidden,
        premiumBadgeMasked: premiumBadgeMasked,
        premiumBadgeTimestampHidden: premiumBadgeTimestampHidden,
        premiumBadgeSequenceHidden: premiumBadgeSequenceHidden,
      );

      if (s.avatarCleared || s.bannerCleared) {
        // SDK uses @JsonKey(includeIfNull: false) which omits null
        // fields, but the API needs explicit nulls to clear
        // avatar/banner on a PATCH request.
        final json = body.toJson();
        if (s.avatarCleared) {
          json['avatar'] = null;
        }
        if (s.bannerCleared) {
          json['banner'] = null;
        }
        final dio = ref.read(fluxerDioProvider);
        await dio.patch<dynamic>('/users/@me', data: json);
      } else {
        final client = ref.read(fluxerClientProvider);
        await client.users.updateCurrentUser(body: body);
      }

      await loadProfile();
      reset();
    } on Exception catch (e) {
      talker.error('Failed to save profile', e);
      state = state.copyWith(isSaving: false, error: 'Failed to save profile');
    }
  }

  void reset() {
    if (state.isPerGuildProfile) {
      _resetGuildEdits();
      state = state.copyWith(
        guildAvatarMode: state.initialGuildAvatarMode,
        guildBannerMode: state.initialGuildBannerMode,
        isSaving: false,
        error: null,
      );
      return;
    }

    state = state.copyWith(
      editedDisplayName: UserSettingsViewState._resetEdited,
      editedBio: UserSettingsViewState._resetEdited,
      editedPronouns: UserSettingsViewState._resetEdited,
      editedAccentColor: UserSettingsViewState._resetEdited,
      editedPremiumBadgeHidden: UserSettingsViewState._resetEdited,
      editedPremiumBadgeMasked: UserSettingsViewState._resetEdited,
      editedPremiumBadgeTimestampHidden: UserSettingsViewState._resetEdited,
      editedPremiumBadgeSequenceHidden: UserSettingsViewState._resetEdited,
      editedAvatarBase64: null,
      editedBannerBase64: null,
      avatarCleared: false,
      bannerCleared: false,
      isSaving: false,
      error: null,
    );
  }

  void toggleCompact() {
    state = state.copyWith(messageDisplayCompact: !state.messageDisplayCompact);
  }

  Future<void> setMessageDisplayCompact({required bool value}) async {
    final bool previous = state.messageDisplayCompact;
    state = state.copyWith(messageDisplayCompact: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(messageDisplayCompact: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(messageDisplayCompact: previous);
      talker.error('Failed to update messageDisplayCompact', e, st);
      rethrow;
    }
  }

  bool isTrustedDomain(String hostname) {
    return external_link_utils.isTrustedDomain(
      hostname,
      trustedDomains: state.trustedDomains,
      currentHostname: Uri.base.host,
    );
  }

  Future<void> addTrustedDomain(String domain) async {
    if (state.trustAllDomains || domain.isEmpty) {
      return;
    }

    final current = [...state.trustedDomains];
    if (current.contains(domain)) {
      return;
    }

    await _updateTrustedDomains([...current, domain]);
  }

  Future<void> setTrustAllDomains({required bool trustAll}) async {
    await _updateTrustedDomains(trustAll ? const ['*'] : const []);
  }

  Future<void> _updateTrustedDomains(List<String> trustedDomains) async {
    final client = ref.read(fluxerClientProvider);
    await client.users.updateCurrentUserSettings(
      body: UserSettingsUpdateRequest(trustedDomains: trustedDomains),
    );
    state = state.copyWith(trustedDomains: trustedDomains);
  }

  Future<void> setInlineEmbedMedia({required bool value}) async {
    state = state.copyWith(inlineEmbedMedia: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(inlineEmbedMedia: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(inlineEmbedMedia: !value);
      talker.error('Failed to update inlineEmbedMedia', e, st);
      rethrow;
    }
  }

  Future<void> setInlineAttachmentMedia({required bool value}) async {
    state = state.copyWith(inlineAttachmentMedia: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(inlineAttachmentMedia: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(inlineAttachmentMedia: !value);
      talker.error('Failed to update inlineAttachmentMedia', e, st);
      rethrow;
    }
  }

  Future<void> setRenderEmbeds({required bool value}) async {
    state = state.copyWith(renderEmbeds: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(renderEmbeds: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(renderEmbeds: !value);
      talker.error('Failed to update renderEmbeds', e, st);
      rethrow;
    }
  }

  Future<void> setRenderReactions({required bool value}) async {
    state = state.copyWith(renderReactions: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(renderReactions: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(renderReactions: !value);
      talker.error('Failed to update renderReactions', e, st);
      rethrow;
    }
  }

  Future<void> setRenderSpoilers(RenderSpoilers value) async {
    final previous = state.renderSpoilers;
    state = state.copyWith(renderSpoilers: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(renderSpoilers: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(renderSpoilers: previous);
      talker.error('Failed to update renderSpoilers', e, st);
      rethrow;
    }
  }

  Future<void> setGifAutoPlay({required bool value}) async {
    state = state.copyWith(gifAutoPlay: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(gifAutoPlay: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(gifAutoPlay: !value);
      talker.error('Failed to update gifAutoPlay', e, st);
      rethrow;
    }
  }

  Future<void> setAnimateEmoji({required bool value}) async {
    state = state.copyWith(animateEmoji: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(animateEmoji: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(animateEmoji: !value);
      talker.error('Failed to update animateEmoji', e, st);
      rethrow;
    }
  }

  Future<void> setAnimateStickers(StickerAnimationOptions value) async {
    final previous = state.animateStickers;
    state = state.copyWith(animateStickers: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(animateStickers: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(animateStickers: previous);
      talker.error('Failed to update animateStickers', e, st);
      rethrow;
    }
  }

  // TODO(M0n7y5): switch to server-sync once the SDK exposes
  // `show_faded_unread_on_muted_channels` on `UserSettingsUpdateRequest` /
  // `UserSettingsResponse`. Until then this is an in-memory toggle.
  void setShowFadedUnreadOnMutedChannels({required bool value}) {
    state = state.copyWith(showFadedUnreadOnMutedChannels: value);
  }

  Future<void> setDefaultHideMutedChannels({required bool value}) async {
    state = state.copyWith(defaultHideMutedChannels: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(defaultHideMutedChannels: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(defaultHideMutedChannels: !value);
      talker.error('Failed to update defaultHideMutedChannels', e, st);
      rethrow;
    }
  }

  Future<void> setDeveloperMode({required bool value}) async {
    final previous = state.developerMode;
    state = state.copyWith(developerMode: value);
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(developerMode: value),
      );
    } on Object catch (e, st) {
      state = state.copyWith(developerMode: previous);
      talker.error('Failed to update developerMode', e, st);
      rethrow;
    }
  }

  Future<void> applyDefaultHideMutedChannelsToExistingGuilds({
    required bool value,
  }) async {
    final db = ref.read(fluxerDatabaseProvider);
    final client = ref.read(fluxerClientProvider);
    final guilds = await db.guildDao.getServers();

    for (final guild in guilds) {
      final existing = await db.userGuildSettingsDao.getByGuildId(guild.id);
      final data = existing != null
          ? jsonDecode(existing.data) as Map<String, dynamic>
          : <String, dynamic>{};
      data['hide_muted_channels'] = value;

      await db.userGuildSettingsDao.upsert(
        UserGuildSettingsTableCompanion(
          guildId: Value(guild.id),
          data: Value(jsonEncode(data)),
        ),
      );

      unawaited(
        _updateGuildHideMutedChannels(
          client: client,
          guildId: guild.id,
          value: value,
        ),
      );
    }
  }

  Future<void> _updateGuildHideMutedChannels({
    required FluxerClient client,
    required String guildId,
    required bool value,
  }) async {
    try {
      await client.users.updateGuildSettingsForUser(
        guildId: guildId,
        body: UserGuildSettingsUpdateRequest(hideMutedChannels: value),
      );
    } on Object catch (e, st) {
      talker.error(
        'Failed to update hideMutedChannels for guild $guildId',
        e,
        st,
      );
    }
  }
}
