import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/overview/guild_invite_embed_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/overview/guild_message_history_threshold_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:fluxer_dart/export.dart';

class GuildOverviewWidget extends ConsumerStatefulWidget {
  const GuildOverviewWidget({
    required this.guildId,
    required this.details,
    super.key,
    this.scrollController,
  });

  final String guildId;
  final GuildSettingsDetails details;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildOverviewWidget> createState() =>
      _GuildOverviewWidgetState();
}

class _GuildOverviewWidgetState extends ConsumerState<GuildOverviewWidget> {
  late final TextEditingController _nameController;
  late String? _afkChannelId;
  late int _afkTimeout;
  late String? _systemChannelId;
  late bool _hideJoinMessages;
  late int _defaultNotifications;
  late int _splashCardAlignment;
  late bool _detachedBanner;
  late bool _flexibleNames;
  late bool _hideOwnerCrown;
  late List<String> _features;
  bool _isSaving = false;
  String? _pendingIconUri;
  String? _pendingBannerUri;
  String? _pendingSplashUri;
  String? _pendingEmbedSplashUri;
  bool _iconCleared = false;
  bool _bannerCleared = false;
  bool _splashCleared = false;
  bool _embedSplashCleared = false;

  @override
  void initState() {
    super.initState();
    _applyDetails(widget.details);
    _nameController = TextEditingController(text: widget.details.guild.name);
  }

