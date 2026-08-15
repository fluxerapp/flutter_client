import 'package:material_ui/material_ui.dart';

/// Publishes the roles sidebar from GuildRolesSettingsWidget into the
/// community settings modal left column.
class GuildRolesSettingsBridge extends ChangeNotifier {
  Widget? _sidebar;

  Widget? get sidebar => _sidebar;

  void publish(Widget sidebar) {
    _sidebar = sidebar;
    notifyListeners();
  }

  void clear() {
    if (_sidebar == null) {
      return;
    }
    _sidebar = null;
    notifyListeners();
  }
}
