import 'dart:async';
import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

enum FluxerSettingsSelectWidth {
  small(minWidth: 128, maxWidth: 192),
  medium(minWidth: 176, maxWidth: 288),
  large(minWidth: 224, maxWidth: 352),
  wide(minWidth: 288, maxWidth: 448);

  const FluxerSettingsSelectWidth({
    required this.minWidth,
    required this.maxWidth,
  });

  final double minWidth;
  final double maxWidth;
}

class FluxerSettingsCompactSelectRow<T> extends StatelessWidget {
  const FluxerSettingsCompactSelectRow({
    required this.label,
    required this.value,
    required this.items,
    required this._onChanged,
    this.description,
    this.controlWidth = FluxerSettingsSelectWidth.medium,
    this.enabled = true,
    super.key,
  });

  final String label;
  final String? description;
  final T value;
  final List<FluxerSelectItem<T>> items;
  final FluxerSettingsSelectWidth controlWidth;
  final bool enabled;

  // The generic callback keeps select values strongly typed for callers.
  // ignore: unsafe_variance
  final ValueChanged<T> _onChanged;

  static const double _kRowMinHeight = 44;
  static const double _kRowGap = 16;
  static const double _kControlChrome = 64;
  static const double _kCharacterFontSize = 16;
  static const double _kDisabledOpacity = 0.55;

  String? get _selectedLabel {
    for (final FluxerSelectItem<T> item in items) {
      if (item.value == value) {
        return item.label;
      }
    }
    return null;
  }

  double _controlWidth(BuildContext context, double available) {
    final TextPainter character = TextPainter(
      text: TextSpan(
        text: '0',
        style: context.textStyles.bodySmall.copyWith(
          fontSize: _kCharacterFontSize,
        ),
      ),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();
    final double content =
        character.width * (_selectedLabel ?? label).length + _kControlChrome;
    character.dispose();
    final double clamped = content.clamp(
      controlWidth.minWidth,
      controlWidth.maxWidth,
    );
    return math.min(available, clamped);
  }

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return _buildMobile(context);
    }
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final TextStyle labelStyle = textStyles.bodySmall.copyWith(
      color: colors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
    );
    final TextStyle descriptionStyle = textStyles.bodySmall.copyWith(
      color: colors.textPrimaryMuted,
      fontSize: 13,
      height: 20 / 13,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s1),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: _kRowMinHeight),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                    opacity: enabled ? 1 : _kDisabledOpacity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: layout.s1,
                      children: <Widget>[
                        Text(
                          label,
                          style: labelStyle,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (description case final String text)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              end: _kRowGap,
                            ),
                            child: Text(text, style: descriptionStyle),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: _kRowGap),
                SizedBox(
                  width: _controlWidth(context, constraints.maxWidth),
                  child: FluxerSelect<T>(
                    hint: label,
                    sheetTitle: label,
                    value: value,
                    items: items,
                    enabled: enabled,
                    enableSearch: false,
                    stretch: true,
                    density: FluxerSelectDensity.compact,
                    onChanged: _onChanged,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final String? selected = _selectedLabel;
    return FluxerMenuGroup.ensureGrouped(
      context,
      FluxerBottomSheetMenuItem(
        label: label,
        hint: description,
        enabled: enabled,
        onTap: () => unawaited(
          showFluxerSelectOptions<T>(
            context,
            title: label,
            items: items,
            value: value,
            onChanged: _onChanged,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: layout.s1,
          children: <Widget>[
            if (selected != null)
              Text(
                selected,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            PhosphorIcon(
              PhosphorIconsBold.caretRight,
              size: 16,
              color: colors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerSettingsCompactSelectRow')
Widget fluxerSettingsCompactSelectRowPreview() {
  return FluxerSettingsCompactSelectRow<int>(
    label: 'Frame rate',
    value: 30,
    controlWidth: FluxerSettingsSelectWidth.small,
    items: const <FluxerSelectItem<int>>[
      FluxerSelectItem<int>(value: 15, label: '15 FPS'),
      FluxerSelectItem<int>(value: 30, label: '30 FPS'),
      FluxerSelectItem<int>(value: 60, label: '60 FPS', enabled: false),
    ],
    onChanged: (_) {},
  );
}
