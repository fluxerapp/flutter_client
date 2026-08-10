import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/settings/domain/privacy_permission.dart'
    as privacy;
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'privacy_dashboard_view_model.g.dart';

const _sentinel = Object();

class PrivacyDashboardViewState {
  const PrivacyDashboardViewState({
    this.isLoading = true,
    this.error,
    this.profilePrivacy = ProfilePrivacyLevel.allGuilds,
    this.friendSourceFlags = 0,
    this.defaultGuildsRestricted = false,
    this.botDefaultGuildsRestricted = false,
    this.incomingCallFlags = 0,
    this.groupDmAddPermissionFlags = 0,
    this.defaultShareVoiceActivity = true,
    this.lastVoiceActivitySharingChangeAt,
    this.sensitiveContentFriendDmFilter = 0,
    this.sensitiveContentNonFriendDmFilter = 0,
    this.sensitiveContentGuildFilter = 0,
    this.isAdult = false,
    this.editedFriendDmFilter,
    this.editedNonFriendDmFilter,
    this.editedGuildFilter,
    this.isSavingSensitiveContent = false,
  });

  final bool isLoading;
  final String? error;

  final ProfilePrivacyLevel profilePrivacy;
  final int friendSourceFlags;
  final bool defaultGuildsRestricted;
  final bool botDefaultGuildsRestricted;
  final int incomingCallFlags;
  final int groupDmAddPermissionFlags;
  final bool defaultShareVoiceActivity;
  final String? lastVoiceActivitySharingChangeAt;

  final int sensitiveContentFriendDmFilter;
  final int sensitiveContentNonFriendDmFilter;
  final int sensitiveContentGuildFilter;
  final bool isAdult;

  final int? editedFriendDmFilter;
  final int? editedNonFriendDmFilter;
  final int? editedGuildFilter;
  final bool isSavingSensitiveContent;

  bool get everyoneCanFriendRequest =>
      friendSourceFlags & privacy.FriendSourceFlag.noRelation != 0;

  bool get friendsOfFriendsCanFriend =>
      friendSourceFlags & privacy.FriendSourceFlag.mutualFriends != 0;

  bool get communityMembersCanFriend =>
      friendSourceFlags & privacy.FriendSourceFlag.mutualGuilds != 0;

  privacy.PermissionMode get incomingCallMode =>
      privacy.incomingCallModeFromFlags(incomingCallFlags);

  bool get callFriendsOfFriends =>
      incomingCallFlags & privacy.IncomingCallFlag.friendsOfFriends != 0;

  bool get callGuildMembers =>
      incomingCallFlags & privacy.IncomingCallFlag.guildMembers != 0;

  bool get silentCallsEnabled =>
      incomingCallFlags & privacy.IncomingCallFlag.silentEveryone != 0;

  privacy.PermissionMode get groupDmAddMode =>
      privacy.groupDmAddModeFromFlags(groupDmAddPermissionFlags);

  bool get groupDmFriendsOfFriends =>
      groupDmAddPermissionFlags &
          privacy.GroupDmAddPermissionFlag.friendsOfFriends !=
      0;

  bool get groupDmGuildMembers =>
      groupDmAddPermissionFlags &
          privacy.GroupDmAddPermissionFlag.guildMembers !=
      0;

  int get effectiveFriendDmFilter =>
      editedFriendDmFilter ?? sensitiveContentFriendDmFilter;

  int get effectiveNonFriendDmFilter =>
      editedNonFriendDmFilter ?? sensitiveContentNonFriendDmFilter;

  int get effectiveGuildFilter =>
      editedGuildFilter ?? sensitiveContentGuildFilter;

  bool get isSensitiveContentDirty =>
      (editedFriendDmFilter != null &&
          editedFriendDmFilter != sensitiveContentFriendDmFilter) ||
      (editedNonFriendDmFilter != null &&
          editedNonFriendDmFilter != sensitiveContentNonFriendDmFilter) ||
      (editedGuildFilter != null &&
          editedGuildFilter != sensitiveContentGuildFilter);

