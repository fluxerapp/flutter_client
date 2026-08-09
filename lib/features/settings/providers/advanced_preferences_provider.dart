import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'advanced_preferences_provider.g.dart';

class AdvancedPreferencesState {
  const AdvancedPreferencesState({
    this.enableTextSelection = false,
    this.showVideoSeekPreviewThumbnails = false,
    this.voiceChannelJoinRequiresDoubleClick = false,
    this.confirmBeforeJoiningVoiceChannels = false,
    this.showGifIndicator = true,
    this.showAttachmentExpiryIndicator = true,
    this.showMessageActionBar = true,
    this.showMessageActionBarQuickReactions = true,
    this.showMessageActionBarShiftExpand = true,
    this.showMessageActionBarOnlyMoreButton = false,
    this.showGifButton = true,
    this.showMemesButton = true,
    this.showStickersButton = true,
    this.showEmojiButton = true,
    this.showMessageSendButton = false,
    this.scrollToBottomOnMessageSend = true,
    this.skipMarkAllAsReadConfirmation = false,
    this.preuploadMessageAttachments = true,
    this.disableStreamPreviews = false,
    this.saveGifFavoritesAsSavedMedia = false,
    this.searchEngines = const SearchEnginesState(),
  });

  final bool enableTextSelection;
  final bool showVideoSeekPreviewThumbnails;
  final bool voiceChannelJoinRequiresDoubleClick;
  final bool confirmBeforeJoiningVoiceChannels;
  final bool showGifIndicator;
  final bool showAttachmentExpiryIndicator;
  final bool showMessageActionBar;
  final bool showMessageActionBarQuickReactions;
  final bool showMessageActionBarShiftExpand;
  final bool showMessageActionBarOnlyMoreButton;
  final bool showGifButton;
  final bool showMemesButton;
  final bool showStickersButton;
  final bool showEmojiButton;
  final bool showMessageSendButton;
  final bool scrollToBottomOnMessageSend;
  final bool skipMarkAllAsReadConfirmation;
  final bool preuploadMessageAttachments;
  final bool disableStreamPreviews;
  final bool saveGifFavoritesAsSavedMedia;
  final SearchEnginesState searchEngines;

  AdvancedPreferencesState copyWith({
    bool? enableTextSelection,
    bool? showVideoSeekPreviewThumbnails,
    bool? voiceChannelJoinRequiresDoubleClick,
    bool? confirmBeforeJoiningVoiceChannels,
    bool? showGifIndicator,
    bool? showAttachmentExpiryIndicator,
    bool? showMessageActionBar,
    bool? showMessageActionBarQuickReactions,
    bool? showMessageActionBarShiftExpand,
    bool? showMessageActionBarOnlyMoreButton,
    bool? showGifButton,
    bool? showMemesButton,
    bool? showStickersButton,
    bool? showEmojiButton,
    bool? showMessageSendButton,
    bool? scrollToBottomOnMessageSend,
    bool? skipMarkAllAsReadConfirmation,
    bool? preuploadMessageAttachments,
    bool? disableStreamPreviews,
    bool? saveGifFavoritesAsSavedMedia,
    SearchEnginesState? searchEngines,
  }) {
    return AdvancedPreferencesState(
      enableTextSelection: enableTextSelection ?? this.enableTextSelection,
      showVideoSeekPreviewThumbnails:
          showVideoSeekPreviewThumbnails ?? this.showVideoSeekPreviewThumbnails,
      voiceChannelJoinRequiresDoubleClick:
          voiceChannelJoinRequiresDoubleClick ??
          this.voiceChannelJoinRequiresDoubleClick,
      confirmBeforeJoiningVoiceChannels:
          confirmBeforeJoiningVoiceChannels ??
          this.confirmBeforeJoiningVoiceChannels,
      showGifIndicator: showGifIndicator ?? this.showGifIndicator,
      showAttachmentExpiryIndicator:
          showAttachmentExpiryIndicator ?? this.showAttachmentExpiryIndicator,
      showMessageActionBar: showMessageActionBar ?? this.showMessageActionBar,
      showMessageActionBarQuickReactions:
          showMessageActionBarQuickReactions ??
          this.showMessageActionBarQuickReactions,
      showMessageActionBarShiftExpand:
          showMessageActionBarShiftExpand ??
          this.showMessageActionBarShiftExpand,
      showMessageActionBarOnlyMoreButton:
          showMessageActionBarOnlyMoreButton ??
          this.showMessageActionBarOnlyMoreButton,
      showGifButton: showGifButton ?? this.showGifButton,
      showMemesButton: showMemesButton ?? this.showMemesButton,
      showStickersButton: showStickersButton ?? this.showStickersButton,
      showEmojiButton: showEmojiButton ?? this.showEmojiButton,
      showMessageSendButton:
          showMessageSendButton ?? this.showMessageSendButton,
      scrollToBottomOnMessageSend:
          scrollToBottomOnMessageSend ?? this.scrollToBottomOnMessageSend,
      skipMarkAllAsReadConfirmation:
          skipMarkAllAsReadConfirmation ?? this.skipMarkAllAsReadConfirmation,
      preuploadMessageAttachments:
          preuploadMessageAttachments ?? this.preuploadMessageAttachments,
      disableStreamPreviews:
          disableStreamPreviews ?? this.disableStreamPreviews,
      saveGifFavoritesAsSavedMedia:
          saveGifFavoritesAsSavedMedia ?? this.saveGifFavoritesAsSavedMedia,
      searchEngines: searchEngines ?? this.searchEngines,
    );
  }
}

