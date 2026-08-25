import 'dart:ui' show BoxWidthStyle;

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/character_counter/fluxer_character_counter.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class FluxerInput extends StatelessWidget {
  const FluxerInput({
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.suffixSemanticLabel,
    this.trailing,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.readOnly = false,
    this.maxLength,
    this.showCounter = false,
    this.counterLength,
    this.counterMax,
    this.helperText,
    this.onChanged,
    this.onSubmitted,
    this.onTapOutside,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.inputFormatters,
    this.style,
    this.maxLines = 1,
    this.minLines,
    this.textCapitalization,
    this.autocorrect = true,
    this.enableSuggestions = true,
    super.key,
  });

  const FluxerInput.multiline({
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.suffixSemanticLabel,
    this.trailing,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.readOnly = false,
    this.maxLength,
    this.showCounter = false,
    this.counterLength,
    this.counterMax,
    this.helperText,
    this.onChanged,
    this.onSubmitted,
    this.onTapOutside,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.inputFormatters,
    this.style,
    this.maxLines,
    this.minLines = 3,
    this.textCapitalization,
    this.autocorrect = true,
    this.enableSuggestions = true,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final String? suffixSemanticLabel;

  /// Widget placed to the right of the text field inside the same border,
  /// separated by a vertical divider (e.g. a color swatch).
  final Widget? trailing;

  final bool obscureText;
  final bool enabled;
  final bool autofocus;

  /// When true, the field displays text but cannot be edited.
  final bool readOnly;
  final int? maxLength;
  final bool showCounter;
  final ValueGetter<int>? counterLength;

  /// When set, the character counter uses this as its max instead of
  /// [maxLength]. Useful when [maxLength] is an adjusted display-text
  /// limit but the counter should reflect the true API limit.
  final int? counterMax;

  final String? helperText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TapRegionCallback? onTapOutside;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;
  final TextCapitalization? textCapitalization;
  final bool autocorrect;
  final bool enableSuggestions;

  bool get _isMultiline => minLines != null && minLines! > 1;

  bool get _usesClipboardScope => controller != null && !readOnly;

  bool get _usesTightSelectionWidth {
    if (maxLines == null) {
      return true;
    }
    if (maxLines! > 1) {
      return true;
    }
    if (minLines != null && minLines! > 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (!_usesClipboardScope) {
      return _buildField(
        context,
        focusNode: focusNode,
        contextMenuBuilder: _defaultContextMenuBuilder,
      );
    }
    return FluxerClipboardScope(
      controller: controller!,
      focusNode: focusNode,
      builder:
          (
            BuildContext context,
            FluxerClipboardScopeState clipboardScope,
            FocusNode effectiveFocusNode,
          ) {
            return _buildField(
              context,
              focusNode: effectiveFocusNode,
              contextMenuBuilder: clipboardScope.buildContextMenu,
            );
          },
    );
  }

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    if (SystemContextMenu.isSupportedByField(editableTextState)) {
      return SystemContextMenu.editableText(
        editableTextState: editableTextState,
      );
    }
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  Widget _buildField(
    BuildContext context, {
    required FocusNode? focusNode,
    required EditableTextContextMenuBuilder contextMenuBuilder,
  }) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final Widget? effectiveSuffix = suffixIcon != null && onSuffixTap != null
        ? Semantics(
            button: true,
            label: suffixSemanticLabel,
            child: FluxerGestureDetector(onTap: onSuffixTap, child: suffixIcon),
          )
        : suffixIcon;

    if (_isMultiline) {
      return _buildMultiline(
        context,
        suffix: effectiveSuffix,
        focusNode: focusNode,
        contextMenuBuilder: contextMenuBuilder,
      );
    }

    if (trailing != null) {
      return _buildWithTrailing(
        context,
        suffix: effectiveSuffix,
        focusNode: focusNode,
        contextMenuBuilder: contextMenuBuilder,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: layout.s1_5),
            child: Text(
              label!,
              style: textStyles.label.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        wrapBoundedTextClip(
          maxLines: maxLines,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            textInputAction: textInputAction,
            style: style,
            strutStyle: shouldApplyBoundedTextMetrics(maxLines: maxLines)
                ? boundedStrutFor(textStyles.inputText.merge(style))
                : null,
            decoration: InputDecoration(
              hintText: hint,
              errorText: errorText,
              prefixIcon: prefixIcon,
              suffixIcon: effectiveSuffix,
              counterText: maxLength != null ? '' : null,
            ),
            obscureText: obscureText,
            autofillHints: autofillHints,
            enabled: enabled,
            autofocus: autofocus,
            readOnly: readOnly,
            maxLength: maxLength,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            onTapOutside: onTapOutside,
            validator: validator,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            autocorrect: autocorrect,
            enableSuggestions: enableSuggestions,
            inputFormatters: inputFormatters,
            contextMenuBuilder: contextMenuBuilder,
            maxLines: maxLines,
            minLines: minLines,
            selectionWidthStyle: _usesTightSelectionWidth
                ? BoxWidthStyle.tight
                : null,
          ),
        ),
        if (helperText != null)
          Padding(
            padding: EdgeInsets.only(top: layout.s1),
            child: Text(
              helperText!,
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ),
      ],
    );
  }

  Widget _buildWithTrailing(
    BuildContext context, {
    required Widget? suffix,
    required FocusNode? focusNode,
    required EditableTextContextMenuBuilder contextMenuBuilder,
  }) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: layout.s1_5),
            child: Text(
              label!,
              style: textStyles.label.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundTertiary,
            borderRadius: layout.radiusLg,
            border: Border.all(color: colors.backgroundModifierAccent),
          ),
          child: ClipRRect(
            borderRadius: layout.radiusLg,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: wrapBoundedTextClip(
                      maxLines: maxLines,
                      child: TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        textInputAction: textInputAction,
                        style: style,
                        strutStyle:
                            shouldApplyBoundedTextMetrics(maxLines: maxLines)
                            ? boundedStrutFor(textStyles.inputText.merge(style))
                            : null,
                        decoration: InputDecoration(
                          hintText: hint,
                          errorText: errorText,
                          prefixIcon: prefixIcon,
                          suffixIcon: suffix,
                          counterText: maxLength != null ? '' : null,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          filled: false,
                        ),
                        obscureText: obscureText,
                        autofillHints: autofillHints,
                        enabled: enabled,
                        autofocus: autofocus,
                        readOnly: readOnly,
                        maxLength: maxLength,
                        onChanged: onChanged,
                        onFieldSubmitted: onSubmitted,
                        onTapOutside: onTapOutside,
                        validator: validator,
                        keyboardType: keyboardType,
                        textCapitalization:
                            textCapitalization ?? TextCapitalization.none,
                        autocorrect: autocorrect,
                        enableSuggestions: enableSuggestions,
                        inputFormatters: inputFormatters,
                        contextMenuBuilder: contextMenuBuilder,
                        maxLines: maxLines,
                        minLines: minLines,
                        selectionWidthStyle: _usesTightSelectionWidth
                            ? BoxWidthStyle.tight
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1,
                    child: ColoredBox(color: colors.backgroundModifierAccent),
                  ),
                  trailing!,
                ],
              ),
            ),
          ),
        ),
        if (helperText != null)
          Padding(
            padding: EdgeInsets.only(top: layout.s1),
            child: Text(
              helperText!,
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ),
      ],
    );
  }

  Widget _buildMultiline(
    BuildContext context, {
    required Widget? suffix,
    required FocusNode? focusNode,
    required EditableTextContextMenuBuilder contextMenuBuilder,
  }) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: layout.s1_5),
            child: Text(
              label!,
              style: textStyles.label.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Stack(
          children: [
            wrapBoundedTextClip(
              maxLines: maxLines,
              child: TextFormField(
                controller: controller,
                focusNode: focusNode,
                textInputAction: textInputAction,
                style: style,
                strutStyle: shouldApplyBoundedTextMetrics(maxLines: maxLines)
                    ? boundedStrutFor(textStyles.inputText.merge(style))
                    : null,
                decoration: InputDecoration(
                  hintText: hint,
                  errorText: errorText,
                  prefixIcon: prefixIcon,
                  counterText: maxLength != null ? '' : null,
                ),
                obscureText: obscureText,
                autofillHints: autofillHints,
                enabled: enabled,
                autofocus: autofocus,
                readOnly: readOnly,
                maxLength: maxLength,
                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,
                onTapOutside: onTapOutside,
                validator: validator,
                keyboardType: keyboardType,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                autocorrect: autocorrect,
                enableSuggestions: enableSuggestions,
                inputFormatters: inputFormatters,
                contextMenuBuilder: contextMenuBuilder,
                maxLines: maxLines,
                minLines: minLines,
                selectionWidthStyle: _usesTightSelectionWidth
                    ? BoxWidthStyle.tight
                    : null,
              ),
            ),
            if (suffix != null)
              Positioned(top: layout.s2, right: layout.s2, child: suffix),
            if (showCounter && (counterMax != null || maxLength != null))
              Positioned(
                bottom: layout.s2,
                right: layout.s2,
                child: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: controller ?? TextEditingController(),
                  builder: (context, value, _) => FluxerCharacterCounter(
                    current: counterLength?.call() ?? value.text.length,
                    max: counterMax ?? maxLength!,
                  ),
                ),
              ),
          ],
        ),
        if (helperText != null)
          Padding(
            padding: EdgeInsets.only(top: layout.s1),
            child: Text(
              helperText!,
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ),
      ],
    );
  }
}

@FluxerWidgetPreview(name: 'Single line', group: 'FluxerInput')
Widget fluxerInputSinglePreview() {
  return const FluxerInput(label: 'Display name', hint: 'How others see you');
}

@FluxerWidgetPreview(name: 'Multiline', group: 'FluxerInput')
Widget fluxerInputMultilinePreview() {
  return const FluxerInput.multiline(
    label: 'Bio',
    hint: 'Tell everyone about yourself',
  );
}

@FluxerWidgetPreview(name: 'With error', group: 'FluxerInput')
Widget fluxerInputErrorPreview() {
  return const FluxerInput(
    label: 'Email',
    hint: 'you@example.com',
    errorText: 'Enter a valid email address.',
  );
}
