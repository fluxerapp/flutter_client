import 'dart:async';

import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const double voiceVideoZoomMinScale = 1;
const double voiceVideoZoomMaxScale = 8;

const double _voiceVideoZoomPanThreshold = 1.01;
const Duration _voiceVideoZoomLabelFadeDuration = Duration(milliseconds: 200);
const Duration _voiceVideoZoomLabelHideDelay = Duration(milliseconds: 600);

String voiceVideoZoomScaleLabel(double scale) {
  final double clamped = scale.clamp(
    voiceVideoZoomMinScale,
    voiceVideoZoomMaxScale,
  );
  return clamped.toStringAsFixed(1);
}

class VoiceFullscreenVideoZoom extends StatelessWidget {
  const VoiceFullscreenVideoZoom({
    required this.enabled,
    required this.child,
    super.key,
  });

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }
    return _VoiceFullscreenVideoZoomBody(child: child);
  }
}

class _VoiceFullscreenVideoZoomBody extends StatefulWidget {
  const _VoiceFullscreenVideoZoomBody({required this.child});

  final Widget child;

  @override
  State<_VoiceFullscreenVideoZoomBody> createState() =>
      _VoiceFullscreenVideoZoomBodyState();
}

class _VoiceFullscreenVideoZoomBodyState
    extends State<_VoiceFullscreenVideoZoomBody> {
  late final TransformationController _controller;
  final ValueNotifier<bool> _panEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _showLabel = ValueNotifier<bool>(false);
  final ValueNotifier<String> _label = ValueNotifier<String>('1.0');
  bool _interacting = false;
  Timer? _hideLabelTimer;

  @override
  void initState() {
    super.initState();
    _controller = TransformationController();
  }

  @override
  void dispose() {
    _hideLabelTimer?.cancel();
    _panEnabled.dispose();
    _showLabel.dispose();
    _label.dispose();
    _controller.dispose();
    super.dispose();
  }

  double _readScale() {
    return _controller.value.getMaxScaleOnAxis();
  }

  void _syncFromTransform() {
    final bool canPan = _readScale() > _voiceVideoZoomPanThreshold;
    final String nextLabel = voiceVideoZoomScaleLabel(_readScale());
    if (_panEnabled.value != canPan) {
      _panEnabled.value = canPan;
    }
    if (_label.value != nextLabel) {
      _label.value = nextLabel;
    }
  }

  void _onInteractionStart(ScaleStartDetails details) {
    _hideLabelTimer?.cancel();
    _hideLabelTimer = null;
    _interacting = true;
    _showLabel.value = true;
    _syncFromTransform();
  }

  void _onInteractionUpdate(ScaleUpdateDetails details) {
    _syncFromTransform();
  }

  void _onInteractionEnd(ScaleEndDetails details) {
    _interacting = false;
    _hideLabelTimer = Timer(_voiceVideoZoomLabelHideDelay, () {
      if (!mounted || _interacting) {
        return;
      }
      _showLabel.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        RepaintBoundary(
          child: ValueListenableBuilder<bool>(
            valueListenable: _panEnabled,
            builder: (BuildContext context, bool panEnabled, Widget? child) {
              return InteractiveViewer(
                transformationController: _controller,
                minScale: voiceVideoZoomMinScale,
                maxScale: voiceVideoZoomMaxScale,
                panEnabled: panEnabled,
                onInteractionStart: _onInteractionStart,
                onInteractionUpdate: _onInteractionUpdate,
                onInteractionEnd: _onInteractionEnd,
                child: child!,
              );
            },
            child: widget.child,
          ),
        ),
        ListenableBuilder(
          listenable: Listenable.merge(<Listenable>[_showLabel, _label]),
          builder: (BuildContext context, Widget? _) {
            return IgnorePointer(
              child: AnimatedOpacity(
                opacity: _showLabel.value ? 1 : 0,
                duration: _voiceVideoZoomLabelFadeDuration,
                child: Center(
                  child: Semantics(
                    label: l10n.voiceVideoZoomLevel(_label.value),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0x99000000),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        child: Text(
                          _label.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