  int? get voiceActivityCooldownRemainingMs => privacy
      .voiceActivityCooldownRemainingMs(lastVoiceActivitySharingChangeAt);

  PrivacyDashboardViewState copyWith({
    bool? isLoading,
    Object? error = _sentinel,
    ProfilePrivacyLevel? profilePrivacy,
    int? friendSourceFlags,
    bool? defaultGuildsRestricted,
    bool? botDefaultGuildsRestricted,
    int? incomingCallFlags,
    int? groupDmAddPermissionFlags,
    bool? defaultShareVoiceActivity,
    Object? lastVoiceActivitySharingChangeAt = _sentinel,
    int? sensitiveContentFriendDmFilter,
    int? sensitiveContentNonFriendDmFilter,
    int? sensitiveContentGuildFilter,
    bool? isAdult,
    Object? editedFriendDmFilter = _sentinel,
    Object? editedNonFriendDmFilter = _sentinel,
    Object? editedGuildFilter = _sentinel,
    bool? isSavingSensitiveContent,
  }) {
    return PrivacyDashboardViewState(
      isLoading: isLoading ?? this.isLoading,
      error: error == _sentinel ? this.error : error as String?,
      profilePrivacy: profilePrivacy ?? this.profilePrivacy,
      friendSourceFlags: friendSourceFlags ?? this.friendSourceFlags,
      defaultGuildsRestricted:
          defaultGuildsRestricted ?? this.defaultGuildsRestricted,
      botDefaultGuildsRestricted:
          botDefaultGuildsRestricted ?? this.botDefaultGuildsRestricted,
      incomingCallFlags: incomingCallFlags ?? this.incomingCallFlags,
      groupDmAddPermissionFlags:
          groupDmAddPermissionFlags ?? this.groupDmAddPermissionFlags,
      defaultShareVoiceActivity:
          defaultShareVoiceActivity ?? this.defaultShareVoiceActivity,
      lastVoiceActivitySharingChangeAt:
          lastVoiceActivitySharingChangeAt == _sentinel
          ? this.lastVoiceActivitySharingChangeAt
          : lastVoiceActivitySharingChangeAt as String?,
      sensitiveContentFriendDmFilter:
          sensitiveContentFriendDmFilter ?? this.sensitiveContentFriendDmFilter,
      sensitiveContentNonFriendDmFilter:
          sensitiveContentNonFriendDmFilter ??
          this.sensitiveContentNonFriendDmFilter,
      sensitiveContentGuildFilter:
          sensitiveContentGuildFilter ?? this.sensitiveContentGuildFilter,
      isAdult: isAdult ?? this.isAdult,
      editedFriendDmFilter: editedFriendDmFilter == _sentinel
          ? this.editedFriendDmFilter
          : editedFriendDmFilter as int?,
      editedNonFriendDmFilter: editedNonFriendDmFilter == _sentinel
          ? this.editedNonFriendDmFilter
          : editedNonFriendDmFilter as int?,
      editedGuildFilter: editedGuildFilter == _sentinel
          ? this.editedGuildFilter
          : editedGuildFilter as int?,
      isSavingSensitiveContent:
          isSavingSensitiveContent ?? this.isSavingSensitiveContent,
    );
  }
}

@Riverpod(keepAlive: true)
class PrivacyDashboardViewModel extends _$PrivacyDashboardViewModel {
  @override
  PrivacyDashboardViewState build() {
    unawaited(loadSettings());
    return const PrivacyDashboardViewState();
  }

