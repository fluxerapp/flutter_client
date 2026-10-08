import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';

Future<void> applyReplacementSession(
  WidgetRef ref, {
  required String token,
  required String authSessionIdHash,
}) async {
  ref.read(gatewayConnectionProvider).setToken(token);
  ref.read(fluxerAuthTokenProvider.notifier).setToken(token);
  ref.read(currentAuthSessionIdHashProvider.notifier).update(authSessionIdHash);
  await ref.read(authRepositoryProvider).persistRotatedToken(token);
}
