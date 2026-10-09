library;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math' as math;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/domain/announcement_follow.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_unread_state.dart';
import 'package:fluxer_app/features/channels/presentation/category_menu_data.dart';
import 'package:fluxer_app/features/channels/presentation/channel_menu_data.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_flow.dart';
import 'package:fluxer_app/features/channels/presentation/delete_channel_flow.dart';
import 'package:fluxer_app/features/channels/presentation/modals/show_channel_invite_modal.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_follow_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_notification_settings_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_list_typing_indicator.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar_skeleton.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/voice_channel_participants.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/voice_channel_user_count.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_entries_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_scroll_store_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/channels/utils/channel_scroll_indicator_severity.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/channels/utils/show_channel_debug_sheet.dart';
import 'package:fluxer_app/features/chat/utils/messages/delete_my_messages_in_channel_action.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_link.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/members/utils/guild_members_page_permissions.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/presentation/thread_sidebar_tile.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_member_count_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/navigation_item_semantics.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'guild_sidebar_banner_layout.dart';
part 'guild_sidebar_header.dart';
part 'guild_sidebar_channel_list.dart';
part 'guild_sidebar_channel_tile.dart';
part 'guild_sidebar_category_header.dart';
part 'guild_sidebar_helpers.dart';
part 'guild_sidebar_members_tile.dart';

class GuildSidebar extends ConsumerStatefulWidget {
  const GuildSidebar({super.key});

  @override
  ConsumerState<GuildSidebar> createState() => _GuildSidebarState();
}

class _GuildSidebarState extends ConsumerState<GuildSidebar> {
  Future<void> _handleServerHeaderTap(BuildContext context, Guild guild) async {
    if (isMobileLayout(context)) {
      await presentGuildMenuSheet(context, ref, guild: guild);
      return;
    }

    await ref
        .read(guildPermissionsProvider.notifier)
        .refreshPermissions(guild.id);
    if (!context.mounted) {
      return;
    }

    final int permissions = ref.read(guildPermissionsProvider)[guild.id] ?? 0;
    if (canOpenGuildSettingsForRef(
      ref: ref,
      permissions: permissions,
      guild: guild,
    )) {
      await context.push(RoutePaths.guildSettingsPath(guild.id));
      return;
    }

    await presentGuildMenuSheet(context, ref, guild: guild);
  }

  @override
  Widget build(BuildContext context) {
    final String? guildId = ref.watch(activeGuildIdProvider);
    final Set<String> trackedUnavailableGuildIds = ref.watch(
      guildAvailabilityProvider,
    );
    final Guild? guild = ref.watch(
      channelListViewModelProvider.select((s) => s.guild),
    );
    final bool guildOutageUnavailable =
        guildId != null &&
        isGuildOutageUnavailable(
          guildId: guildId,
          trackedUnavailableGuildIds: trackedUnavailableGuildIds,
          guild: guild,
        );
    final bool hasReceivedInitialChannelList = ref.watch(
      channelListViewModelProvider.select(
        (s) => s.hasReceivedInitialChannelList,
      ),
    );
    final bool guildReady =
        guild != null && guildId != null && guild.id == guildId;

    final bool showStaticHeader =
        guildOutageUnavailable || !guildReady || !hasReceivedInitialChannelList;

    return Container(
      width: isMobileLayout(context) ? null : context.layout.sidebarWidth,
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      decoration: BoxDecoration(
        color: context.colors.channelSidebarBackground,
        border: Border(right: BorderSide(color: context.colors.borderColor)),
      ),
      child: Column(
        children: [
          if (showStaticHeader)
            GuildSidebarHeader(
              guild: guild,
              outageUnavailable: guildOutageUnavailable,
              onTap: guildOutageUnavailable || guild == null
                  ? null
                  : () => unawaited(_handleServerHeaderTap(context, guild)),
            ),
          Expanded(
            child: showStaticHeader
                ? const GuildSidebarSkeleton()
                : _GuildSidebarChannelListHost(
                    activeGuildId: guildId,
                    guild: guild,
                    onHeaderTap: guildOutageUnavailable
                        ? null
                        : () =>
                              unawaited(_handleServerHeaderTap(context, guild)),
                  ),
          ),
        ],
      ),
    );
  }
}
