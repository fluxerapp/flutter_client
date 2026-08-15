import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_empty_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_entry_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_filter_row.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_audit_log_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class GuildAuditLogWidget extends ConsumerStatefulWidget {
  const GuildAuditLogWidget({
    required this.guildId,
    required this.state,
    super.key,
  });

  final String guildId;
  final GuildAuditLogState state;

  @override
  ConsumerState<GuildAuditLogWidget> createState() =>
      _GuildAuditLogWidgetState();
}

class _GuildAuditLogWidgetState extends ConsumerState<GuildAuditLogWidget> {
  static const int _headerItemCount = 4;

  final ScrollController _scrollController = ScrollController();
  final Set<String> _expandedIds = <String>{};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients || widget.state.isLoadingMore) {
      return;
    }
    const double threshold = 200;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - threshold) {
      unawaited(
        ref.read(guildAuditLogProvider(widget.guildId).notifier).loadMore(),
      );
    }
  }

  int _itemCount() {
    if (widget.state.entries.isEmpty && widget.state.hasSuccessfulEmptyLoad) {
      return _headerItemCount + 1;
    }
    if (widget.state.entries.isEmpty) {
      return _headerItemCount + 1;
    }
    return _headerItemCount +
        widget.state.entries.length +
        (widget.state.isLoadingMore ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String locale = Localizations.localeOf(context).toString();
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    final Map<String, String> channelNames = _buildChannelNames();
    final Map<String, Channel> channelsById = _buildChannelsById();
    final Map<String, String> roleNames = _buildRoleNames();
    final Map<String, String> userNames = widget.state.userNames;
    return ListView.builder(
      controller: _scrollController,
      padding: settingsScrollPadding(context),
      itemCount: _itemCount(),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Text(
            l10n.guildMenuSettingsActivityLog,
            style: context.textStyles.heading.copyWith(
              fontSize: 18,
              color: context.colors.textChat,
            ),
          );
        }
        if (index == 1) {
          return SizedBox(height: context.layout.s1);
        }
        if (index == 2) {
          return Text(
            l10n.guildSettingsAuditLogDescription,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          );
        }
        if (index == 3) {
          return Column(
            children: <Widget>[
              SizedBox(height: context.layout.s4),
              GuildAuditLogFilterRow(
                guildId: widget.guildId,
                state: widget.state,
                l10n: l10n,
              ),
              SizedBox(height: context.layout.s4),
            ],
          );
        }
        if (widget.state.entries.isEmpty &&
            widget.state.hasSuccessfulEmptyLoad &&
            index == _headerItemCount) {
          return GuildAuditLogEmptyState(l10n: l10n);
        }
        if (widget.state.entries.isEmpty && index == _headerItemCount) {
          return const Center(child: FluxerLoadingSpinner());
        }
        final int entryIndex = index - _headerItemCount;
        if (entryIndex < 0) {
          return const SizedBox.shrink();
        }
        if (entryIndex >= widget.state.entries.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: FluxerLoadingSpinner()),
          );
        }
        final GuildAuditLogEntry entry = widget.state.entries[entryIndex];
        return Padding(
          padding: EdgeInsets.only(bottom: context.layout.s2),
          child: GuildAuditLogEntryCard(
            entry: entry,
            actorName: widget.state.actorName(
              entry.userId,
              l10n.guildSettingsAuditLogUnknownUser,
            ),
            actorAvatarUrl: widget.state.actorAvatarUrl(entry.userId),
            actorAvatarColor: widget.state.actorAvatarColor(entry.userId),
            actorUserId: entry.userId,
            isExpanded: _expandedIds.contains(entry.id),
            onToggle: () => setState(() {
              if (_expandedIds.contains(entry.id)) {
                _expandedIds.remove(entry.id);
              } else {
                _expandedIds.add(entry.id);
              }
            }),
            l10n: l10n,
            locale: locale,
            use12Hour: use12Hour,
            channelNames: channelNames,
            channelsById: channelsById,
            roleNames: roleNames,
            userNames: userNames,
          ),
        );
      },
    );
  }

  Map<String, String> _buildChannelNames() {
    final Map<String, Channel> channelsById = _buildChannelsById();
    return <String, String>{
      for (final MapEntry<String, Channel> entry in channelsById.entries)
        entry.key: entry.value.type == ChannelType.guildText
            ? '#${entry.value.name}'
            : entry.value.name,
    };
  }

  Map<String, Channel> _buildChannelsById() {
    final AsyncValue<List<Channel>> channelsAsync = ref.watch(
      guildSettingsChannelsProvider(widget.guildId),
    );
    final List<Channel> channels = channelsAsync.value ?? const <Channel>[];
    return <String, Channel>{
      for (final Channel channel in channels) channel.id: channel,
    };
  }

  Map<String, String> _buildRoleNames() {
    final AsyncValue<Map<String, db.Role>> rolesAsync = ref.watch(
      guildRolesByIdProvider(widget.guildId),
    );
    final Map<String, db.Role> roles =
        rolesAsync.value ?? const <String, db.Role>{};
    return <String, String>{
      for (final MapEntry<String, db.Role> entry in roles.entries)
        entry.key: entry.value.name,
    };
  }
}
