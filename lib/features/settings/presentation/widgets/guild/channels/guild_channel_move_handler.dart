import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_channel_settings_providers.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<void> performGuildChannelMove({
  required WidgetRef ref,
  required BuildContext context,
  required String guildId,
  required ChannelMoveComputation computation,
  required List<Channel> currentChannels,
}) async {
  try {
    await ref
        .read(guildChannelSettingsActionsProvider(guildId).notifier)
        .moveChannel(
          operation: computation.operation,
          currentChannels: currentChannels,
          optimisticChannels: computation.updatedChannels,
        );
  } on Object catch (_) {
    if (!context.mounted) {
      return;
    }
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: FluxerLocalizations.of(context).genericError,
            variant: FluxerToastVariant.danger,
          ),
        );
  }
}
