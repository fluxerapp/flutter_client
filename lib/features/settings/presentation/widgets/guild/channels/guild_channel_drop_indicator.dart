import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

class GuildChannelDropIndicator extends StatelessWidget {
  const GuildChannelDropIndicator({
    required this.isValid,
    required this.atTop,
    super.key,
  });

  final bool isValid;
  final bool atTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: atTop ? 0 : null,
      bottom: atTop ? null : 0,
      left: 8,
      right: 8,
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: isValid
              ? context.colors.brandPrimary
              : context.colors.statusDanger,
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}