  @override
  void didUpdateWidget(covariant GuildOverviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.details != widget.details && !_isDirty) {
      _applyDetails(widget.details);
      _nameController.text = widget.details.guild.name;
    }
  }

  void _applyDetails(GuildSettingsDetails details) {
    _afkChannelId = details.afkChannelId;
    _afkTimeout = details.afkTimeout;
    _systemChannelId = details.systemChannelId;
    _hideJoinMessages = details.hideJoinMessages;
    _defaultNotifications = details.defaultMessageNotifications;
    _splashCardAlignment = details.splashCardAlignment;
    _features = _resolveFeatures(details);
    _detachedBanner = details.hasDetachedBanner;
    _flexibleNames = details.hasTextChannelFlexibleNames;
    _hideOwnerCrown = details.hasHideOwnerCrown;
    _pendingIconUri = null;
    _pendingBannerUri = null;
    _pendingSplashUri = null;
    _pendingEmbedSplashUri = null;
    _iconCleared = false;
    _bannerCleared = false;
    _splashCleared = false;
    _embedSplashCleared = false;
  }

  List<String> _resolveFeatures(GuildSettingsDetails details) {
    if (details.features.isNotEmpty) {
      return List<String>.from(details.features);
    }
    return List<String>.from(details.guild.features);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isDirty {
    final GuildSettingsDetails details = widget.details;
    final List<String> originalFeatures = _resolveFeatures(details);
    final List<String> currentFeatures = _buildFeatureList();
    return _nameController.text.trim() != details.guild.name ||
        _afkChannelId != details.afkChannelId ||
        _afkTimeout != details.afkTimeout ||
        _systemChannelId != details.systemChannelId ||
        _hideJoinMessages != details.hideJoinMessages ||
        _defaultNotifications != details.defaultMessageNotifications ||
        _splashCardAlignment != details.splashCardAlignment ||
        !areGuildFeaturesEqual(originalFeatures, currentFeatures) ||
        _pendingIconUri != null ||
        _pendingBannerUri != null ||
        _pendingSplashUri != null ||
        _pendingEmbedSplashUri != null ||
        _iconCleared ||
        _bannerCleared ||
        _splashCleared ||
        _embedSplashCleared;
  }

  List<String> _buildFeatureList() {
    List<String> next = List<String>.from(_features);
    next = setGuildFeatureEnabled(
      features: next,
      feature: GuildFeatures.detachedBanner,
      enabled: _detachedBanner,
    );
    next = setGuildFeatureEnabled(
      features: next,
      feature: GuildFeatures.textChannelFlexibleNames,
      enabled: _flexibleNames,
    );
    next = setGuildFeatureEnabled(
      features: next,
      feature: GuildFeatures.hideOwnerCrown,
      enabled: _hideOwnerCrown,
    );
    return next;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildSettingsDetails details = widget.details;
    final Guild guild = details.guild;
    final AsyncValue<List<Channel>> channelsAsync = ref.watch(
      guildSettingsChannelsProvider(widget.guildId),
    );
    return FluxerSettingsSheet(
      hasUnsavedChanges: _isDirty,
      isSaving: _isSaving,
      onReset: _reset,
      onSave: _save,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        padding: guildSettingsScrollPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ..._buildSections(context, l10n, details, guild, channelsAsync),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSections(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildSettingsDetails details,
    Guild guild,
    AsyncValue<List<Channel>> channelsAsync,
  ) {
    return <Widget>[
      FluxerSettingsSection(
        title: l10n.guildSettingsOverviewBrandingTitle,
        description: l10n.guildSettingsOverviewBrandingDescription,
        isFirst: true,
        children: <Widget>[
          _buildIconSection(context, l10n, guild),
          FluxerInput(
            controller: _nameController,
            label: l10n.guildSettingsOverviewNameTitle,
            hint: l10n.guildSettingsOverviewNameHint,
            onChanged: (_) => setState(() {}),
          ),
          if (isGuildBannerEnabled(guild)) ...<Widget>[
            FluxerSettingsSwitchItem(
              label: l10n.guildSettingsOverviewDetachedBanner,
              description: l10n.guildSettingsOverviewDetachedBannerHint,
              value: _detachedBanner,
              onChanged: (bool value) =>
                  setState(() => _detachedBanner = value),
            ),
            _buildImageAssetSection(
              context: context,
              l10n: l10n,
              title: l10n.guildSettingsOverviewBannerTitle,
              preview: _buildBannerPreview(context, l10n, guild, details),
              uploadLabel: l10n.guildSettingsOverviewBannerUpload,
              showRemove: _hasBannerAsset(guild, details),
              onUpload: () => _handleImageUpload(
                guild: guild,
                aspectRatio: 16 / 9,
                maskShape: CropMaskShape.rectangle,
                cropTitle: l10n.cropBanner,
                allowAnimated: hasGuildFeature(
                  guild.features,
                  GuildFeatures.animatedBanner,
                ),
                animatedError: l10n.guildSettingsAnimatedBannerRequiresFeature,
                onPicked: (String dataUri) => setState(() {
                  _pendingBannerUri = dataUri;
                  _bannerCleared = false;
                }),
              ),
              onRemove: () => setState(() {
                _pendingBannerUri = null;
                _bannerCleared = true;
              }),
            ),
          ],
          if (isGuildInviteSplashEnabled(guild)) ...<Widget>[
            _buildImageAssetSection(
              context: context,
              l10n: l10n,
              title: l10n.guildSettingsOverviewSplashTitle,
              preview: _buildSplashPreview(context, l10n, guild, details),
              uploadLabel: l10n.guildSettingsOverviewUploadBackground,
              uploadHint: l10n.guildSettingsOverviewSplashUploadHint,
              showRemove: _hasSplashAsset(guild, details),
              onUpload: () => _handleImageUpload(
                guild: guild,
                aspectRatio: 16 / 9,
                maskShape: CropMaskShape.rectangle,
                cropTitle: l10n.guildSettingsOverviewSplashTitle,
                allowAnimated: false,
                animatedError: l10n.croppingAnimatedNotSupported,
                onPicked: (String dataUri) => setState(() {
                  _pendingSplashUri = dataUri;
                  _splashCleared = false;
                }),
              ),
              onRemove: () => setState(() {
                _pendingSplashUri = null;
                _splashCleared = true;
              }),
            ),
            _buildSplashAlignmentControls(context, l10n),
            _buildImageAssetSection(
              context: context,
              l10n: l10n,
              title: l10n.guildSettingsOverviewEmbedSplashTitle,
              preview: _buildEmbedSplashPreview(context, l10n, guild, details),
              uploadLabel: l10n.guildSettingsOverviewUploadBackground,
              uploadHint: l10n.guildSettingsOverviewEmbedSplashUploadHint,
              showRemove: _hasEmbedSplashAsset(guild, details),
              previewBelowHint: true,
              onUpload: () => _handleImageUpload(
                guild: guild,
                aspectRatio: 16 / 9,
                maskShape: CropMaskShape.rectangle,
                cropTitle: l10n.guildSettingsOverviewEmbedSplashTitle,
                allowAnimated: false,
                animatedError: l10n.croppingAnimatedNotSupported,
                onPicked: (String dataUri) => setState(() {
                  _pendingEmbedSplashUri = dataUri;
                  _embedSplashCleared = false;
                }),
              ),
              onRemove: () => setState(() {
                _pendingEmbedSplashUri = null;
                _embedSplashCleared = true;
              }),
            ),
          ],
        ],
      ),
      channelsAsync.when(
        loading: () => const SizedBox.shrink(),
        error: (_, _) => const SizedBox.shrink(),
        data: (List<Channel> channels) {
          final List<Channel> voiceChannels = channels
              .where((Channel c) => c.type == ChannelType.guildVoice)
              .toList();
          final List<Channel> textChannels = channels
              .where((Channel c) => c.type == ChannelType.guildText)
              .toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FluxerSettingsSection(
                title: l10n.guildSettingsOverviewIdleTitle,
                description: l10n.guildSettingsOverviewIdleDescription,
                children: <Widget>[
                  _buildChannelSelect(
                    context,
                    label: l10n.guildSettingsAfkChannel,
                    description: l10n.guildSettingsAfkChannelHint,
                    value: _afkChannelId,
                    noneLabel: l10n.guildSettingsNoAfkChannel,
                    channels: voiceChannels,
                    onChanged: (String? value) =>
                        setState(() => _afkChannelId = value),
                  ),
                  _buildAfkTimeoutSelect(context, l10n),
                ],
              ),
              FluxerSettingsSection(
                title: l10n.guildSettingsOverviewSystemTitle,
                description: l10n.guildSettingsOverviewSystemDescription,
                children: <Widget>[
                  _buildChannelSelect(
                    context,
                    label: l10n.guildSettingsSystemChannel,
                    description: l10n.guildSettingsSystemChannelHint,
                    value: _systemChannelId,
                    noneLabel: l10n.guildSettingsNoSystemChannel,
                    channels: textChannels,
                    onChanged: (String? value) =>
                        setState(() => _systemChannelId = value),
                  ),
                  FluxerSettingsSwitchItem(
                    label: l10n.guildSettingsHideJoinMessages,
                    description: l10n.guildSettingsHideJoinMessagesHint,
                    value: _hideJoinMessages,
                    onChanged: (bool value) =>
                        setState(() => _hideJoinMessages = value),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      FluxerSettingsSection(
        title: l10n.guildSettingsOverviewNotificationsTitle,
        children: <Widget>[
          if (guild.memberCount > 250)
            FluxerWarningAlert(
              message: l10n.guildSettingsOverviewNotificationsLargeGuild,
            ),
          IgnorePointer(
            ignoring: guild.memberCount > 250,
            child: Opacity(
              opacity: guild.memberCount > 250 ? 0.5 : 1,
              child: FluxerRadioGroup<int>(
                label: l10n.guildSettingsDefaultNotifications,
                value: guild.memberCount > 250 ? 1 : _defaultNotifications,
                items: <FluxerRadioItem<int>>[
                  FluxerRadioItem<int>(
                    value: 0,
                    label: l10n.guildSettingsNotificationsAll,
                    description: l10n.guildSettingsNotificationsAllDescription,
                  ),
                  FluxerRadioItem<int>(
                    value: 1,
                    label: l10n.guildSettingsNotificationsMentions,
                    description:
                        l10n.guildSettingsNotificationsMentionsDescription,
                  ),
                ],
                onChanged: (int value) =>
                    setState(() => _defaultNotifications = value),
              ),
            ),
          ),
        ],
      ),
      FluxerSettingsSection(
        title: l10n.guildSettingsOverviewMessageHistoryTitle(
          l10n.permissionReadMessageHistory,
        ),
        description: l10n.guildSettingsOverviewMessageHistoryDescription(
          l10n.permissionReadMessageHistory,
        ),
        children: <Widget>[
          FluxerButton.secondary(
            onPressed: () => showGuildMessageHistoryThresholdSheet(
              context: context,
              guildId: widget.guildId,
              initialCutoff: details.messageHistoryCutoff,
            ),
            label: l10n.guildSettingsOverviewMessageHistoryOpen,
            fitContent: true,
          ),
        ],
      ),
      FluxerSettingsSection(
        title: l10n.guildSettingsOverviewTextChannelNamesTitle,
        children: <Widget>[
          FluxerSettingsSwitchItem(
            label: l10n.guildSettingsOverviewFlexibleNames,
            description: l10n.guildSettingsOverviewFlexibleNamesHint,
            value: _flexibleNames,
            onChanged: (bool value) => setState(() => _flexibleNames = value),
          ),
        ],
      ),
      FluxerSettingsSection(
        title: l10n.guildSettingsOverviewOwnerCrownTitle,
        description: l10n.guildSettingsOverviewOwnerCrownDescription,
        children: <Widget>[
          FluxerSettingsSwitchItem(
            label: l10n.guildSettingsOverviewHideOwnerCrown,
            description: l10n.guildSettingsOverviewHideOwnerCrownHint,
            value: _hideOwnerCrown,
            onChanged: (bool value) => setState(() => _hideOwnerCrown = value),
          ),
        ],
      ),
    ];
  }

  Widget _buildIconSection(
    BuildContext context,
    FluxerLocalizations l10n,
    Guild guild,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.guildSettingsOverviewIconTitle,
          style: context.textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.layout.s2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildIconPreview(context, guild),
            SizedBox(width: context.layout.s4),
            Expanded(
              child: Wrap(
                spacing: context.layout.s2,
                runSpacing: context.layout.s2,
                children: <Widget>[
                  FluxerButton.primary(
                    onPressed: () => _handleImageUpload(
                      guild: guild,
                      aspectRatio: 1,
                      maskShape: CropMaskShape.circle,
                      cropTitle: l10n.cropAvatar,
                      allowAnimated: hasGuildFeature(
                        guild.features,
                        GuildFeatures.animatedIcon,
                      ),
                      animatedError:
                          l10n.guildSettingsAnimatedIconRequiresFeature,
                      onPicked: (String dataUri) => setState(() {
                        _pendingIconUri = dataUri;
                        _iconCleared = false;
                      }),
                    ),
                    label: l10n.guildSettingsOverviewUploadIcon,
                    size: FluxerButtonSize.small,
                    fitContent: true,
                  ),
                  if (_hasIconAsset(guild))
                    FluxerButton.secondary(
                      onPressed: () => setState(() {
                        _pendingIconUri = null;
                        _iconCleared = true;
                      }),
                      label: l10n.guildSettingsOverviewRemoveImage,
                      size: FluxerButtonSize.small,
                      fitContent: true,
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: context.layout.s3),
        FluxerHintText(l10n.avatarDescription),
      ],
    );
  }

  Widget _buildSplashAlignmentControls(
    BuildContext context,
    FluxerLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.guildSettingsOverviewInvitePreviewTitle,
          style: context.textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.layout.s1),
        Text(
          l10n.guildSettingsOverviewInvitePreviewHint,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: context.layout.s4),
        Text(
          l10n.guildSettingsSplashCardAlignment,
          style: context.textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.layout.s2),
        FluxerCardAlignmentControls(
          value: _splashCardAlignment,
          semanticLabels: <int, String>{
            0: l10n.guildSettingsSplashAlignmentCenter,
            1: l10n.guildSettingsSplashAlignmentLeft,
            2: l10n.guildSettingsSplashAlignmentRight,
          },
          onChanged: (int value) =>
              setState(() => _splashCardAlignment = value),
        ),
        SizedBox(height: context.layout.s1),
        Text(
          l10n.guildSettingsSplashAlignmentHint,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildImageAssetSection({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required String title,
    required Widget preview,
    required String uploadLabel,
    required bool showRemove,
    required VoidCallback onUpload,
    required VoidCallback onRemove,
    String? uploadHint,
    bool previewBelowHint = false,
  }) {
    final Widget buttons = Wrap(
      spacing: context.layout.s2,
      runSpacing: context.layout.s2,
      children: <Widget>[
        FluxerButton.primary(
          onPressed: onUpload,
          label: uploadLabel,
          size: FluxerButtonSize.small,
          fitContent: true,
        ),
        if (showRemove)
          FluxerButton.secondary(
            onPressed: onRemove,
            label: l10n.guildSettingsOverviewRemoveImage,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
      ],
    );
    final Widget? hint = uploadHint == null ? null : FluxerHintText(uploadHint);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: context.textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.layout.s2),
        buttons,
        if (previewBelowHint && hint != null) ...<Widget>[
          SizedBox(height: context.layout.s3),
          hint,
        ],
        if (!previewBelowHint) ...<Widget>[
          SizedBox(height: context.layout.s2),
          preview,
        ],
        if (previewBelowHint) ...<Widget>[
          SizedBox(height: context.layout.s2),
          preview,
        ],
        if (!previewBelowHint && hint != null) ...<Widget>[
          SizedBox(height: context.layout.s3),
          hint,
        ],
      ],
    );
  }

  Widget _buildIconPreview(BuildContext context, Guild guild) {
    const double size = 80;
    final String? dataUri = _pendingIconUri;
    final Widget icon = dataUri != null
        ? _buildDataUriImage(dataUri, size: size)
        : FluxerGuildIconAvatar(
            name: guild.name,
            imageUrl: _iconCleared ? null : guild.iconUrl,
            isCircle: true,
            size: size,
          );
    return _buildGuildSettingsIconPreview(context, size: size, child: icon);
  }

  Widget _buildGuildSettingsIconPreview(
    BuildContext context, {
    required double size,
    required Widget child,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }

  Widget _buildBannerPreview(
    BuildContext context,
    FluxerLocalizations l10n,
    Guild guild,
    GuildSettingsDetails details,
  ) {
    return _buildAspectRatioImagePreview(
      context: context,
      aspectRatio: _kGuildBannerAspectRatio,
      dataUri: _pendingBannerUri,
      networkUrl: _bannerCleared
          ? null
          : (details.guild.bannerUrl ?? guild.bannerUrl),
      emptyPlaceholder: l10n.guildSettingsOverviewNoCommunityBanner,
    );
  }

  Widget _buildSplashPreview(
    BuildContext context,
    FluxerLocalizations l10n,
    Guild guild,
    GuildSettingsDetails details,
  ) {
    final String? hash = details.splash ?? guild.splash;
    return _buildAspectRatioImagePreview(
      context: context,
      aspectRatio: _kGuildSplashAspectRatio,
      dataUri: _pendingSplashUri,
      networkUrl: _splashCleared
          ? null
          : guild.splashUrl ??
                FluxerMediaUrl.guildSplash(guildId: widget.guildId, hash: hash),
      emptyPlaceholder: l10n.guildSettingsOverviewNoInviteBackground,
    );
  }

  Widget _buildEmbedSplashPreview(
    BuildContext context,
    FluxerLocalizations l10n,
    Guild guild,
    GuildSettingsDetails details,
  ) {
    final String? hash = details.embedSplash ?? guild.embedSplash;
    final String displayName = _nameController.text.trim().isEmpty
        ? guild.name
        : _nameController.text.trim();
    return GuildInviteEmbedPreview(
      guildName: displayName,
      features: _buildFeatureList(),
      onlineCount: guild.onlineCount,
      memberCount: guild.memberCount,
      l10n: l10n,
      iconDataUri: _iconCleared ? null : _pendingIconUri,
      iconNetworkUrl: _iconCleared ? null : guild.iconUrl,
      splashDataUri: _embedSplashCleared ? null : _pendingEmbedSplashUri,
      splashNetworkUrl: _embedSplashCleared
          ? null
          : guild.embedSplashUrl ??
                (hash == null
                    ? null
                    : FluxerMediaUrl.guildEmbedSplash(
                        guildId: widget.guildId,
                        hash: hash,
                      )),
    );
  }

  Widget _buildAspectRatioImagePreview({
    required BuildContext context,
    required double aspectRatio,
    required String? dataUri,
    required String? networkUrl,
    String? emptyPlaceholder,
  }) {
    final Widget? image = _buildPreviewImage(
      context: context,
      dataUri: dataUri,
      networkUrl: networkUrl,
    );
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colors.backgroundSecondaryAlt,
          borderRadius: context.layout.radiusLg,
        ),
        clipBehavior: Clip.hardEdge,
        child:
            image ??
            (emptyPlaceholder == null
                ? null
                : Padding(
                    padding: EdgeInsets.all(context.layout.s4),
                    child: Text(
                      emptyPlaceholder,
                      style: context.textStyles.bodySmall.copyWith(
                        color: context.colors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
      ),
    );
  }

  Widget? _buildPreviewImage({
    required BuildContext context,
    required String? dataUri,
    required String? networkUrl,
  }) {
    if (dataUri != null) {
      final Uint8List? bytes = _decodeDataUri(dataUri);
      if (bytes == null) {
        return null;
      }
      return Image.memory(
        bytes,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      );
    }
    if (networkUrl != null) {
      return Image.network(
        networkUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      );
    }
    return null;
  }

  Widget _buildDataUriImage(String dataUri, {double? height, double? size}) {
    final Uint8List? bytes = _decodeDataUri(dataUri);
    if (bytes == null) {
      return SizedBox(height: height, width: size);
    }
    return Image.memory(
      bytes,
      height: height,
      width: size ?? double.infinity,
      fit: BoxFit.cover,
    );
  }

  Uint8List? _decodeDataUri(String dataUri) {
    final int commaIndex = dataUri.indexOf(',');
    if (commaIndex < 0) {
      return null;
    }
    try {
      return base64Decode(dataUri.substring(commaIndex + 1));
    } on FormatException {
      return null;
    }
  }

  bool _hasIconAsset(Guild guild) {
    return (_pendingIconUri != null || guild.icon != null) && !_iconCleared;
  }

  bool _hasBannerAsset(Guild guild, GuildSettingsDetails details) {
    final bool hasStored = details.guild.banner != null || guild.banner != null;
    return (_pendingBannerUri != null || hasStored) && !_bannerCleared;
  }

  bool _hasSplashAsset(Guild guild, GuildSettingsDetails details) {
    final bool hasStored = details.splash != null || guild.splash != null;
    return (_pendingSplashUri != null || hasStored) && !_splashCleared;
  }

  bool _hasEmbedSplashAsset(Guild guild, GuildSettingsDetails details) {
    final bool hasStored =
        details.embedSplash != null || guild.embedSplash != null;
    return (_pendingEmbedSplashUri != null || hasStored) &&
        !_embedSplashCleared;
  }

  List<FluxerSelectItem<int>> _buildAfkTimeoutItems(FluxerLocalizations l10n) {
    final List<MapEntry<int, String Function(FluxerLocalizations)>> options =
        List<MapEntry<int, String Function(FluxerLocalizations)>>.from(
          _afkTimeoutOptions,
        );
    if (!options.any(
      (MapEntry<int, String Function(FluxerLocalizations)> entry) =>
          entry.key == _afkTimeout,
    )) {
      options.insert(
        0,
        MapEntry<int, String Function(FluxerLocalizations)>(
          _afkTimeout,
          (FluxerLocalizations l10n) =>
              l10n.guildSettingsAfkTimeoutSeconds(_afkTimeout),
        ),
      );
    }
    return options
        .map(
          (MapEntry<int, String Function(FluxerLocalizations)> entry) =>
              FluxerSelectItem<int>(value: entry.key, label: entry.value(l10n)),
        )
        .toList();
  }

  Widget _buildAfkTimeoutSelect(
    BuildContext context,
    FluxerLocalizations l10n,
  ) {
    return FluxerSelect<int>(
      label: l10n.guildSettingsAfkTimeout,
      value: _afkTimeout,
      enableSearch: false,
      items: _buildAfkTimeoutItems(l10n),
      onChanged: (int value) => setState(() => _afkTimeout = value),
    );
  }

  Widget _buildChannelSelect(
    BuildContext context, {
    required String label,
    required String? value,
    required String noneLabel,
    required List<Channel> channels,
    required ValueChanged<String?> onChanged,
    String? description,
  }) {
    const String noneValue = '';
    return FluxerSelect<String>(
      label: label,
      description: description,
      value: value ?? noneValue,
      enableSearch: channels.length > 8,
      items: <FluxerSelectItem<String>>[
        FluxerSelectItem<String>(value: noneValue, label: noneLabel),
        for (final Channel channel in channels)
          FluxerSelectItem<String>(value: channel.id, label: channel.name),
      ],
      onChanged: (String selected) =>
          onChanged(selected.isEmpty ? null : selected),
    );
  }

  Future<void> _handleImageUpload({
    required Guild guild,
    required double aspectRatio,
    required CropMaskShape maskShape,
    required String cropTitle,
    required bool allowAnimated,
    required String animatedError,
    required ValueChanged<String> onPicked,
  }) async {
    final ({Uint8List bytes, String name})? picked =
        await ImageUtils.pickImage();
    if (picked == null || !mounted) {
      return;
    }
    if (ImageUtils.isOverSizeLimit(picked.bytes)) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(context).imageFileTooLarge,
              variant: FluxerToastVariant.danger,
            ),
          );
      return;
    }
    final AnimationCheckResult animCheck = ImageUtils.checkAnimated(
      picked.bytes,
    );
    if (animCheck.isAnimated) {
      if (!allowAnimated) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: animatedError,
                variant: FluxerToastVariant.warning,
              ),
            );
        return;
      }
      onPicked(ImageUtils.toDataUri(picked.bytes));
      return;
    }
    if (!mounted) {
      return;
    }
    final Uint8List? croppedBytes = await showImageCropSheet(
      context,
      imageBytes: picked.bytes,
      aspectRatio: aspectRatio,
      title: cropTitle,
      maskShape: maskShape,
    );
    if (croppedBytes == null || !mounted) {
      return;
    }
    onPicked(ImageUtils.toDataUri(croppedBytes));
  }

  void _reset() {
    setState(() {
      _applyDetails(widget.details);
      _nameController.text = widget.details.guild.name;
    });
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      final GuildSettingsDetails details = widget.details;
      int systemFlags = details.systemChannelFlags;
      if (_hideJoinMessages) {
        systemFlags |= 1;
      } else {
        systemFlags &= ~1;
      }
      final List<String> originalFeatures = _resolveFeatures(details);
      final List<String> updatedFeatures = _buildFeatureList();
      final List<String>? featuresUpdate = buildGuildFeaturesUpdate(
        original: originalFeatures,
        updated: updatedFeatures,
      );
      await ref
          .read(guildSettingsOverviewActionsProvider(widget.guildId).notifier)
          .updateGuild(
            GuildUpdateRequest(
              name: _nameController.text.trim(),
              icon: _resolveImageField(
                pending: _pendingIconUri,
                cleared: _iconCleared,
              ),
              banner: _resolveImageField(
                pending: _pendingBannerUri,
                cleared: _bannerCleared,
              ),
              splash: _resolveImageField(
                pending: _pendingSplashUri,
                cleared: _splashCleared,
              ),
              embedSplash: _resolveImageField(
                pending: _pendingEmbedSplashUri,
                cleared: _embedSplashCleared,
              ),
              splashCardAlignment:
                  GuildUpdateRequestSplashCardAlignmentSplashCardAlignment.fromJson(
                    _splashCardAlignment,
                  ),
              afkChannelId: _afkChannelId,
              afkTimeout: _afkTimeout,
              systemChannelId: _systemChannelId,
              systemChannelFlags: systemFlags,
              defaultMessageNotifications: DefaultMessageNotifications.fromJson(
                _defaultNotifications,
              ),
              features: featuresUpdate,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  String? _resolveImageField({
    required String? pending,
    required bool cleared,
  }) {
    if (cleared) {
      return '';
    }
    return pending;
  }
}

const double _kGuildBannerAspectRatio = 16 / 9;
const double _kGuildSplashAspectRatio = 16 / 9;

const List<MapEntry<int, String Function(FluxerLocalizations l10n)>>
_afkTimeoutOptions = <MapEntry<int, String Function(FluxerLocalizations l10n)>>[
  MapEntry<int, String Function(FluxerLocalizations l10n)>(60, _afk1Min),
  MapEntry<int, String Function(FluxerLocalizations l10n)>(300, _afk5Min),
  MapEntry<int, String Function(FluxerLocalizations l10n)>(900, _afk15Min),
  MapEntry<int, String Function(FluxerLocalizations l10n)>(1800, _afk30Min),
  MapEntry<int, String Function(FluxerLocalizations l10n)>(3600, _afk1Hour),
];

String _afk1Min(FluxerLocalizations l10n) => l10n.guildSettingsAfkTimeout1Min;
String _afk5Min(FluxerLocalizations l10n) => l10n.guildSettingsAfkTimeout5Min;
String _afk15Min(FluxerLocalizations l10n) => l10n.guildSettingsAfkTimeout15Min;
String _afk30Min(FluxerLocalizations l10n) => l10n.guildSettingsAfkTimeout30Min;
String _afk1Hour(FluxerLocalizations l10n) => l10n.guildSettingsAfkTimeout1Hour;
