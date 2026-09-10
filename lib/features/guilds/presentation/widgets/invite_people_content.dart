import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/invite_people_recipient.dart';
import 'package:fluxer_app/features/guilds/utils/invite_create_errors.dart';
import 'package:fluxer_app/features/guilds/utils/invite_people_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InvitePeopleContent extends StatefulWidget {
  const InvitePeopleContent({
    required this.createInvite,
    required this.getRecipients,
    required this.sendInvite,
    required this.onEditLink,
    this.scrollController,
    this.vanityUrl,
    this.fill = false,
    super.key,
  });

  final InvitePeopleCreateFn createInvite;
  final Future<List<InvitePeopleRecipient>> Function() getRecipients;
  final InvitePeopleSendFn sendInvite;
  final Future<({int maxAge, int maxUses, bool temporary})?> Function()
  onEditLink;
  final ScrollController? scrollController;
  final String? vanityUrl;
  final bool fill;

  @override
  State<InvitePeopleContent> createState() => _InvitePeopleContentState();
}

class _InvitePeopleContentState extends State<InvitePeopleContent> {
  late final Future<List<InvitePeopleRecipient>> _recipientsFuture;
  final ValueNotifier<InviteLinkState?> _inviteState =
      ValueNotifier<InviteLinkState?>(null);
  final ValueNotifier<bool> _copied = ValueNotifier<bool>(false);
  final ValueNotifier<Set<String>> _sentTo = ValueNotifier<Set<String>>(
    <String>{},
  );
  final ValueNotifier<Set<String>> _sendingTo = ValueNotifier<Set<String>>(
    <String>{},
  );
  final TextEditingController _linkController = TextEditingController();
  Timer? _copiedReset;
  String _searchQuery = '';
  bool _creating = false;

  @override
  void initState() {
    super.initState();
    _recipientsFuture = widget.getRecipients();
    final String? vanityUrl = widget.vanityUrl;
    if (vanityUrl != null && vanityUrl.isNotEmpty) {
      _inviteState.value = (
        url: vanityUrl,
        channelName: '',
        maxAge: 0,
        useVanityUrl: true,
      );
      _linkController.text = vanityUrl;
    } else {
      unawaited(_loadInvite());
    }
    _inviteState.addListener(_syncLinkField);
  }

  @override
  void dispose() {
    _copiedReset?.cancel();
    _inviteState.removeListener(_syncLinkField);
    _inviteState.dispose();
    _copied.dispose();
    _sentTo.dispose();
    _sendingTo.dispose();
    _linkController.dispose();
    super.dispose();
  }

  void _syncLinkField() {
    _linkController.text = _inviteState.value?.url ?? '';
  }

  Future<void> _loadInvite({
    int maxAge = kDefaultInviteMaxAgeSeconds,
    int maxUses = 0,
    bool temporary = false,
  }) async {
    setState(() => _creating = true);
    try {
      final result = await widget.createInvite(
        maxAge: maxAge,
        maxUses: maxUses,
        temporary: temporary,
      );
      if (!mounted) {
        return;
      }
      if (result == null) {
        _showCreateFailed();
        return;
      }
      _inviteState.value = (
        url: result.url,
        channelName: result.channelName,
        maxAge: result.useVanityUrl ? 0 : maxAge,
        useVanityUrl: result.useVanityUrl,
      );
      _copied.value = false;
    } on Object catch (error) {
      if (mounted) {
        _showCreateFailed(error);
      }
    } finally {
      if (mounted) {
        setState(() => _creating = false);
      }
    }
  }

  void _showToast(
    String message, {
    FluxerToastVariant variant = FluxerToastVariant.danger,
  }) {
    ProviderScope.containerOf(context, listen: false)
        .read(toastProvider.notifier)
        .show(FluxerToast(message: message, variant: variant));
  }

