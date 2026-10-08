import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showThreadSettingsSheet(BuildContext context, Channel thread) {
  return FluxerBottomSheet.show<void>(
    context,
    title: FluxerLocalizations.of(context).threadSettings,
    builder: (sheetContext, close) =>
        _ThreadSettingsBody(thread: thread, close: close),
  );
}

List<FluxerSelectItem<int>> threadSlowmodeItems(FluxerLocalizations l10n) {
  String label(int seconds) {
    if (seconds < 60) {
      return l10n.channelSettingsSlowmodeSeconds(seconds);
    }
    if (seconds < 3600) {
      final int minutes = seconds ~/ 60;
      return minutes == 1
          ? l10n.channelSettingsSlowmodeOneMinute(minutes)
          : l10n.channelSettingsSlowmodeMinutes(minutes);
    }
    final int hours = seconds ~/ 3600;
    return hours == 1
        ? l10n.channelSettingsSlowmodeOneHour(hours)
        : l10n.channelSettingsSlowmodeHours(hours);
  }

  return <FluxerSelectItem<int>>[
    FluxerSelectItem<int>(value: 0, label: l10n.channelSettingsSlowmodeOff),
    for (final int seconds in kSlowmodeOptionsSeconds.where((int s) => s > 0))
      FluxerSelectItem<int>(value: seconds, label: label(seconds)),
  ];
}

List<FluxerSelectItem<int>> threadAutoArchiveItems(FluxerLocalizations l10n) =>
    <FluxerSelectItem<int>>[
      for (final int minutes in threadAutoArchiveDurations)
        FluxerSelectItem<int>(
          value: minutes,
          label: threadAutoArchiveLabel(l10n, minutes),
        ),
    ];

class _ThreadSettingsBody extends ConsumerStatefulWidget {
  const _ThreadSettingsBody({required this.thread, required this.close});

  final Channel thread;
  final VoidCallback close;

  @override
  ConsumerState<_ThreadSettingsBody> createState() =>
      _ThreadSettingsBodyState();
}

class _ThreadSettingsBodyState extends ConsumerState<_ThreadSettingsBody> {
  late final TextEditingController _name;
  late int _autoArchive;
  late int _slowmode;
  late bool _invitable;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.thread.name);
    _autoArchive = widget.thread.threadAutoArchiveMinutes;
    _slowmode = widget.thread.rateLimitPerUser;
    _invitable = widget.thread.threadInvitable ?? true;
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel thread = widget.thread;
    final String name = _name.text.trim();
    if (name.isEmpty) {
      setState(() => _error = l10n.threadNameRequired);
      return;
    }
    final Map<String, Object?> body = <String, Object?>{
      if (name != thread.name) 'name': name,
      if (_autoArchive != thread.threadAutoArchiveMinutes)
        'auto_archive_duration': _autoArchive,
      if (_slowmode != thread.rateLimitPerUser)
        'rate_limit_per_user': _slowmode,
      if (thread.type == ChannelType.privateThread &&
          _invitable != (thread.threadInvitable ?? true))
        'invitable': _invitable,
    };
    if (body.isEmpty) {
      widget.close();
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    final bool saved = await updateThread(
      context,
      ref,
      thread,
      body,
      successMessage: l10n.threadSettingsSaved,
    );
    if (!mounted) {
      return;
    }
    if (saved) {
      widget.close();
      return;
    }
    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel thread = widget.thread;
    final ThreadActorContext? actor = ref.watch(
      threadActorContextProvider(thread.id),
    );
    final bool isModerator = actor != null && isThreadModeratorFor(actor);
    final bool canInvitable =
        thread.type == ChannelType.privateThread &&
        actor != null &&
        threadPatchRequirement(
              const ThreadPatch(invitable: true),
              thread.flags ?? 0,
              actor,
            ) ==
            null;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        0,
        context.layout.s4,
        context.layout.s4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FluxerInput(
            controller: _name,
            label: l10n.threadName,
            maxLength: threadNameMaxLength,
            errorText: _error,
            onChanged: (_) {
              if (_error != null) {
                setState(() => _error = null);
              }
            },
          ),
          SizedBox(height: context.layout.s4),
          FluxerSelect<int>(
            label: l10n.threadAutoArchive,
            description: l10n.threadAutoArchiveDescription,
            value: _autoArchive,
            stretch: true,
            enableSearch: false,
            items: threadAutoArchiveItems(l10n),
            onChanged: (int value) => setState(() => _autoArchive = value),
          ),
          if (isModerator) ...<Widget>[
            SizedBox(height: context.layout.s4),
            FluxerSelect<int>(
              label: l10n.channelSettingsSlowmode,
              value: _slowmode,
              stretch: true,
              enableSearch: false,
              items: threadSlowmodeItems(l10n),
              onChanged: (int value) => setState(() => _slowmode = value),
            ),
          ],
          if (canInvitable) ...<Widget>[
            SizedBox(height: context.layout.s4),
            FluxerSwitchGroup(
              children: <Widget>[
                FluxerSwitchGroupItem(
                  label: l10n.threadInvitable,
                  description: l10n.threadInvitableDescription,
                  value: _invitable,
                  onChanged: (bool value) => setState(() => _invitable = value),
                ),
              ],
            ),
          ],
          SizedBox(height: context.layout.s4),
          FluxerButton.primary(
            label: l10n.save,
            isLoading: _saving,
            onPressedAsync: _saving ? null : _save,
          ),
        ],
      ),
    );
  }
}
