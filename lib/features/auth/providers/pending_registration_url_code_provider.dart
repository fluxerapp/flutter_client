import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_registration_url_code_provider.g.dart';

@Riverpod(keepAlive: true)
class PendingRegistrationUrlCode extends _$PendingRegistrationUrlCode {
  @override
  String? build() => null;

  // ignore: use_setters_to_change_properties, Riverpod notifier method.
  void store(String code) => state = code;

  String? consume() {
    final String? code = state;
    state = null;
    return code;
  }
}
