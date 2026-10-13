import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_settings_tab.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_page_shell.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_settings_providers.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

typedef ChannelSettingsBuilder =
    Widget Function(
      BuildContext context,
      WidgetRef ref,
      Channel channel,
      int permissions,
    );

void scheduleChannelSettingsPop(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (context.mounted) {
      context.pop();
    }
  });
}

class ChannelSettingsGate extends ConsumerWidget {
  const ChannelSettingsGate({
    required this.channelId,
    required this.builder,
    this.tab,
    this.backgroundColor,
    super.key,
  });

  final String channelId;
  final ChannelSettingsTab? tab;
  final Color? backgroundColor;
  final ChannelSettingsBuilder builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<Channel?> channelAsync = ref.watch(
      channelByIdProvider(channelId),
    );
    final AsyncValue<int?> permissionsAsync = ref.watch(
      channelSettingsPermissionBitsProvider(channelId),
    );
    final Color background =
        backgroundColor ?? channelSettingsPageBackgroundColor(context);
    Widget loadingScaffold() => Scaffold(
      backgroundColor: background,
      body: const Center(child: FluxerLoadingSpinner()),
    );
    return channelAsync.when(
      loading: loadingScaffold,
      error: (Object error, StackTrace stackTrace) => Scaffold(
        backgroundColor: background,
        body: Center(
          child: Text(userFacingErrorMessage(error, l10n.networkErrorMessage)),
        ),
      ),
      data: (Channel? channel) {
        if (channel == null) {
          scheduleChannelSettingsPop(context);
          return loadingScaffold();
        }
        return permissionsAsync.when(
          loading: loadingScaffold,
          error: (Object error, StackTrace stackTrace) => Scaffold(
            backgroundColor: background,
            body: Center(
              child: Text(
                userFacingErrorMessage(error, l10n.networkErrorMessage),
              ),
            ),
          ),
          data: (int? permissions) {
            if (permissions == null) {
              return loadingScaffold();
            }
            final bool hasAccess = tab == null
                ? canAccessChannelSettings(
                    channel: channel,
                    permissions: permissions,
                  )
                : canAccessChannelSettingsTab(
                    channel: channel,
                    tab: tab!,
                    permissions: permissions,
                  );
            if (!hasAccess) {
              scheduleChannelSettingsPop(context);
              return loadingScaffold();
            }
            return builder(context, ref, channel, permissions);
          },
        );
      },
    );
  }
}
