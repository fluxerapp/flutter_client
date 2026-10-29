import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/settings/providers/view_models/blocked_users_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blocked_user_ids_provider.g.dart';

@Riverpod(keepAlive: true)
Set<String> blockedUserIds(Ref ref) {
  final AsyncValue<List<Friend>> async = ref.watch(
    blockedUsersViewModelProvider,
  );
  return async.when(
    data: (List<Friend> friends) => <String>{
      for (final Friend f in friends) f.id,
    },
    loading: () => <String>{},
    error: (_, _) => <String>{},
  );
}
