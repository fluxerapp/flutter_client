import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildDiscoveryTagChip extends StatelessWidget {
  const GuildDiscoveryTagChip({
    required this.tag,
    required this.removeLabel,
    this.onRemove,
    super.key,
  });

  final String tag;
  final String removeLabel;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.layout.s2,
        vertical: context.layout.s1,
      ),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: context.colors.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(tag, style: context.textStyles.bodySmall),
          if (onRemove != null) ...<Widget>[
            SizedBox(width: context.layout.s1),
            IconButton(
              onPressed: onRemove,
              tooltip: removeLabel,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
              icon: Text(
                '×',
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
