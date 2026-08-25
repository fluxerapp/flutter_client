import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerEmojiPickerSheet {
  FluxerEmojiPickerSheet._();

  static Future<void> show(
    BuildContext context, {
    ValueChanged<FluxerSelectedEmoji>? onEmojiSelected,
    ValueChanged<FluxerSelectedGif>? onGifSelected,
    ValueChanged<StickerEntry>? onStickerSelected,
    ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelected,
    String? title,
    double? maxHeight,
    List<ExpressionPickerTab> visibleTabs = const [
      ExpressionPickerTab.gifs,
      ExpressionPickerTab.memes,
      ExpressionPickerTab.stickers,
      ExpressionPickerTab.emojis,
    ],
    ExpressionPickerTab initialTab = ExpressionPickerTab.emojis,
    String? channelId,
    bool trackEmojiUsageOnSelect = true,
  }) {
    final double sheetSize = maxHeight ?? 0.9;
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: title,
      initialChildSize: sheetSize,
      maxChildSize: sheetSize,
      builder: (context, scrollController, close) {
        return _SheetContent(
          scrollController: scrollController,
          visibleTabs: visibleTabs,
          initialTab: initialTab,
          onClose: close,
          onEmojiSelected: onEmojiSelected,
          onGifSelected: onGifSelected,
          onStickerSelected: onStickerSelected,
          onFavoriteMemeSelected: onFavoriteMemeSelected,
          channelId: channelId,
          trackEmojiUsageOnSelect: trackEmojiUsageOnSelect,
        );
      },
    );
  }
}

class _SheetContent extends StatefulWidget {
  const _SheetContent({
    required this.scrollController,
    required this.visibleTabs,
    required this.initialTab,
    required this.onClose,
    this.onEmojiSelected,
    this.onGifSelected,
    this.onStickerSelected,
    this.onFavoriteMemeSelected,
    this.channelId,
    this.trackEmojiUsageOnSelect = true,
  });

  final ScrollController scrollController;
  final List<ExpressionPickerTab> visibleTabs;
  final ExpressionPickerTab initialTab;
  final VoidCallback onClose;
  final ValueChanged<FluxerSelectedEmoji>? onEmojiSelected;
  final ValueChanged<FluxerSelectedGif>? onGifSelected;
  final ValueChanged<StickerEntry>? onStickerSelected;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelected;
  final String? channelId;
  final bool trackEmojiUsageOnSelect;

  @override
  State<_SheetContent> createState() => _SheetContentState();
}

class _SheetContentState extends State<_SheetContent> {
  late ExpressionPickerTab _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
  }

  String _tabLabel(ExpressionPickerTab tab) => switch (tab) {
    ExpressionPickerTab.gifs => 'GIFs',
    ExpressionPickerTab.memes => 'Media',
    ExpressionPickerTab.stickers => 'Stickers',
    ExpressionPickerTab.emojis => 'Emojis',
  };

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      bottom: FluxerBottomSheet.scrollBottomPaddingOf(context),
    ),
    child: Column(
      children: [
        if (widget.visibleTabs.length > 1) _buildSegmentedTabs(context),
        const SizedBox(height: 8),
        Expanded(
          child: ExpressionPicker(
            scrollController: widget.scrollController,
            onClose: widget.onClose,
            onEmojiSelect: (name, surrogates) {
              widget.onEmojiSelected?.call(
                FluxerSelectedEmoji.fromSelection(name, surrogates),
              );
              widget.onClose();
            },
            onGifSelect: widget.onGifSelected,
            onFavoriteMemeSelect: (selection) {
              widget.onFavoriteMemeSelected?.call(selection);
              if (selection.autoSend) {
                widget.onClose();
              }
            },
            onStickerSelect: (sticker) {
              widget.onStickerSelected?.call(sticker);
              widget.onClose();
            },
            onTabChanged: (tab) => setState(() => _selectedTab = tab),
            visibleTabs: widget.visibleTabs,
            initialTab: _selectedTab,
            showTabs: false,
            channelId: widget.channelId,
            trackEmojiUsageOnSelect: widget.trackEmojiUsageOnSelect,
          ),
        ),
      ],
    ),
  );

  Widget _buildSegmentedTabs(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundTertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: widget.visibleTabs.map((tab) {
              final isActive = tab == _selectedTab;
              return Expanded(
                child: FluxerGestureDetector(
                  onTap: () => setState(() => _selectedTab = tab),
                  child: AnimatedContainer(
                    duration: context.motion.normal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? colors.backgroundSecondary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: isActive
                          ? const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.08),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : null,
                    ),
                    child: Text(
                      _tabLabel(tab),
                      textAlign: TextAlign.center,
                      style: context.textStyles.categoryName.copyWith(
                        height: 18 / 14,
                        color: isActive
                            ? colors.textPrimary
                            : colors.textSecondary,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
