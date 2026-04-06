import 'dart:async';
import 'dart:convert';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart'
    show fluxerMediaCdn;
import 'package:fluxer_app/shared/external_links/external_link_utils.dart'
    as external_link_utils;
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_view_model.g.dart';

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

  final String? bio;
  final String? pronouns;
  final int? accentColor;
  final String? banner;
  final String? email;
  final bool verified;
  final bool isProfileLoaded;

  final int? premiumType;
  final String? premiumSince;
  final int? premiumLifetimeSequence;
  final bool premiumBadgeHidden;
  final bool premiumBadgeMasked;
  final bool premiumBadgeTimestampHidden;
  final bool premiumBadgeSequenceHidden;
  final bool premiumDiscriminator;
  final DateTime? premiumOutOfBandTrialEndsAt;
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
    this.bio,
    this.pronouns,
    this.accentColor,
    this.banner,
    this.email,
    this.verified = false,
    this.isProfileLoaded = false,
    this.premiumType,
    this.premiumSince,
    this.premiumLifetimeSequence,
    this.premiumBadgeHidden = false,
    this.premiumBadgeMasked = false,
    this.premiumBadgeTimestampHidden = false,
    this.premiumBadgeSequenceHidden = false,
    this.premiumDiscriminator = false,
    this.premiumOutOfBandTrialEndsAt,
    this.premiumBillingCycle,
    Object? editedPremiumBadgeHidden = _unset,
    Object? editedPremiumBadgeMasked = _unset,
    Object? editedPremiumBadgeTimestampHidden = _unset,
    Object? editedPremiumBadgeSequenceHidden = _unset,
    Object? editedDisplayName = _unset,
    Object? editedBio = _unset,
    Object? editedPronouns = _unset,
    Object? editedAccentColor = _unset,
    this.editedAvatarBase64,
    this.editedBannerBase64,
    this.avatarCleared = false,
    this.bannerCleared = false,
    this.isSaving = false,
    this.error,
  }) : _editedPremiumBadgeHidden = editedPremiumBadgeHidden,
       _editedPremiumBadgeMasked = editedPremiumBadgeMasked,
       _editedPremiumBadgeTimestampHidden = editedPremiumBadgeTimestampHidden,
       _editedPremiumBadgeSequenceHidden = editedPremiumBadgeSequenceHidden,
       _editedDisplayName = editedDisplayName,
       _editedBio = editedBio,
       _editedPronouns = editedPronouns,
       _editedAccentColor = editedAccentColor;

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
  bool get isEditedPremiumBadgeHiddenSet =>
      _editedPremiumBadgeHidden != _unset;

  bool? get editedPremiumBadgeMasked => _editedPremiumBadgeMasked == _unset
      ? null
      : _editedPremiumBadgeMasked as bool?;
  bool get isEditedPremiumBadgeMaskedSet =>
      _editedPremiumBadgeMasked != _unset;

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

  bool get isPremium =>
      premiumType != null &&
      premiumType != UserPremiumTypes.none.json;

  bool get hasLifetimePremium =>
      premiumType == UserPremiumTypes.lifetime.json;

  bool get hasVerifiedEmail => email != null;

  bool get trustAllDomains =>
      external_link_utils.trustAllDomains(trustedDomains);

  int get trustedDomainsCount =>
      trustAllDomains ? 0 : trustedDomains.length;

  bool get isOutOfBandTrialActive =>
      premiumOutOfBandTrialEndsAt != null &&
      premiumOutOfBandTrialEndsAt!.isAfter(DateTime.now());

  bool get effectivePremiumBadgeHidden =>
      editedPremiumBadgeHidden ?? premiumBadgeHidden;

  bool get effectivePremiumBadgeMasked =>
      editedPremiumBadgeMasked ?? premiumBadgeMasked;

  bool get effectivePremiumBadgeTimestampHidden =>
      editedPremiumBadgeTimestampHidden ?? premiumBadgeTimestampHidden;

  bool get effectivePremiumBadgeSequenceHidden =>
      editedPremiumBadgeSequenceHidden ?? premiumBadgeSequenceHidden;

  String? get avatarUrl {
    if (avatar == null) {
      return null;
    }
    return '$fluxerMediaCdn'
        '/avatars/$userId/$avatar.png';
  }

  String? get bannerUrl {
    if (banner == null) {
      return null;
    }
    return '$fluxerMediaCdn'
        '/banners/$userId/$banner.png';
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
    Object? bio = _unset,
    Object? pronouns = _unset,
    Object? accentColor = _unset,
    Object? banner = _unset,
    Object? email = _unset,
    bool? verified,
    bool? isProfileLoaded,
    Object? premiumType = _unset,
    Object? premiumSince = _unset,
    Object? premiumLifetimeSequence = _unset,
    bool? premiumBadgeHidden,
    bool? premiumBadgeMasked,
    bool? premiumBadgeTimestampHidden,
    bool? premiumBadgeSequenceHidden,
    bool? premiumDiscriminator,
    Object? premiumOutOfBandTrialEndsAt = _unset,
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
      bio: bio == _unset ? this.bio : bio as String?,
      pronouns: pronouns == _unset ? this.pronouns : pronouns as String?,
      accentColor: accentColor == _unset
          ? this.accentColor
          : accentColor as int?,
      banner: banner == _unset ? this.banner : banner as String?,
      email: email == _unset ? this.email : email as String?,
      verified: verified ?? this.verified,
      isProfileLoaded: isProfileLoaded ?? this.isProfileLoaded,
      premiumType: premiumType == _unset
          ? this.premiumType
          : premiumType as int?,
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
      premiumDiscriminator:
          premiumDiscriminator ?? this.premiumDiscriminator,
      premiumOutOfBandTrialEndsAt: premiumOutOfBandTrialEndsAt == _unset
          ? this.premiumOutOfBandTrialEndsAt
          : premiumOutOfBandTrialEndsAt as DateTime?,
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
      unawaited(loadProfile());
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

  void _watchUser(String userId) {
    final db = ref.read(fluxerDatabaseProvider);
    final subscription = db.userDao.watchUserById(userId).listen((user) {
      if (user == null) {
        return;
      }
      state = state.copyWith(
        username: user.username,
        displayName: user.globalName ?? user.username,
        discriminator: user.discriminator,
        avatar: user.avatar,
        avatarColor: user.avatarColor,
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
      final trustedDomains = (data['trusted_domains'] as List<dynamic>? ?? const [])
          .whereType<String>()
          .toList(growable: false);
      state = state.copyWith(
        developerMode: developerMode,
        trustedDomains: trustedDomains,
      );
    });
    ref.onDispose(subscription.cancel);
  }

  Future<void> loadProfile() async {
    try {
      final client = ref.read(fluxerClientProvider);
      final profile = await client.users.getCurrentUser();
      state = state.copyWith(
        bio: profile.bio,
        pronouns: profile.pronouns,
        accentColor: profile.accentColor,
        banner: profile.banner,
        email: profile.email,
        verified: profile.verified,
        premiumType: profile.premiumType?.json,
        premiumSince: profile.premiumSince,
        premiumLifetimeSequence: profile.premiumLifetimeSequence,
        premiumBadgeHidden: profile.premiumBadgeHidden,
        premiumBadgeMasked: profile.premiumBadgeMasked,
        premiumBadgeTimestampHidden: profile.premiumBadgeTimestampHidden,
        premiumBadgeSequenceHidden: profile.premiumBadgeSequenceHidden,
        premiumDiscriminator: profile.premiumDiscriminator ?? false,
        premiumOutOfBandTrialEndsAt: profile.premiumOutOfBandTrialEndsAt,
        premiumBillingCycle: profile.premiumBillingCycle,
        isProfileLoaded: true,
      );
    } on Exception catch (e) {
      talker.error('Failed to load profile', e);
      state = state.copyWith(error: 'Failed to load profile');
    }
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

  void togglePremiumBadge(String field, {required bool value}) {
    switch (field) {
      case 'premium_badge_hidden':
        state = state.copyWith(editedPremiumBadgeHidden: value);
      case 'premium_badge_timestamp_hidden':
        state = state.copyWith(editedPremiumBadgeTimestampHidden: value);
      case 'premium_badge_masked':
        state = state.copyWith(editedPremiumBadgeMasked: value);
        if (value) {
          state = state.copyWith(editedPremiumBadgeSequenceHidden: true);
        }
      case 'premium_badge_sequence_hidden':
        state = state.copyWith(editedPremiumBadgeSequenceHidden: value);
    }
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

  Future<void> save() async {
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
          s.editedPremiumBadgeSequenceHidden !=
              s.premiumBadgeSequenceHidden) {
        premiumBadgeSequenceHidden = s.editedPremiumBadgeSequenceHidden;
      }

      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUser(
        body: UserUpdateWithVerificationRequest(
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
        ),
      );

      await loadProfile();
      reset();
    } on Exception catch (e) {
      talker.error('Failed to save profile', e);
      state = state.copyWith(isSaving: false, error: 'Failed to save profile');
    }
  }

  void reset() {
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

  Future<void> setTrustAllDomains(bool trustAll) async {
    await _updateTrustedDomains(trustAll ? const ['*'] : const []);
  }

  Future<void> _updateTrustedDomains(List<String> trustedDomains) async {
    final client = ref.read(fluxerClientProvider);
    await client.users.updateCurrentUserSettings(
      body: UserSettingsUpdateRequest(trustedDomains: trustedDomains),
    );
    state = state.copyWith(trustedDomains: trustedDomains);
  }
}
