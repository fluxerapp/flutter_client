import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kVoiceParticipantContextMenuWidth = 260;

class VoiceParticipantContextMenuCheckboxItem extends StatefulWidget {
  const VoiceParticipantContextMenuCheckboxItem({
    required this.label,
    required this.isChecked,
    required this.onTap,
    this.icon,
    super.key,
  });

  final String label;
  final bool isChecked;
  final VoidCallback onTap;
  final PhosphorIconData? icon;

  @override
  State<VoiceParticipantContextMenuCheckboxItem> createState() =>
      _VoiceParticipantContextMenuCheckboxItemState();
}

class _VoiceParticipantContextMenuCheckboxItemState
    extends State<VoiceParticipantContextMenuCheckboxItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final Color textColor = _isHovered
        ? colors.textPrimary
        : colors.textSecondary;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 36),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
          margin: const EdgeInsets.symmetric(vertical: 1),
          decoration: BoxDecoration(
            color: _isHovered
                ? colors.backgroundModifierHover
                : Colors.transparent,
            borderRadius: layout.radiusSm,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: context.textStyles.label.copyWith(color: textColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (widget.icon != null) ...[
                SizedBox(width: layout.s3),
                PhosphorIcon(widget.icon!, size: layout.s5, color: textColor),
              ],
              SizedBox(width: layout.s2),
              _MenuCheckbox(isChecked: widget.isChecked),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuCheckbox extends StatelessWidget {
  const _MenuCheckbox({required this.isChecked});

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        border: Border.all(
          color: isChecked
              ? colors.brandPrimary
              : colors.backgroundHeaderSecondary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(3),
        color: isChecked ? colors.brandPrimary : Colors.transparent,
      ),
      child: isChecked
          ? Center(
              child: PhosphorIcon(
                PhosphorIconsBold.check,
                size: 11,
                color: colors.textOnBrandPrimary,
              ),
            )
          : null,
    );
  }
}

class VoiceParticipantContextMenuVolumeItem extends StatelessWidget {
  const VoiceParticipantContextMenuVolumeItem({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: layout.s2),
      child: VoiceParticipantVolumeSlider(
        label: label,
        value: value,
        onChanged: onChanged,
        mini: true,
        labelStyle: context.textStyles.label.copyWith(
          color: context.colors.textSecondary,
        ),
        valueStyle: context.textStyles.label.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}

class VoiceParticipantBottomSheetVolumeItem extends StatelessWidget {
  const VoiceParticipantBottomSheetVolumeItem({
    required this.label,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: VoiceParticipantVolumeSlider(
        label: label,
        value: value,
        onChanged: onChanged,
        labelStyle: context.textStyles.username.copyWith(
          color: context.colors.textPrimary,
        ),
        valueStyle: context.textStyles.username.copyWith(
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}

class VoiceParticipantVolumeSlider extends StatefulWidget {
  const VoiceParticipantVolumeSlider({
    required this.label,
    required this.value,
    required this.onChanged,
    required this.labelStyle,
    required this.valueStyle,
    this.mini = false,
    super.key,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final bool mini;

  @override
  State<VoiceParticipantVolumeSlider> createState() =>
      _VoiceParticipantVolumeSliderState();
}

class _VoiceParticipantVolumeSliderState
    extends State<VoiceParticipantVolumeSlider> {
  late int _volume;

  @override
  void initState() {
    super.initState();
    _volume = widget.value;
  }

  @override
  void didUpdateWidget(VoiceParticipantVolumeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _volume = widget.value;
    }
  }

  void _setVolume(int next) {
    setState(() => _volume = next);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Text(widget.label, style: widget.labelStyle)),
            Text('$_volume%', style: widget.valueStyle),
          ],
        ),
        SizedBox(height: widget.mini ? context.layout.s2 : 12),
        FluxerSlider(
          defaultValue: _volume.toDouble(),
          minValue: kMinVoiceVolumePercent.toDouble(),
          maxValue: kMaxVoiceVolumePercent.toDouble(),
          factoryDefaultValue: kDefaultVoiceVolumePercent.toDouble(),
          mini: widget.mini,
          asValueChanges: (double next) => _setVolume(next.round()),
          onValueChange: (double next) {
            final int rounded = next.round();
            _setVolume(rounded);
            widget.onChanged(rounded);
          },
        ),
      ],
    );
  }
}

double estimateVoiceParticipantContextMenuHeight(List<Widget> items) {
  var height = 16.0;
  for (final Widget item in items) {
    if (item is ContextMenuDivider) {
      height += 13;
    } else if (item is VoiceParticipantContextMenuVolumeItem) {
      height += 72;
    } else {
      height += 38;
    }
  }
  return height;
}
