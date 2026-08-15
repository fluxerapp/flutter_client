import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:material_ui/material_ui.dart';

class FluxerNagbarButton extends StatelessWidget {
  const FluxerNagbarButton({
    required this.label,
    required this.onPressed,
    required this.isMobile,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isMobile;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FluxerButton.inverted(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      fitContent: true,
      size: isMobile ? FluxerButtonSize.compact : FluxerButtonSize.superCompact,
    );
  }
}
