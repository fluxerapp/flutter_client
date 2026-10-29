import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_entered_from_parent_provider.g.dart';

/// Thread opened from its parent's content, so phone back returns there.
@Riverpod(keepAlive: true)
class ThreadEnteredFromParent extends _$ThreadEnteredFromParent {
  @override
  String? build() => null;

  void enter(String threadId, {required bool fromParent}) {
    state = fromParent ? threadId : null;
  }
}
