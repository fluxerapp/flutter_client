import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_mention_query.dart';
import 'package:fluxer_app/features/chat/utils/search/channel_search_autocomplete.dart';
import 'package:fluxer_app/features/chat/utils/search/channel_search_utils.dart';
import 'package:fluxer_app/features/dm/data/dm_conversation_mapper.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Duration _kUserSuggestionDebounce = Duration(milliseconds: 150);
const int _kUserSuggestionLimit = 12;

class ChannelSearchUserSuggestion {
  const ChannelSearchUserSuggestion({
    required this.id,
    required this.displayName,
    required this.tag,
    this.avatar,
    this.avatarColor,
  });

  final String id;
  final String displayName;
  final String tag;
  final String? avatar;
  final int? avatarColor;
}

typedef ChannelSearchUserSuggestionArgs = ({
  String channelId,
  String? guildId,
  String query,
});

final FutureProviderFamily<
  List<ChannelSearchUserSuggestion>,
  ChannelSearchUserSuggestionArgs
>
channelSearchUserSuggestionsProvider = FutureProvider.autoDispose
    .family<List<ChannelSearchUserSuggestion>, ChannelSearchUserSuggestionArgs>(
      (Ref ref, ChannelSearchUserSuggestionArgs args) async {
        final String query = args.query.trim();
        final String? guildId = args.guildId;
        if (guildId != null && guildId.isNotEmpty) {
          final GuildMentionMemberSearch search = ref.read(
            guildMentionMemberSearchProvider,
          );
          final ParsedMentionQuery parsed = parseMentionQuery(query);
          final List<Member> members = query.isEmpty
              ? await search.searchCached(guildId: guildId, parsed: parsed)
              : (await search.searchCachedThenGateway(
                  guildId: guildId,
                  query: query,
                  parsed: parsed,
                )).members;
          final Map<String, String> discriminators = await search
              .discriminatorsFor(members);
          return <ChannelSearchUserSuggestion>[
            for (final Member member in members.take(_kUserSuggestionLimit))
              ChannelSearchUserSuggestion(
                id: member.id,
                displayName: memberDisplayLabel(member),
                tag: formatChannelSearchUserTag(
                  member.username,
                  discriminators[member.id],
                ),
                avatar: member.avatar,
                avatarColor: member.avatarColor,
              ),
          ];
        }
        final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
        final String? currentUserId = ref.read(currentUserIdProvider);
        final db.DmChannel? dmRow = await database.dmChannelDao
            .getDmChannelById(args.channelId);
        final Set<String> ids = <String>{
          if (dmRow != null)
            ...buildDmRemoteRecipientIds(
              parseDmChannelRecipientIds(dmRow.recipientIds),
              dmRow.recipientId,
              isGroup: isDmGroupType(dmRow.type),
            ),
          if (currentUserId != null && currentUserId.isNotEmpty) currentUserId,
        };
        final List<db.User> users = await database.userDao.getUsersByIds(
          ids.toList(),
        );
        final String normalized = query.toLowerCase();
        final List<ChannelSearchUserSuggestion> suggestions =
            <ChannelSearchUserSuggestion>[
              for (final db.User user in users)
                if (normalized.isEmpty ||
                    user.username.toLowerCase().contains(normalized) ||
                    (user.globalName?.toLowerCase().contains(normalized) ??
                        false))
                  ChannelSearchUserSuggestion(
                    id: user.id,
                    displayName: user.globalName ?? user.username,
                    tag: formatChannelSearchUserTag(
                      user.username,
                      user.discriminator,
                    ),
                    avatar: user.avatar,
                    avatarColor: user.avatarColor,
                  ),
            ]..sort(
              (ChannelSearchUserSuggestion a, ChannelSearchUserSuggestion b) =>
                  a.displayName.toLowerCase().compareTo(
                    b.displayName.toLowerCase(),
                  ),
            );
        return suggestions.take(_kUserSuggestionLimit).toList();
      },
    );