@Riverpod(keepAlive: true)
class AdvancedPreferences extends _$AdvancedPreferences {
  String? _userId;
  bool _isApplyingRemote = false;

  @override
  AdvancedPreferencesState build() => const AdvancedPreferencesState();

  Future<void> load(String userId) async {
    _userId = userId;
    final db = ref.read(fluxerDatabaseProvider);
    final prefs = await db.userPreferencesDao.getPreferences(userId);

    SearchEnginesState searchEngines = SearchEnginesState.defaults();
    if (prefs != null && prefs.searchEnginesJson.isNotEmpty) {
      try {
        final Object? decoded = jsonDecode(prefs.searchEnginesJson);
        if (decoded is Map<String, Object?>) {
          if (decoded.containsKey('textSearch') ||
              decoded.containsKey('translators') ||
              decoded.containsKey('reverseImage')) {
            searchEngines = SearchEnginesState.fromJson(decoded);
          } else {
            searchEngines = SearchEnginesState.fromLegacyJson(decoded);
          }
        }
      } on Object {
        searchEngines = SearchEnginesState.defaults();
      }
    }

    if (prefs != null) {
      state = AdvancedPreferencesState(
        enableTextSelection: prefs.enableTextSelection,
        showVideoSeekPreviewThumbnails: prefs.showVideoSeekPreviewThumbnails,
        voiceChannelJoinRequiresDoubleClick:
            prefs.voiceChannelJoinRequiresDoubleClick,
        confirmBeforeJoiningVoiceChannels:
            prefs.confirmBeforeJoiningVoiceChannels,
        showGifIndicator: prefs.showGifIndicator,
        showAttachmentExpiryIndicator: prefs.showAttachmentExpiryIndicator,
        showMessageActionBar: prefs.showMessageActionBar,
        showMessageActionBarQuickReactions:
            prefs.showMessageActionBarQuickReactions,
        showMessageActionBarShiftExpand: prefs.showMessageActionBarShiftExpand,
        showMessageActionBarOnlyMoreButton:
            prefs.showMessageActionBarOnlyMoreButton,
        showGifButton: prefs.showGifButton,
        showMemesButton: prefs.showMemesButton,
        showStickersButton: prefs.showStickersButton,
        showEmojiButton: prefs.showEmojiButton,
        showMessageSendButton: prefs.showMessageSendButton,
        scrollToBottomOnMessageSend: prefs.scrollToBottomOnMessageSend,
        skipMarkAllAsReadConfirmation: prefs.skipMarkAllAsReadConfirmation,
        preuploadMessageAttachments: prefs.preuploadMessageAttachments,
        disableStreamPreviews: prefs.disableStreamPreviews,
        saveGifFavoritesAsSavedMedia: prefs.saveGifFavoritesAsSavedMedia,
        searchEngines: searchEngines,
      );
    }
  }

