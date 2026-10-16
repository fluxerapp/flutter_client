import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/zoom/fluxer_app_zoom.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_segmented_tabs.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration kReactionPickerRiseDuration = Duration(milliseconds: 400);
const double kReactionPickerRiseStartFraction = 0.558;
const Curve kReactionPickerRiseSpring = FluxerSpringCurve(
  stiffness: 870,
  damping: 38.4,
  duration: kReactionPickerRiseDuration,
);

class ReactionPickerRiseCurve extends Curve {
  const ReactionPickerRiseCurve({required this.start});

  final double start;

  @override
  double transformInternal(double t) =>
      start + (1 - start) * kReactionPickerRiseSpring.transform(t);
}

double reactionPickerSheetHeight(BuildContext context) {
  final MediaQueryData view = FluxerAppZoom.mediaQueryOfView(context);
  return view.size.height - view.viewPadding.top - kExpressionSheetTopInset;
}

AnimationStyle? reactionPickerAnimationStyle(
  BuildContext context, {
  required double sheetHeight,
}) {
  if (context.motion.sheet <= Duration.zero || sheetHeight <= 0) {
    return null;
  }
  final double screenHeight = MediaQuery.sizeOf(context).height;
  return AnimationStyle(
    duration: kReactionPickerRiseDuration,
    curve: ReactionPickerRiseCurve(
      start: (kReactionPickerRiseStartFraction * screenHeight / sheetHeight)
          .clamp(0.0, 1.0),
    ),
    reverseDuration: kFluxerSheetCloseDuration,
    reverseCurve: Curves.linear,
  );
}

class FluxerEmojiPickerSheet {
  FluxerEmojiPickerSheet._();

  static Future<void> show(
    BuildContext context, {
    ValueChanged<FluxerSelectedEmoji>? onEmojiSelected,
    ValueChanged<FluxerSelectedGif>? onGifSelected,
    ValueChanged<StickerEntry>? onStickerSelected,
    ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelected,
    String? title,
    Widget? subtitle,
    List<ExpressionPickerTab> visibleTabs = const [
      ExpressionPickerTab.gifs,
      ExpressionPickerTab.memes,
      ExpressionPickerTab.stickers,
      ExpressionPickerTab.emojis,
    ],
    ExpressionPickerTab initialTab = ExpressionPickerTab.emojis,
    String? channelId,
  }) {
    final bool emojiOnly =
        visibleTabs.length == 1 &&
        visibleTabs.first == ExpressionPickerTab.emojis;
    final bool searchFollowsHandle =
        visibleTabs.length == 1 && title == null && subtitle == null;
    final double? sheetHeight = emojiOnly
        ? reactionPickerSheetHeight(context)
        : null;
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: title,
      subtitle: subtitle,
      sheetHeight: sheetHeight,
      animationStyle: sheetHeight == null
          ? null
          : reactionPickerAnimationStyle(context, sheetHeight: sheetHeight),
      builder: (context, scrollController, close) {
        return _SheetContent(
          scrollController: scrollController,
          visibleTabs: visibleTabs,
          initialTab: initialTab,
          searchFollowsHandle: searchFollowsHandle,
          onClose: close,
          onEmojiSelected: onEmojiSelected,
          onGifSelected: onGifSelected,
          onStickerSelected: onStickerSelected,
          onFavoriteMemeSelected: onFavoriteMemeSelected,
          channelId: channelId,
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
    required this.searchFollowsHandle,
    required this.onClose,
    this.onEmojiSelected,
    this.onGifSelected,
    this.onStickerSelected,
    this.onFavoriteMemeSelected,
    this.channelId,
  });

  final ScrollController scrollController;
  final List<ExpressionPickerTab> visibleTabs;
  final ExpressionPickerTab initialTab;
  final bool searchFollowsHandle;
  final VoidCallback onClose;
  final ValueChanged<FluxerSelectedEmoji>? onEmojiSelected;
  final ValueChanged<FluxerSelectedGif>? onGifSelected;
  final ValueChanged<StickerEntry>? onStickerSelected;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelected;
  final String? channelId;

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

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      bottom: FluxerBottomSheet.scrollBottomPaddingOf(context),
    ),
    child: Column(
      children: [
        if (widget.visibleTabs.length > 1) _buildSegmentedTabs(context),
        if (!widget.searchFollowsHandle) const SizedBox(height: 8),
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
            contentSearchTopPadding: widget.searchFollowsHandle ? 0 : null,
          ),
        ),
      ],
    ),
  );

  Widget _buildSegmentedTabs(BuildContext context) {
    return ExpressionSegmentedTabs(
      tabs: widget.visibleTabs,
      selected: _selectedTab,
      labelOf: (ExpressionPickerTab tab) =>
          expressionTabLabel(tab, FluxerLocalizations.of(context)),
      onSelected: (ExpressionPickerTab tab) =>
          setState(() => _selectedTab = tab),
    );
  }
}