IconData channelSearchFilterIcon(ChannelSearchTokenKind kind) => switch (kind) {
  ChannelSearchTokenKind.from => PhosphorIconsBold.user,
  ChannelSearchTokenKind.mentions => PhosphorIconsBold.at,
  ChannelSearchTokenKind.channel => PhosphorIconsBold.hash,
  ChannelSearchTokenKind.has => PhosphorIconsBold.paperclip,
  ChannelSearchTokenKind.during => PhosphorIconsBold.calendarBlank,
  ChannelSearchTokenKind.before => PhosphorIconsBold.calendarMinus,
  ChannelSearchTokenKind.after => PhosphorIconsBold.calendarPlus,
  ChannelSearchTokenKind.pinned => PhosphorIconsBold.pushPin,
  ChannelSearchTokenKind.authorType => PhosphorIconsBold.robot,
};

String channelSearchFilterLabel(
  FluxerLocalizations l10n,
  ChannelSearchTokenKind kind,
) => switch (kind) {
  ChannelSearchTokenKind.from => l10n.channelSearchFilterFromLabel,
  ChannelSearchTokenKind.mentions => l10n.channelSearchFilterMentionsLabel,
  ChannelSearchTokenKind.channel => l10n.channelSearchFilterInLabel,
  ChannelSearchTokenKind.has => l10n.channelSearchFilterHasLabel,
  ChannelSearchTokenKind.during => l10n.channelSearchFilterDuringLabel,
  ChannelSearchTokenKind.before => l10n.channelSearchFilterBeforeLabel,
  ChannelSearchTokenKind.after => l10n.channelSearchFilterAfterLabel,
  ChannelSearchTokenKind.pinned => l10n.channelSearchFilterPinnedLabel,
  ChannelSearchTokenKind.authorType => l10n.channelSearchFilterAuthorTypeLabel,
};

