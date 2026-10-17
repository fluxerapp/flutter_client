import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

bool isWebMessageTranslationAvailable(SearchEnginesState searchEngines) {
  return searchEngines.translators.enabledEngines.isNotEmpty;
}

Future<bool> openMessageWebTranslation({
  required BuildContext context,
  required WidgetRef ref,
  required String query,
}) async {
  final String trimmed = query.trim();
  if (trimmed.isEmpty) {
    return false;
  }
  final SearchProviderCategoryState translators = ref
      .read(advancedPreferencesProvider)
      .searchEngines
      .translators;
  if (translators.enabledEngines.isEmpty) {
    return false;
  }

  final SearchProviderEngine? defaultEngine =
      translators.effectiveDefaultEngine;
  final String? engineId =
      defaultEngine?.id ?? await _pickTranslatorEngine(context, translators);
  if (!context.mounted || engineId == null) {
    return false;
  }

  final String? url = translators.buildSearchUrl(engineId, trimmed);
  if (url == null || url.isEmpty || !context.mounted) {
    return false;
  }
  await handleExternalLinkTap(context, url);
  if (!context.mounted) {
    return false;
  }
  FluxerHaptics.light();
  return true;
}

Future<String?> _pickTranslatorEngine(
  BuildContext context,
  SearchProviderCategoryState translators,
) {
  final List<SearchProviderEngine> engines = translators.enabledEngines;
  if (engines.isEmpty) {
    return Future.value();
  }
  if (engines.length == 1) {
    return Future.value(engines.first.id);
  }

  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.show<String>(
    context,
    title: l10n.chatMessageTranslate,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, _) {
      return FluxerBottomSheetContent(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final SearchProviderEngine engine in engines)
              FluxerBottomSheetMenuItem(
                label: engine.name,
                onTap: () => Navigator.of(sheetContext).pop(engine.id),
              ),
          ],
        ),
      );
    },
  );
}
