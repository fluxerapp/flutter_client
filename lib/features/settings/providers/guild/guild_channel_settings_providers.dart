import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/channels/data/channel_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_channel_settings_providers.g.dart';

@riverpod
Stream<List<Channel>> guildChannelSettingsChannels(
  Ref ref,
  String guildId,
) async* {
  final channelRepository = ref.watch(channelRepositoryProvider);
  await channelRepository.getChannels(guildId);
  yield* channelRepository.watchChannels(guildId);
}

@riverpod
Stream<List<ChannelCategory>> guildChannelSettingsCategories(
  Ref ref,
  String guildId,
) async* {
  final channelRepository = ref.watch(channelRepositoryProvider);
  await channelRepository.getChannels(guildId);
  yield* channelRepository
      .watchChannels(guildId)
      .map(groupChannelsIntoCategories);
}

@riverpod
class GuildChannelSettingsActions extends _$GuildChannelSettingsActions {
  @override
  // Action notifier base type for Riverpod mutations.
  // ignore: avoid_futureor_void
  FutureOr<void> build(String guildId) {}

  Future<void> moveChannel({
    required ChannelMoveOperation operation,
    required List<Channel> currentChannels,
    required List<Channel> optimisticChannels,
  }) async {
    final ChannelRepository repository = ref.read(channelRepositoryProvider);
    final String targetGuildId = guildId;
    final keepAlive = ref.keepAlive();
    try {
      await repository.applyLocalChannels(targetGuildId, optimisticChannels);
      await repository.moveChannel(
        guildId: targetGuildId,
        operation: operation,
        rollbackChannels: currentChannels,
      );
    } finally {
      keepAlive.close();
    }
  }

  Future<void> createChannel(ChannelCreateRequest body) async {
    if (!ref.mounted) {
      return;
    }
    // Async notifier loading state for void action providers.
    state = const AsyncLoading<void>();
    final AsyncValue<void> result = await AsyncValue.guard(() async {
      await ref
          .read(fluxerClientProvider)
          .guilds
          .createGuildChannel(guildId: guildId, body: body);
      await ref.read(channelRepositoryProvider).getChannels(guildId);
    });
    if (!ref.mounted) {
      return;
    }
    // Async notifier result state for void action providers.
    state = result;
  }

  Future<void> createCategory(String name) async {
    await createChannel(
      ChannelCreateRequest4(
        name: name,
        type: GuildCategoryChannelCreateRequestTypeType.guildCategory,
        topic: null,
        url: null,
        parentId: null,
        bitrate: null,
        userLimit: null,
        voiceConnectionLimit: null,
        permissionOverwrites: [],
        rateLimitPerUser: null,
        nsfw: false,
        nsfwOverride: null,
        contentWarningLevel: ContentWarningLevel.inherit,
        contentWarningText: null,
      ),
    );
  }
}
