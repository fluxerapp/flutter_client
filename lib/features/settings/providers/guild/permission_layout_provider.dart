import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_layout_provider.g.dart';

enum PermissionLayoutMode { comfy, dense }

enum PermissionGridMode { single, grid }

class PermissionLayoutState {
  const PermissionLayoutState({
    this.layoutMode = PermissionLayoutMode.comfy,
    this.gridMode = PermissionGridMode.single,
  });

  final PermissionLayoutMode layoutMode;
  final PermissionGridMode gridMode;

  bool get isComfy => layoutMode == PermissionLayoutMode.comfy;
  bool get isDense => layoutMode == PermissionLayoutMode.dense;
  bool get isGrid => gridMode == PermissionGridMode.grid;

  PermissionLayoutState copyWith({
    PermissionLayoutMode? layoutMode,
    PermissionGridMode? gridMode,
  }) {
    return PermissionLayoutState(
      layoutMode: layoutMode ?? this.layoutMode,
      gridMode: gridMode ?? this.gridMode,
    );
  }
}

@riverpod
class PermissionLayout extends _$PermissionLayout {
  @override
  PermissionLayoutState build() => const PermissionLayoutState();

  void toggleLayoutMode() {
    state = state.copyWith(
      layoutMode: state.isComfy
          ? PermissionLayoutMode.dense
          : PermissionLayoutMode.comfy,
    );
  }

  void toggleGridMode() {
    state = state.copyWith(
      gridMode: state.isGrid
          ? PermissionGridMode.single
          : PermissionGridMode.grid,
    );
  }
}
