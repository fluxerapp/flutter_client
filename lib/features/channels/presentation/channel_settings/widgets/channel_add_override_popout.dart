import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const int _kMemberPreviewLimit = 10;

class ChannelAddOverridePopout extends ConsumerStatefulWidget {
  const ChannelAddOverridePopout({
    required this.guildId,
    required this.rolesById,
    required this.existingOverwriteIds,
    required this.onSelect,
    required this.onClose,
    this.width = 320,
    super.key,
  });

  final String guildId;
  final Map<String, db.Role> rolesById;
  final Set<String> existingOverwriteIds;
  final void Function(String id, int type, String name) onSelect;
  final VoidCallback onClose;
  final double width;

  @override
  ConsumerState<ChannelAddOverridePopout> createState() =>
      _ChannelAddOverridePopoutState();
}

class _ChannelAddOverridePopoutState
    extends ConsumerState<ChannelAddOverridePopout> {
  String _searchQuery = '';
  List<Member> _members = const <Member>[];
  bool _isLoadingMembers = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_loadMembers());
    });
  }

  Future<void> _loadMembers() async {
    setState(() => _isLoadingMembers = true);
    final GuildMentionMemberSearch search = ref.read(
      guildMentionMemberSearchProvider,
    );
    final ParsedMentionQuery parsed = parseMentionQuery(_searchQuery);
    final List<Member> members = await search.searchCached(
      guildId: widget.guildId,
      parsed: parsed,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _members = members;
      _isLoadingMembers = false;
    });
    if (_searchQuery.trim().isEmpty) {
      return;
    }
    final bool shouldFetch = await search.shouldFetchFromGateway(
      widget.guildId,
      _searchQuery,
    );
    if (!shouldFetch || !mounted) {
      return;
    }
    final ({List<Member> members, Set<String> remoteMemberIds}) result =
        await search.fetchGatewayAndMerge(
          guildId: widget.guildId,
          query: _searchQuery,
          parsed: parsed,
        );
    if (!mounted) {
      return;
    }
    setState(() => _members = result.members);
  }

  void _onSearchChanged(String value) {
    setState(() => _searchQuery = value);
    unawaited(_loadMembers());
  }

  List<db.Role> get _availableRoles {
    final List<db.Role> roles = widget.rolesById.values
        .where(
          (db.Role role) =>
              role.id != widget.guildId &&
              !widget.existingOverwriteIds.contains(role.id),
        )
        .toList();
    roles.sort((db.Role a, db.Role b) {
      if (a.position != b.position) {
        return b.position.compareTo(a.position);
      }
      return BigInt.parse(a.id).compareTo(BigInt.parse(b.id));
    });
    return roles;
  }

  List<Member> get _availableMembers {
    final ParsedMentionQuery parsed = parseMentionQuery(_searchQuery);
    final List<Member> filtered = filterGuildMembersForAutocomplete(
      members: _members,
      parsed: parsed,
      limit: _kMemberPreviewLimit,
      discriminatorByUserId: const <String, String>{},
    );
    return filtered
        .where(
          (Member member) => !widget.existingOverwriteIds.contains(member.id),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<db.Role> roles = _availableRoles;
    final List<Member> members = _availableMembers;
    return Material(
      elevation: 8,
      color: context.colors.backgroundSecondary,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: widget.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: FluxerInput(
                hint: l10n.channelSettingsPermissionsSearchRolesOrMembers,
                prefixIcon: const PhosphorIcon(
                  PhosphorIconsBold.magnifyingGlass,
                  size: 16,
                ),
                onChanged: _onSearchChanged,
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 280),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 8),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
                    child: Text(
                      l10n.channelSettingsPermissionsRolesAndMembers,
                      style: context.textStyles.categoryName,
                    ),
                  ),
                  for (final db.Role role in roles)
                    _OverridePickTile(
                      label: role.name,
                      onTap: () {
                        widget.onSelect(role.id, 0, role.name);
                        widget.onClose();
                      },
                    ),
                  if (_isLoadingMembers && members.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(child: FluxerLoadingSpinner()),
                    ),
                  for (final Member member in members)
                    _OverridePickTile(
                      label: member.displayName,
                      onTap: () {
                        widget.onSelect(member.id, 1, member.displayName);
                        widget.onClose();
                      },
                    ),
                  if (roles.isEmpty && members.isEmpty && !_isLoadingMembers)
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        l10n.guildSettingsRolesNoPermissionsFound,
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OverridePickTile extends StatelessWidget {
  const _OverridePickTile({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(label, style: context.textStyles.bodyMedium),
        ),
      ),
    );
  }
}
