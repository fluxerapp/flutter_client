import 'package:fluxer_app/material_ui.dart';

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
