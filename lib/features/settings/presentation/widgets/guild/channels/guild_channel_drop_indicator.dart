import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';

const double kGuildChannelSettingsNullSpaceHeight = 10;
const double kGuildChannelSettingsMobileNullSpaceHeight = 28;
const double kGuildChannelSettingsCategoryTailHeight = 16;
const double kGuildChannelSettingsCategoryTailMobileHeight = 28;
const double kGuildChannelSettingsRowHorizontalPadding = 8;
const double kGuildChannelSettingsDraggedRowOpacity = 0.3;
const double kGuildChannelSettingsCategoryTopPadding = 4;
const double kGuildChannelDropIndicatorHeight = 2;
const double kGuildChannelDropIndicatorEdgeOffset = 2;

const Duration kGuildChannelDropIndicatorAnimationDuration = Duration(
  milliseconds: 150,
);

class GuildChannelDropIndicator extends StatelessWidget {
  const GuildChannelDropIndicator({
    required this.position,
    required this.isValid,
    this.isIndented = false,
    super.key,
  });

  final ChannelReorderIndicatorPosition position;
  final bool isValid;
  final bool isIndented;

  @override
  Widget build(BuildContext context) {
    final Color color = isValid
        ? context.colors.brandPrimary
        : context.colors.textPrimaryMuted.withValues(alpha: 0.6);
    return Positioned(
      left: isIndented ? 8 : 0,
      right: kGuildChannelSettingsRowHorizontalPadding,
      top: position == ChannelReorderIndicatorPosition.top
          ? -kGuildChannelDropIndicatorEdgeOffset
          : null,
      bottom: position == ChannelReorderIndicatorPosition.bottom
          ? -kGuildChannelDropIndicatorEdgeOffset
          : null,
      height: kGuildChannelDropIndicatorHeight,
      child: AnimatedContainer(
        duration: kGuildChannelDropIndicatorAnimationDuration,
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}
