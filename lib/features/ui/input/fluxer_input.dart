import 'dart:math' as math;
import 'dart:ui' show BoxWidthStyle;

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/character_counter/fluxer_character_counter.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/widgets/auto_text_direction_builder.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

typedef _DesktopThemeEntry = ({
  FluxerColorTheme colors,
  FluxerTextTheme textStyles,
  Color? fillColor,
  ThemeData data,
});

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
    this.action,
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
    this.desktopFillColor,
    super.key,
  }) : assert(
         action == null || trailing == null,
         'action and trailing cannot be combined',
       );

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
    this.desktopFillColor,
    super.key,
  }) : action = null;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final String? suffixSemanticLabel;

  final Widget? trailing;

  final Widget? action;

  final bool obscureText;
  final bool enabled;
  final bool autofocus;

  final bool readOnly;
  final int? maxLength;
  final bool showCounter;
  final ValueGetter<int>? counterLength;

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
  final Color? desktopFillColor;

  static const double _multilineSuffixExtent = 20;

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
    if (!usesDesktopPointerUi(context)) {
      return _buildContent(context);
    }
    return Theme(
      data: _desktopTheme(context, fillColor: desktopFillColor),
      child: Builder(builder: _buildContent),
    );
  }

  static TextStyle _desktopTextStyle(BuildContext context) =>
      context.textStyles.inputText.copyWith(
        fontSize: 14,
        height: 20 / 14,
        color: context.colors.textPrimary,
      );

  static TextStyle _baseTextStyle(BuildContext context) =>
      usesDesktopPointerUi(context)
      ? _desktopTextStyle(context)
      : context.textStyles.inputText;

  static final Expando<_DesktopThemeEntry> _desktopThemeCache =
      Expando<_DesktopThemeEntry>();

  static ThemeData _desktopTheme(BuildContext context, {Color? fillColor}) {
    final ThemeData theme = Theme.of(context);
    final FluxerColorTheme colors = context.colors;
    final FluxerTextTheme textStyles = context.textStyles;
    final _DesktopThemeEntry? cached = _desktopThemeCache[theme];
    if (cached != null &&
        identical(cached.colors, colors) &&
        identical(cached.textStyles, textStyles) &&
        cached.fillColor == fillColor) {
      return cached.data;
    }
    final ThemeData data = _buildDesktopTheme(
      context,
      theme: theme,
      fillColor: fillColor,
    );
    _desktopThemeCache[theme] = (
      colors: colors,
      textStyles: textStyles,
      fillColor: fillColor,
      data: data,
    );
    return data;
  }

  static ThemeData _buildDesktopTheme(
    BuildContext context, {
    required ThemeData theme,
    required Color? fillColor,
  }) {
    final colors = context.colors;
    final TextStyle textStyle = _desktopTextStyle(context);
    final InputDecorationThemeData decoration = theme.inputDecorationTheme;
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(bodyLarge: textStyle),
      inputDecorationTheme: decoration.copyWith(
        fillColor: fillColor ?? fluxerFormSurfaceBackground(context),
        isDense: true,
        constraints: const BoxConstraints(minHeight: 44),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 11,
        ),
        hintStyle: textStyle.copyWith(color: colors.textTertiary),
        errorStyle: textStyle.copyWith(
          color: fluxerCssColorMix(
            colors.statusDanger,
            colors.textPrimary,
            0.78,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: context.layout.radiusLg,
          borderSide: BorderSide(color: colors.backgroundModifierAccentFocus),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
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

  Widget _accessibleField({required Widget field}) {
    final String? name = label;
    if (name == null || name.isEmpty) {
      return field;
    }
    return Semantics(label: name, textField: true, child: field);
  }

  Widget _visualLabel(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    if (usesDesktopPointerUi(context)) {
      return ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            label!,
            style: textStyles.label.copyWith(
              color: colors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 20 / 14,
            ),
          ),
        ),
      );
    }
    return ExcludeSemantics(
      child: Padding(
        padding: EdgeInsets.only(bottom: layout.s1_5),
        child: Text(
          label!,
          style: textStyles.label.copyWith(
            color: colors.textSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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

    final Widget field = _accessibleField(
      field: wrapBoundedTextClip(
        maxLines: maxLines,
        child: AutoTextDirectionBuilder(
          controller: controller,
          builder: (BuildContext context, TextDirection? direction) =>
              TextFormField(
                textDirection: direction,
                controller: controller,
                focusNode: focusNode,
                textInputAction: textInputAction,
                style: style,
                strutStyle: shouldApplyBoundedTextMetrics(maxLines: maxLines)
                    ? boundedStrutFor(_baseTextStyle(context).merge(style))
                    : null,
                decoration: InputDecoration(
                  hintText: hint,
                  errorText: errorText,
                  errorMaxLines: 4,
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
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) _visualLabel(context),
        if (action == null)
          field
        else
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: field),
                SizedBox(width: layout.s2),
                AspectRatio(aspectRatio: 1, child: action),
              ],
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
        if (label != null) _visualLabel(context),
        DecoratedBox(
          decoration: BoxDecoration(
            color: usesDesktopPointerUi(context)
                ? fluxerFormSurfaceBackground(context)
                : colors.backgroundTertiary,
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
                    child: _accessibleField(
                      field: wrapBoundedTextClip(
                        maxLines: maxLines,
                        child: AutoTextDirectionBuilder(
                          controller: controller,
                          builder:
                              (
                                BuildContext context,
                                TextDirection? direction,
                              ) => TextFormField(
                                textDirection: direction,
                                controller: controller,
                                focusNode: focusNode,
                                textInputAction: textInputAction,
                                style: style,
                                strutStyle:
                                    shouldApplyBoundedTextMetrics(
                                      maxLines: maxLines,
                                    )
                                    ? boundedStrutFor(
                                        _baseTextStyle(context).merge(style),
                                      )
                                    : null,
                                decoration: InputDecoration(
                                  hintText: hint,
                                  errorText: errorText,
                                  errorMaxLines: 4,
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
                                    textCapitalization ??
                                    TextCapitalization.none,
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
    final EdgeInsets themePadding =
        (Theme.of(context).inputDecorationTheme.contentPadding ??
                EdgeInsets.zero)
            .resolve(Directionality.of(context));
    final double suffixInset = layout.s2 + _multilineSuffixExtent + layout.s2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) _visualLabel(context),
        Stack(
          children: [
            _accessibleField(
              field: wrapBoundedTextClip(
                maxLines: maxLines,
                child: AutoTextDirectionBuilder(
                  controller: controller,
                  builder: (BuildContext context, TextDirection? direction) =>
                      TextFormField(
                        textDirection: direction,
                        controller: controller,
                        focusNode: focusNode,
                        textInputAction: textInputAction,
                        style: style,
                        strutStyle:
                            shouldApplyBoundedTextMetrics(maxLines: maxLines)
                            ? boundedStrutFor(
                                _baseTextStyle(context).merge(style),
                              )
                            : null,
                        decoration: InputDecoration(
                          hintText: hint,
                          errorText: errorText,
                          errorMaxLines: 4,
                          prefixIcon: prefixIcon,
                          counterText: maxLength != null ? '' : null,
                          contentPadding: suffix == null
                              ? null
                              : Directionality.of(context) == TextDirection.rtl
                              ? themePadding.copyWith(
                                  left: math.max(
                                    themePadding.left,
                                    suffixInset,
                                  ),
                                )
                              : themePadding.copyWith(
                                  right: math.max(
                                    themePadding.right,
                                    suffixInset,
                                  ),
                                ),
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
            ),
            if (suffix != null)
              PositionedDirectional(
                top: layout.s2,
                end: layout.s2,
                child: SizedBox.square(
                  dimension: _multilineSuffixExtent,
                  child: suffix,
                ),
              ),
            if (showCounter && (counterMax != null || maxLength != null))
              PositionedDirectional(
                bottom: layout.s2,
                end: layout.s2,
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
