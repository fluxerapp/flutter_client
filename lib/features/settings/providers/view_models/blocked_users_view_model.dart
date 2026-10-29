import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blocked_users_view_model.g.dart';

@Riverpod(keepAlive: true)
class BlockedUsersViewModel extends _$BlockedUsersViewModel {
  @override
  Stream<List<Friend>> build() {
    final repo = ref.watch(friendRepositoryProvider);
    return repo.watchRelationships().map((all) {
      final blocked =
          all.where((f) => f.friendStatus == FriendStatus.blocked).toList()
            ..sort(
              (a, b) => a.displayName.toLowerCase().compareTo(
                b.displayName.toLowerCase(),
              ),
            );
      return blocked;
    });
  }

  Future<void> unblock(String userId) async {
    final repo = ref.read(friendRepositoryProvider);
    await repo.removeRelationship(userId);
  }
}
