import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserSettingsSearchField extends StatelessWidget {
  const UserSettingsSearchField({
    required this.controller,
    required this.onChanged,
    required this.onClear,
    this.focusNode,
    this.padding,
    this.iconSize = 16,
    this.style,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? padding;
  final double iconSize;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool showClear = controller.text.isNotEmpty;
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: context.layout.s4),
      child: FluxerInput(
        controller: controller,
        focusNode: focusNode,
        hint: l10n.userSettingsSearchPlaceholder,
        onTapOutside: (_) =>
            (focusNode ?? FocusManager.instance.primaryFocus)?.unfocus(),
        prefixIcon: PhosphorIcon(
          PhosphorIconsBold.magnifyingGlass,
          size: iconSize,
          color: context.colors.textPrimaryMuted,
        ),
        suffixIcon: showClear
            ? PhosphorIcon(
                PhosphorIconsBold.x,
                size: iconSize,
                color: context.colors.textPrimaryMuted,
              )
            : null,
        onSuffixTap: showClear ? onClear : null,
        suffixSemanticLabel: showClear ? l10n.userSettingsSearchClear : null,
        onChanged: onChanged,
        style: style,
        textInputAction: TextInputAction.search,
        autocorrect: false,
        enableSuggestions: false,
      ),
    );
  }
}
