import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_ban_entry.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild_audit_log_utils.dart';
import 'package:fluxer_app/features/settings/utils/guild_bans_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';

class GuildBanDetailsSheet {
  GuildBanDetailsSheet._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required GuildBanEntry entry,
    required Future<void> Function() onRevokeBan,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (isMobileLayout(context)) {
      return FluxerBottomSheet.showScrollable<void>(
        context,
        title: l10n.guildSettingsBanDetailsTitle,
        useRootNavigator: true,
        builder:
            (
              BuildContext sheetContext,
              ScrollController scrollController,
              VoidCallback close,
            ) {
              return _GuildBanDetailsBody(
                entry: entry,
                onClose: close,
                onRevokeBan: onRevokeBan,
                scrollController: scrollController,
              );
            },
      );
    }
    return FluxerModal.show<void>(
      context,
      title: l10n.guildSettingsBanDetailsTitle,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return _GuildBanDetailsBody(
          entry: entry,
          onClose: close,
          onRevokeBan: onRevokeBan,
        );
      },
      actionsBuilder: (void Function([void]) pop) => <Widget>[
        FluxerButton.dangerPrimary(
          label: l10n.guildSettingsRevokeBanTitle,
          onPressed: () async {
            await onRevokeBan();
            pop();
          },
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(onPressed: () => pop(), label: l10n.uiClose),
      ],
    );
  }
}

class _GuildBanDetailsBody extends ConsumerStatefulWidget {
  const _GuildBanDetailsBody({
    required this.entry,
    required this.onRevokeBan,
    this.onClose,
    this.scrollController,
  });

  final GuildBanEntry entry;
  final Future<void> Function() onRevokeBan;
  final VoidCallback? onClose;
  final ScrollController? scrollController;

  @override
  ConsumerState<_GuildBanDetailsBody> createState() =>
      _GuildBanDetailsBodyState();
}

class _GuildBanDetailsBodyState extends ConsumerState<_GuildBanDetailsBody> {
  UserPartialResponse? _moderator;
  bool _hasLoadedModerator = false;
  bool _isRevoking = false;

  @override
  void initState() {
    super.initState();
    unawaited(_loadModerator());
  }

  Future<void> _loadModerator() async {
    final String moderatorId = widget.entry.ban.moderatorId;
    if (moderatorId.isEmpty) {
      if (mounted) {
        setState(() => _hasLoadedModerator = true);
      }
      return;
    }
    try {
      final UserPartialResponse moderator = await ref
          .read(fluxerClientProvider)
          .users
          .getUserById(userId: moderatorId);
      if (!mounted) {
        return;
      }
      setState(() {
        _moderator = moderator;
        _hasLoadedModerator = true;
      });
    } on Object {
      if (mounted) {
        setState(() => _hasLoadedModerator = true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String locale = Localizations.localeOf(context).toString();
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    final bool isMobile = isMobileLayout(context);
    final ban = widget.entry.ban;
    final user = ban.user;
    final String displayName = resolveDisplayName(
      username: user.username,
      globalName: user.globalName,
    );
    final String tag = GuildBansUtils.buildUserTag(user);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final String bannedOn = GuildAuditLogUtils.formatAuditLogTimestamp(
      ban.bannedAt,
      l10n,
      locale,
      use12Hour: use12Hour,
    );
    final String reason = (ban.reason?.trim().isNotEmpty ?? false)
        ? ban.reason!.trim()
        : l10n.guildSettingsAuditLogNoReason;
    final Widget content = Padding(
      padding: EdgeInsets.fromLTRB(
        layout.s4,
        layout.s4,
        layout.s4,
        kSettingsScrollBottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              FluxerAvatar.user(
                fallbackText: displayName,
                userId: user.id,
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: user.id,
                  hash: user.avatar,
                ),
                avatarColor: user.avatarColor,
                showStatus: false,
                size: 48,
              ),
              SizedBox(width: layout.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      displayName,
                      style: textStyles.heading.copyWith(
                        fontSize: 16,
                        color: colors.textChat,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      tag,
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textPrimaryMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: layout.s4),
          _GuildBanDetailRow(
            label: l10n.guildSettingsAuditLogReason,
            value: reason,
          ),
          SizedBox(height: layout.s3),
          _GuildBanDetailRow(
            label: l10n.guildSettingsBannedOn,
            value: bannedOn,
          ),
          if (ban.expiresAt != null) ...<Widget>[
            SizedBox(height: layout.s3),
            _GuildBanDetailRow(
              label: l10n.guildSettingsBanExpiresLabel,
              value: GuildAuditLogUtils.formatAuditLogTimestamp(
                ban.expiresAt!,
                l10n,
                locale,
                use12Hour: use12Hour,
              ),
            ),
          ],
          SizedBox(height: layout.s3),
          _GuildBanDetailRow(
            label: l10n.guildSettingsBannedBy,
            child: _buildModeratorValue(context, l10n),
          ),
          if (isMobile) ...<Widget>[
            SizedBox(height: layout.s4),
            FluxerButton.dangerPrimary(
              label: l10n.guildSettingsRevokeBanTitle,
              isLoading: _isRevoking,
              onPressed: _isRevoking
                  ? null
                  : () async {
                      setState(() => _isRevoking = true);
                      try {
                        await widget.onRevokeBan();
                        widget.onClose?.call();
                      } finally {
                        if (mounted) {
                          setState(() => _isRevoking = false);
                        }
                      }
                    },
            ),
          ],
        ],
      ),
    );
    final ScrollController? scrollController = widget.scrollController;
    if (scrollController != null) {
      return SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.only(
          bottom: FluxerBottomSheet.scrollBottomPaddingOf(context),
        ),
        child: content,
      );
    }
    return content;
  }

  Widget _buildModeratorValue(BuildContext context, FluxerLocalizations l10n) {
    if (!_hasLoadedModerator) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: FluxerLoadingSpinner(),
      );
    }
    final UserPartialResponse? moderator = _moderator;
    if (moderator == null) {
      return Text(
        l10n.guildSettingsAuditLogUnknownUser,
        style: context.textStyles.bodyMedium.copyWith(
          color: context.colors.textChat,
        ),
      );
    }
    final String moderatorName = resolveDisplayName(
      username: moderator.username,
      globalName: moderator.globalName,
    );
    return Row(
      children: <Widget>[
        FluxerAvatar.user(
          fallbackText: moderatorName,
          userId: moderator.id,
          imageUrl: FluxerMediaUrl.userAvatar(
            userId: moderator.id,
            hash: moderator.avatar,
          ),
          avatarColor: moderator.avatarColor,
          showStatus: false,
          size: 20,
        ),
        SizedBox(width: context.layout.s2),
        Expanded(
          child: Text(
            moderatorName,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textChat,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _GuildBanDetailRow extends StatelessWidget {
  const _GuildBanDetailRow({required this.label, this.value, this.child});

  final String label;
  final String? value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: textStyles.categoryName.copyWith(
            color: colors.textPrimaryMuted,
          ),
        ),
        SizedBox(height: context.layout.s1),
        if (child != null)
          child!
        else
          Text(
            value ?? '',
            style: textStyles.bodyMedium.copyWith(color: colors.textChat),
          ),
      ],
    );
  }
}
