import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/updater/oxygen_update_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const Color _updateIconColor = Color(0xFF22C55E);

class OxygenUpdateHeaderButton extends ConsumerWidget {
  const OxygenUpdateHeaderButton({this.highContrast = false, super.key});

  final bool highContrast;

  static const double _visualSize = 32;
  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isWideLayout(context)) {
      return const SizedBox.shrink();
    }
    final OxygenUpdateStatus status = ref.watch(oxygenUpdateProvider);
    if (status == OxygenUpdateStatus.none) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool updating = status == OxygenUpdateStatus.updating;
    final double? progress = updating
        ? ref.watch(oxygenUpdateProgressProvider)
        : null;
    final String label = !updating
        ? l10n.oxygenUpdateAvailable
        : progress == null
        ? l10n.oxygenUpdating
        : l10n.oxygenUpdatingProgress((progress * 100).round());
    final Color color = highContrast ? Colors.white : _updateIconColor;
    final double hitSize = isTouchPrimaryInput(ref)
        ? context.layout.touchTargetMin
        : _visualSize;

    return Semantics(
      button: true,
      enabled: !updating,
      label: label,
      child: Tooltip(
        message: label,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: updating
                ? null
                : () => unawaited(
                    ref.read(oxygenUpdateProvider.notifier).applyUpdate(),
                  ),
            borderRadius: BorderRadius.circular(hitSize / 2),
            child: SizedBox.square(
              dimension: hitSize,
              child: Center(
                child: _OxygenUpdateIcon(
                  spinning: updating,
                  progress: progress,
                  color: color,
                  size: _iconSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OxygenUpdateIcon extends StatefulWidget {
  const _OxygenUpdateIcon({
    required this.spinning,
    required this.progress,
    required this.color,
    required this.size,
  });

  final bool spinning;
  final double? progress;
  final Color color;
  final double size;

  @override
  State<_OxygenUpdateIcon> createState() => _OxygenUpdateIconState();
}

class _OxygenUpdateIconState extends State<_OxygenUpdateIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncAnimation();
  }

  @override
  void didUpdateWidget(_OxygenUpdateIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncAnimation();
  }

  void _syncAnimation() {
    final bool animate =
        widget.spinning && !MediaQuery.disableAnimationsOf(context);
    if (animate && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!animate && _controller.isAnimating) {
      _controller
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.spinning) {
      return PhosphorIcon(
        PhosphorIconsBold.downloadSimple,
        size: widget.size,
        color: widget.color,
      );
    }
    final Widget icon = PhosphorIcon(
      PhosphorIconsBold.arrowsClockwise,
      size: widget.size * _spinningIconScale,
      color: widget.color,
    );
    final Widget spinner = MediaQuery.disableAnimationsOf(context)
        ? icon
        : RotationTransition(turns: _controller, child: icon);
    return SizedBox.square(
      dimension: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: widget.progress ?? 0,
              strokeWidth: _ringStrokeWidth,
              color: widget.color,
              backgroundColor: widget.color.withValues(alpha: 0.25),
            ),
          ),
          spinner,
        ],
      ),
    );
  }
}

const double _spinningIconScale = 0.55;
const double _ringStrokeWidth = 2;
