// Action-card widget used on the IAR guidance and success steps.
//
// Each card surfaces a single recovery action (block user, copy link, leave
// guild, etc.) with a title + description + trailing button. The visual
// language mirrors web `IARActionCards.tsx`.

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:material_ui/material_ui.dart';

/// Visual style for the trailing button on an [IarActionCardConfig].
enum IarActionCardButtonStyle { secondary, dangerSecondary }

/// Static description of one action card. The sheet builds a list of these
/// and renders them with [IarActionCardList]. Keeping this as plain data
/// makes the card list trivially testable.
class IarActionCardConfig {
  const IarActionCardConfig({
    required this.id,
    required this.title,
    required this.description,
    required this.label,
    required this.onPressed,
    this.style = IarActionCardButtonStyle.secondary,
    this.disabled = false,
    this.disabledTooltip,
  });

  final String id;
  final String title;
  final String description;
  final String label;
  final VoidCallback onPressed;
  final IarActionCardButtonStyle style;
  final bool disabled;

  /// Optional tooltip displayed when the card is disabled. The web uses this
  /// to explain "Already deleted" / "Already banned" states.
  final String? disabledTooltip;
}

/// Renders a list of [IarActionCardConfig]s. Returns an empty SizedBox when
/// the list is empty so callers don't need to guard on `cards.isEmpty`.
class IarActionCardList extends StatelessWidget {
  const IarActionCardList({required this.cards, super.key});

  final List<IarActionCardConfig> cards;

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return const SizedBox.shrink();
    }
    final layout = context.layout;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < cards.length; i++) ...[
          _IarActionCard(card: cards[i]),
          if (i < cards.length - 1) SizedBox(height: layout.s2),
        ],
      ],
    );
  }
}

class _IarActionCard extends StatelessWidget {
  const _IarActionCard({required this.card});

  final IarActionCardConfig card;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final button = card.style == IarActionCardButtonStyle.dangerSecondary
        ? FluxerButton.dangerSecondary(
            onPressed: card.disabled ? null : card.onPressed,
            label: card.label,
            size: FluxerButtonSize.small,
            fitContent: true,
          )
        : FluxerButton.secondary(
            onPressed: card.disabled ? null : card.onPressed,
            label: card.label,
            size: FluxerButtonSize.small,
            fitContent: true,
          );
    final trailing =
        card.disabled &&
            card.disabledTooltip != null &&
            card.disabledTooltip!.isNotEmpty
        ? FluxerTooltip(message: card.disabledTooltip, child: button)
        : button;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: layout.s4, vertical: layout.s3),
      decoration: BoxDecoration(
        color: colors.backgroundSecondaryAlt,
        borderRadius: layout.radiusLg,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  card.title,
                  style: textStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                  ),
                ),
                SizedBox(height: layout.s1),
                Text(
                  card.description,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: layout.s3),
          trailing,
        ],
      ),
    );
  }
}
