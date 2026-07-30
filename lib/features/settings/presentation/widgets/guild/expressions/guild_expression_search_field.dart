import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildExpressionSearchField extends StatelessWidget {
  const GuildExpressionSearchField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s4,
        context.layout.s4,
        0,
      ),
      child: FluxerInput(
        controller: controller,
        hint: hintText,
        onChanged: onChanged,
        prefixIcon: PhosphorIcon(
          PhosphorIconsBold.magnifyingGlass,
          size: 16,
          color: context.colors.textPrimaryMuted,
        ),
      ),
    );
  }
}
