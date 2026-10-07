import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expression_panel_provider.g.dart';

@Riverpod()
class ExpressionPanel extends _$ExpressionPanel {
  @override
  bool build() => false;

  void open() => state = true;

  void close() {
    state = false;
    ref.read(expressionPanelTabProvider.notifier).reset();
    ref.read(expressionPanelContentFadeProvider.notifier).reset();
  }

  void toggle() => state = !state;
}

@Riverpod(keepAlive: true)
class ComposerPanelDismissRequest extends _$ComposerPanelDismissRequest {
  @override
  int build() => 0;

  void requestAnimatedClose() => state++;
}

final NotifierProvider<ComposerPanelClosing, bool>
composerPanelClosingProvider = NotifierProvider<ComposerPanelClosing, bool>(
  ComposerPanelClosing.new,
);

class ComposerPanelClosing extends Notifier<bool> {
  @override
  bool build() => false;

  void start() => state = true;

  void reset() => state = false;
}

@Riverpod(keepAlive: true)
class ExpressionPanelTab extends _$ExpressionPanelTab {
  @override
  ExpressionPickerTab build() => ExpressionPickerTab.emojis;

  void setTab(ExpressionPickerTab tab) {
    if (state == tab) {
      return;
    }
    state = tab;
  }

  void reset() => state = ExpressionPickerTab.emojis;
}

@Riverpod(keepAlive: true)
class ExpressionPanelContentFade extends _$ExpressionPanelContentFade {
  @override
  bool build() => false;

  void markPlayed() => state = true;

  void reset() => state = false;
}

@Riverpod()
class ExpressionPanelHeight extends _$ExpressionPanelHeight {
  @override
  double? build() => null;

  void setHeight(double height) {
    if (state == height) {
      return;
    }
    state = height;
  }

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

  void setSelection(FluxerSelectedGif selection) {
    if (state == selection) {
      return;
    }
    state = selection;
  }

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

  void setSelection(StickerEntry selection) {
    if (state == selection) {
      return;
    }
    state = selection;
  }

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

  void setSelection(FavoriteMemeSelection selection) {
    if (state == selection) {
      return;
    }
    state = selection;
  }

  void consume() => state = null;
}
