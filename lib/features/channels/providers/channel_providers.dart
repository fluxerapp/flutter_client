import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_providers.g.dart';

@Riverpod(keepAlive: true)
ChannelRepository channelRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final db = ref.watch(fluxerDatabaseProvider);
  return ChannelRepository(client, db);
}

@riverpod
Stream<Channel?> channelById(Ref ref, String id) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.channelDao
      .watchChannelById(id)
      .map((row) => row == null ? null : Channel.fromRow(row));
}
