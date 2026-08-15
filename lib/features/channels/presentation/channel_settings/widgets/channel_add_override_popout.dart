import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const int _kMemberPreviewLimit = 10;
const Duration _kMemberSearchDebounce = Duration(milliseconds: 300);

class ChannelAddOverrideSheet {
  ChannelAddOverrideSheet._();

  static Future<void> show(
    BuildContext context, {
    required String guildId,
    required Map<String, db.Role> rolesById,
    required Set<String> existingOverwriteIds,
    required void Function(String id, int type, String name) onSelect,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.channelSettingsPermissionsAddOverride,
      useRootNavigator: true,
      initialChildSize: 0.6,
      minChildSize: 0.35,
      builder:
          (
            BuildContext sheetContext,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return ChannelAddOverridePickerContent(
              guildId: guildId,
              rolesById: rolesById,
              existingOverwriteIds: existingOverwriteIds,
              scrollController: scrollController,
              isBottomSheet: true,
              onSelect: onSelect,
              onClose: close,
            );
          },
    );
  }
}

class ChannelAddOverridePickerContent extends ConsumerStatefulWidget {
  const ChannelAddOverridePickerContent({
    required this.guildId,
    required this.rolesById,
    required this.existingOverwriteIds,
    required this.onSelect,
    required this.onClose,
    this.scrollController,
    this.isBottomSheet = false,
    this.width = 320,
    super.key,
  });

  final String guildId;
  final Map<String, db.Role> rolesById;
  final Set<String> existingOverwriteIds;
  final void Function(String id, int type, String name) onSelect;
  final VoidCallback onClose;
  final ScrollController? scrollController;
  final bool isBottomSheet;
  final double width;

  @override
  ConsumerState<ChannelAddOverridePickerContent> createState() =>
      _ChannelAddOverridePickerContentState();
}

