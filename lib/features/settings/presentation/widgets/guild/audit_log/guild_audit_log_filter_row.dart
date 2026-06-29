import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_constants.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_state.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_audit_log_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String kGuildAuditLogAllUsersFilterValue = '';
const String kGuildAuditLogAllActionsFilterValue = '';

class GuildAuditLogFilterRow extends ConsumerWidget {
  const GuildAuditLogFilterRow({
    required this.guildId,
    required this.state,
    required this.l10n,
    super.key,
  });

  final String guildId;
  final GuildAuditLogState state;
  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<FluxerSelectItem<String>> userItems = <FluxerSelectItem<String>>[
      FluxerSelectItem<String>(
        value: kGuildAuditLogAllUsersFilterValue,
        label: l10n.guildSettingsAuditLogFilterAllUsers,
      ),
      ...state.filterMembers.map(
        (Member member) => FluxerSelectItem<String>(
          value: member.id,
          label: member.displayName,
          leading: FluxerAvatar.user(
            imageUrl: _resolveFilterAvatarUrl(member),
            fallbackText: member.displayName,
            userId: member.id,
            avatarColor:
                state.filterMemberAvatarColor(member.id) ?? member.avatarColor,
            size: 28,
            showStatus: false,
          ),
        ),
      ),
    ];
    final List<FluxerSelectItem<String>> actionItems =
        <FluxerSelectItem<String>>[
          FluxerSelectItem<String>(
            value: kGuildAuditLogAllActionsFilterValue,
            label: l10n.guildSettingsAuditLogFilterAllActions,
            icon: PhosphorIconsFill.funnelSimple,
          ),
          ...GuildAuditLogConstants.filterableActions.map(
            (AuditLogActionType action) => FluxerSelectItem<String>(
              value: action.json?.toString() ?? '',
              label: GuildAuditLogConstants.getActionLabel(action, l10n),
              icon: GuildAuditLogConstants.getActionIcon(action),
            ),
          ),
        ];
    final bool isMobile = isMobileLayout(context);
    final Widget userSelect = FluxerSelect<String>(
      label: l10n.guildSettingsAuditLogFilterUser,
      value: state.selectedUserId ?? kGuildAuditLogAllUsersFilterValue,
      items: userItems,
      enableSearch: true,
      scrollableSheet: true,
      stretch: isMobile,
      onChanged: (String value) {
        unawaited(
          ref
              .read(guildAuditLogProvider(guildId).notifier)
              .setUserFilter(value.isEmpty ? null : value),
        );
      },
    );
    final Widget actionSelect = FluxerSelect<String>(
      label: l10n.guildSettingsAuditLogFilterAction,
      value:
          state.selectedActionType?.json?.toString() ??
          kGuildAuditLogAllActionsFilterValue,
      items: actionItems,
      enableSearch: true,
      scrollableSheet: true,
      stretch: isMobile,
      onChanged: (String value) {
        final AuditLogActionType? actionType = value.isEmpty
            ? null
            : AuditLogActionType.fromJson(int.parse(value));
        unawaited(
          ref
              .read(guildAuditLogProvider(guildId).notifier)
              .setActionFilter(actionType),
        );
      },
    );
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          userSelect,
          SizedBox(height: context.layout.s3),
          actionSelect,
        ],
      );
    }
    return Row(
      children: <Widget>[
        Expanded(child: userSelect),
        SizedBox(width: context.layout.s3),
        Expanded(child: actionSelect),
      ],
    );
  }

  String? _resolveFilterAvatarUrl(Member member) {
    final String? guildAvatarUrl = state.filterMemberAvatarUrl(member.id);
    if (guildAvatarUrl != null) {
      return guildAvatarUrl;
    }
    if (!state.hasResolvedProfiles) {
      return null;
    }
    return FluxerMediaUrl.userAvatar(userId: member.id, hash: member.avatar);
  }
}
