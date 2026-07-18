import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expression_panel_provider.g.dart';

@Riverpod()
class ExpressionPanel extends _$ExpressionPanel {
  @override
  bool build() => false;

  void open() => state = true;
  void close() => state = false;
  void toggle() => state = !state;
}

@Riverpod()
class ExpressionPanelHeight extends _$ExpressionPanelHeight {
  @override
  double? build() => null;

  void set(double height) => state = height;

  void clear() => state = null;
}

@Riverpod()
class PendingEmojiInsert extends _$PendingEmojiInsert {
  @override
  ({String name, String surrogates})? build() => null;

  void emit(String name, String surrogates) =>
      state = (name: name, surrogates: surrogates);

  void consume() => state = null;
}

final NotifierProvider<PendingGifSelection, FluxerSelectedGif?>
pendingGifSelectionProvider =
    NotifierProvider<PendingGifSelection, FluxerSelectedGif?>(
      PendingGifSelection.new,
    );

class PendingGifSelection extends Notifier<FluxerSelectedGif?> {
  @override
  FluxerSelectedGif? build() => null;

  void emit(FluxerSelectedGif selection) => state = selection;

  void consume() => state = null;
}

final NotifierProvider<PendingStickerSelection, StickerEntry?>
pendingStickerSelectionProvider =
    NotifierProvider<PendingStickerSelection, StickerEntry?>(
      PendingStickerSelection.new,
    );

class PendingStickerSelection extends Notifier<StickerEntry?> {
  @override
  StickerEntry? build() => null;

  void emit(StickerEntry selection) => state = selection;

  void consume() => state = null;
}

final NotifierProvider<PendingFavoriteMemeSelection, FavoriteMemeSelection?>
pendingFavoriteMemeSelectionProvider =
    NotifierProvider<PendingFavoriteMemeSelection, FavoriteMemeSelection?>(
      PendingFavoriteMemeSelection.new,
    );

class PendingFavoriteMemeSelection extends Notifier<FavoriteMemeSelection?> {
  @override
  FavoriteMemeSelection? build() => null;

  void emit(FavoriteMemeSelection selection) => state = selection;

  void consume() => state = null;
}
