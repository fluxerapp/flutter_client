import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreButton extends StatefulWidget {
  const PremiumStoreButton({
    required this.label,
    required this.primary,
    required this.onPressed,
    this.price,
    this.savings,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final String? price;
  final String? savings;
  final bool primary;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  State<PremiumStoreButton> createState() => _PremiumStoreButtonState();
}

class _PremiumStoreButtonState extends State<PremiumStoreButton> {
  bool _pressed = false;

  static const double _ledge = 6;
  static const double _lift = 1;
  static const double _press = 3;

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    final textStyles = context.textStyles;
    final bool disabled = widget.onPressed == null;
    final bool busy = widget.isLoading;
    final Color face = widget.primary
        ? style.btnPrimaryFace
        : style.btnSecondaryFace;
    final Color faceLedge = widget.primary
        ? style.btnPrimaryLedge
        : style.btnSecondaryLedge;
    final Color ink = widget.primary
        ? style.btnPrimaryInk
        : style.btnSecondaryInk;

    final double shadowDepth = disabled || busy
        ? _ledge
        : _pressed
        ? _ledge - _press
        : _ledge;
    final double translateY = disabled || busy
        ? 0
        : _pressed
        ? _press
        : -_lift;

    final String semanticsLabel = [
      widget.label,
      ?widget.price,
      ?widget.savings,
    ].join(', ');

    return Semantics(
      button: true,
      enabled: !disabled && !busy,
      label: semanticsLabel,
      child: Opacity(
        opacity: disabled || busy ? 0.6 : 1,
        child: GestureDetector(
          onTapDown: disabled || busy
              ? null
              : (_) => setState(() => _pressed = true),
          onTapUp: disabled || busy
              ? null
              : (_) => setState(() => _pressed = false),
          onTapCancel: disabled || busy
              ? null
              : () => setState(() => _pressed = false),
          onTap: disabled || busy ? null : widget.onPressed,
          child: AnimatedContainer(
            duration: Duration(milliseconds: _pressed ? 90 : 240),
            curve: _pressed ? Curves.easeOut : const Cubic(0.22, 1, 0.36, 1),
            transform: Matrix4.translationValues(0, translateY, 0),
            margin: const EdgeInsets.only(bottom: _ledge),
            decoration: BoxDecoration(
              color: face,
              borderRadius: PremiumStoreStyle.tileRadius,
              boxShadow: [
                BoxShadow(color: faceLedge, offset: Offset(0, shadowDepth)),
              ],
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyles.bodyMedium.copyWith(
                          color: ink,
                          fontWeight: FontWeight.w800,
                          height: 1.3,
                        ),
                      ),
                    ),
                    if (busy) ...[
                      const SizedBox(width: 8),
                      FluxerLoadingSpinner(
                        size: FluxerLoadingSpinnerSize.small,
                        color: ink,
                      ),
                    ] else if (widget.price != null) ...[
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.price!,
                            style: textStyles.bodyMedium.copyWith(
                              color: ink,
                              fontWeight: FontWeight.w800,
                              height: 1.3,
                            ),
                          ),
                          if (widget.savings != null)
                            Text(
                              widget.savings!,
                              style: textStyles.timestamp.copyWith(
                                color: ink.withValues(alpha: 0.82),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
