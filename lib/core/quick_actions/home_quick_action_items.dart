import 'package:fluxer_app/core/quick_actions/home_quick_action.dart';
import 'package:quick_actions/quick_actions.dart';

class HomeQuickActionTitles {
  const HomeQuickActionTitles({
    required this.dms,
    required this.search,
    required this.notifications,
  });

  final String dms;
  final String search;
  final String notifications;

  String titleFor(HomeQuickAction action) {
    switch (action) {
      case HomeQuickAction.dms:
        return dms;
      case HomeQuickAction.search:
        return search;
      case HomeQuickAction.notifications:
        return notifications;
    }
  }
}

List<HomeQuickAction> homeQuickActionsToRegister({required bool includeDms}) {
  return <HomeQuickAction>[
    if (includeDms) HomeQuickAction.dms,
    HomeQuickAction.search,
    HomeQuickAction.notifications,
  ];
}

List<ShortcutItem> buildHomeQuickActionItems({
  required HomeQuickActionTitles titles,
  required bool includeDms,
}) {
  return <ShortcutItem>[
    for (final HomeQuickAction action in homeQuickActionsToRegister(
      includeDms: includeDms,
    ))
      ShortcutItem(
        type: action.type,
        localizedTitle: titles.titleFor(action),
        icon: action.icon,
      ),
  ];
}
