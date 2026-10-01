import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/announcement_follow.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_follow_success_sheet.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ChannelFollowSheet {
  ChannelFollowSheet._();

  static Future<void> show(BuildContext context, {required Channel channel}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.channelFollowTitle,
      description: l10n.channelFollowBody,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return _ChannelFollowForm(source: channel, onClose: close);
      },
    );
  }
}

class _ChannelFollowForm extends ConsumerStatefulWidget {
  const _ChannelFollowForm({required this.source, required this.onClose});

  final Channel source;
  final VoidCallback onClose;

  @override
  ConsumerState<_ChannelFollowForm> createState() => _ChannelFollowFormState();
}

class _ChannelFollowFormState extends ConsumerState<_ChannelFollowForm> {
  bool _loading = true;
  bool _submitting = false;
  List<AnnouncementFollowGuildTargets> _targets =
      const <AnnouncementFollowGuildTargets>[];
  AnnouncementFollowRestriction _restriction =
      AnnouncementFollowRestriction.none;
  String? _guildId;
  String? _channelId;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
    final AnnouncementFollowRestriction restriction =
        announcementFollowRestriction(
          channel: widget.source,
          guild: guilds
              .where((Guild guild) => guild.id == widget.source.guildId)
              .firstOrNull,
          parentCategory: await _parentOf(widget.source),
        );
    final List<AnnouncementFollowGuildTargets> targets =
        <AnnouncementFollowGuildTargets>[];
    for (final Guild guild in guilds) {
      final List<Channel> channels = await ref
          .read(channelRepositoryProvider)
          .watchChannels(guild.id)
          .first;
      final List<Channel> allowed = <Channel>[];
      for (final Channel channel in channels) {
        if (!isChannelFollowTargetType(channel.type)) {
          continue;
        }
        final int bits = await readEffectiveGuildChannelPermissionBits(
          container: ref.container,
          channelId: channel.id,
        );
        if (!canManageAnnouncementFollow(permissionBits: bits)) {
          continue;
        }
        final AnnouncementFollowRestriction targetRestriction =
            announcementFollowRestriction(
              channel: channel,
              guild: guild,
              parentCategory: parentCategoryFor(channel, channels),
            );
        if (!isAllowedAnnouncementFollowTarget(
          source: restriction,
          target: targetRestriction,
        )) {
          continue;
        }
        allowed.add(channel);
      }
      allowed.sort((Channel a, Channel b) => a.position.compareTo(b.position));
      if (allowed.isNotEmpty) {
        targets.add(
          AnnouncementFollowGuildTargets(guild: guild, channels: allowed),
        );
      }
    }
    if (!mounted) {
      return;
    }
    final AnnouncementFollowGuildTargets? first = targets.firstOrNull;
    setState(() {
      _restriction = restriction;
      _targets = targets;
      _guildId = first?.guild.id;
      _channelId = first?.channels.firstOrNull?.id;
      _loading = false;
    });
  }

  Future<Channel?> _parentOf(Channel channel) async {
    if (channel.parentId == null) {
      return null;
    }
    final List<Channel> channels = await ref
        .read(channelRepositoryProvider)
        .watchChannels(channel.guildId)
        .first;
    return parentCategoryFor(channel, channels);
  }

  List<Channel> get _channelsForGuild {
    for (final AnnouncementFollowGuildTargets target in _targets) {
      if (target.guild.id == _guildId) {
        return target.channels;
      }
    }
    return const <Channel>[];
  }

  Future<void> _submit() async {
    final String? channelId = _channelId;
    if (channelId == null || _submitting) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() => _submitting = true);
    try {
      await ref
          .read(channelRepositoryProvider)
          .followAnnouncementChannel(
            channelId: widget.source.id,
            webhookChannelId: channelId,
          );
      if (!mounted) {
        return;
      }
      final Channel? target = _channelsForGuild
          .where((Channel channel) => channel.id == channelId)
          .firstOrNull;
      widget.onClose();
      final BuildContext host = context;
      if (!host.mounted) {
        return;
      }
      await ChannelFollowSuccessSheet.show(
        host,
        sourceName: widget.source.name,
        targetName: target?.name ?? '',
      );
    } on Object catch (error) {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: userFacingErrorMessage(error, l10n.channelFollowFailed),
              variant: FluxerToastVariant.danger,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _submitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: FluxerLoadingSpinner()),
      );
    }
    if (_targets.isEmpty) {
      return Text(
        l10n.channelFollowEmpty,
        style: context.textStyles.bodySmall.copyWith(height: 1.4),
      );
    }
    final String? warning = switch (_restriction) {
      AnnouncementFollowRestriction.ageRestricted =>
        l10n.channelFollowAgeWarning,
      AnnouncementFollowRestriction.contentWarning =>
        l10n.channelFollowContentWarning,
      AnnouncementFollowRestriction.none => null,
    };
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (warning != null) ...<Widget>[
          Text(
            warning,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textWarning,
              height: 1.4,
            ),
          ),
          SizedBox(height: context.layout.s4),
        ],
        FluxerSelect<String>(
          label: l10n.channelFollowCommunity,
          value: _guildId,
          stretch: true,
          items: <FluxerSelectItem<String>>[
            for (final AnnouncementFollowGuildTargets target in _targets)
              FluxerSelectItem<String>(
                value: target.guild.id,
                label: target.guild.name,
              ),
          ],
          onChanged: (String? value) {
            if (value == null) {
              return;
            }
            final List<Channel> channels =
                _targets
                    .where(
                      (AnnouncementFollowGuildTargets target) =>
                          target.guild.id == value,
                    )
                    .firstOrNull
                    ?.channels ??
                const <Channel>[];
            setState(() {
              _guildId = value;
              _channelId = channels.firstOrNull?.id;
            });
          },
        ),
        SizedBox(height: context.layout.s4),
        FluxerSelect<String>(
          label: l10n.channelFollowChannel,
          value: _channelId,
          stretch: true,
          items: <FluxerSelectItem<String>>[
            for (final Channel channel in _channelsForGuild)
              FluxerSelectItem<String>(
                value: channel.id,
                label: '#${channel.name}',
              ),
          ],
          onChanged: (String? value) {
            setState(() => _channelId = value);
          },
        ),
        SizedBox(height: context.layout.s3),
        Text(
          l10n.channelFollowHiddenHint,
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textTertiary,
          ),
        ),
        SizedBox(height: context.layout.s4),
        Align(
          alignment: Alignment.centerRight,
          child: FluxerButton.primary(
            onPressed: _channelId == null || _submitting ? null : _submit,
            label: l10n.channelFollowSubmit,
            isLoading: _submitting,
            fitContent: true,
          ),
        ),
      ],
    );
  }
}
