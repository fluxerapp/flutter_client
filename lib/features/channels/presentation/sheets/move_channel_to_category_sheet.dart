import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/guild_channel_ordering.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';

typedef _MoveTarget = ({String? parentId});

Future<void> showMoveChannelToCategorySheet(
  BuildContext context,
  WidgetRef ref, {
  required String guildId,
  required String channelId,
}) async {
  final List<Channel> channels = await _loadGuildChannels(ref, guildId);
  final int index = channels.indexWhere(
    (Channel channel) => channel.id == channelId,
  );
  if (index == -1 || !context.mounted) {
    return;
  }
  final String? currentParentId = channels[index].parentId;
  final List<Channel> categories = GuildChannelOrdering.sortChannelsForOrdering(
    channels,
  ).where((Channel channel) => channel.isCategory).toList();
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final _MoveTarget? target =
      await FluxerBottomSheet.showScrollable<_MoveTarget>(
        context,
        title: l10n.channelMenuMoveToCategory,
        initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
        minChildSize: 0.25,
        builder: (sheetContext, scrollController, _) {
          final layout = sheetContext.layout;
          Widget option(String label, String? parentId) {
            return FluxerBottomSheetMenuItem(
              label: label,
              isSelected: parentId == currentParentId,
              onTap: () => Navigator.of(sheetContext).pop((parentId: parentId)),
            );
          }

          return ListView(
            controller: scrollController,
            padding: FluxerBottomSheet.scrollViewPadding(
              sheetContext,
              padding: EdgeInsets.fromLTRB(
                layout.s4,
                0,
                layout.s4,
                FluxerBottomSheet.bottomGapOf(sheetContext),
              ),
            ),
            children: <Widget>[
              FluxerBottomSheetGroupColumn(
                children: <Widget>[
                  FluxerMenuGroup(
                    children: <Widget>[
                      option(l10n.channelMenuNoCategory, null),
                      for (final Channel category in categories)
                        option(category.name, category.id),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      );
  if (target == null || target.parentId == currentParentId) {
    return;
  }
  await moveChannelToCategory(
    ref,
    guildId: guildId,
    channelId: channelId,
    parentId: target.parentId,
  );
}

Future<void> moveChannelToCategory(
  WidgetRef ref, {
  required String guildId,
  required String channelId,
  required String? parentId,
}) async {
  final ChannelMoveComputation? computation = computeChannelMoveToParent(
    channels: await _loadGuildChannels(ref, guildId),
    channelId: channelId,
    parentId: parentId,
  );
  if (computation == null) {
    return;
  }
  try {
    await ref
        .read(channelRepositoryProvider)
        .moveChannel(guildId: guildId, operation: computation.operation);
  } on Object catch (error) {
    await showApiErrorFromRoot(
      ApiErrorAction.moveChannel,
      error,
      details: ApiErrorDetails(
        count: ref.read(
          instanceLimitProvider(LimitKeys.maxChannelsPerCategory),
        ),
      ),
    );
  }
}

Future<List<Channel>> _loadGuildChannels(WidgetRef ref, String guildId) async {
  final rows = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannels(guildId);
  return rows.map(Channel.fromRow).toList();
}
