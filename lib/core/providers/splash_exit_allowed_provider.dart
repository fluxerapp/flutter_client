import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_exit_allowed_provider.g.dart';

/// Gates splash exit until the reveal overlay mounts the main shell
@Riverpod(keepAlive: true)
class SplashExitAllowed extends _$SplashExitAllowed {
  @override
  bool build() => false;

  void allow() {
    state = true;
  }

  void reset() {
    state = false;
  }
}
