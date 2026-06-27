import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthTokenStorage authTokenStorage(Ref ref) {
  return SecureAuthTokenStorage();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final db = ref.watch(fluxerDatabaseProvider);
  final tokenStorage = ref.watch(authTokenStorageProvider);
  return AuthRepository(
    client,
    db,
    tokenStorage,
    readInstanceSnapshot: () => ref.read(activeInstanceProvider),
  );
}
