import 'package:fluxer_app/material_ui.dart';

class SidebarDragController extends ChangeNotifier {
  Object? _activeItem;
  Offset? _pointer;

  Object? get activeItem => _activeItem;

  Offset? get pointer => _pointer;

  bool get isDragging => _activeItem != null;

  void start(Object item) {
    _activeItem = item;
    _pointer = null;
    notifyListeners();
  }

  void updatePointer(Offset pointer) {
    if (_activeItem == null) {
      return;
    }
    _pointer = pointer;
  }

  void end() {
    if (_activeItem == null) {
      return;
    }
    _activeItem = null;
    _pointer = null;
    notifyListeners();
  }
}
