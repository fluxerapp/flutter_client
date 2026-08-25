import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/pickers/sticker_picker_provider.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerEmojiPickerPopout extends StatefulWidget {
  const FluxerEmojiPickerPopout({
    required this.child,
    this.onClose,
    this.onEmojiSelected,
    this.onGifSelected,
    this.onStickerSelected,
    this.onFavoriteMemeSelected,
    this.closeOnEmojiSelect = false,
    this.visibleTabs = const [
      ExpressionPickerTab.gifs,
      ExpressionPickerTab.memes,
      ExpressionPickerTab.stickers,
      ExpressionPickerTab.emojis,
    ],
    this.initialTab = ExpressionPickerTab.emojis,
    this.channelId,
    this.trackEmojiUsageOnSelect = true,
    super.key,
  });

  final Widget child;
  final VoidCallback? onClose;
  final ValueChanged<FluxerSelectedEmoji>? onEmojiSelected;
  final ValueChanged<FluxerSelectedGif>? onGifSelected;
  final ValueChanged<StickerEntry>? onStickerSelected;
  final ValueChanged<FavoriteMemeSelection>? onFavoriteMemeSelected;
  final bool closeOnEmojiSelect;
  final List<ExpressionPickerTab> visibleTabs;
  final ExpressionPickerTab initialTab;
  final String? channelId;
  final bool trackEmojiUsageOnSelect;

  @override
  State<FluxerEmojiPickerPopout> createState() =>
      FluxerEmojiPickerPopoutState();
}

class FluxerEmojiPickerPopoutState extends State<FluxerEmojiPickerPopout>
    with SingleTickerProviderStateMixin {
  static const _kWidth = 498.0;
  static const _kHeight = 498.0;

  final _layerLink = LayerLink();
  final _overlayController = OverlayPortalController();
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.normalDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.duration = context.motion.normal;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get isOpen => _overlayController.isShowing;

  bool _openUpward = true;

  void toggle() {
    if (_overlayController.isShowing) {
      close();
    } else {
      _computeDirection();
      _overlayController.show();
      _animationController.forward();
    }
  }

  void _computeDirection() {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) {
      _openUpward = true;
      return;
    }
    final screenHeight = MediaQuery.sizeOf(context).height;
    final anchorBottom = renderBox
        .localToGlobal(Offset(0, renderBox.size.height))
        .dy;
    final spaceBelow = screenHeight - anchorBottom;
    _openUpward = spaceBelow < _kHeight + 8;
  }

  void close() {
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && _overlayController.isShowing) {
          _overlayController.hide();
        }
        widget.onClose?.call();
      }),
    );
  }

  void _handleEmojiSelect(String name, String surrogates) {
    widget.onEmojiSelected?.call(
      FluxerSelectedEmoji.fromSelection(name, surrogates),
    );
    if (widget.closeOnEmojiSelect) {
      close();
    }
  }

  Widget _buildOverlay(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Stack(
      children: [
        Positioned.fill(
          child: FluxerGestureDetector(
            onTap: close,
            behavior: HitTestBehavior.opaque,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: CompositedTransformFollower(
            link: _layerLink,
            targetAnchor: _openUpward
                ? Alignment.topRight
                : Alignment.bottomRight,
            followerAnchor: _openUpward
                ? Alignment.bottomRight
                : Alignment.topRight,
            offset: Offset(0, _openUpward ? -4 : 4),
            child: Align(
              alignment: _openUpward
                  ? Alignment.bottomRight
                  : Alignment.topRight,
              child: SizedBox(
                width: _kWidth,
                height: _kHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.backgroundTertiary,
                    borderRadius: layout.radiusXl,
                    border: Border.all(color: colors.backgroundModifierAccent),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: layout.radiusXl,
                    child: ExpressionPicker(
                      onClose: close,
                      onEmojiSelect: _handleEmojiSelect,
                      onGifSelect: widget.onGifSelected,
                      onStickerSelect: widget.onStickerSelected,
                      onFavoriteMemeSelect: widget.onFavoriteMemeSelected,
                      visibleTabs: widget.visibleTabs,
                      initialTab: widget.initialTab,
                      channelId: widget.channelId,
                      trackEmojiUsageOnSelect: widget.trackEmojiUsageOnSelect,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => OverlayPortal(
    controller: _overlayController,
    overlayChildBuilder: _buildOverlay,
    child: CompositedTransformTarget(link: _layerLink, child: widget.child),
  );
}
