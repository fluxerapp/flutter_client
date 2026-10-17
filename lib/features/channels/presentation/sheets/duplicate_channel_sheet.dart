import 'dart:async';

import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/create_channel_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

const int kDuplicateChannelNameMaxLength = 100;

ChannelCreateRequest buildDuplicateChannelRequest(
  Channel source, {
  required String name,
}) {
  final bool isVoice = source.type == ChannelType.guildVoice;
  return CreateChannelSheet.buildRequest(
    name: name,
    selectedType: source.type.wireValue,
    url: isGuildLinkChannelType(source.type.wireValue) ? source.url ?? '' : '',
    parentId: source.parentId,
    overwrites: <CreateChannelOverwrite>[
      for (final ChannelOverwriteEntry entry
          in parseChannelPermissionOverwritesJson(
            source.permissionOverwritesJson,
          ))
        (
          id: entry.id,
          type: entry.isRoleType ? 0 : 1,
          allow: entry.allow.toString(),
          deny: entry.deny.toString(),
        ),
    ],
    bitrate: isVoice ? source.bitrate ?? 64000 : 64000,
    userLimit: isVoice ? source.userLimit ?? 0 : 0,
    voiceConnectionLimit: isVoice
        ? source.voiceConnectionLimit ?? kDefaultVoiceConnectionLimit
        : kDefaultVoiceConnectionLimit,
  );
}

class DuplicateChannelSheet {
  DuplicateChannelSheet._();

  static Future<Channel?> show(
    BuildContext context, {
    required Channel channel,
    required Future<Channel> Function(ChannelCreateRequest request) onCreate,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final _DuplicateChannelDraft draft = _DuplicateChannelDraft(
      source: channel,
      onCreate: onCreate,
      fallbackError: l10n.errorUnexpectedTryAgain,
    );
    return FluxerModal.show<Channel>(
      context,
      title: l10n.channelMenuDuplicateChannel,
      builder: (BuildContext _, VoidCallback _) =>
          _DuplicateChannelForm(draft: draft),
      actionsBuilder: (void Function([Channel? result]) pop) => <Widget>[
        _DuplicateChannelActions(draft: draft, pop: pop),
      ],
    );
  }
}

class _DuplicateChannelDraft extends ChangeNotifier {
  _DuplicateChannelDraft({
    required this.source,
    required this.onCreate,
    required this.fallbackError,
  }) : name = TextEditingController(text: source.name) {
    name.addListener(_onNameChanged);
  }

  final Channel source;
  final Future<Channel> Function(ChannelCreateRequest request) onCreate;
  final String fallbackError;
  final TextEditingController name;
  bool _submitting = false;
  bool _disposed = false;
  String? _error;

  bool get submitting => _submitting;
  String? get error => _error;
  bool get valid => name.text.trim().isNotEmpty;

  void _onNameChanged() {
    _error = null;
    notifyListeners();
  }

  Future<Channel?> submit() async {
    if (!valid || _submitting) {
      return null;
    }
    _submitting = true;
    _error = null;
    notifyListeners();
    try {
      return await onCreate(
        buildDuplicateChannelRequest(source, name: name.text.trim()),
      );
    } on Object catch (error) {
      _error = ApiException.from(error).message ?? fallbackError;
      return null;
    } finally {
      _submitting = false;
      if (!_disposed) {
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _disposed = true;
    name.dispose();
    super.dispose();
  }
}

class _DuplicateChannelForm extends StatefulWidget {
  const _DuplicateChannelForm({required this.draft});

  final _DuplicateChannelDraft draft;

  @override
  State<_DuplicateChannelForm> createState() => _DuplicateChannelFormState();
}

class _DuplicateChannelFormState extends State<_DuplicateChannelForm> {
  _DuplicateChannelDraft get draft => widget.draft;

  @override
  void dispose() {
    draft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String channelName = '#${draft.source.name}';
    final String helper = draft.source.type == ChannelType.guildVoice
        ? l10n.channelDuplicateVoiceHelper(channelName)
        : l10n.channelDuplicateHelper(channelName);
    return ListenableBuilder(
      listenable: draft,
      builder: (BuildContext context, Widget? _) => FluxerInput(
        controller: draft.name,
        label: l10n.channelSettingsChannelName,
        hint: l10n.guildNavbarNewChannelHint,
        helperText: helper,
        errorText: draft.error,
        maxLength: kDuplicateChannelNameMaxLength,
        autofocus: true,
        enabled: !draft.submitting,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => unawaited(_submit()),
      ),
    );
  }

  Future<void> _submit() async {
    final Channel? created = await draft.submit();
    if (created != null && mounted) {
      Navigator.of(context).pop(created);
    }
  }
}

class _DuplicateChannelActions extends StatelessWidget {
  const _DuplicateChannelActions({required this.draft, required this.pop});

  final _DuplicateChannelDraft draft;
  final void Function([Channel? result]) pop;

  Future<void> _submit() async {
    final Channel? created = await draft.submit();
    if (created != null) {
      pop(created);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ListenableBuilder(
      listenable: draft,
      builder: (BuildContext _, Widget? _) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FluxerButton.primary(
            onPressed: draft.valid && !draft.submitting
                ? () => unawaited(_submit())
                : null,
            isLoading: draft.submitting,
            label: l10n.guildNavbarCreateChannel,
          ),
          const SizedBox(height: 8),
          FluxerButton.secondary(
            onPressed: draft.submitting ? null : pop,
            label: l10n.cancel,
          ),
        ],
      ),
    );
  }
}
