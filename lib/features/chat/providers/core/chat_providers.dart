import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_providers.g.dart';

@Riverpod(keepAlive: true)
MessageRepository messageRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final dio = ref.watch(fluxerDioProvider);
  final db = ref.watch(fluxerDatabaseProvider);
  final currentUserId = ref.watch(currentUserIdProvider);
  return MessageRepository(
    client,
    dio,
    db,
    currentUserId,
    mentionContextCache: ref.watch(messageMentionContextCacheProvider),
  );
}
