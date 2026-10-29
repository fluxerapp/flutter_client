import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_preferences_provider.g.dart';

enum MediaDimensionSize { small, large }

class ChatPreferencesState {
  const ChatPreferencesState({
    this.embedMediaDimensionSize = MediaDimensionSize.small,
    this.attachmentMediaDimensionSize = MediaDimensionSize.large,
    this.autoSendKlipyGifs = true,
    this.showDefaultEmojisInExpressionAutocomplete = true,
    this.showCustomEmojisInExpressionAutocomplete = true,
    this.showStickersInExpressionAutocomplete = true,
    this.showMemesInExpressionAutocomplete = true,
    this.preserveEditDraft = false,
    this.sanitizeUrls = true,
  });

  final MediaDimensionSize embedMediaDimensionSize;
  final MediaDimensionSize attachmentMediaDimensionSize;
  final bool autoSendKlipyGifs;
  final bool showDefaultEmojisInExpressionAutocomplete;
  final bool showCustomEmojisInExpressionAutocomplete;
  final bool showStickersInExpressionAutocomplete;
  final bool showMemesInExpressionAutocomplete;
  final bool preserveEditDraft;
  final bool sanitizeUrls;

  ChatPreferencesState copyWith({
    MediaDimensionSize? embedMediaDimensionSize,
    MediaDimensionSize? attachmentMediaDimensionSize,
    bool? autoSendKlipyGifs,
    bool? showDefaultEmojisInExpressionAutocomplete,
    bool? showCustomEmojisInExpressionAutocomplete,
    bool? showStickersInExpressionAutocomplete,
    bool? showMemesInExpressionAutocomplete,
    bool? preserveEditDraft,
    bool? sanitizeUrls,
  }) {
    return ChatPreferencesState(
      embedMediaDimensionSize:
          embedMediaDimensionSize ?? this.embedMediaDimensionSize,
      attachmentMediaDimensionSize:
          attachmentMediaDimensionSize ?? this.attachmentMediaDimensionSize,
      autoSendKlipyGifs: autoSendKlipyGifs ?? this.autoSendKlipyGifs,
      showDefaultEmojisInExpressionAutocomplete:
          showDefaultEmojisInExpressionAutocomplete ??
          this.showDefaultEmojisInExpressionAutocomplete,
      showCustomEmojisInExpressionAutocomplete:
          showCustomEmojisInExpressionAutocomplete ??
          this.showCustomEmojisInExpressionAutocomplete,
      showStickersInExpressionAutocomplete:
          showStickersInExpressionAutocomplete ??
          this.showStickersInExpressionAutocomplete,
      showMemesInExpressionAutocomplete:
          showMemesInExpressionAutocomplete ??
          this.showMemesInExpressionAutocomplete,
      preserveEditDraft: preserveEditDraft ?? this.preserveEditDraft,
      sanitizeUrls: sanitizeUrls ?? this.sanitizeUrls,
    );
  }
}

@Riverpod(keepAlive: true)
class ChatPreferences extends _$ChatPreferences {
  String? _userId;

  @override
  ChatPreferencesState build() => const ChatPreferencesState();

  Future<void> load(String userId) async {
    _userId = userId;
    final db = ref.read(fluxerDatabaseProvider);
    final prefs = await db.userPreferencesDao.getPreferences(userId);
    if (prefs != null) {
      state = ChatPreferencesState(
        embedMediaDimensionSize: MediaDimensionSize.values.firstWhere(
          (m) => m.name == prefs.embedMediaDimensionSize,
          orElse: () => MediaDimensionSize.small,
        ),
        attachmentMediaDimensionSize: MediaDimensionSize.values.firstWhere(
          (m) => m.name == prefs.attachmentMediaDimensionSize,
          orElse: () => MediaDimensionSize.large,
        ),
        autoSendKlipyGifs: prefs.autoSendKlipyGifs,
        showDefaultEmojisInExpressionAutocomplete:
            prefs.showDefaultEmojisInExpressionAutocomplete,
        showCustomEmojisInExpressionAutocomplete:
            prefs.showCustomEmojisInExpressionAutocomplete,
        showStickersInExpressionAutocomplete:
            prefs.showStickersInExpressionAutocomplete,
        showMemesInExpressionAutocomplete:
            prefs.showMemesInExpressionAutocomplete,
        preserveEditDraft: prefs.preserveEditDraft,
        sanitizeUrls: prefs.sanitizeUrls,
      );
    }
  }

  Future<void> setEmbedMediaDimensionSize(MediaDimensionSize value) async {
    state = state.copyWith(embedMediaDimensionSize: value);
    await _persist();
  }

  Future<void> setAttachmentMediaDimensionSize(MediaDimensionSize value) async {
    state = state.copyWith(attachmentMediaDimensionSize: value);
    await _persist();
  }

  Future<void> setAutoSendKlipyGifs({required bool value}) async {
    state = state.copyWith(autoSendKlipyGifs: value);
    await _persist();
  }

  Future<void> setShowDefaultEmojisInExpressionAutocomplete({
    required bool value,
  }) async {
    state = state.copyWith(showDefaultEmojisInExpressionAutocomplete: value);
    await _persist();
  }

  Future<void> setShowCustomEmojisInExpressionAutocomplete({
    required bool value,
  }) async {
    state = state.copyWith(showCustomEmojisInExpressionAutocomplete: value);
    await _persist();
  }

  Future<void> setShowStickersInExpressionAutocomplete({
    required bool value,
  }) async {
    state = state.copyWith(showStickersInExpressionAutocomplete: value);
    await _persist();
  }

  Future<void> setShowMemesInExpressionAutocomplete({
    required bool value,
  }) async {
    state = state.copyWith(showMemesInExpressionAutocomplete: value);
    await _persist();
  }

  Future<void> setSanitizeUrls({required bool value}) async {
    state = state.copyWith(sanitizeUrls: value);
    await _persist();
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
        embedMediaDimensionSize: Value(state.embedMediaDimensionSize.name),
        attachmentMediaDimensionSize: Value(
          state.attachmentMediaDimensionSize.name,
        ),
        autoSendKlipyGifs: Value(state.autoSendKlipyGifs),
        showDefaultEmojisInExpressionAutocomplete: Value(
          state.showDefaultEmojisInExpressionAutocomplete,
        ),
        showCustomEmojisInExpressionAutocomplete: Value(
          state.showCustomEmojisInExpressionAutocomplete,
        ),
        showStickersInExpressionAutocomplete: Value(
          state.showStickersInExpressionAutocomplete,
        ),
        showMemesInExpressionAutocomplete: Value(
          state.showMemesInExpressionAutocomplete,
        ),
        preserveEditDraft: Value(state.preserveEditDraft),
        sanitizeUrls: Value(state.sanitizeUrls),
      ),
    );
  }
}