class _ChannelAddOverridePickerContentState
    extends ConsumerState<ChannelAddOverridePickerContent> {
  String _searchQuery = '';
  List<Member> _members = const <Member>[];
  bool _isLoadingMembers = false;
  MentionAutocompleteSession? _memberSession;
  Timer? _searchDebounce;

  String get _trimmedSearch => _searchQuery.trim();

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(guildSyncProvider.notifier).syncIfNeeded(widget.guildId);
      unawaited(_fetchMembers(''));
    });
  }

  MentionAutocompleteSession _memberSessionFor(String query) {
    final String sessionKey = '${widget.guildId}:${query.trim()}';
    if (_memberSession == null || _memberSession!.sessionKey != sessionKey) {
      _memberSession = MentionAutocompleteSession(sessionKey: sessionKey);
    }
    return _memberSession!;
  }

  ParsedMentionQuery _rankingQueryFor(String query) {
    final ParsedMentionQuery parsed = parseMentionQuery(query);
    final String searchQuery = parsed.usernameQuery.trim();
    if (parsed.hasTagSeparator &&
        searchQuery.isNotEmpty &&
        (parsed.tagQuery ?? '').trim().isEmpty) {
      return parseMentionQuery(searchQuery);
    }
    return parsed;
  }

  Future<void> _fetchMembers(String query) async {
    final String trimmed = query.trim();
    if (mounted && trimmed.isNotEmpty) {
      setState(() => _isLoadingMembers = true);
    }
    final ParsedMentionQuery rankingQuery = _rankingQueryFor(trimmed);
    final String searchQuery = rankingQuery.usernameQuery.trim();
    final search = ref.read(guildMentionMemberSearchProvider);
    final MentionAutocompleteSession session = _memberSessionFor(trimmed);
    try {
      List<Member> members = await search.searchCached(
        guildId: widget.guildId,
        parsed: rankingQuery,
        stableSession: session,
      );
      if (searchQuery.isNotEmpty &&
          await search.shouldFetchFromGateway(widget.guildId, searchQuery)) {
        members = (await search.fetchGatewayAndMerge(
          guildId: widget.guildId,
          query: searchQuery,
          parsed: rankingQuery,
          stableSession: session,
        )).members;
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _members = members;
        _isLoadingMembers = false;
      });
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _isLoadingMembers = false);
    }
  }

  void _onSearchChanged(String value) {
    setState(() => _searchQuery = value);
    _searchDebounce?.cancel();
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      unawaited(_fetchMembers(''));
      return;
    }
    _searchDebounce = Timer(_kMemberSearchDebounce, () {
      unawaited(_fetchMembers(trimmed));
    });
  }

  List<db.Role> get _visibleRoles {
    final List<db.Role> roles =
        widget.rolesById.values
            .where(
              (db.Role role) =>
                  role.id != widget.guildId &&
                  !widget.existingOverwriteIds.contains(role.id),
            )
            .toList()
          ..sort((db.Role a, db.Role b) {
            if (a.position != b.position) {
              return b.position.compareTo(a.position);
            }
            return BigInt.parse(a.id).compareTo(BigInt.parse(b.id));
          });
    if (_trimmedSearch.isEmpty) {
      return roles;
    }
    return roles
        .where(
          (db.Role role) =>
              roleNameMatchesMentionQuery(role.name, _trimmedSearch),
        )
        .toList();
  }

  List<Member> get _visibleMembers {
    final List<Member> filtered = filterGuildMembersForAutocomplete(
      members: _members,
      parsed: _rankingQueryFor(_trimmedSearch),
      limit: _kMemberPreviewLimit,
      discriminatorByUserId: const <String, String>{},
      stableSession: _memberSessionFor(_trimmedSearch),
    );
    return filtered
        .where(
          (Member member) => !widget.existingOverwriteIds.contains(member.id),
        )
        .toList();
  }

  void _handleSelect(String id, int type, String name) {
    widget.onSelect(id, type, name);
    widget.onClose();
  }

  List<Widget> _buildListChildren(
    BuildContext context,
    FluxerLocalizations l10n,
  ) {
    final List<db.Role> roles = _visibleRoles;
    final List<Member> members = _visibleMembers;
    final bool hasSearchQuery = _trimmedSearch.isNotEmpty;
    final List<Widget> children = <Widget>[];

    if (roles.isNotEmpty) {
      children.add(_OverrideSectionHeader(label: l10n.guildSettingsRolesTab));
      for (final db.Role role in roles) {
        children.add(
          _OverridePickTile(
            label: role.name,
            roleColor: role.color,
            onTap: () => _handleSelect(role.id, 0, role.name),
          ),
        );
      }
    }

    if (members.isNotEmpty || (_isLoadingMembers && hasSearchQuery)) {
      children.add(
        _OverrideSectionHeader(label: l10n.channelDetailsTabMembers),
      );
      if (_isLoadingMembers && members.isEmpty) {
        children.add(
          const Padding(
            padding: EdgeInsets.all(12),
            child: Center(child: FluxerLoadingSpinner()),
          ),
        );
      }
      for (final Member member in members) {
        children.add(
          _OverridePickTile(
            label: member.displayName,
            member: member,
            onTap: () => _handleSelect(member.id, 1, member.displayName),
          ),
        );
      }
    }

    if (roles.isEmpty && members.isEmpty && !_isLoadingMembers) {
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Text(
            hasSearchQuery
                ? l10n.quickSwitcherNoMatchesFound
                : l10n.guildSettingsRolesNoPermissionsFound,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
      );
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isBottomSheet = widget.isBottomSheet;
    final EdgeInsets searchPadding = isBottomSheet
        ? EdgeInsets.zero
        : const EdgeInsets.all(12);
    final List<Widget> listChildren = _buildListChildren(context, l10n);

    final Widget searchField = Padding(
      padding: searchPadding,
      child: FluxerInput(
        hint: l10n.channelSettingsPermissionsSearchRolesOrMembers,
        prefixIcon: const PhosphorIcon(
          PhosphorIconsBold.magnifyingGlass,
          size: 16,
        ),
        autofocus: isBottomSheet,
        onChanged: _onSearchChanged,
      ),
    );

    if (isBottomSheet) {
      return Padding(
        padding: FluxerBottomSheet.scrollViewPadding(
          context,
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            0,
            context.layout.s4,
            context.layout.s4,
          ),
        ),
        child: Column(
          children: <Widget>[
            searchField,
            SizedBox(height: context.layout.s3),
            Expanded(
              child: ListView(
                controller: widget.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: FluxerBottomSheet.scrollViewPadding(
                  context,
                  padding: EdgeInsets.zero,
                ),
                children: listChildren,
              ),
            ),
          ],
        ),
      );
    }

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
            searchField,
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 280),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 8),
                children: listChildren,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OverrideSectionHeader extends StatelessWidget {
  const _OverrideSectionHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Text(
        label.toUpperCase(),
        style: context.textStyles.label.copyWith(
          color: context.colors.textTertiary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _OverridePickTile extends StatelessWidget {
  const _OverridePickTile({
    required this.label,
    required this.onTap,
    this.roleColor,
    this.member,
  });

  final String label;
  final VoidCallback onTap;
  final int? roleColor;
  final Member? member;

  @override
  Widget build(BuildContext context) {
    final Widget leading = member != null
        ? FluxerAvatar.user(
            fallbackText: label,
            userId: member!.id,
            imageUrl: FluxerMediaUrl.userAvatar(
              userId: member!.id,
              hash: member!.avatar,
            ),
            avatarColor: member!.avatarColor,
            size: 24,
            showStatus: false,
          )
        : Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Color(guildRoleColorInt(roleColor ?? 0)),
              shape: BoxShape.circle,
            ),
          );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: <Widget>[
              leading,
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: member == null && roleColor != null && roleColor != 0
                      ? context.textStyles.label.copyWith(
                          color: Color(guildRoleColorInt(roleColor!)),
                        )
                      : context.textStyles.bodyMedium,
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
