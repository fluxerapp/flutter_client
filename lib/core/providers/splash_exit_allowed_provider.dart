import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_exit_allowed_provider.g.dart';

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

@Riverpod(keepAlive: true)
class SplashRevealComplete extends _$SplashRevealComplete {
  @override
  bool build() => true;

  void complete() {
    if (!ref.mounted) {
      return;
    }
    state = true;
  }

  void reset() {
    state = false;
  }
}

@Riverpod(keepAlive: true)
class SplashRevealZoom extends _$SplashRevealZoom {
  @override
  bool build() => false;

  void setZoom({required bool value}) {
    if (state == value) {
      return;
    }
    state = value;
  }
}