class ChannelSearchSectionHeader extends StatelessWidget {
  const ChannelSearchSectionHeader({
    required this.title,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final String? action = actionLabel;
    return Padding(
      padding: EdgeInsets.only(top: layout.s4, bottom: layout.s1),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Semantics(
              header: true,
              child: Text(
                title,
                style: context.textStyles.label.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          if (action != null)
            FluxerGestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onAction,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: layout.s1),
                child: Text(
                  action,
                  style: context.textStyles.label.copyWith(
                    color: colors.textLink,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

const double kChannelSearchLeadingExtent = 32;

class ChannelSearchSuggestionRow extends StatelessWidget {
  const ChannelSearchSuggestionRow({
    required this.leading,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.trailing,
    super.key,
  });

  final Widget leading;
  final String title;
  final String? subtitle;
  final String? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final String? sub = subtitle;
    final String? end = trailing;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: layout.radiusLg,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: layout.s1_5),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: kChannelSearchLeadingExtent,
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: leading,
                  ),
                ),
                SizedBox(width: layout.s3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.bodyMedium.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (sub != null && sub.isNotEmpty)
                        Text(
                          sub,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
                if (end != null) ...<Widget>[
                  SizedBox(width: layout.s2),
                  Text(
                    end,
                    style: context.textStyles.label.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChannelSearchFilterSuggestions extends ConsumerStatefulWidget {
  const ChannelSearchFilterSuggestions({
    required this.filter,
    required this.channelId,
    required this.guildId,
    required this.onPick,
    required this.onPickDate,
    super.key,
  });

  final ChannelSearchActiveFilter filter;
  final String channelId;
  final String? guildId;
  final ValueChanged<ChannelSearchToken> onPick;
  final ValueChanged<ChannelSearchTokenKind> onPickDate;

  @override
  ConsumerState<ChannelSearchFilterSuggestions> createState() =>
      _ChannelSearchFilterSuggestionsState();
}

class _ChannelSearchFilterSuggestionsState
    extends ConsumerState<ChannelSearchFilterSuggestions> {
  Timer? _userDebounce;
  String _userQuery = '';

  @override
  void initState() {
    super.initState();
    _userQuery = widget.filter.query.trim();
  }

  @override
  void didUpdateWidget(ChannelSearchFilterSuggestions oldWidget) {
    super.didUpdateWidget(oldWidget);
    final String next = widget.filter.query.trim();
    if (oldWidget.filter.kind != widget.filter.kind) {
      _userDebounce?.cancel();
      _userQuery = next;
      return;
    }
    if (next == _userQuery) {
      return;
    }
    _userDebounce?.cancel();
    _userDebounce = Timer(_kUserSuggestionDebounce, () {
      if (mounted) {
        setState(() => _userQuery = next);
      }
    });
  }

  @override
  void dispose() {
    _userDebounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ChannelSearchTokenKind kind = widget.filter.kind;
    final ({String title, List<Widget> rows}) section = switch (kind) {
      ChannelSearchTokenKind.from || ChannelSearchTokenKind.mentions => (
        title: l10n.channelHeaderSearchUsersTitle,
        rows: _userRows(context, l10n, kind),
      ),
      ChannelSearchTokenKind.channel => (
        title: l10n.channelHeaderSearchChannelsTitle,
        rows: _channelRows(context, l10n),
      ),
      ChannelSearchTokenKind.has => (
        title: l10n.channelHeaderSearchValuesTitle,
        rows: _hasRows(context, l10n),
      ),
      ChannelSearchTokenKind.before ||
      ChannelSearchTokenKind.during ||
      ChannelSearchTokenKind.after => (
        title: l10n.channelHeaderSearchDatesTitle,
        rows: _dateRows(context, l10n, kind),
      ),
      ChannelSearchTokenKind.pinned || ChannelSearchTokenKind.authorType => (
        title: l10n.channelHeaderSearchValuesTitle,
        rows: _valueRows(context, l10n, kind),
      ),
    };
    final layout = context.layout;
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
      children: <Widget>[
        ChannelSearchSectionHeader(title: section.title),
        ...section.rows,
      ],
    );
  }

  Widget _icon(BuildContext context, IconData icon) =>
      PhosphorIcon(icon, size: 20, color: context.colors.textSecondary);

  Widget _status(BuildContext context, Widget child) => Padding(
    padding: EdgeInsets.symmetric(vertical: context.layout.s4),
    child: Center(child: child),
  );

  Widget _emptyText(BuildContext context, String text) => _status(
    context,
    Text(
      text,
      style: context.textStyles.bodySmall.copyWith(
        color: context.colors.textSecondary,
      ),
    ),
  );

  List<Widget> _userRows(
    BuildContext context,
    FluxerLocalizations l10n,
    ChannelSearchTokenKind kind,
  ) {
    final bool settling = _userQuery != widget.filter.query.trim();
    final AsyncValue<List<ChannelSearchUserSuggestion>> users = ref.watch(
      channelSearchUserSuggestionsProvider((
        channelId: widget.channelId,
        guildId: widget.guildId,
        query: _userQuery,
      )),
    );
    final List<ChannelSearchUserSuggestion>? list = users.value;
    if (list == null) {
      return <Widget>[
        _status(
          context,
          const FluxerLoadingSpinner(size: FluxerLoadingSpinnerSize.small),
        ),
      ];
    }
    if (list.isEmpty) {
      if (settling || users.isLoading) {
        return <Widget>[
          _status(
            context,
            const FluxerLoadingSpinner(size: FluxerLoadingSpinnerSize.small),
          ),
        ];
      }
      return <Widget>[_emptyText(context, l10n.channelDetailsSearchUsersEmpty)];
    }
    return <Widget>[
      for (final ChannelSearchUserSuggestion user in list)
        ChannelSearchSuggestionRow(
          key: ValueKey<String>('search-user-${user.id}'),
          leading: FluxerAvatar.user(
            imageUrl: FluxerMediaUrl.userAvatar(
              userId: user.id,
              hash: user.avatar,
            ),
            fallbackText: user.displayName,
            avatarColor: user.avatarColor,
            size: 32,
            showStatus: false,
            userId: user.id,
          ),
          title: user.displayName,
          subtitle: user.tag,
          onTap: () => widget.onPick(
            ChannelSearchToken(
              kind: kind,
              value: user.id,
              label: user.displayName,
            ),
          ),
        ),
    ];
  }

  List<Widget> _channelRows(BuildContext context, FluxerLocalizations l10n) {
    final String normalized = widget.filter.query.trim().toLowerCase();
    final List<Channel> channels = <Channel>[
      for (final ChannelCategory category
          in ref.watch(channelListViewModelProvider).categories)
        for (final Channel channel in category.channels)
          if (isGuildTextBasedChannelType(channel.type) &&
              (normalized.isEmpty ||
                  channel.name.toLowerCase().contains(normalized)))
            channel,
    ];
    if (channels.isEmpty) {
      return <Widget>[
        _emptyText(context, l10n.channelDetailsSearchChannelsEmpty),
      ];
    }
    return <Widget>[
      for (final Channel channel in channels.take(_kUserSuggestionLimit))
        ChannelSearchSuggestionRow(
          key: ValueKey<String>('search-channel-${channel.id}'),
          leading: ChannelIcon(
            type: channel.type,
            channel: channel,
            color: context.colors.textSecondary,
          ),
          title: channel.name,
          onTap: () => widget.onPick(
            ChannelSearchToken(
              kind: ChannelSearchTokenKind.channel,
              value: channel.id,
              label: channel.name,
            ),
          ),
        ),
    ];
  }

  List<Widget> _hasRows(BuildContext context, FluxerLocalizations l10n) {
    final List<MessageSearchContentFilter> filters =
        channelSearchHasSuggestions(
          widget.filter.query,
          (MessageSearchContentFilter filter) =>
              channelSearchContentLabel(l10n, filter),
        );
    return <Widget>[
      for (final MessageSearchContentFilter filter in filters)
        ChannelSearchSuggestionRow(
          key: ValueKey<String>('search-has-${filter.name}'),
          leading: _icon(context, channelSearchContentIcon(filter)),
          title: channelSearchContentLabel(l10n, filter),
          subtitle: channelSearchContentDescription(l10n, filter),
          onTap: () => widget.onPick(channelSearchHasToken(filter)),
        ),
    ];
  }

  List<Widget> _dateRows(
    BuildContext context,
    FluxerLocalizations l10n,
    ChannelSearchTokenKind kind,
  ) {
    final DateTime now = DateTime.now();
    final DateTime? typed = channelSearchParseDate(widget.filter.query);
    final List<(String, DateTime)> options = <(String, DateTime)>[
      if (typed != null) (formatChannelSearchDate(typed), typed),
      (l10n.channelSearchDateToday, now),
      (l10n.channelSearchDateYesterday, now.subtract(const Duration(days: 1))),
    ];
    return <Widget>[
      for (final (String label, DateTime date) in options)
        ChannelSearchSuggestionRow(
          leading: _icon(context, PhosphorIconsBold.calendarBlank),
          title: label,
          trailing: formatChannelSearchDate(date),
          onTap: () => widget.onPick(
            ChannelSearchToken(
              kind: kind,
              value: formatChannelSearchDate(date),
            ),
          ),
        ),
      ChannelSearchSuggestionRow(
        leading: _icon(context, PhosphorIconsBold.calendarDots),
        title: l10n.channelDetailsSearchMoreFiltersPickDate,
        onTap: () => widget.onPickDate(kind),
      ),
    ];
  }

  List<Widget> _valueRows(
    BuildContext context,
    FluxerLocalizations l10n,
    ChannelSearchTokenKind kind,
  ) {
    return <Widget>[
      for (final String value in channelSearchValueSuggestions(
        kind,
        widget.filter.query,
      ))
        ChannelSearchSuggestionRow(
          key: ValueKey<String>('search-value-${kind.key}-$value'),
          leading: _icon(context, channelSearchFilterIcon(kind)),
          title: kind == ChannelSearchTokenKind.pinned
              ? (value == 'true'
                    ? l10n.channelDetailsSearchPinnedTrue
                    : l10n.channelDetailsSearchPinnedFalse)
              : channelSearchAuthorTypeLabel(l10n, value),
          trailing: '${kind.key}:$value',
          onTap: () =>
              widget.onPick(ChannelSearchToken(kind: kind, value: value)),
        ),
    ];
  }
}
