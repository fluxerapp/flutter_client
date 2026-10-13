import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/utils/media/attachment_url_signature.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_gifs_provider.g.dart';

class FavoriteGifsState {
  const FavoriteGifsState({
    this.entries = const [],
    this.seenFirstTimePrompt = false,
  });

  final List<FavoriteGifEntry> entries;
  final bool seenFirstTimePrompt;
}

@Riverpod(keepAlive: true)
class FavoriteGifs extends _$FavoriteGifs {
  @override
  FavoriteGifsState build() {
    ref.watch(currentUserIdProvider);
    return const FavoriteGifsState();
  }

  void applySynced({
    required List<FavoriteGifEntry> entries,
    required bool seenFirstTimePrompt,
  }) {
    state = FavoriteGifsState(
      entries: List.unmodifiable(entries),
      seenFirstTimePrompt: seenFirstTimePrompt,
    );
  }

  bool hasUrl(String url) {
    final String target = stripAttachmentSignature(url);
    return state.entries.any(
      (entry) => stripAttachmentSignature(entry.url) == target,
    );
  }

  void addFromGif(GifPickerGif gif) {
    final url = favoriteGifUrl(gif);
    if (hasUrl(url)) {
      return;
    }
    state = FavoriteGifsState(
      entries: [
        ...state.entries,
        stripFavoriteGifEntrySignatures(favoriteGifEntryFromPickerGif(gif)),
      ],
      seenFirstTimePrompt: state.seenFirstTimePrompt,
    );
    _markDirty();
  }

  void removeByUrl(String url) {
    if (!hasUrl(url)) {
      return;
    }
    final String target = stripAttachmentSignature(url);
    state = FavoriteGifsState(
      entries: state.entries
          .where((entry) => stripAttachmentSignature(entry.url) != target)
          .toList(),
      seenFirstTimePrompt: state.seenFirstTimePrompt,
    );
    _markDirty();
  }

  void addFromMessageMedia({
    required String url,
    required String proxyUrl,
    int width = 0,
    int height = 0,
  }) {
    if (hasUrl(url)) {
      return;
    }
    state = FavoriteGifsState(
      entries: [
        ...state.entries,
        FavoriteGifEntry(
          url: stripAttachmentSignature(url),
          proxyUrl: stripAttachmentSignature(proxyUrl),
          width: width,
          height: height,
        ),
      ],
      seenFirstTimePrompt: state.seenFirstTimePrompt,
    );
    _markDirty();
  }

  void markFirstTimePromptSeen() {
    if (state.seenFirstTimePrompt) {
      return;
    }
    state = FavoriteGifsState(
      entries: state.entries,
      seenFirstTimePrompt: true,
    );
    _markDirty();
  }

  void _markDirty() {
    ref.markSyncedDirty(SyncedPreferenceField.favoriteGifs);
  }
}
