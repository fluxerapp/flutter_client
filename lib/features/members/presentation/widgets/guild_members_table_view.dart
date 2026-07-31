import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/presentation/menus/guild_member_context_menu.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildMembersTableView extends ConsumerStatefulWidget {
  const GuildMembersTableView({
    required this.guildId,
    required this.onMemberTap,
    super.key,
  });

  final String guildId;
  final ValueChanged<Member> onMemberTap;

  @override
  ConsumerState<GuildMembersTableView> createState() =>
      _GuildMembersTableViewState();
}

class _GuildMembersTableViewState extends ConsumerState<GuildMembersTableView> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  bool _bootstrapping = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() => _query = _searchController.text.trim().toLowerCase());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_bootstrap());
    });
  }

  Future<void> _bootstrap() async {
    try {
      await ref
          .read(memberRepositoryProvider)
          .backfillMembersIfSparse(widget.guildId);
    } finally {
      if (mounted) {
        setState(() => _bootstrapping = false);
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _matchesQuery(Member member) {
    if (_query.isEmpty) {
      return true;
    }
    final String displayName = resolveDisplayName(
      guildNickname: member.nickname,
      globalName: member.globalName,
      username: member.username,
    ).toLowerCase();
    final String username = member.username.toLowerCase();
    return displayName.contains(_query) || username.contains(_query);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<List<drift_db.Member>> membersAsync = ref.watch(
      guildMemberRowsProvider(widget.guildId),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _searchController,
            style: TextStyle(color: context.colors.textChat, fontSize: 14),
            decoration: InputDecoration(
              hintText: l10n.guildSettingsMembersSearchHint,
              hintStyle: TextStyle(
                color: context.colors.textPrimaryMuted,
                fontSize: 14,
              ),
              prefixIcon: PhosphorIcon(
                PhosphorIconsBold.magnifyingGlass,
                size: 20,
                color: context.colors.textSecondary,
              ),
            ),
          ),
          SizedBox(height: context.layout.s3),
          Expanded(
            child: membersAsync.when(
              skipLoadingOnReload: false,
              loading: () => _buildLoading(context),
              error: (Object error, _) => _buildError(context, '$error', l10n),
              data: (List<drift_db.Member> rows) {
                if (_bootstrapping && rows.isEmpty) {
                  return _buildLoading(context);
                }
                return _buildMemberList(context, l10n, rows);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return FluxerRefreshScrollView(
      onRefresh: _bootstrap,
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: FluxerLoadingSpinner(color: context.colors.brandPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildError(
    BuildContext context,
    String message,
    FluxerLocalizations l10n,
  ) {
    return FluxerRefreshScrollView(
      onRefresh: _bootstrap,
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: context.colors.statusDanger,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => unawaited(_bootstrap()),
                    child: Text(l10n.retry),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMemberList(
    BuildContext context,
    FluxerLocalizations l10n,
    List<drift_db.Member> rows,
  ) {
    return FutureBuilder<List<Member>>(
      future: ref
          .read(memberRepositoryProvider)
          .getMembersByUserIds(
            widget.guildId,
            rows.map((drift_db.Member row) => row.userId).toList(),
          ),
      builder: (BuildContext context, AsyncSnapshot<List<Member>> snapshot) {
        if (!snapshot.hasData) {
          return _buildLoading(context);
        }
        final List<Member> members = snapshot.data!
            .where(_matchesQuery)
            .toList();
        if (members.isEmpty) {
          return FluxerRefreshScrollView(
            onRefresh: _bootstrap,
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      l10n.channelDetailsMembersEmptyTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.colors.textPrimaryMuted,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return FluxerRefreshScrollView(
          onRefresh: _bootstrap,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                final Member member = members[index];
                return _MemberRow(
                  guildId: widget.guildId,
                  member: member,
                  onTap: () => widget.onMemberTap(member),
                );
              }, childCount: members.length),
            ),
          ],
        );
      },
    );
  }
}

class _MemberRow extends ConsumerWidget {
  const _MemberRow({
    required this.guildId,
    required this.member,
    required this.onTap,
  });

  final String guildId;
  final Member member;
  final VoidCallback onTap;

  GuildMemberResponse _toGuildMemberResponse() {
    return GuildMemberResponse(
      user: UserPartialResponse(
        id: member.id,
        username: member.username,
        discriminator: '0000',
        globalName: member.globalName,
        avatar: member.avatar,
        avatarColor: member.avatarColor,
        flags: 0,
      ),
      roles: member.roles.map((MemberRole role) => role.id).toList(),
      nick: member.nickname,
      joinedAt: DateTime.fromMillisecondsSinceEpoch(0),
      communicationDisabledUntil: member.communicationDisabledUntil,
      mute: false,
      deaf: false,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String displayName = resolveDisplayName(
      guildNickname: member.nickname,
      globalName: member.globalName,
      username: member.username,
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: isTouchPrimaryInput(ref)
            ? () => unawaited(
                GuildMemberContextMenu.show(
                  context,
                  ref,
                  position: contextMenuPositionAtCenter(context),
                  guildId: guildId,
                  member: _toGuildMemberResponse(),
                ),
              )
            : null,
        onSecondaryTap: () => unawaited(
          GuildMemberContextMenu.show(
            context,
            ref,
            position: contextMenuPositionAtCenter(context),
            guildId: guildId,
            member: _toGuildMemberResponse(),
          ),
        ),
        hoverColor: context.colors.backgroundModifierHover,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.layout.s2),
          child: Row(
            children: <Widget>[
              FluxerAvatar.userPresence(
                fallbackText: displayName,
                userId: member.id,
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: member.id,
                  hash: member.avatar,
                ),
                avatarColor: member.avatarColor,
                size: 36,
              ),
              SizedBox(width: context.layout.s3),
              Expanded(
                child: Text(
                  displayName,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