  void _showCreateFailed([Object? error]) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    _showToast(
      error == null
          ? l10n.guildNavbarCreateInviteFailed
          : inviteCreateFailureMessage(error: error, l10n: l10n),
    );
  }

  Future<void> _copyLink() async {
    final String? url = _inviteState.value?.url;
    if (url == null || url.isEmpty) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await copyToClipboard(
      context: context,
      value: url,
      message: l10n.guildSettingsCopiedUrl,
    );
    _copiedReset?.cancel();
    _copied.value = true;
    _copiedReset = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        _copied.value = false;
      }
    });
  }

  Future<void> _sendTo(InvitePeopleRecipient recipient) async {
    final String? url = _inviteState.value?.url;
    if (url == null || url.isEmpty) {
      return;
    }
    _sendingTo.value = <String>{..._sendingTo.value, recipient.id};
    try {
      await widget.sendInvite(recipient.channelId, recipient.id, url);
      _sentTo.value = <String>{..._sentTo.value, recipient.id};
    } on Object {
      if (!mounted) {
        return;
      }
      _showToast(FluxerLocalizations.of(context).genericError);
    } finally {
      _sendingTo.value = <String>{..._sendingTo.value}..remove(recipient.id);
    }
  }

  Future<void> _editLink() async {
    if ((widget.vanityUrl != null && widget.vanityUrl!.isNotEmpty) ||
        (_inviteState.value?.useVanityUrl ?? false)) {
      return;
    }
    final settings = await widget.onEditLink();
    if (settings == null || !mounted) {
      return;
    }
    await _loadInvite(
      maxAge: settings.maxAge,
      maxUses: settings.maxUses,
      temporary: settings.temporary,
    );
  }

  String _expiryText(FluxerLocalizations l10n, InviteLinkState? state) {
    if ((widget.vanityUrl != null && widget.vanityUrl!.isNotEmpty) ||
        (state != null && (state.useVanityUrl || state.maxAge == 0))) {
      return l10n.guildNavbarInviteNeverExpires;
    }
    if (state == null || state.maxAge == kDefaultInviteMaxAgeSeconds) {
      return l10n.guildNavbarInviteExpiresSevenDays;
    }
    return l10n.guildNavbarInviteExpiresIn(
      _inviteExpirationDurationLabel(state.maxAge, l10n),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final Widget header = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ValueListenableBuilder<InviteLinkState?>(
          valueListenable: _inviteState,
          builder: (_, InviteLinkState? result, _) {
            if (result == null || result.channelName.isEmpty) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.only(bottom: layout.s3),
              child: Text(
                l10n.guildNavbarInviteRecipientsChannel(result.channelName),
                style: textStyles.timestamp.copyWith(
                  color: colors.textSecondary,
                  height: 1.4,
                ),
              ),
            );
          },
        ),
        FluxerInput(
          hint: l10n.guildNavbarSearchFriends,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: layout.s3),
            child: PhosphorIcon(
              PhosphorIconsBold.magnifyingGlass,
              size: 20,
              color: colors.textSecondary,
            ),
          ),
          onChanged: (String v) => setState(() => _searchQuery = v),
        ),
        SizedBox(height: layout.s2),
      ],
    );

    final Widget list = FutureBuilder<List<InvitePeopleRecipient>>(
      future: _recipientsFuture,
      builder:
          (
            BuildContext context,
            AsyncSnapshot<List<InvitePeopleRecipient>> snapshot,
          ) {
            return CustomScrollView(
              controller: widget.scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(child: header),
                ..._recipientSlivers(context, l10n, snapshot),
              ],
            );
          },
    );

    final Widget footer = FluxerBottomSheetFooter(
      showTopBorder: true,
      padding: EdgeInsets.fromLTRB(0, layout.s3, 0, layout.s3),
      child: _InviteLinkFooter(
        l10n: l10n,
        linkController: _linkController,
        inviteState: _inviteState,
        copied: _copied,
        creating: _creating,
        canEdit: widget.vanityUrl == null || widget.vanityUrl!.isEmpty,
        expiryText: (InviteLinkState? state) => _expiryText(l10n, state),
        onCopy: _copyLink,
        onEdit: _editLink,
      ),
    );

    final Widget body = widget.fill
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(child: list),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight,
                    ),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: footer,
                    ),
                  ),
                ],
              );
            },
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 280, child: list),
              footer,
            ],
          );

    if (widget.scrollController == null) {
      return body;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: body,
    );
  }

  List<Widget> _recipientSlivers(
    BuildContext context,
    FluxerLocalizations l10n,
    AsyncSnapshot<List<InvitePeopleRecipient>> snapshot,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    if (snapshot.connectionState == ConnectionState.waiting) {
      return <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: layout.s8),
            child: Center(
              child: FluxerLoadingSpinner(color: colors.brandPrimary),
            ),
          ),
        ),
      ];
    }
    final List<InvitePeopleRecipient> recipients =
        snapshot.data ?? <InvitePeopleRecipient>[];
    final List<InvitePeopleRecipient> filtered = recipients.where((
      InvitePeopleRecipient r,
    ) {
      if (_searchQuery.isEmpty) {
        return true;
      }
      final String q = _searchQuery.toLowerCase();
      return r.displayName.toLowerCase().contains(q) ||
          (r.secondaryText?.toLowerCase().contains(q) ?? false);
    }).toList();
    if (filtered.isEmpty) {
      return <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              recipients.isEmpty
                  ? l10n.guildNavbarNoFriendsYet
                  : l10n.guildNavbarNoResults,
              style: textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ];
    }
    return <Widget>[
      SliverPadding(
        padding: EdgeInsets.symmetric(vertical: layout.s2),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            return _InviteRecipientRow(
              recipient: filtered[index],
              inviteState: _inviteState,
              sentTo: _sentTo,
              sendingTo: _sendingTo,
              onInvite: _sendTo,
            );
          }, childCount: filtered.length),
        ),
      ),
    ];
  }
}