  Future<void> loadSettings() async {
    try {
      final client = ref.read(fluxerClientProvider);
      final settings = await client.users.getCurrentUserSettings();
      final user = await client.users.getCurrentUser();

      state = state.copyWith(
        isLoading: false,
        error: null,
        profilePrivacy: settings.profilePrivacy,
        friendSourceFlags: settings.friendSourceFlags,
        defaultGuildsRestricted: settings.defaultGuildsRestricted,
        botDefaultGuildsRestricted: settings.botDefaultGuildsRestricted,
        incomingCallFlags: settings.incomingCallFlags,
        groupDmAddPermissionFlags: settings.groupDmAddPermissionFlags,
        defaultShareVoiceActivity: settings.defaultShareVoiceActivity,
        lastVoiceActivitySharingChangeAt: user.lastVoiceActivitySharingChangeAt,
        sensitiveContentFriendDmFilter:
            settings.sensitiveContentFriendDmFilter.json ?? 0,
        sensitiveContentNonFriendDmFilter:
            settings.sensitiveContentNonFriendDmFilter.json ?? 0,
        sensitiveContentGuildFilter:
            settings.sensitiveContentGuildFilter.json ?? 0,
        isAdult: user.nsfwAllowed,
      );
    } on Object catch (e, st) {
      talker.error('Failed to load privacy settings', e, st);
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateProfilePrivacy(ProfilePrivacyLevel value) async {
    final previous = state.profilePrivacy;
    state = state.copyWith(profilePrivacy: value);

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(profilePrivacy: value),
      );
    } on Object catch (e, st) {
      talker.error('Failed to update profile privacy', e, st);
      state = state.copyWith(profilePrivacy: previous);
    }
  }

