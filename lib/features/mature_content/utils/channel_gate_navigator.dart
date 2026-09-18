import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/sheets/channel_access_gate_sheet.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_media_policy_utils.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';

/// Whether the caller may proceed into [channelId].
///
/// Whether a gate is required is answered from [container] alone, so a caller
/// with no usable context can still proceed into an ungated channel. When a
/// gate IS required and there is no live context to show it on, this fails
/// closed and returns false: navigating anyway would walk straight past the
/// gate.
Future<bool> promptForChannelGateIfNeeded({
  required BuildContext? context,
  required ProviderContainer container,
  required String channelId,
  String? guildId,
  ChannelType? channelType,
  Channel? channel,
}) async {
  if (!await isChannelGateBlocking(
    container: container,
    channelId: channelId,
    channel: channel,
  )) {
    return true;
  }
  if (context == null || !context.mounted) {
    return false;
  }
  return showChannelAccessGateSheet(
    context: context,
    container: container,
    channelId: channelId,
    guildId: guildId,
    channelType: channelType,
  );
}

bool isResolvedChannelGateBlocking({
  required Channel channel,
  required ChannelListState channelList,
  required bool nsfwAllowed,
  required MatureContentAgreementsState agreements,
}) {
  Channel? parentCategory;
  final String? parentId = channel.parentId;
  if (parentId != null) {
    final Channel? parent = findChannelById(channelList, parentId);
    if (parent != null && parent.isCategory) {
      parentCategory = parent;
    }
  }
  final Guild? listedGuild = channelList.guild;
  return resolveChannelGateReason(
        context: resolveMatureGateContext(
          channel: channel,
          guild: listedGuild?.id == channel.guildId ? listedGuild : null,
          parentCategory: parentCategory,
        ),
        nsfwAllowed: nsfwAllowed,
        agreements: agreements,
      ) !=
      MatureContentGateReason.none;
}

Future<bool> isChannelGateBlocking({
  required ProviderContainer container,
  required String channelId,
  Channel? channel,
}) async {
  await container.read(matureContentAgreementsProvider.notifier).ensureLoaded();
  final ChannelListState channelList = container.read(
    channelListViewModelProvider,
  );
  final Channel? resolvedChannel =
      channel ?? findChannelById(channelList, channelId);
  if (resolvedChannel != null) {
    return isResolvedChannelGateBlocking(
      channel: resolvedChannel,
      channelList: channelList,
      nsfwAllowed: container.read(sensitiveContentProvider).nsfwAllowed,
      agreements: container.read(matureContentAgreementsProvider),
    );
  }

  final ProviderSubscription<AsyncValue<bool>> gateSub = container.listen(
    shouldShowMatureContentGateProvider(channelId),
    (_, _) {},
  );
  try {
    if (await container.read(
      shouldShowMatureContentGateProvider(channelId).future,
    )) {
      return true;
    }
  } finally {
    gateSub.close();
  }
  return false;
}
