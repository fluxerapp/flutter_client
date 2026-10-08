import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show ProviderFamily;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';

final ProviderFamily<bool, String> mediaDownloadHiddenProvider = Provider
    .autoDispose
    .family<bool, String>((Ref ref, String channelId) {
      if (!ref.watch(anyThreadChannelsActiveProvider)) {
        return false;
      }
      final Channel? post = ref.watch(channelByIdProvider(channelId)).value;
      final String? parentId = post?.parentId;
      if (post == null || !post.isThread || parentId == null) {
        return false;
      }
      if (!ref.watch(threadChannelsActiveProvider(post.guildId))) {
        return false;
      }
      final Channel? parent = ref.watch(channelByIdProvider(parentId)).value;
      return parent != null && forumHidesMediaDownloads(parent);
    });