class _InviteLinkFooter extends StatelessWidget {
  const _InviteLinkFooter({
    required this.l10n,
    required this.linkController,
    required this.inviteState,
    required this.copied,
    required this.creating,
    required this.canEdit,
    required this.expiryText,
    required this.onCopy,
    required this.onEdit,
  });

  final FluxerLocalizations l10n;
  final TextEditingController linkController;
  final ValueNotifier<InviteLinkState?> inviteState;
  final ValueNotifier<bool> copied;
  final bool creating;
  final bool canEdit;
  final String Function(InviteLinkState? state) expiryText;
  final VoidCallback onCopy;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          l10n.guildNavbarInviteLinkPrompt,
          style: textStyles.bodySmall.copyWith(
            fontWeight: FontWeight.w500,
            color: colors.textPrimary,
          ),
        ),
        SizedBox(height: layout.s2),
        ValueListenableBuilder<InviteLinkState?>(
          valueListenable: inviteState,
          builder: (_, InviteLinkState? state, _) {
            return ValueListenableBuilder<bool>(
              valueListenable: copied,
              builder: (_, bool isCopied, _) {
                return FluxerInput(
                  controller: linkController,
                  readOnly: true,
                  hint: l10n.guildNavbarInviteLink,
                  trailing: Padding(
                    padding: EdgeInsets.all(layout.s1),
                    child: FluxerButton.primary(
                      fitContent: true,
                      size: FluxerButtonSize.compact,
                      isLoading: creating,
                      onPressed: state == null || creating ? null : onCopy,
                      label: isCopied
                          ? l10n.guildNavbarCopied
                          : l10n.guildNavbarCopy,
                    ),
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: layout.s2),
        ValueListenableBuilder<InviteLinkState?>(
          valueListenable: inviteState,
          builder: (_, InviteLinkState? state, _) {
            return FluxerGestureDetector(
              onTap: canEdit && !(state?.useVanityUrl ?? false) ? onEdit : null,
              child: Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: '${expiryText(state)} '),
                    if (canEdit && !(state?.useVanityUrl ?? false))
                      TextSpan(
                        text: l10n.guildNavbarEditInviteLink,
                        style: textStyles.timestamp.copyWith(
                          color: colors.textLink,
                        ),
                      ),
                  ],
                ),
                style: textStyles.timestamp.copyWith(
                  color: colors.textTertiary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

String _inviteExpirationDurationLabel(int maxAge, FluxerLocalizations l10n) {
  return switch (maxAge) {
    0 => l10n.guildNavbarDurationNever,
    1800 => l10n.guildNavbarDuration30Minutes,
    3600 => l10n.guildNavbarDuration1Hour,
    21600 => l10n.guildNavbarDuration6Hours,
    43200 => l10n.guildNavbarDuration12Hours,
    86400 => l10n.guildNavbarDuration1Day,
    604800 => l10n.guildNavbarDuration7Days,
    _ => l10n.guildNavbarDurationSeconds(maxAge),
  };
}

class _InviteRecipientRow extends StatelessWidget {
  const _InviteRecipientRow({
    required this.recipient,
    required this.inviteState,
    required this.sentTo,
    required this.sendingTo,
    required this.onInvite,
  });

  final InvitePeopleRecipient recipient;
  final ValueNotifier<InviteLinkState?> inviteState;
  final ValueNotifier<Set<String>> sentTo;
  final ValueNotifier<Set<String>> sendingTo;
  final Future<void> Function(InvitePeopleRecipient recipient) onInvite;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s2, vertical: layout.s2),
      child: Row(
        children: <Widget>[
          FluxerAvatar.userPresence(
            imageUrl: recipient.avatarUrl,
            fallbackText: recipient.displayName,
            userId: recipient.id,
            size: 32,
          ),
          SizedBox(width: layout.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  recipient.displayName,
                  style: textStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (recipient.secondaryText != null)
                  Text(
                    recipient.secondaryText!,
                    style: textStyles.timestamp.copyWith(
                      color: colors.textTertiary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
          SizedBox(width: layout.s3),
          ValueListenableBuilder<Set<String>>(
            valueListenable: sentTo,
            builder: (_, Set<String> sent, _) {
              if (sent.contains(recipient.id)) {
                return FluxerButton.secondary(
                  fitContent: true,
                  size: FluxerButtonSize.compact,
                  label: l10n.guildNavbarSent,
                );
              }
              return ValueListenableBuilder<Set<String>>(
                valueListenable: sendingTo,
                builder: (_, Set<String> sending, _) {
                  final bool isSending = sending.contains(recipient.id);
                  return ValueListenableBuilder<InviteLinkState?>(
                    valueListenable: inviteState,
                    builder: (_, result, _) => FluxerButton.secondary(
                      fitContent: true,
                      size: FluxerButtonSize.compact,
                      isLoading: isSending,
                      onPressed: result != null && !isSending
                          ? () => onInvite(recipient)
                          : null,
                      label: l10n.guildNavbarInvite,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
