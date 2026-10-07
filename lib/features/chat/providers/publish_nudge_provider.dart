import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:path_provider/path_provider.dart';

class PublishNudgeState {
  const PublishNudgeState({
    this.hideForever = false,
    this.dismissedMessageIds = const <String>{},
  });

  final bool hideForever;
  final Set<String> dismissedMessageIds;

  PublishNudgeState copyWith({
    bool? hideForever,
    Set<String>? dismissedMessageIds,
  }) {
    return PublishNudgeState(
      hideForever: hideForever ?? this.hideForever,
      dismissedMessageIds: dismissedMessageIds ?? this.dismissedMessageIds,
    );
  }
}

class PublishNudgeController extends Notifier<PublishNudgeState> {
  @override
  PublishNudgeState build() {
    unawaited(_load());
    return const PublishNudgeState();
  }

  void dismiss(String messageId) {
    state = state.copyWith(
      dismissedMessageIds: <String>{...state.dismissedMessageIds, messageId},
    );
  }

  Future<void> hideForever() async {
    state = state.copyWith(hideForever: true);
    final File file = await _file();
    await file.parent.create(recursive: true);
    await file.writeAsString(jsonEncode(<String, bool>{'hide': true}));
  }

  Future<void> _load() async {
    try {
      final File file = await _file();
      if (!file.existsSync()) {
        return;
      }
      final Object? decoded = jsonDecode(await file.readAsString());
      final bool hide = decoded is Map && decoded['hide'] == true;
      if (hide && ref.mounted) {
        state = state.copyWith(hideForever: true);
      }
    } on Object {
      return;
    }
  }

  Future<File> _file() async {
    final Directory dir = await getApplicationSupportDirectory();
    return File('${dir.path}/publish_nudge.json');
  }
}

final NotifierProvider<PublishNudgeController, PublishNudgeState>
publishNudgeControllerProvider =
    NotifierProvider<PublishNudgeController, PublishNudgeState>(
      PublishNudgeController.new,
    );

final Provider<String?> publishNudgeMessageIdProvider = Provider<String?>((
  Ref ref,
) {
  final PublishNudgeState nudge = ref.watch(publishNudgeControllerProvider);
  if (nudge.hideForever) {
    return null;
  }
  final String channelId = ref.watch(
    chatViewModelProvider.select((ChatViewState state) => state.channelId),
  );
  final List<Message> messages = ref.watch(
    chatViewModelProvider.select((ChatViewState state) => state.messages),
  );
  final String? userId = ref.watch(currentUserIdProvider);
  final Channel? channel = ref.watch(channelByIdProvider(channelId)).value;
  if (userId == null || channel == null) {
    return null;
  }
  final int? bits = ref.watch(channelPermissionCacheProvider)[channelId];
  if (bits == null) {
    return null;
  }
  final bool canSend = hasPermission(bits, Permission.sendMessages);
  final bool canManage = hasPermission(bits, Permission.manageMessages);
  Message? newest;
  for (final Message message in messages) {
    if (message.authorId != userId || message.isCrossposted) {
      continue;
    }
    if (nudge.dismissedMessageIds.contains(message.id)) {
      continue;
    }
    if (!canPublishMessage(
      message: message,
      channelType: channel.type,
      isOwnMessage: true,
      canSendMessages: canSend,
      canManageMessages: canManage,
      isDmChannel: false,
      isSendDisabled: false,
    )) {
      continue;
    }
    if (newest == null || _messageIdIsNewer(message.id, newest.id)) {
      newest = message;
    }
  }
  return newest?.id;
});

bool _messageIdIsNewer(String candidate, String current) {
  final BigInt? left = BigInt.tryParse(candidate);
  final BigInt? right = BigInt.tryParse(current);
  if (left == null || right == null) {
    return candidate.compareTo(current) > 0;
  }
  return left > right;
}
