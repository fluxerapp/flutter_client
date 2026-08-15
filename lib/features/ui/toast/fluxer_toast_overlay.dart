import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerToastOverlay extends ConsumerWidget {
  const FluxerToastOverlay({required this.child, super.key});

  final Widget child;

  IconData? _variantIcon(FluxerToastVariant variant) => switch (variant) {
    FluxerToastVariant.success => PhosphorIconsBold.check,
    FluxerToastVariant.danger => PhosphorIconsBold.x,
    FluxerToastVariant.warning => PhosphorIconsBold.warning,
    FluxerToastVariant.info => null,
  };

  Color _variantIconColor(BuildContext context, FluxerToastVariant variant) {
    final colors = context.colors;
    return switch (variant) {
      FluxerToastVariant.success => colors.accentSuccess,
      FluxerToastVariant.danger => colors.accentDanger,
      FluxerToastVariant.warning => colors.accentWarning,
      FluxerToastVariant.info => colors.textPrimary,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(toastProvider);
    final layout = context.layout;
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (entries.isNotEmpty)
          Positioned(
            left: layout.s4,
            right: layout.s4,
            top: mediaQuery.padding.top + layout.s4,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final entry in entries)
                    Padding(
                      padding: EdgeInsets.only(bottom: layout.s2),
                      child: _ToastItem(
                        key: ValueKey<int>(entry.id),
                        entry: entry,
                        icon: _variantIcon(entry.toast.variant),
                        iconColor: _variantIconColor(
                          context,
                          entry.toast.variant,
                        ),
                        onDismiss: () =>
                            ref.read(toastProvider.notifier).dismiss(entry.id),
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _ToastItem extends StatefulWidget {
  const _ToastItem({
    required this.entry,
    required this.icon,
    required this.iconColor,
    required this.onDismiss,
    super.key,
  });

  final ToastEntry entry;
  final IconData? icon;
  final Color iconColor;
  final VoidCallback onDismiss;

  @override
  State<_ToastItem> createState() => _ToastItemState();
}

class _ToastItemState extends State<_ToastItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.panelDuration,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    if (widget.entry.isVisible) {
      _controller.forward();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.duration = context.motion.panel;
  }

  @override
  void didUpdateWidget(covariant _ToastItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.entry.isVisible == oldWidget.entry.isVisible) {
      return;
    }
    if (widget.entry.isVisible) {
      _controller.forward();
      return;
    }
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String message = widget.entry.toast.message;

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: IgnorePointer(
          ignoring: !widget.entry.isVisible,
          child: Semantics(
            liveRegion: true,
            label: message,
            button: true,
            onTap: widget.onDismiss,
            hint: l10n.uiDismissNotification,
            child: ExcludeSemantics(
              child: FluxerGestureDetector(
                onTap: widget.onDismiss,
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: EdgeInsets.symmetric(
                      horizontal: layout.s4,
                      vertical: layout.s3,
                    ),
                    decoration: BoxDecoration(
                      color: colors.backgroundPrimary,
                      borderRadius: layout.radiusFull,
                      border: Border.all(
                        color: colors.backgroundModifierAccent,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.icon != null) ...[
                          PhosphorIcon(
                            widget.icon!,
                            size: 20,
                            color: widget.iconColor,
                          ),
                          SizedBox(width: layout.s3),
                        ],
                        Flexible(
                          child: Text(
                            message,
                            style: textStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
