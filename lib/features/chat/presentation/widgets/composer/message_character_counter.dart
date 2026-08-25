import 'package:fluxer_app/features/ui/character_counter/fluxer_character_counter.dart';
import 'package:fluxer_app/material_ui.dart';

class MessageCharacterCounter extends StatelessWidget {
  const MessageCharacterCounter({
    required this.currentLength,
    required this.maxLength,
    required this.canUpgrade,
    required this.premiumMaxLength,
    this.onUpgradePressed,
    this.threshold = 0.8,
    this.showTooltip = true,
    super.key,
  });

  final int currentLength;
  final int maxLength;
  final bool canUpgrade;
  final int premiumMaxLength;
  final VoidCallback? onUpgradePressed;
  final double threshold;
  final bool showTooltip;

  @override
  Widget build(BuildContext context) {
    if (currentLength <= (maxLength * threshold).floor()) {
      return const SizedBox.shrink();
    }
    return FluxerCharacterCounter(
      current: currentLength,
      max: maxLength,
      canUpgrade: canUpgrade,
      premiumMaxLength: premiumMaxLength,
      onUpgradePressed: onUpgradePressed,
      showTooltip: showTooltip,
    );
  }
}
