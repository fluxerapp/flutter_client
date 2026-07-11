import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/inline_expression_panel.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

/// Stack child that renders the mobile inline expression panel above the
/// keyboard.
///
/// Reads `viewInsets` only while the panel is open, so the surrounding chat
/// surface no longer rebuilds during keyboard animation when the panel is
/// closed (the everyday "tap field → keyboard" case).
class InlineExpressionPanelHost extends ConsumerWidget {
  const InlineExpressionPanelHost({
    required this.showInlineEmojiPicker,
    this.topHeaderInset = 0,
    super.key,
  });

  final bool showInlineEmojiPicker;
  final double topHeaderInset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!showInlineEmojiPicker || !isMobileLayout(context)) {
      return const SizedBox.shrink();
    }
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    if (!isPanelOpen) {
      return const SizedBox.shrink();
    }
    final double keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    return Positioned(
      left: 0,
      right: 0,
      top: topHeaderInset > 0 ? topHeaderInset : null,
      bottom: inlineExpressionPanelBottomOffset(keyboardInset: keyboardInset),
      child: Material(
        color: Colors.transparent,
        elevation: 8,
        child: InlineExpressionPanel(
          onClose: () => ref.read(expressionPanelProvider.notifier).close(),
          onEmojiSelect: (String name, String surrogates) => ref
              .read(pendingEmojiInsertProvider.notifier)
              .emit(name, surrogates),
          onGifSelect: (selection) =>
              ref.read(pendingGifSelectionProvider.notifier).emit(selection),
          onStickerSelect: (selection) => ref
              .read(pendingStickerSelectionProvider.notifier)
              .emit(selection),
          onFavoriteMemeSelect: (selection) => ref
              .read(pendingFavoriteMemeSelectionProvider.notifier)
              .emit(selection),
        ),
      ),
    );
  }
}
