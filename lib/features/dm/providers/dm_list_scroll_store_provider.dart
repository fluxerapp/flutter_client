import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dm_list_scroll_store_provider.g.dart';

class DmListScrollStore {
  double? offset;
}

@Riverpod(keepAlive: true)
DmListScrollStore dmListScrollStore(Ref ref) => DmListScrollStore();
