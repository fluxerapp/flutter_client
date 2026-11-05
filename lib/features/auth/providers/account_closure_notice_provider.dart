import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_closure_notice_provider.g.dart';

enum AccountClosureKind { scheduledDeletion, immediateDeletion, disabled }

class AccountClosureNotice {
  const AccountClosureNotice({
    required this.kind,
    this.deletionAt,
    this.emailsEnabled = true,
  });

  final AccountClosureKind kind;
  final DateTime? deletionAt;
  final bool emailsEnabled;
}

@Riverpod(keepAlive: true)
class PendingAccountClosureNotice extends _$PendingAccountClosureNotice {
  @override
  AccountClosureNotice? build() {
    ref.listen<bool>(authStateProvider, (bool? previous, bool next) {
      if (next) {
        state = null;
      }
    });
    return null;
  }

  void show(AccountClosureNotice notice) {
    if (identical(state, notice)) {
      return;
    }
    state = notice;
  }

  void clear() {
    state = null;
  }
}