  Future<void> updateFriendSourceFlag(int flag, {required bool enabled}) async {
    final previous = state.friendSourceFlags;
    final int newFlags;
    if (enabled) {
      newFlags = previous | flag;
    } else {
      newFlags = previous & ~flag;
    }

    state = state.copyWith(friendSourceFlags: newFlags);

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(friendSourceFlags: newFlags),
      );
    } on Object catch (e, st) {
      talker.error('Failed to update friend source flags', e, st);
      state = state.copyWith(friendSourceFlags: previous);
    }
  }

  Future<void> updateDefaultGuildsRestricted({
    required bool restricted,
    bool applyToAll = false,
    List<String> guildIds = const <String>[],
  }) async {
    final previous = state.defaultGuildsRestricted;
    state = state.copyWith(defaultGuildsRestricted: restricted);

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(
          defaultGuildsRestricted: restricted,
          restrictedGuilds: applyToAll
              ? (restricted ? guildIds : const <String>[])
              : null,
        ),
      );
    } on Object catch (e, st) {
      talker.error('Failed to update default guilds restricted', e, st);
      state = state.copyWith(defaultGuildsRestricted: previous);
    }
  }

  Future<void> updateBotDefaultGuildsRestricted({
    required bool restricted,
    bool applyToAll = false,
    List<String> guildIds = const <String>[],
  }) async {
    final previous = state.botDefaultGuildsRestricted;
    state = state.copyWith(botDefaultGuildsRestricted: restricted);

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(
          botDefaultGuildsRestricted: restricted,
          botRestrictedGuilds: applyToAll
              ? (restricted ? guildIds : const <String>[])
              : null,
        ),
      );
    } on Object catch (e, st) {
      talker.error('Failed to update bot default guilds restricted', e, st);
      state = state.copyWith(botDefaultGuildsRestricted: previous);
    }
  }

  Future<void> updateIncomingCallFlags(int flags) async {
    final previous = state.incomingCallFlags;
    state = state.copyWith(incomingCallFlags: flags);

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(incomingCallFlags: flags),
      );
    } on Object catch (e, st) {
      talker.error('Failed to update incoming call flags', e, st);
      state = state.copyWith(incomingCallFlags: previous);
    }
  }

  Future<void> updateGroupDmAddPermissionFlags(int flags) async {
    final previous = state.groupDmAddPermissionFlags;
    state = state.copyWith(groupDmAddPermissionFlags: flags);

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.updateCurrentUserSettings(
        body: UserSettingsUpdateRequest(groupDmAddPermissionFlags: flags),
      );
    } on Object catch (e, st) {
      talker.error('Failed to update group DM add permission flags', e, st);
      state = state.copyWith(groupDmAddPermissionFlags: previous);
    }
  }

  Future<bool> updateVoiceActivitySharingWithToast({
    required bool value,
    required String successMessage,
    required String failureMessage,
  }) async {
    try {
      final client = ref.read(fluxerClientProvider);
      final user = await client.users.updateVoiceActivitySharingDefault(
        body: VoiceActivitySharingUpdateRequest(shareVoiceActivity: value),
      );
      state = state.copyWith(
        defaultShareVoiceActivity: value,
        lastVoiceActivitySharingChangeAt: user.lastVoiceActivitySharingChangeAt,
      );
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: successMessage,
              variant: FluxerToastVariant.success,
            ),
          );
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to update voice activity sharing', e, st);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: failureMessage,
              variant: FluxerToastVariant.danger,
            ),
          );
      return false;
    }
  }

  void editFriendDmFilter(int value) {
    state = state.copyWith(editedFriendDmFilter: value);
  }

  void editNonFriendDmFilter(int value) {
    state = state.copyWith(editedNonFriendDmFilter: value);
  }

  void editGuildFilter(int value) {
    state = state.copyWith(editedGuildFilter: value);
  }

  void resetSensitiveContent() {
    state = state.copyWith(
      editedFriendDmFilter: null,
      editedNonFriendDmFilter: null,
      editedGuildFilter: null,
    );
  }

  Future<void> saveSensitiveContent({required String failureMessage}) async {
    if (!state.isSensitiveContentDirty) {
      return;
    }

    state = state.copyWith(isSavingSensitiveContent: true);

    try {
      final client = ref.read(fluxerClientProvider);
      if (state.isAdult) {
        await client.users.updateCurrentUserSettings(
          body: UserSettingsUpdateRequest(
            sensitiveContentFriendDmFilter: SensitiveMediaFilterLevel.values
                .firstWhere(
                  (level) => level.json == state.effectiveFriendDmFilter,
                  orElse: () => SensitiveMediaFilterLevel.valueShow,
                ),
            sensitiveContentNonFriendDmFilter: SensitiveMediaFilterLevel.values
                .firstWhere(
                  (level) => level.json == state.effectiveNonFriendDmFilter,
                  orElse: () => SensitiveMediaFilterLevel.valueShow,
                ),
            sensitiveContentGuildFilter: SensitiveMediaGuildFilterLevel.values
                .firstWhere(
                  (level) => level.json == state.effectiveGuildFilter,
                  orElse: () => SensitiveMediaGuildFilterLevel.valueShow,
                ),
          ),
        );
      } else {
        await client.users.updateCurrentUserSettings(
          body: UserSettingsUpdateRequest(
            sensitiveContentFriendDmFilter: SensitiveMediaFilterLevel.values
                .firstWhere(
                  (level) => level.json == state.effectiveFriendDmFilter,
                  orElse: () => SensitiveMediaFilterLevel.blur,
                ),
          ),
        );
      }

      state = state.copyWith(
        sensitiveContentFriendDmFilter: state.effectiveFriendDmFilter,
        sensitiveContentNonFriendDmFilter: state.effectiveNonFriendDmFilter,
        sensitiveContentGuildFilter: state.effectiveGuildFilter,
        editedFriendDmFilter: null,
        editedNonFriendDmFilter: null,
        editedGuildFilter: null,
        isSavingSensitiveContent: false,
      );
      unawaited(ref.read(sensitiveContentProvider.notifier).load());
    } on Object catch (e, st) {
      talker.error('Failed to save sensitive content settings', e, st);
      state = state.copyWith(isSavingSensitiveContent: false);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: failureMessage,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<bool> requestFullDataExport() async {
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.requestDataHarvest();
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to request data export', e, st);
      return false;
    }
  }

  Future<bool> requestFilteredDataExport(HarvestSelfDataRequest body) async {
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.requestFilteredDataHarvest(body: body);
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to request filtered data export', e, st);
      return false;
    }
  }

  Future<bool> bulkDeleteMessages(BulkDeleteSelfMessagesRequest body) async {
    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.bulkDeleteMyMessages(body: body);
      return true;
    } on Object catch (e, st) {
      talker.error('Failed to bulk delete messages', e, st);
      return false;
    }
  }
}
