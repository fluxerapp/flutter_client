import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/data/chat_wallpaper_file_store.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_wallpaper_provider.g.dart';

@Riverpod(keepAlive: true)
class ChatWallpaper extends _$ChatWallpaper {
  String? _userId;
  final ChatWallpaperFileStore _files = const ChatWallpaperFileStore();

  @override
  ChatWallpaperSnapshot build() => const ChatWallpaperSnapshot();

  Future<void> load(String userId) async {
    _userId = userId;
    final FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final UserPreferencesTableData? prefs = await db.userPreferencesDao
        .getPreferences(userId);
    final ChatWallpaperState selection = chatWallpaperFromJson(
      prefs?.chatWallpaperJson,
    );
    String? customPath;
    if (!kIsWeb) {
      customPath = await _files.existingPathForUser(userId);
    }
    state = ChatWallpaperSnapshot(
      selection: selection,
      customImagePath: customPath,
    );
  }

  Future<void> setSelection(ChatWallpaperState selection) async {
    state = state.copyWith(selection: selection);
    await _persist();
  }

  void previewDim(double dim) {
    state = state.copyWith(
      selection: state.selection.copyWith(dim: clampChatWallpaperDim(dim)),
    );
  }

  Future<void> setDim(double dim) async {
    previewDim(dim);
    await _persist();
  }

  Future<bool> setCustomImage(Uint8List bytes) async {
    state = state.copyWith(isProcessingCustom: true);
    try {
      final Uint8List? encoded = await prepareChatWallpaperBytes(bytes);
      if (encoded == null) {
        return false;
      }
      String? path;
      final String? userId = _userId;
      if (userId != null) {
        path = await _files.saveForUser(userId: userId, bytes: encoded);
        if (path == null && !kIsWeb) {
          return false;
        }
      }
      _setCustomSelection(encoded, path: path);
      await _persist();
      return true;
    } finally {
      if (state.isProcessingCustom) {
        state = state.copyWith(isProcessingCustom: false);
      }
    }
  }

  void _setCustomSelection(Uint8List encoded, {required String? path}) {
    state = state.copyWith(
      selection: state.selection.copyWith(
        kind: ChatWallpaperKind.custom,
        clearId: true,
      ),
      customImagePath: path,
      customImageBytes: encoded,
      isProcessingCustom: false,
      clearCustomImagePath: path == null,
    );
  }

  Future<void> _persist() async {
    final String? userId = _userId;
    if (userId == null) {
      return;
    }
    final FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    await db.userPreferencesDao.savePreferences(
      UserPreferencesTableCompanion(
        userId: Value(userId),
        chatWallpaperJson: Value(chatWallpaperToJson(state.selection)),
      ),
    );
  }
}
