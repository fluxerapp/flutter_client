import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/advanced_search_provider_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showAdvancedTextSearchEnginesSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingSearchEnginesLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final category = ref.watch(
            advancedPreferencesProvider.select(
              (state) => state.searchEngines.textSearch,
            ),
          );

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: AdvancedSearchProviderSection(
              mode: SearchProviderMode.text,
              category: category,
              defaultTitle: l10n.advancedSettingDefaultSearchEngineLabel,
              defaultDescription:
                  l10n.advancedSettingDefaultSearchEngineDescription,
              builtInTitle: l10n.advancedSettingBuiltInSearchEnginesLabel,
              builtInDescription:
                  l10n.advancedSettingBuiltInSearchEnginesDescription,
              customTitle: l10n.advancedSettingCustomSearchEnginesLabel,
              customDescription: l10n
                  .advancedSettingCustomSearchEnginesDescription('{query}'),
              addButtonLabel: l10n.advancedSettingAddSearchEngineLabel,
              noEnginesText:
                  l10n.advancedSettingEnableAtLeastOneSearchEngineLabel,
              removeConfirmTitle: l10n.advancedSettingRemoveSearchEngineLabel,
            ),
          );
        },
      );
    },
  );
}

Future<void> showAdvancedTranslatorsSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingTranslatorsLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final category = ref.watch(
            advancedPreferencesProvider.select(
              (state) => state.searchEngines.translators,
            ),
          );

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: AdvancedSearchProviderSection(
              mode: SearchProviderMode.translate,
              category: category,
              defaultTitle: l10n.advancedSettingDefaultTranslatorLabel,
              defaultDescription:
                  l10n.advancedSettingDefaultTranslatorDescription,
              builtInTitle: l10n.advancedSettingBuiltInTranslatorsLabel,
              builtInDescription:
                  l10n.advancedSettingBuiltInTranslatorsDescription,
              customTitle: l10n.advancedSettingCustomTranslatorsLabel,
              customDescription: l10n
                  .advancedSettingCustomTranslatorsDescription('{query}'),
              addButtonLabel: l10n.advancedSettingAddTranslatorLabel,
              noEnginesText:
                  l10n.advancedSettingEnableAtLeastOneTranslatorLabel,
              removeConfirmTitle: l10n.advancedSettingRemoveTranslatorLabel,
            ),
          );
        },
      );
    },
  );
}

Future<void> showAdvancedReverseImageSearchSheet(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.advancedSettingReverseImageSearchLabel,
    builder: (sheetContext, scrollController, close) {
      return Consumer(
        builder: (context, ref, _) {
          final category = ref.watch(
            advancedPreferencesProvider.select(
              (state) => state.searchEngines.reverseImage,
            ),
          );

          return SingleChildScrollView(
            controller: scrollController,
            padding: settingsScrollPadding(sheetContext),
            child: AdvancedSearchProviderSection(
              mode: SearchProviderMode.image,
              category: category,
              defaultTitle: l10n.advancedSettingDefaultReverseImageSearchLabel,
              defaultDescription:
                  l10n.advancedSettingDefaultReverseImageSearchDescription,
              builtInTitle: l10n.advancedSettingBuiltInReverseImageSearchLabel,
              builtInDescription:
                  l10n.advancedSettingBuiltInReverseImageSearchDescription,
              customTitle: l10n.advancedSettingCustomReverseImageSearchLabel,
              customDescription: l10n
                  .advancedSettingCustomReverseImageSearchDescription('{url}'),
              addButtonLabel: l10n.advancedSettingAddReverseImageSearchLabel,
              noEnginesText:
                  l10n.advancedSettingEnableAtLeastOneReverseImageSearchLabel,
              removeConfirmTitle:
                  l10n.advancedSettingRemoveReverseImageSearchLabel,
            ),
          );
        },
      );
    },
  );
}
