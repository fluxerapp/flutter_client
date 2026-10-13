import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_invite_code_provider.g.dart';

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
