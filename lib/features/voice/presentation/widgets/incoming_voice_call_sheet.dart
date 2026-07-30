import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String kIncomingVoiceResultAccept = 'accept';
const String kIncomingVoiceResultReject = 'reject';
const String kIncomingVoiceResultIgnore = 'ignore';
const String kIncomingVoiceResultRemoteDismiss = 'remote_dismiss';

String _resolveSheetHeaderTitle({
  required DmConversation? dm,
  required Channel? guildChannel,
  required String channelId,
  required FluxerLocalizations l10n,
}) {
  if (guildChannel != null) {
    final String name = guildChannel.name;
    return name.isNotEmpty ? name : l10n.incomingVoiceCallTitle;
  }
  if (dm != null) {
    return dm.displayName;
  }
  return l10n.incomingVoiceCallTitle;
}

/// Web mobile parity: [BottomSheet] with Accept / Reject / Ignore.
Future<String?> showIncomingVoiceCallSheet(
  BuildContext context, {
  required WidgetRef ref,
  required String channelId,
}) {
  final List<DmConversation> conversations = ref.read(
    dmViewModelProvider.select((DmViewState s) => s.conversations),
  );
  final DmConversation? dm = findDmById(conversations, channelId);
  final AsyncValue<Channel?> channelAsync = ref.read(
    channelByIdProvider(channelId),
  );
  final Channel? guildChannel = switch (channelAsync) {
    AsyncData(:final value) => value,
    _ => null,
  };
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String headerTitle = _resolveSheetHeaderTitle(
    dm: dm,
    guildChannel: guildChannel,
    channelId: channelId,
    l10n: l10n,
  );
  return FluxerBottomSheet.showScrollable<String>(
    context,
    useRootNavigator: true,
    title: headerTitle,
    isDismissible: false,
    initialChildSize: 0.58,
    minChildSize: 0.28,
    maxChildSize: 0.92,
    builder: (BuildContext sheetContext, ScrollController scrollController, _) {
      return _IncomingVoiceCallSheetBody(
        sheetContext: sheetContext,
        scrollController: scrollController,
        channelId: channelId,
      );
    },
  );
}

class _IncomingVoiceCallSheetBody extends ConsumerWidget {
  const _IncomingVoiceCallSheetBody({
    required this.sheetContext,
    required this.scrollController,
    required this.channelId,
  });

  final BuildContext sheetContext;
  final ScrollController scrollController;
  final String channelId;

  void _pop(String value) {
    Navigator.of(sheetContext, rootNavigator: true).pop<String>(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef bodyRef) {
    bodyRef.listen<List<String>>(pendingIncomingVoiceChannelIdsProvider, (
      List<String>? _,
      List<String> next,
    ) {
      if (!next.contains(channelId)) {
        _pop(kIncomingVoiceResultRemoteDismiss);
      }
    });
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<DmConversation> conversations = bodyRef.watch(
      dmViewModelProvider.select((DmViewState s) => s.conversations),
    );
    final DmConversation? dm = findDmById(conversations, channelId);
    final AsyncValue<Channel?> channelWatch = bodyRef.watch(
      channelByIdProvider(channelId),
    );
    final Channel? guildChannel = switch (channelWatch) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final String centeredName = _resolveSheetHeaderTitle(
      dm: dm,
      guildChannel: guildChannel,
      channelId: channelId,
      l10n: l10n,
    );
    final layout = context.layout;
    return SingleChildScrollView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PhosphorIcon(
                PhosphorIconsBold.phoneIncoming,
                size: 18,
                color: context.colors.textSecondary,
              ),
              SizedBox(width: layout.s2),
              Text(
                l10n.incomingVoiceCallLabel,
                style: context.textStyles.categoryName.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: layout.s4),
          Center(child: _buildAvatar(context, dm: dm)),
          SizedBox(height: layout.s3),
          Text(
            centeredName,
            textAlign: TextAlign.center,
            style: context.textStyles.channelName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: layout.s4),
          FilledButton.icon(
            onPressed: () => _pop(kIncomingVoiceResultAccept),
            icon: PhosphorIcon(
              PhosphorIconsFill.phone,
              size: 18,
              color: context.colors.textPrimary,
            ),
            label: Text(l10n.incomingVoiceCallAccept),
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
          SizedBox(height: layout.s3),
          FilledButton.icon(
            onPressed: () => _pop(kIncomingVoiceResultReject),
            icon: PhosphorIcon(
              PhosphorIconsBold.x,
              size: 18,
              color: context.colors.buttonDangerText,
            ),
            label: Text(l10n.incomingVoiceCallDecline),
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: context.colors.buttonDangerFill,
              foregroundColor: context.colors.buttonDangerText,
            ),
          ),
          SizedBox(height: layout.s3),
          OutlinedButton(
            onPressed: () => _pop(kIncomingVoiceResultIgnore),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
            child: Text(l10n.incomingVoiceCallIgnore),
          ),
          SizedBox(height: layout.s4),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, {required DmConversation? dm}) {
    const double size = 80;
    if (dm != null && dm.isGroup) {
      return groupDmAvatarCluster(dm: dm, size: size, status: dm.groupStatus);
    }
    if (dm != null) {
      return FluxerAvatar.userPresence(
        fallbackText: dm.recipientName,
        userId: dm.recipientId,
        imageUrl: FluxerMediaUrl.userAvatar(
          userId: dm.recipientId,
          hash: dm.recipientAvatar,
        ),
        size: size,
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.backgroundTertiary,
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsFill.phone,
          size: 36,
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
