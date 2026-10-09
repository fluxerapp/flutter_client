import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_invite_code_provider.g.dart';

/// Stores an invite code extracted from a deep link received before
/// the user is authenticated. Consumed once by login/register, then cleared.
@Riverpod(keepAlive: true)
class PendingInviteCode extends _$PendingInviteCode {
  @override
  String? build() => null;

  void store(String code) {
    if (state == code) {
      return;
    }
    state = code;
  }

  String? consume() {
    final code = state;
    state = null;
    return code;
  }
}
