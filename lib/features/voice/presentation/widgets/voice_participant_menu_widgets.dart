import 'package:flutter/rendering.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/material_ui.dart';

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
    return FluxerDesktopMenuSlider(
      label: label,
      value: value.toDouble(),
      minValue: kMinVoiceVolumePercent.toDouble(),
      maxValue: kMaxVoiceVolumePercent.toDouble(),
      factoryDefaultValue: kDefaultVoiceVolumePercent.toDouble(),
      onChangeEnd: (double next) => onChanged(next.round()),
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
    this.gap,
    this.headerInset = 0,
    super.key,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final bool mini;
  final double? gap;
  final double headerInset;

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.headerInset),
          child: Row(
            children: [
              Expanded(child: Text(widget.label, style: widget.labelStyle)),
              Text('$_volume%', style: widget.valueStyle),
            ],
          ),
        ),
        SizedBox(height: widget.gap ?? (widget.mini ? context.layout.s2 : 12)),
        _NoIntrinsicWidth(
          child: FluxerSlider(
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
        ),
      ],
    );
  }
}

class _NoIntrinsicWidth extends SingleChildRenderObjectWidget {
  const _NoIntrinsicWidth({required Widget super.child});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderNoIntrinsicWidth();
}

class _RenderNoIntrinsicWidth extends RenderProxyBox {
  @override
  double computeMinIntrinsicWidth(double height) => 0;

  @override
  double computeMaxIntrinsicWidth(double height) => 0;
}
