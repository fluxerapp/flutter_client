import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_webhook_list_item.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_empty_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_header.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_info_box.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/webhooks/guild_webhooks_notice_box.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_webhooks_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild_webhook_updates.dart';
import 'package:fluxer_app/features/settings/utils/guild_webhooks_utils.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class GuildWebhooksWidget extends ConsumerStatefulWidget {
  const GuildWebhooksWidget({
    required this.guildId,
    required this.webhooks,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final List<WebhookResponse> webhooks;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildWebhooksWidget> createState() =>
      _GuildWebhooksWidgetState();
}

class _GuildWebhooksWidgetState extends ConsumerState<GuildWebhooksWidget> {
  final GuildWebhookUpdates _pendingUpdates = GuildWebhookUpdates();
  int _formVersion = 0;
  bool _isSaving = false;
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController == null) {
      _ownedScrollController = ScrollController();
    }
  }

  @override
  void dispose() {
    _ownedScrollController?.dispose();
    super.dispose();
  }

  bool get _canManageWebhooks {
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    return hasPermission(permissions, Permission.manageWebhooks);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerSettingsSheet(
      hasUnsavedChanges: _pendingUpdates.hasUnsavedChanges,
      isSaving: _isSaving,
      onReset: _resetChanges,
      onSave: () => unawaited(_saveChanges(l10n)),
      child: _buildContent(context, l10n),
    );
  }

  Widget _buildContent(BuildContext context, FluxerLocalizations l10n) {
    if (!_canManageWebhooks) {
      return ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        children: <Widget>[
          const GuildWebhooksHeader(),
          GuildWebhooksNoticeBox(
            message: l10n.guildSettingsWebhooksPermissionRequired(
              l10n.permissionManageWebhooks,
            ),
          ),
        ],
      );
    }
    final List<Channel> availableChannels = filterTextChannels(
      ref.watch(guildSettingsChannelsProvider(widget.guildId)).value ??
          <Channel>[],
    );
    final Map<String, String> channelNames = channelNamesById(
      availableChannels,
    );
    final List<WebhookResponse> sortedWebhooks = sortGuildWebhooks(
      widget.webhooks,
      channelNames,
    );
    if (sortedWebhooks.isEmpty) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GuildWebhooksHeader(),
          GuildWebhooksInfoBox(),
          Expanded(child: GuildWebhooksEmptyState()),
        ],
      );
    }
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        const SliverToBoxAdapter(child: GuildWebhooksHeader()),
        const SliverToBoxAdapter(child: GuildWebhooksInfoBox()),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            0,
            context.layout.s4,
            kSettingsScrollBottomPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final WebhookResponse webhook = sortedWebhooks[index];
              return Padding(
                padding: EdgeInsets.only(bottom: context.layout.s3),
                child: ChannelWebhookListItem(
                  key: ValueKey<String>('${webhook.id}-$_formVersion'),
                  channelId: webhook.channelId,
                  webhook: webhook,
                  channelName: resolveWebhookChannelName(
                    l10n: l10n,
                    channelId: webhook.channelId,
                    channelNames: channelNames,
                  ),
                  availableChannels: availableChannels,
                  formVersion: _formVersion,
                  onUpdate: _handleWebhookUpdate,
                  onDelete: _handleWebhookDelete,
                ),
              );
            }, childCount: sortedWebhooks.length),
          ),
        ),
      ],
    );
  }

  void _handleWebhookUpdate(
    String webhookId, {
    String? name,
    String? avatar,
    String? channelId,
    bool clearAvatar = false,
  }) {
    WebhookResponse? original;
    for (final WebhookResponse webhook in widget.webhooks) {
      if (webhook.id == webhookId) {
        original = webhook;
        break;
      }
    }
    final WebhookResponse? resolved = original;
    if (resolved == null) {
      return;
    }
    setState(() {
      _pendingUpdates.applyPatch(
        resolved,
        name: name,
        avatar: avatar,
        channelId: channelId,
        clearAvatar: clearAvatar,
      );
    });
  }

  Future<void> _handleWebhookDelete(WebhookResponse webhook) async {
    await ref
        .read(guildWebhooksProvider(widget.guildId).notifier)
        .deleteWebhook(webhook.id);
    if (!mounted) {
      return;
    }
    setState(() {
      _pendingUpdates.reset();
      _formVersion++;
    });
  }

  void _resetChanges() {
    setState(() {
      _pendingUpdates.reset();
      _formVersion++;
    });
  }

  Future<void> _saveChanges(FluxerLocalizations l10n) async {
    if (!_pendingUpdates.hasUnsavedChanges) {
      return;
    }
    setState(() => _isSaving = true);
    try {
      await ref
          .read(guildWebhooksProvider(widget.guildId).notifier)
          .applyPendingUpdates(
            originals: widget.webhooks,
            updates: _pendingUpdates,
          );
      if (!mounted) {
        return;
      }
      setState(() => _formVersion++);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.guildSettingsWebhooksUpdated,
              variant: FluxerToastVariant.success,
            ),
          );
    } on Object {
      if (!mounted) {
        return;
      }
      await FluxerModal.show<void>(
        context,
        title: l10n.discoveryJoinErrorGenericMessage,
        centered: true,
        builder: (BuildContext dialogContext, VoidCallback close) {
          return Text(
            l10n.guildSettingsWebhooksUpdateFailed,
            style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }
}
