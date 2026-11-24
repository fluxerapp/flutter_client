import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_settings_store_provider.g.dart';

@Riverpod(keepAlive: true)
LocalSettingsStore localSettingsStore(Ref ref) {
  final LocalSettingsStore store = LocalSettingsStore(
    () => ref.read(fluxerDatabaseProvider),
  );
  ref.onDispose(store.dispose);
  return store;
}
