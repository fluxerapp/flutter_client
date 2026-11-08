import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class ForwardIndicator extends StatelessWidget {
  final String source;

  const ForwardIndicator({required this.source, super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.only(start: 56, bottom: 4),
    child: Row(
      children: [
        PhosphorIcon(
          PhosphorIconsFill.shareFat,
          size: 14,
          color: context.colors.textPrimaryMuted,
        ),
        const SizedBox(width: 4),
        Text(
          FluxerLocalizations.of(context).chatForwardedFrom(source),
          style: context.textStyles.timestamp.copyWith(
            color: context.colors.textPrimaryMuted,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );
}
