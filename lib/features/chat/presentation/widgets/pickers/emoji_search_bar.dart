import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_utils.dart'
    show kSkinToneSurrogates;

export 'package:fluxer_app/shared/utils/emoji_utils.dart'
    show kSkinToneSurrogates, skinToneToName;

const _kClapEmoji = '\u{1F44F}';

class EmojiSearchBar extends StatelessWidget {
  const EmojiSearchBar({
    required this.controller,
    required this.skinTone,
    required this.onSkinToneChanged,
    this.hoveredEmojiName,
    this.horizontalPadding = 12.0,
    this.focusNode,
    this.onActivated,
    super.key,
  });

  final TextEditingController controller;
  final String? hoveredEmojiName;
  final String skinTone;
  final ValueChanged<String> onSkinToneChanged;
  final VoidCallback? onActivated;
  final FocusNode? focusNode;

  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final hintText = hoveredEmojiName != null
        ? ':$hoveredEmojiName:'
        : FluxerLocalizations.of(context).emojiSearchPlaceholder;

    return Padding(
      padding: EdgeInsets.only(right: horizontalPadding),
      child: Row(
        children: [
          Expanded(
            child: PickerSearchInput(
              controller: controller,
              hintText: hintText,
              horizontalPadding: horizontalPadding,
              rightPadding: 0,
              topPadding: 8,
              bottomPadding: 4,
              focusNode: focusNode,
              onActivated: onActivated,
            ),
          ),
          const SizedBox(width: 8),
          _SkinToneButton(
            skinTone: skinTone,
            onSkinToneChanged: onSkinToneChanged,
          ),
        ],
      ),
    );
  }
}

class _SkinToneButton extends StatefulWidget {
  const _SkinToneButton({
    required this.skinTone,
    required this.onSkinToneChanged,
  });

  final String skinTone;
  final ValueChanged<String> onSkinToneChanged;

  @override
  State<_SkinToneButton> createState() => _SkinToneButtonState();
}

class _SkinToneButtonState extends State<_SkinToneButton> {
  final _overlayController = OverlayPortalController();
  final _layerLink = LayerLink();

  void _toggle() {
    if (_overlayController.isShowing) {
      _overlayController.hide();
    } else {
      _overlayController.show();
    }
  }

  void _select(String tone) {
    widget.onSkinToneChanged(tone);
    _overlayController.hide();
  }

  String get _previewEmoji => _kClapEmoji + widget.skinTone;

  Widget _buildOverlay(BuildContext context) {
    final colors = context.colors;
    final tones = [
      widget.skinTone,
      ...['', ...kSkinToneSurrogates].where((t) => t != widget.skinTone),
    ];

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: _overlayController.hide,
            behavior: HitTestBehavior.opaque,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: Alignment.bottomCenter,
          followerAnchor: Alignment.topCenter,
          offset: const Offset(0, 4),
          child: Material(
            color: colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(4),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: tones.map((tone) {
                  final emoji = _kClapEmoji + tone;
                  return GestureDetector(
                    onTap: () => _select(tone),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(emoji, style: const TextStyle(fontSize: 24)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: _layerLink,
    child: OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: GestureDetector(
        onTap: _toggle,
        child: SizedBox(
          width: 28,
          height: 28,
          child: Center(
            child: Text(
              _previewEmoji,
              style: const TextStyle(fontSize: 26, height: 1),
            ),
          ),
        ),
      ),
    ),
  );
}
