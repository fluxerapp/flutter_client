import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

FluxerSelectionContextMenuBuilder createSearchSelectionContextMenuBuilder({
  required SearchEnginesState searchEngines,
}) {
  return (BuildContext context, SelectableRegionState state) {
    return AdaptiveTextSelectionToolbar.buttonItems(
      anchors: state.contextMenuAnchors,
      buttonItems: <ContextMenuButtonItem>[
        ...state.contextMenuButtonItems,
        ..._searchContextMenuItems(
          context: context,
          state: state,
          searchEngines: searchEngines,
        ),
      ],
    );
  };
}

List<ContextMenuButtonItem> _searchContextMenuItems({
  required BuildContext context,
  required SelectableRegionState state,
  required SearchEnginesState searchEngines,
}) {
  return <ContextMenuButtonItem>[
    ..._categorySearchItems(
      context: context,
      state: state,
      category: searchEngines.textSearch,
      actionLabel: (SearchProviderEngine engine) => 'Search ${engine.name}',
    ),
    ..._categorySearchItems(
      context: context,
      state: state,
      category: searchEngines.translators,
      actionLabel: (SearchProviderEngine engine) =>
          'Translate with ${engine.name}',
    ),
  ];
}

List<ContextMenuButtonItem> _categorySearchItems({
  required BuildContext context,
  required SelectableRegionState state,
  required SearchProviderCategoryState category,
  required String Function(SearchProviderEngine engine) actionLabel,
}) {
  final items = <ContextMenuButtonItem>[];
  for (final engine in category.enabledEngines) {
    items.add(
      ContextMenuButtonItem(
        label: actionLabel(engine),
        onPressed: () {
          ContextMenuController.removeAny();
          unawaited(() async {
            final String? selectedText = await _readSelectedText(state);
            if (!context.mounted ||
                selectedText == null ||
                selectedText.trim().isEmpty) {
              return;
            }
            final url = buildSearchProviderUrl(
              urlTemplate: engine.urlTemplate,
              value: selectedText.trim(),
            );
            await handleExternalLinkTap(context, url);
          }());
        },
      ),
    );
  }
  return items;
}

Future<String?> _readSelectedText(SelectableRegionState state) async {
  // No public non-deprecated API reads selection text from SelectableRegionState.
  // ignore: deprecated_member_use
  state.copySelection(SelectionChangedCause.toolbar);
  final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
  final String? text = data?.text?.trim();
  if (text == null || text.isEmpty) {
    return null;
  }
  return text;
}
