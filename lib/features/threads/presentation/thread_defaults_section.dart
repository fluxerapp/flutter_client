import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/presentation/thread_settings_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ThreadDefaultsSection extends ConsumerStatefulWidget {
  const ThreadDefaultsSection({required this.channel, super.key});

  final Channel channel;

  @override
  ConsumerState<ThreadDefaultsSection> createState() =>
      _ThreadDefaultsSectionState();
}

class _ThreadDefaultsSectionState extends ConsumerState<ThreadDefaultsSection> {
  late int _autoArchive;
  late int _slowmode;

  @override
  void initState() {
    super.initState();
    _autoArchive =
        widget.channel.defaultAutoArchiveDuration ??
        defaultThreadAutoArchiveDuration;
    _slowmode = widget.channel.defaultThreadRateLimitPerUser ?? 0;
  }

  Future<bool> _save(Map<String, Object?> body) {
    final Channel channel = widget.channel;
    return runThreadAction(
      context,
      ref,
      (ThreadsRepository repo) => repo.update(
        guildId: channel.guildId,
        threadId: channel.id,
        body: body,
      ),
      successMessage: FluxerLocalizations.of(context).threadSettingsSaved,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isTextThreadParentType(widget.channel.type) ||
        !ref.watch(threadChannelsActiveProvider(widget.channel.guildId))) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(top: context.layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FluxerSelect<int>(
            label: l10n.threadDefaultAutoArchive,
            description: l10n.threadDefaultAutoArchiveDescription,
            value: _autoArchive,
            stretch: true,
            enableSearch: false,
            items: threadAutoArchiveItems(l10n),
            onChanged: (int value) {
              final int previous = _autoArchive;
              setState(() => _autoArchive = value);
              unawaited(
                _save(<String, Object?>{
                  'default_auto_archive_duration': value,
                }).then((bool saved) {
                  if (!saved && mounted && _autoArchive == value) {
                    setState(() => _autoArchive = previous);
                  }
                }),
              );
            },
          ),
          SizedBox(height: context.layout.s4),
          FluxerSelect<int>(
            label: l10n.threadDefaultSlowmode,
            value: _slowmode,
            stretch: true,
            enableSearch: false,
            items: threadSlowmodeItems(l10n),
            onChanged: (int value) {
              final int previous = _slowmode;
              setState(() => _slowmode = value);
              unawaited(
                _save(<String, Object?>{
                  'default_thread_rate_limit_per_user': value,
                }).then((bool saved) {
                  if (!saved && mounted && _slowmode == value) {
                    setState(() => _slowmode = previous);
                  }
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
