import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PickerSearchInput extends StatelessWidget {
  const PickerSearchInput({
    required this.controller,
    required this.hintText,
    this.showBackButton = false,
    this.onBackButtonClick,
    this.rightCustomElement,
    this.horizontalPadding = 12,
    this.maxLength = 100,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool showBackButton;
  final VoidCallback? onBackButtonClick;
  final Widget? rightCustomElement;
  final double horizontalPadding;
  final int maxLength;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final searchInputFillColor = _resolveSearchInputFillColor(context, colors);

    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        top: 12,
        bottom: 12,
      ),
      child: Row(
        children: [
          if (showBackButton && onBackButtonClick != null) ...[
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onBackButtonClick,
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
              valueListenable: controller,
              builder: (context, value, _) {
                return TextField(
                  controller: controller,
                  onSubmitted: onSubmitted,
                  maxLength: maxLength,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  style: TextStyle(
                    fontSize: 16,
                    color: colors.textPrimary,
                    height: 1.2,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: colors.textTertiary,
                      fontSize: 16,
                      height: 1.2,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 0),
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
                    suffixIcon: _renderRightElement(colors),
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
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: colors.backgroundModifierAccent,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: colors.backgroundModifierAccentFocus,
                        width: 1,
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

  Color _resolveSearchInputFillColor(BuildContext context, FluxerColorTheme colors) {
    final formSurface = Theme.of(context).brightness == Brightness.light
        ? colors.backgroundPrimary
        : colors.backgroundTertiary;
    return Color.lerp(formSurface, Colors.black, 0.15)!;
  }

  Widget? _renderRightElement(FluxerColorTheme colors) {
    if (rightCustomElement == null && controller.text.isEmpty) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (rightCustomElement != null) ...[
            rightCustomElement!,
            if (controller.text.isNotEmpty) const SizedBox(width: 6),
          ],
          if (controller.text.isNotEmpty)
            GestureDetector(
              onTap: controller.clear,
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