  Future<void> applySyncedAccessibility(
    AdvancedAccessibilityLocalState value,
  ) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(
        enableTextSelection: value.enableTextSelection,
        voiceChannelJoinRequiresDoubleClick:
            value.voiceChannelJoinRequiresDoubleClick,
        confirmBeforeJoiningVoiceChannels:
            value.confirmBeforeJoiningVoiceChannels,
        showGifIndicator: value.showGifIndicator,
        showAttachmentExpiryIndicator: value.showAttachmentExpiryIndicator,
        showMessageActionBar: value.showMessageActionBar,
        showMessageActionBarQuickReactions:
            value.showMessageActionBarQuickReactions,
        showMessageActionBarShiftExpand: value.showMessageActionBarShiftExpand,
        showMessageActionBarOnlyMoreButton:
            value.showMessageActionBarOnlyMoreButton,
        showGifButton: value.showGifButton,
        showMemesButton: value.showMemesButton,
        showStickersButton: value.showStickersButton,
        showEmojiButton: value.showEmojiButton,
        showMessageSendButton: value.showMessageSendButton,
        scrollToBottomOnMessageSend: value.scrollToBottomOnMessageSend,
      );
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
  }

  Future<void> applySyncedPrivacy(AdvancedPrivacyLocalState value) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(
        preuploadMessageAttachments: value.preuploadMessageAttachments,
        disableStreamPreviews: value.disableStreamPreviews,
      );
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
  }

  Future<void> applySyncedSearchEngines(SearchEnginesState value) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(
        searchEngines: state.searchEngines.mergeSyncedDefaults(
          textSearchEngineId: value.textSearchEngineId,
          reverseImageSearchEngineId: value.reverseImageSearchEngineId,
          translatorEngineId: value.translatorEngineId,
        ),
      );
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
  }

  Future<void> setEnableTextSelection({required bool value}) async {
    state = state.copyWith(enableTextSelection: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowVideoSeekPreviewThumbnails({required bool value}) async {
    state = state.copyWith(showVideoSeekPreviewThumbnails: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setVoiceChannelJoinRequiresDoubleClick({
    required bool value,
  }) async {
    state = state.copyWith(
      voiceChannelJoinRequiresDoubleClick: value,
      confirmBeforeJoiningVoiceChannels:
          !value && state.confirmBeforeJoiningVoiceChannels,
    );
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setConfirmBeforeJoiningVoiceChannels({
    required bool value,
  }) async {
    if (state.voiceChannelJoinRequiresDoubleClick) {
      return;
    }
    state = state.copyWith(confirmBeforeJoiningVoiceChannels: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowGifIndicator({required bool value}) async {
    state = state.copyWith(showGifIndicator: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowAttachmentExpiryIndicator({required bool value}) async {
    state = state.copyWith(showAttachmentExpiryIndicator: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMessageActionBar({required bool value}) async {
    state = state.copyWith(showMessageActionBar: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMessageActionBarQuickReactions({
    required bool value,
  }) async {
    state = state.copyWith(showMessageActionBarQuickReactions: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMessageActionBarShiftExpand({required bool value}) async {
    state = state.copyWith(showMessageActionBarShiftExpand: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMessageActionBarOnlyMoreButton({
    required bool value,
  }) async {
    state = state.copyWith(showMessageActionBarOnlyMoreButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowGifButton({required bool value}) async {
    state = state.copyWith(showGifButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMemesButton({required bool value}) async {
    state = state.copyWith(showMemesButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowStickersButton({required bool value}) async {
    state = state.copyWith(showStickersButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowEmojiButton({required bool value}) async {
    state = state.copyWith(showEmojiButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMessageSendButton({required bool value}) async {
    state = state.copyWith(showMessageSendButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setScrollToBottomOnMessageSend({required bool value}) async {
    state = state.copyWith(scrollToBottomOnMessageSend: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setSkipMarkAllAsReadConfirmation({required bool value}) async {
    state = state.copyWith(skipMarkAllAsReadConfirmation: value);
    await _persist();
  }

  Future<void> setPreuploadMessageAttachments({required bool value}) async {
    state = state.copyWith(preuploadMessageAttachments: value);
    await _persist();
    _markPrivacyDirty();
  }

  Future<void> setDisableStreamPreviews({required bool value}) async {
    state = state.copyWith(disableStreamPreviews: value);
    await _persist();
    _markPrivacyDirty();
  }

  Future<void> setSaveGifFavoritesAsSavedMedia({required bool value}) async {
    state = state.copyWith(saveGifFavoritesAsSavedMedia: value);
    await _persist();
  }

  Future<void> _updateSearchEngines(SearchEnginesState searchEngines) async {
    state = state.copyWith(searchEngines: searchEngines);
    await _persist();
    _markSearchEnginesDirty();
  }

  Future<void> setSearchProviderDefault({
    required SearchProviderMode mode,
    required String engineId,
  }) async {
    final category = state.searchEngines
        .categoryFor(mode)
        .setDefaultEngine(engineId);
    await _updateSearchEngines(
      state.searchEngines.updateCategory(mode, category),
    );
  }

  Future<void> setSearchProviderEnabled({
    required SearchProviderMode mode,
    required String engineId,
    required bool enabled,
  }) async {
    final category = state.searchEngines
        .categoryFor(mode)
        .setEngineEnabled(engineId: engineId, enabled: enabled);
    await _updateSearchEngines(
      state.searchEngines.updateCategory(mode, category),
    );
  }

  Future<void> addCustomSearchProvider({
    required SearchProviderMode mode,
    required String name,
    required String urlTemplate,
  }) async {
    final category = state.searchEngines
        .categoryFor(mode)
        .addCustomEngine(
          id: createCustomSearchProviderId(),
          name: name,
          urlTemplate: urlTemplate,
        );
    await _updateSearchEngines(
      state.searchEngines.updateCategory(mode, category),
    );
  }

  Future<void> updateCustomSearchProvider({
    required SearchProviderMode mode,
    required String engineId,
    required String name,
    required String urlTemplate,
  }) async {
    final category = state.searchEngines
        .categoryFor(mode)
        .updateCustomEngine(
          engineId: engineId,
          name: name,
          urlTemplate: urlTemplate,
        );
    await _updateSearchEngines(
      state.searchEngines.updateCategory(mode, category),
    );
  }

  Future<void> removeCustomSearchProvider({
    required SearchProviderMode mode,
    required String engineId,
  }) async {
    final category = state.searchEngines
        .categoryFor(mode)
        .removeCustomEngine(engineId);
    await _updateSearchEngines(
      state.searchEngines.updateCategory(mode, category),
    );
  }

  Future<void> setTextSearchEngineId(String value) async {
    await setSearchProviderDefault(
      mode: SearchProviderMode.text,
      engineId: value,
    );
  }

  Future<void> setReverseImageSearchEngineId(String value) async {
    await setSearchProviderDefault(
      mode: SearchProviderMode.image,
      engineId: value,
    );
  }

  Future<void> setTranslatorEngineId(String value) async {
    await setSearchProviderDefault(
      mode: SearchProviderMode.translate,
      engineId: value,
    );
  }

  void _markAccessibilityDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.accessibility);
  }

  void _markPrivacyDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.privacy);
  }

  void _markSearchEnginesDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.searchEngines);
  }

  Future<void> _persist() async {
    final userId = _userId;
    if (userId == null) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    await db.userPreferencesDao.savePreferences(
      UserPreferencesTableCompanion(
        userId: Value(userId),
        enableTextSelection: Value(state.enableTextSelection),
        showVideoSeekPreviewThumbnails: Value(
          state.showVideoSeekPreviewThumbnails,
        ),
        voiceChannelJoinRequiresDoubleClick: Value(
          state.voiceChannelJoinRequiresDoubleClick,
        ),
        confirmBeforeJoiningVoiceChannels: Value(
          state.confirmBeforeJoiningVoiceChannels,
        ),
        showGifIndicator: Value(state.showGifIndicator),
        showAttachmentExpiryIndicator: Value(
          state.showAttachmentExpiryIndicator,
        ),
        showMessageActionBar: Value(state.showMessageActionBar),
        showMessageActionBarQuickReactions: Value(
          state.showMessageActionBarQuickReactions,
        ),
        showMessageActionBarShiftExpand: Value(
          state.showMessageActionBarShiftExpand,
        ),
        showMessageActionBarOnlyMoreButton: Value(
          state.showMessageActionBarOnlyMoreButton,
        ),
        showGifButton: Value(state.showGifButton),
        showMemesButton: Value(state.showMemesButton),
        showStickersButton: Value(state.showStickersButton),
        showEmojiButton: Value(state.showEmojiButton),
        showMessageSendButton: Value(state.showMessageSendButton),
        scrollToBottomOnMessageSend: Value(state.scrollToBottomOnMessageSend),
        skipMarkAllAsReadConfirmation: Value(
          state.skipMarkAllAsReadConfirmation,
        ),
        preuploadMessageAttachments: Value(state.preuploadMessageAttachments),
        disableStreamPreviews: Value(state.disableStreamPreviews),
        saveGifFavoritesAsSavedMedia: Value(state.saveGifFavoritesAsSavedMedia),
        searchEnginesJson: Value(jsonEncode(state.searchEngines.toJson())),
      ),
    );
  }
}

const AdvancedAccessibilityLocalState kDefaultAdvancedAccessibility =
    AdvancedAccessibilityLocalState(
      enableTextSelection: false,
      voiceChannelJoinRequiresDoubleClick: false,
      confirmBeforeJoiningVoiceChannels: false,
      showGifIndicator: true,
      showAttachmentExpiryIndicator: true,
      showMessageActionBar: true,
      showMessageActionBarQuickReactions: true,
      showMessageActionBarShiftExpand: true,
      showMessageActionBarOnlyMoreButton: false,
      showGifButton: true,
      showMemesButton: true,
      showStickersButton: true,
      showEmojiButton: true,
      showMessageSendButton: false,
      scrollToBottomOnMessageSend: true,
    );

const AdvancedPrivacyLocalState kDefaultAdvancedPrivacy =
    AdvancedPrivacyLocalState(
      preuploadMessageAttachments: true,
      disableStreamPreviews: false,
    );

class AdvancedAccessibilityLocalState {
  const AdvancedAccessibilityLocalState({
    required this.enableTextSelection,
    required this.voiceChannelJoinRequiresDoubleClick,
    required this.confirmBeforeJoiningVoiceChannels,
    required this.showGifIndicator,
    required this.showAttachmentExpiryIndicator,
    required this.showMessageActionBar,
    required this.showMessageActionBarQuickReactions,
    required this.showMessageActionBarShiftExpand,
    required this.showMessageActionBarOnlyMoreButton,
    required this.showGifButton,
    required this.showMemesButton,
    required this.showStickersButton,
    required this.showEmojiButton,
    required this.showMessageSendButton,
    required this.scrollToBottomOnMessageSend,
  });

  final bool enableTextSelection;
  final bool voiceChannelJoinRequiresDoubleClick;
  final bool confirmBeforeJoiningVoiceChannels;
  final bool showGifIndicator;
  final bool showAttachmentExpiryIndicator;
  final bool showMessageActionBar;
  final bool showMessageActionBarQuickReactions;
  final bool showMessageActionBarShiftExpand;
  final bool showMessageActionBarOnlyMoreButton;
  final bool showGifButton;
  final bool showMemesButton;
  final bool showStickersButton;
  final bool showEmojiButton;
  final bool showMessageSendButton;
  final bool scrollToBottomOnMessageSend;
}

class AdvancedPrivacyLocalState {
  const AdvancedPrivacyLocalState({
    required this.preuploadMessageAttachments,
    required this.disableStreamPreviews,
  });

  final bool preuploadMessageAttachments;
  final bool disableStreamPreviews;
}
