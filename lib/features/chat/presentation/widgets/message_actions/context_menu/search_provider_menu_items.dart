import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

List<Widget> buildSearchProviderMenuItems({
  required FluxerLocalizations l10n,
  required SearchProviderCategoryState category,
  required String defaultLabel,
  required IconData icon,
  required String query,
  required ValueChanged<String> onOpenUrl,
}) {
  final String trimmed = query.trim();
  final List<SearchProviderEngine> enabled = category.enabledEngines;
  if (trimmed.isEmpty || enabled.isEmpty) {
    return const <Widget>[];
  }
  void open(SearchProviderEngine engine) {
    final String? url = category.buildSearchUrl(engine.id, trimmed);
    if (url != null && url.isNotEmpty) {
      onOpenUrl(url);
    }
  }

  final SearchProviderEngine? defaultEngine = category.effectiveDefaultEngine;
  final List<SearchProviderEngine> alternates = <SearchProviderEngine>[
    for (final SearchProviderEngine engine in enabled)
      if (engine.id != defaultEngine?.id) engine,
  ];
  if (defaultEngine != null && alternates.isEmpty) {
    return <Widget>[
      ContextMenuItem(
        label: defaultLabel,
        icon: icon,
        onTap: () => open(defaultEngine),
      ),
    ];
  }
  return <Widget>[
    FluxerMenuSubmenuItem(
      label: defaultLabel,
      onTriggerSelect: (_) => open(defaultEngine ?? enabled.first),
      submenuBuilder: (BuildContext _) => <Widget>[
        if (defaultEngine != null)
          FluxerMenuItem(
            label: defaultEngine.name,
            hint: l10n.searchProviderDefaultHint,
            onPressed: () => open(defaultEngine),
          ),
        for (final SearchProviderEngine engine in alternates)
          FluxerMenuItem(label: engine.name, onPressed: () => open(engine)),
      ],
    ),
  ];
}
