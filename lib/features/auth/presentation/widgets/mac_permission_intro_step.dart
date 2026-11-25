import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_prompt.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class MacPermissionIntroStep extends StatelessWidget {
  const MacPermissionIntroStep({
    required this.kind,
    required this.index,
    required this.count,
    required this.onAllowed,
    required this.onNotNow,
    super.key,
  });

  final MacPermissionKind kind;
  final int index;
  final int count;
  final VoidCallback onAllowed;
  final VoidCallback onNotNow;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: context.layout.s4,
      children: [
        MacPermissionPrompt(
          kind: kind,
          onAllowed: onAllowed,
          onNotNow: onNotNow,
        ),
        Semantics(
          image: true,
          label: FluxerLocalizations.of(
            context,
          ).macPermissionProgress(index + 1, count),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              for (int dot = 0; dot < count; dot++)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dot == index
                        ? colors.textSecondary
                        : colors.backgroundModifierAccent,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
