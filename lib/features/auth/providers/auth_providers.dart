import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/data/sso_auth_service.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthTokenStorage authTokenStorage(Ref ref) {
  return SecureAuthTokenStorage();
}

@Riverpod(keepAlive: true)
SsoAuthService ssoAuthService(Ref ref) {
  return SsoAuthService();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final FluxerClient client = ref.watch(authFluxerClientProvider);
  final db = ref.watch(fluxerDatabaseProvider);
  final tokenStorage = ref.watch(authTokenStorageProvider);
  return AuthRepository(
    client,
    db,
    tokenStorage,
    readInstanceSnapshot: () => ref.read(authInstanceSnapshotProvider),
  );
}
