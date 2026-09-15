import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/ip_auth_poll_result.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/ip_authorization_view_model.dart';

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository({this.pollResult, this.pollError, this.pollPending});

  final IpAuthPollResult? pollResult;
  final Exception? pollError;
  final Completer<IpAuthPollResult>? pollPending;
  int pollCount = 0;

  @override
  Future<IpAuthPollResult> pollIpAuthorization(String ticket) async {
    pollCount++;
    if (pollPending != null) {
      return pollPending!.future;
    }
    if (pollError != null) {
      throw pollError!;
    }
    return pollResult ?? const IpAuthPending();
  }

  @override
  Future<void> resendIpAuthorization(String ticket) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

ProviderContainer _container(_FakeAuthRepository repo) {
  final container = ProviderContainer(
    overrides: [authRepositoryProvider.overrideWithValue(repo)],
  );
  addTearDown(container.dispose);
  final sub = container.listen(
    ipAuthorizationViewModelProvider('ticket', 0),
    (_, _) {},
  );
  addTearDown(sub.close);
  return container;
}

Future<void> _pump() => Future<void>.delayed(Duration.zero);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('poll completion exposes the session', () async {
    const session = AuthSession(token: 'tok', userId: '123');
    final container = _container(
      _FakeAuthRepository(pollResult: const IpAuthCompleted(session)),
    );
    await _pump();

    expect(
      container
          .read(ipAuthorizationViewModelProvider('ticket', 0))
          .completedSession,
      session,
    );
  });

  test('an expired ticket moves to the expired state', () async {
    final container = _container(
      _FakeAuthRepository(pollResult: const IpAuthExpired()),
    );
    await _pump();

    expect(
      container
          .read(ipAuthorizationViewModelProvider('ticket', 0))
          .pollingState,
      IpAuthPollingState.expired,
    );
  });

  test('a transient error keeps polling rather than expiring', () async {
    final container = _container(
      _FakeAuthRepository(pollError: Exception('network')),
    );
    await _pump();

    expect(
      container
          .read(ipAuthorizationViewModelProvider('ticket', 0))
          .pollingState,
      IpAuthPollingState.polling,
    );
  });

  test('returning to the foreground triggers an immediate poll', () async {
    final repo = _FakeAuthRepository(pollResult: const IpAuthPending());
    final container = _container(repo);
    await _pump();
    expect(repo.pollCount, 1);

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    await _pump();

    expect(repo.pollCount, 2);
  });

  test('does not start a second poll while one is in flight', () async {
    final Completer<IpAuthPollResult> pending = Completer<IpAuthPollResult>();
    final repo = _FakeAuthRepository(pollPending: pending);
    final container = _container(repo);
    await _pump();
    expect(repo.pollCount, 1);

    container.read(appUiForegroundProvider.notifier).setResumed(false);
    container.read(appUiForegroundProvider.notifier).setResumed(true);
    await _pump();
    expect(repo.pollCount, 1);

    pending.complete(const IpAuthPending());
    await _pump();
    expect(repo.pollCount, 2);
  });
}
