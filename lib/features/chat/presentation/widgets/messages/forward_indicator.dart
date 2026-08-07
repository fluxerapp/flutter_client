import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// A label shown on forwarded messages.
class ForwardIndicator extends StatelessWidget {
  final String source;

  const ForwardIndicator({required this.source, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 56, bottom: 4),
    child: Row(
      children: [
        PhosphorIcon(
          PhosphorIconsFill.shareFat,
          size: 14,
          color: context.colors.textPrimaryMuted,
        ),
        const SizedBox(width: 4),
        Text(
          'Forwarded from $source',
          style: context.textStyles.timestamp.copyWith(
            color: context.colors.textPrimaryMuted,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );
}
