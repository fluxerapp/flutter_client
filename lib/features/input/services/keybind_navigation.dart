import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_entries_provider.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';
import 'package:fluxer_app/features/quick_switcher/domain/recent_channel_visit.dart';
import 'package:fluxer_app/features/quick_switcher/providers/recent_channel_visits_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class LastGuildBeforeDmsNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void remember(String? guildId) {
    if (guildId != null && guildId.isNotEmpty) {
      state = guildId;
    }
  }
}

final lastGuildBeforeDmsProvider =
    NotifierProvider<LastGuildBeforeDmsNotifier, String?>(
      LastGuildBeforeDmsNotifier.new,
    );

class KeybindNavigation {
  KeybindNavigation(this._ref);

  final WidgetRef _ref;

  ProviderContainer get _container => _ref.container;

  void goToDmHome() {
    DrawerNavigationCoordinator.navigateToContent(_container, RoutePaths.me);
  }

  void goToGuild(String guildId) {
    _ref
        .read(lastGuildBeforeDmsProvider.notifier)
        .remember(_ref.read(activeGuildIdProvider));
    DrawerNavigationCoordinator.selectGuild(_container, guildId);
  }

  void goToGuildSlot(int slot) {
    if (slot == 1) {
      goToDmHome();
      return;
    }
    final List<Guild> guilds = _ref.read(guildListViewModelProvider).guilds;
    final int index = slot - 2;
    if (index < 0 || index >= guilds.length) {
      return;
    }
    goToGuild(guilds[index].id);
  }

  void goToAdjacentGuild({required bool previous}) {
    final List<Guild> guilds = _ref.read(guildListViewModelProvider).guilds;
    if (guilds.isEmpty) {
      return;
    }
    final String? activeGuildId = _ref.read(activeGuildIdProvider);
    if (activeGuildId == null) {
      goToGuild(guilds.first.id);
      return;
    }
    final int index = guilds.indexWhere((Guild g) => g.id == activeGuildId);
    if (index < 0) {
      goToGuild(guilds.first.id);
      return;
    }
    final int nextIndex = previous
        ? (index - 1).clamp(0, guilds.length - 1)
        : (index + 1).clamp(0, guilds.length - 1);
    goToGuild(guilds[nextIndex].id);
  }

  Future<void> goToAdjacentChannel({
    required BuildContext context,
    required bool previous,
  }) async {
    final String? guildId = _ref.read(activeGuildIdProvider);
    if (guildId == null) {
      return;
    }
    final List<GuildSidebarEntry> entries = _ref.read(
      guildSidebarEntriesProvider,
    );
    final List<Channel> channels = <Channel>[];
    for (final GuildSidebarEntry entry in entries) {
      if (entry.kind == GuildSidebarEntryKind.channel &&
          entry.channel != null) {
        channels.add(entry.channel!);
      }
    }
    if (channels.isEmpty) {
      return;
    }
    final String? activeChannelId = _ref.read(activeChannelIdProvider);
    var index = channels.indexWhere((Channel c) => c.id == activeChannelId);
    if (index < 0) {
      index = 0;
    } else {
      index = previous
          ? (index - 1).clamp(0, channels.length - 1)
          : (index + 1).clamp(0, channels.length - 1);
    }
    final Channel channel = channels[index];
    await navigateToChannelContent(
      context: context,
      ref: _ref,
      guildId: guildId,
      channelId: channel.id,
    );
  }

  Future<void> goHistory({
    required BuildContext context,
    required bool back,
  }) async {
    final List<RecentChannelVisit> visits = _ref.read(
      recentChannelVisitsProvider,
    );
    if (visits.length < 2) {
      return;
    }
    final String? currentChannelId = _ref.read(activeChannelIdProvider);
    var startIndex = visits.indexWhere(
      (RecentChannelVisit v) => v.channelId == currentChannelId,
    );
    if (startIndex < 0) {
      startIndex = 0;
    }
    final int targetIndex = back ? startIndex + 1 : startIndex - 1;
    if (targetIndex < 0 || targetIndex >= visits.length) {
      return;
    }
    final RecentChannelVisit visit = visits[targetIndex];
    await navigateToChannelContent(
      context: context,
      ref: _ref,
      guildId: visit.guildId,
      channelId: visit.channelId,
    );
  }

  Future<void> goUnreadChannel({
    required BuildContext context,
    required bool previous,
    required bool mentionsOnly,
    required List<QuickSwitcherUnreadChannel> unread,
  }) async {
    if (unread.isEmpty) {
      return;
    }
    final Iterable<QuickSwitcherUnreadChannel> filtered = mentionsOnly
        ? unread.where((QuickSwitcherUnreadChannel c) => c.mentionCount > 0)
        : unread;
    final List<QuickSwitcherUnreadChannel> list = filtered.toList();
    if (list.isEmpty) {
      return;
    }
    final String? currentChannelId = _ref.read(activeChannelIdProvider);
    var index = list.indexWhere(
      (QuickSwitcherUnreadChannel c) => c.channelId == currentChannelId,
    );
    if (index < 0) {
      index = previous ? list.length - 1 : 0;
    } else {
      index = previous
          ? (index - 1 + list.length) % list.length
          : (index + 1) % list.length;
    }
    final QuickSwitcherUnreadChannel target = list[index];
    await navigateToChannelContent(
      context: context,
      ref: _ref,
      guildId: target.guildId,
      channelId: target.channelId,
    );
  }

  void toggleLastGuildAndDms() {
    final String? activeGuildId = _ref.read(activeGuildIdProvider);
    final String location = _ref.read(currentLocationProvider);
    if (location.startsWith('/channels/@me')) {
      final String? lastGuild = _ref.read(lastGuildBeforeDmsProvider);
      if (lastGuild != null && lastGuild.isNotEmpty) {
        goToGuild(lastGuild);
      } else {
        final List<Guild> guilds = _ref.read(guildListViewModelProvider).guilds;
        if (guilds.isNotEmpty) {
          goToGuild(guilds.first.id);
        }
      }
      return;
    }
    if (activeGuildId != null) {
      _ref.read(lastGuildBeforeDmsProvider.notifier).remember(activeGuildId);
    }
    goToDmHome();
  }

  void goToAdjacentGuildTab({required bool previous}) {
    final List<String> targets = <String>['@me'];
    final List<Guild> guilds = _ref.read(guildListViewModelProvider).guilds;
    targets.addAll(guilds.map((Guild g) => g.id));
    final String location = _ref.read(currentLocationProvider);
    final String? activeGuildId = _ref.read(activeGuildIdProvider);
    var index = 0;
    if (location.startsWith('/channels/@me')) {
      index = 0;
    } else if (activeGuildId != null) {
      index = targets.indexOf(activeGuildId);
      if (index < 0) {
        index = 1;
      }
    }
    final int nextIndex = previous
        ? (index - 1 + targets.length) % targets.length
        : (index + 1) % targets.length;
    final String target = targets[nextIndex];
    if (target == '@me') {
      goToDmHome();
      return;
    }
    goToGuild(target);
  }

  Future<void> goToCurrentCall({required BuildContext context}) async {
    final voice = _ref.read(voiceSessionProvider);
    if (!voice.isConnected || voice.channelId == null) {
      return;
    }
    await navigateToChannelContent(
      context: context,
      ref: _ref,
      guildId: voice.guildId,
      channelId: voice.channelId!,
    );
  }
}
