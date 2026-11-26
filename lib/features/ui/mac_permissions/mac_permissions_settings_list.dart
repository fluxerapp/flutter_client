import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_provider.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_state.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_settings_line.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

class MacPermissionsSettingsList extends ConsumerWidget {
  const MacPermissionsSettingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final String productName = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    );
    final bool showAdvice = ref.watch(
      macPermissionStatusesProvider.select(
        (MacPermissionsState state) => state.anyQuitPromptAdvice,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      spacing: layout.s3,
      children: [
        Text(
          l10n.macPermissionsSettingsDescription(productName),
          style: context.textStyles.bodySmall.copyWith(
            fontSize: 14,
            height: 20 / 14,
            color: colors.textPrimaryMuted,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            borderRadius: layout.radiusLg,
            border: Border.all(color: colors.backgroundModifierAccent),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final MacPermissionKind kind in MacPermissionKind.values)
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: kind == MacPermissionKind.values.first
                        ? null
                        : Border(
                            top: BorderSide(
                              color: colors.backgroundModifierAccent,
                            ),
                          ),
                  ),
                  child: MacPermissionSettingsLine(kind: kind),
                ),
            ],
          ),
        ),
        if (showAdvice)
          Semantics(
            liveRegion: true,
            child: Text(
              l10n.macPermissionQuitPromptAdvice(productName),
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                height: 18 / 13,
                color: colors.textPrimaryMuted,
              ),
            ),
          ),
      ],
    );
  }
}
