import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PickerSearchInput extends StatefulWidget {
  const PickerSearchInput({
    required this.controller,
    required this.hintText,
    this.showBackButton = false,
    this.onBackButtonClick,
    this.rightCustomElement,
    this.horizontalPadding = 12,
    this.rightPadding,
    this.topPadding = 12,
    this.bottomPadding = 12,
    this.maxLength = 100,
    this.onSubmitted,
    this.focusNode,
    this.onActivated,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool showBackButton;
  final VoidCallback? onBackButtonClick;
  final Widget? rightCustomElement;
  final double horizontalPadding;
  final double? rightPadding;
  final double topPadding;
  final double bottomPadding;
  final int maxLength;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final VoidCallback? onActivated;

  @override
  State<PickerSearchInput> createState() => _PickerSearchInputState();
}

class _PickerSearchInputState extends State<PickerSearchInput> {
  FocusNode? _ownedFocusNode;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? (_ownedFocusNode = FocusNode());
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(PickerSearchInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode == widget.focusNode) {
      return;
    }
    _focusNode.removeListener(_handleFocusChange);
    _ownedFocusNode?.dispose();
    _ownedFocusNode = null;
    _focusNode = widget.focusNode ?? (_ownedFocusNode = FocusNode());
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _ownedFocusNode?.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      widget.onActivated?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final searchInputFillColor = _resolveSearchInputFillColor(context, colors);

    return Padding(
      padding: EdgeInsets.only(
        left: widget.horizontalPadding,
        right: widget.rightPadding ?? widget.horizontalPadding,
        top: widget.topPadding,
        bottom: widget.bottomPadding,
      ),
      child: Row(
        children: [
          if (widget.showBackButton && widget.onBackButtonClick != null) ...[
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: widget.onBackButtonClick,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    PhosphorIconsRegular.arrowLeft,
                    size: 20,
                    color: colors.textPrimary,
                  ),
                ),
              ),
            ),
          ],
          Expanded(
            child: ValueListenableBuilder<TextEditingValue>(
              valueListenable: widget.controller,
              builder: (context, value, _) {
                return TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onSubmitted: widget.onSubmitted,
                  maxLength: widget.maxLength,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  style: TextStyle(
                    fontSize: 16,
                    color: colors.textPrimary,
                    height: 1.2,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: colors.textTertiary,
                      fontSize: 16,
                      height: 1.2,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        PhosphorIconsRegular.magnifyingGlass,
                        size: 18,
                        color: colors.textTertiary,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 36,
                      minHeight: 36,
                    ),
                    suffixIcon: _renderRightElement(colors, value.text),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                      maxHeight: 36,
                    ),
                    filled: true,
                    fillColor: searchInputFillColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: colors.backgroundModifierAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: colors.backgroundModifierAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: colors.backgroundModifierAccentFocus,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _resolveSearchInputFillColor(
    BuildContext context,
    FluxerColorTheme colors,
  ) {
    final formSurface = Theme.of(context).brightness == Brightness.light
        ? colors.backgroundPrimary
        : colors.backgroundTertiary;
    return Color.lerp(formSurface, Colors.black, 0.15)!;
  }

  Widget? _renderRightElement(FluxerColorTheme colors, String text) {
    if (widget.rightCustomElement == null && text.isEmpty) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.rightCustomElement != null) ...[
            widget.rightCustomElement!,
            if (text.isNotEmpty) const SizedBox(width: 6),
          ],
          if (text.isNotEmpty)
            GestureDetector(
              onTap: widget.controller.clear,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  PhosphorIconsBold.x,
                  size: 18,
                  color: colors.textPrimaryMuted,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
