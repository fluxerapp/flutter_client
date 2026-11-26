import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_labels.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class MacPermissionTile extends StatelessWidget {
  const MacPermissionTile({required this.kind, super.key});

  final MacPermissionKind kind;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      width: 56,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.brandPrimary.withValues(
          alpha: colors.brandPrimary.a * 0.16,
        ),
        borderRadius: context.layout.radiusXl,
      ),
      child: PhosphorIcon(
        macPermissionIcon(kind),
        size: 28,
        color: isLight ? colors.brandPrimary : colors.brandPrimaryLight,
      ),
    );
  }
}
