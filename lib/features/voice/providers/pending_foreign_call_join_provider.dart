import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingForeignCallJoin {
  const PendingForeignCallJoin({
    required this.accountUserId,
    required this.channelId,
    required this.callKitId,
    this.guildId,
  });

  final String accountUserId;
  final String channelId;
  final String callKitId;
  final String? guildId;
}

class PendingForeignCallJoinController
    extends Notifier<PendingForeignCallJoin?> {
  @override
  PendingForeignCallJoin? build() => null;

  void queue(PendingForeignCallJoin join) {
    if (join.accountUserId.isEmpty ||
        join.channelId.isEmpty ||
        join.callKitId.isEmpty) {
      return;
    }
    state = join;
  }

  PendingForeignCallJoin? take() {
    final PendingForeignCallJoin? current = state;
    state = null;
    return current;
  }
}

final NotifierProvider<
  PendingForeignCallJoinController,
  PendingForeignCallJoin?
>
pendingForeignCallJoinProvider =
    NotifierProvider<PendingForeignCallJoinController, PendingForeignCallJoin?>(
      PendingForeignCallJoinController.new,
    );
