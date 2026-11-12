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
    final String label = updating
        ? l10n.oxygenUpdating
        : l10n.oxygenUpdateAvailable;
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
    required this.color,
    required this.size,
  });

  final bool spinning;
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
    final Widget icon = PhosphorIcon(
      PhosphorIconsBold.downloadSimple,
      size: widget.size,
      color: widget.color,
    );
    if (!widget.spinning) {
      return icon;
    }
    if (MediaQuery.disableAnimationsOf(context)) {
      return Opacity(opacity: 0.6, child: icon);
    }
    return RotationTransition(turns: _controller, child: icon);
  }
}
