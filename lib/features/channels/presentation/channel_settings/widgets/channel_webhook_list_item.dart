import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_webhooks_provider.dart';
import 'package:fluxer_app/features/channels/utils/webhook_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef WebhookListItemUpdateCallback =
    void Function(
      String webhookId, {
      String? name,
      String? avatar,
      String? channelId,
      bool clearAvatar,
    });

typedef WebhookListItemDeleteCallback =
    Future<void> Function(WebhookResponse webhook);

class ChannelWebhookListItem extends ConsumerStatefulWidget {
  const ChannelWebhookListItem({
    required this.channelId,
    required this.webhook,
    required this.channelName,
    required this.availableChannels,
    this.onUpdate,
    this.onDelete,
    this.formVersion = 0,
    this.defaultExpanded = false,
    super.key,
  });

  final String channelId;
  final WebhookResponse webhook;
  final String channelName;
  final List<Channel> availableChannels;
  final WebhookListItemUpdateCallback? onUpdate;
  final WebhookListItemDeleteCallback? onDelete;
  final int formVersion;
  final bool defaultExpanded;

  @override
  ConsumerState<ChannelWebhookListItem> createState() =>
      _ChannelWebhookListItemState();
}

class _ChannelWebhookListItemState
    extends ConsumerState<ChannelWebhookListItem> {
  bool _isExpanded = false;
  bool _isDeleting = false;
  bool _isUpdatingAvatar = false;
  late TextEditingController _nameController;
  late TextEditingController _urlController;
  String? _localAvatarOverride;
  String _selectedChannelId = '';

  bool get _usesDeferredUpdates => widget.onUpdate != null;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.defaultExpanded;
    _nameController = TextEditingController(text: widget.webhook.name);
    _urlController = TextEditingController();
    _selectedChannelId = widget.webhook.channelId;
    _syncUrlController();
  }

  @override
  void didUpdateWidget(covariant ChannelWebhookListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.formVersion != widget.formVersion) {
      _nameController.text = widget.webhook.name;
      _selectedChannelId = widget.webhook.channelId;
      _localAvatarOverride = null;
      _syncUrlController();
      return;
    }
    if (oldWidget.webhook.id != widget.webhook.id ||
        oldWidget.webhook.name != widget.webhook.name ||
        oldWidget.webhook.token != widget.webhook.token ||
        oldWidget.webhook.channelId != widget.webhook.channelId) {
      _nameController.text = widget.webhook.name;
      _selectedChannelId = widget.webhook.channelId;
      _localAvatarOverride = null;
      _syncUrlController();
    }
  }

  void _syncUrlController() {
    _urlController.text = _webhookUrl;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  String? get _effectiveAvatar {
    if (_localAvatarOverride != null) {
      return _localAvatarOverride;
    }
    return widget.webhook.avatar;
  }

  String get _webhookUrl {
    final String apiPublicBase = resolveWebhookApiPublicBase(
      ref.read(activeInstanceProvider).wellKnown,
    );
    return buildWebhookUrl(
      apiPublicBase: apiPublicBase,
      webhookId: widget.webhook.id,
      token: widget.webhook.token,
    );
  }

  Future<void> _updateWebhook({
    String? name,
    String? avatar,
    String? channelId,
    bool clearAvatar = false,
  }) async {
    if (_usesDeferredUpdates) {
      widget.onUpdate!(
        widget.webhook.id,
        name: name,
        avatar: avatar,
        channelId: channelId,
        clearAvatar: clearAvatar,
      );
      return;
    }
    await ref
        .read(channelWebhooksProvider(widget.channelId).notifier)
        .updateWebhook(
          webhookId: widget.webhook.id,
          name: name,
          avatar: clearAvatar ? '' : avatar,
          channelId: channelId,
        );
  }

  Future<void> _handleAvatarUpload() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ({Uint8List bytes, String name})? picked =
        await ImageUtils.pickImage();
    if (picked == null || !mounted) {
      return;
    }
    if (ImageUtils.isOverSizeLimit(picked.bytes)) {
      if (!mounted) {
        return;
      }
      await FluxerModal.show<void>(
        context,
        title: l10n.imageFileTooLarge,
        centered: true,
        builder: (BuildContext dialogContext, VoidCallback close) {
          return const SizedBox.shrink();
        },
      );
      return;
    }
    setState(() => _isUpdatingAvatar = true);
    try {
      final String dataUri = ImageUtils.toDataUri(picked.bytes);
      setState(() => _localAvatarOverride = dataUri);
      await _updateWebhook(avatar: dataUri);
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _localAvatarOverride = null);
    } finally {
      if (mounted) {
        setState(() => _isUpdatingAvatar = false);
      }
    }
  }

  Future<void> _handleClearAvatar() async {
    setState(() => _localAvatarOverride = '');
    try {
      await _updateWebhook(clearAvatar: true);
    } on Object {
      if (mounted) {
        setState(() => _localAvatarOverride = null);
      }
    }
  }

  Future<void> _handleDelete() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await FluxerConfirmSheet.show(
      context,
      title: l10n.channelSettingsWebhooksDelete,
      description: l10n.channelSettingsWebhooksDeleteConfirm,
      confirmLabel: l10n.channelSettingsWebhooksDelete,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !mounted) {
      return;
    }
    setState(() => _isDeleting = true);
    try {
      if (widget.onDelete != null) {
        await widget.onDelete!(widget.webhook);
      } else {
        await ref
            .read(channelWebhooksProvider(widget.channelId).notifier)
            .deleteWebhook(widget.webhook.id);
      }
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
            l10n.channelSettingsWebhooksDeleteFailed,
            style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() => _isDeleting = false);
      }
    }
  }

  Future<void> _copyWebhookUrl() async {
    await copyToClipboard(context: context, value: _webhookUrl);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final UserPartialResponse creator = widget.webhook.user;
    final String creatorName = resolveDisplayName(
      username: creator.username,
      globalName: creator.globalName,
    );
    final DateTime createdAt = dateTimeFromSnowflakeAsLocalOrNow(
      widget.webhook.id,
    );
    final String createdDate = formatUserMediumDate(createdAt, l10n.localeName);
    final String? avatarUrl = resolveWebhookAvatarUrl(
      webhookId: widget.webhook.id,
      avatar: _effectiveAvatar?.isEmpty ?? true ? null : _effectiveAvatar,
    );
    final bool hasAvatar =
        _effectiveAvatar != null && _effectiveAvatar!.isNotEmpty;
    return Container(
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: context.colors.backgroundHeaderSecondary),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FluxerTappable(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            builder: (BuildContext context, _) {
              return Padding(
                padding: EdgeInsets.all(context.layout.s3),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildAvatarPreview(
                            context,
                            avatarUrl: avatarUrl,
                            name: widget.webhook.name,
                          ),
                          SizedBox(width: context.layout.s3),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        widget.webhook.name,
                                        style: context.textStyles.bodyMedium
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: context.colors.textPrimary,
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (!isMobile) ...<Widget>[
                                      SizedBox(width: context.layout.s2),
                                      _buildChannelTag(context),
                                    ],
                                  ],
                                ),
                                SizedBox(height: context.layout.s1),
                                Text(
                                  l10n.channelSettingsWebhooksCreatedBy(
                                    creatorName,
                                    createdDate,
                                  ),
                                  style: context.textStyles.timestamp.copyWith(
                                    color: context.colors.textPrimaryMuted,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (isMobile) ...<Widget>[
                                  SizedBox(height: context.layout.s1),
                                  _buildChannelTag(context),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    PhosphorIcon(
                      _isExpanded
                          ? PhosphorIconsBold.caretUp
                          : PhosphorIconsBold.caretDown,
                      size: isMobile ? 20 : 24,
                      color: context.colors.textPrimaryMuted,
                    ),
                  ],
                ),
              );
            },
          ),
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.layout.s3,
                0,
                context.layout.s3,
                context.layout.s3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Divider(
                    height: 1,
                    color: context.colors.backgroundHeaderSecondary,
                  ),
                  SizedBox(height: context.layout.s3),
                  if (isMobile)
                    _buildExpandedContentMobile(
                      context,
                      l10n: l10n,
                      hasAvatar: hasAvatar,
                      avatarUrl: avatarUrl,
                    )
                  else
                    _buildExpandedContentDesktop(
                      context,
                      l10n: l10n,
                      hasAvatar: hasAvatar,
                      avatarUrl: avatarUrl,
                    ),
                  SizedBox(height: context.layout.s3),
                  Wrap(
                    spacing: context.layout.s2,
                    runSpacing: context.layout.s2,
                    children: <Widget>[
                      FluxerButton.secondary(
                        onPressed: _copyWebhookUrl,
                        label: l10n.channelSettingsWebhooksCopyUrl,
                        size: FluxerButtonSize.small,
                        icon: PhosphorIconsBold.copy,
                        fitContent: true,
                      ),
                      FluxerButton.dangerSecondary(
                        onPressed: _isDeleting ? null : _handleDelete,
                        label: l10n.channelSettingsWebhooksDelete,
                        size: FluxerButtonSize.small,
                        icon: PhosphorIconsBold.trash,
                        isLoading: _isDeleting,
                        fitContent: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  String _resolveDisplayChannelName() {
    for (final Channel channel in widget.availableChannels) {
      if (channel.id == _selectedChannelId) {
        return channel.name;
      }
    }
    return widget.channelName;
  }

  Widget _buildChannelTag(BuildContext context) {
    final String displayName = _resolveDisplayChannelName();
    return Text(
      '#$displayName',
      style: context.textStyles.smallText.copyWith(
        color: context.colors.textPrimaryMuted,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAvatarPreview(
    BuildContext context, {
    required String? avatarUrl,
    required String name,
  }) {
    return FluxerAvatar(fallbackText: name, imageUrl: avatarUrl);
  }

  Widget _buildExpandedContentDesktop(
    BuildContext context, {
    required FluxerLocalizations l10n,
    required bool hasAvatar,
    required String? avatarUrl,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildAvatarColumn(
          context,
          l10n: l10n,
          hasAvatar: hasAvatar,
          avatarUrl: avatarUrl,
        ),
        SizedBox(width: context.layout.s4),
        Expanded(child: _buildFieldsColumn(context, l10n: l10n)),
      ],
    );
  }

  Widget _buildExpandedContentMobile(
    BuildContext context, {
    required FluxerLocalizations l10n,
    required bool hasAvatar,
    required String? avatarUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildAvatarColumn(
          context,
          l10n: l10n,
          hasAvatar: hasAvatar,
          avatarUrl: avatarUrl,
        ),
        SizedBox(height: context.layout.s3),
        _buildFieldsColumn(context, l10n: l10n, stackFields: true),
      ],
    );
  }

  Widget _buildAvatarColumn(
    BuildContext context, {
    required FluxerLocalizations l10n,
    required bool hasAvatar,
    required String? avatarUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.channelSettingsWebhooksAvatar,
          style: context.textStyles.categoryName,
        ),
        SizedBox(height: context.layout.s2),
        FluxerAvatar(
          fallbackText: widget.webhook.name,
          imageUrl: avatarUrl,
          size: 64,
        ),
        SizedBox(height: context.layout.s2),
        FluxerButton.secondary(
          onPressed: _isUpdatingAvatar ? null : _handleAvatarUpload,
          label: l10n.channelSettingsWebhooksUploadImage,
          size: FluxerButtonSize.small,
          isLoading: _isUpdatingAvatar,
          fitContent: true,
        ),
        if (hasAvatar) ...<Widget>[
          SizedBox(height: context.layout.s2),
          FluxerButton.secondary(
            onPressed: _handleClearAvatar,
            label: l10n.channelSettingsWebhooksRemove,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
        ],
      ],
    );
  }

  Widget _buildFieldsColumn(
    BuildContext context, {
    required FluxerLocalizations l10n,
    bool stackFields = false,
  }) {
    final List<FluxerSelectItem<String>> channelItems = widget.availableChannels
        .map(
          (Channel channel) =>
              FluxerSelectItem<String>(value: channel.id, label: channel.name),
        )
        .toList();
    final Widget nameField = FluxerInput(
      controller: _nameController,
      label: l10n.channelSettingsWebhooksName,
      hint: l10n.channelSettingsWebhooksNamePlaceholder,
      onSubmitted: (String value) =>
          unawaited(_updateWebhook(name: value.trim())),
    );
    final Widget? channelField = channelItems.isEmpty
        ? null
        : FluxerSelect<String>(
            label: l10n.channelSettingsWebhooksChannel,
            value: _selectedChannelId,
            items: channelItems,
            onChanged: (String? value) {
              if (value == null) {
                return;
              }
              setState(() => _selectedChannelId = value);
              if (value == widget.webhook.channelId && !_usesDeferredUpdates) {
                return;
              }
              unawaited(_updateWebhook(channelId: value));
            },
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (stackFields) ...<Widget>[
          nameField,
          if (channelField != null) ...<Widget>[
            SizedBox(height: context.layout.s3),
            channelField,
          ],
        ] else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: nameField),
              if (channelField != null) ...<Widget>[
                SizedBox(width: context.layout.s3),
                Expanded(child: channelField),
              ],
            ],
          ),
        SizedBox(height: context.layout.s3),
        FluxerInput(
          readOnly: true,
          label: l10n.channelSettingsWebhooksUrl,
          controller: _urlController,
        ),
      ],
    );
  }
}
