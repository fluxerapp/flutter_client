import 'package:quick_actions/quick_actions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_quick_actions_plugin.g.dart';

class HomeQuickActionsPlugin {
  const HomeQuickActionsPlugin({this.quickActions = const QuickActions()});

  final QuickActions quickActions;

  Future<void> initialize(void Function(String type) callback) {
    return quickActions.initialize(callback);
  }

  Future<void> setShortcutItems(List<ShortcutItem> items) {
    return quickActions.setShortcutItems(items);
  }
}

@Riverpod(keepAlive: true)
HomeQuickActionsPlugin homeQuickActionsPlugin(Ref ref) {
  return const HomeQuickActionsPlugin();
}
