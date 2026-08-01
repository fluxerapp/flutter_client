import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/advanced_custom_search_engine_sheet.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AdvancedSearchProviderSection extends ConsumerWidget {
  const AdvancedSearchProviderSection({
    required this.mode,
    required this.category,
    required this.defaultTitle,
    required this.defaultDescription,
    required this.builtInTitle,
    required this.builtInDescription,
    required this.customTitle,
    required this.customDescription,
    required this.addButtonLabel,
    required this.noEnginesText,
    required this.removeConfirmTitle,
    super.key,
  });

  final SearchProviderMode mode;
  final SearchProviderCategoryState category;
  final String defaultTitle;
  final String defaultDescription;
  final String builtInTitle;
  final String builtInDescription;
  final String customTitle;
  final String customDescription;
  final String addButtonLabel;
  final String noEnginesText;
  final String removeConfirmTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final notifier = ref.read(advancedPreferencesProvider.notifier);
    final enabledEngines = category.enabledEngines;
    final defaultEngineId = category.defaultEngineId;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FluxerSettingsSubsection(
          title: defaultTitle,
          description: defaultDescription,
          children: [
            if (enabledEngines.isNotEmpty)
              FluxerSelect<String>(
                label: defaultTitle,
                value: defaultEngineId ?? enabledEngines.first.id,
                items: [
                  for (final engine in enabledEngines)
                    FluxerSelectItem(value: engine.id, label: engine.name),
                ],
                onChanged: (value) => notifier.setSearchProviderDefault(
                  mode: mode,
                  engineId: value,
                ),
              )
            else
              Text(
                noEnginesText,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
          ],
        ),
        SizedBox(height: layout.s6),
        FluxerSettingsSubsection(
          title: builtInTitle,
          description: builtInDescription,
          children: [
            FluxerSettingsSwitchGroup(
              children: [
                for (final engine in category.builtInEngines)
                  FluxerSettingsSwitchItem.grouped(
                    label: engine.name,
                    value: engine.enabled,
                    onChanged: (value) => notifier.setSearchProviderEnabled(
                      mode: mode,
                      engineId: engine.id,
                      enabled: value,
                    ),
                  ),
              ],
            ),
          ],
        ),
        SizedBox(height: layout.s6),
        FluxerSettingsSubsection(
          title: customTitle,
          description: customDescription,
          children: [
            if (category.customEngines.isNotEmpty)
              FluxerSettingsSwitchGroup(
                children: [
                  for (final engine in category.customEngines)
                    _CustomEngineRow(
                      engine: engine,
                      onChanged: (value) => notifier.setSearchProviderEnabled(
                        mode: mode,
                        engineId: engine.id,
                        enabled: value,
                      ),
                      onEdit: () => showAdvancedCustomSearchEngineSheet(
                        context,
                        mode: mode,
                        editingEngineId: engine.id,
                        initialName: engine.name,
                        initialUrlTemplate: engine.urlTemplate,
                      ),
                      onRemove: () async {
                        final confirmed = await showFluxerSettingsConfirmSheet(
                          context,
                          title: removeConfirmTitle,
                          description: l10n
                              .advancedSettingRemoveSearchProviderConfirmDescription(
                                engine.name,
                              ),
                          confirmLabel: l10n
                              .advancedSettingRemoveSearchProviderConfirmAction,
                          isDanger: true,
                        );
                        if ((confirmed ?? false) && context.mounted) {
                          await notifier.removeCustomSearchProvider(
                            mode: mode,
                            engineId: engine.id,
                          );
                        }
                      },
                    ),
                ],
              ),
            SizedBox(height: layout.s3),
            FluxerButton.secondary(
              size: FluxerButtonSize.compact,
              fitContent: true,
              onPressed: () =>
                  showAdvancedCustomSearchEngineSheet(context, mode: mode),
              label: addButtonLabel,
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomEngineRow extends StatelessWidget {
  const _CustomEngineRow({
    required this.engine,
    required this.onChanged,
    required this.onEdit,
    required this.onRemove,
  });

  final SearchProviderEngine engine;
  final ValueChanged<bool> onChanged;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
    final minHeight = layout.settingsSwitchGroupedRowMinHeight;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s3, vertical: layout.s1),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
        child: Row(
          children: [
            Expanded(
              child: FluxerTappable(
                onTap: () => onChanged(!engine.enabled),
                semanticLabel: engine.name,
                toggled: engine.enabled,
                builder: (context, states) {
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          engine.name,
                          style: textStyles.bodySmall.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ),
                      FluxerSwitchControl(value: engine.enabled),
                    ],
                  );
                },
              ),
            ),
            SizedBox(width: layout.s3),
            FluxerButton.secondary(
              size: FluxerButtonSize.compact,
              fitContent: true,
              onPressed: onEdit,
              label: l10n.advancedSettingEditSearchProviderAction,
            ),
            SizedBox(width: layout.s2),
            FluxerButton.secondary(
              size: FluxerButtonSize.compact,
              fitContent: true,
              onPressed: onRemove,
              icon: PhosphorIconsBold.trash,
              semanticLabel:
                  l10n.advancedSettingRemoveSearchProviderConfirmAction,
            ),
          ],
        ),
      ),
    );
  }
}
