import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dm_list_scroll_store_provider.g.dart';

/// Keeps the DM conversation list scroll offset alive across sidebar
/// teardowns (switching to a community sidebar and back).
class DmListScrollStore {
  double offset = 0;
}

@Riverpod(keepAlive: true)
DmListScrollStore dmListScrollStore(Ref ref) => DmListScrollStore();
