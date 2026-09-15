import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';

void main() {
  test('token swap between accounts clears the session id hash', () {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(fluxerAuthTokenProvider.notifier).setToken('token-a');
    container.read(currentAuthSessionIdHashProvider.notifier).update('hash-a');
    expect(container.read(currentAuthSessionIdHashProvider), 'hash-a');

    container.read(fluxerAuthTokenProvider.notifier).setToken('token-b');
    expect(container.read(currentAuthSessionIdHashProvider), isNull);
  });
}
