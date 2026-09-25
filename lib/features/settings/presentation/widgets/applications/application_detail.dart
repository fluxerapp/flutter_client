import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/constants/user_flags.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_bot_profile_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_danger_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_header.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_info_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_oauth_builder_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_secrets_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/applications_view_model.dart';
import 'package:fluxer_app/features/settings/utils/bot_username.dart';
import 'package:fluxer_app/features/settings/utils/oauth_authorize_url.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ApplicationDetail extends ConsumerStatefulWidget {
  const ApplicationDetail({
    required this.onBack,
    this.scrollController,
    super.key,
  });

  final VoidCallback onBack;
  final ScrollController? scrollController;

  @override
  ConsumerState<ApplicationDetail> createState() => _ApplicationDetailState();
}

class _ApplicationDetailState extends ConsumerState<ApplicationDetail> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final List<TextEditingController> _redirectControllers =
      <TextEditingController>[];

  String? _boundAppId;
  bool _botPublic = true;
  bool _botRequireCodeGrant = false;
  bool _friendlyBot = false;
  bool _manualApproval = false;
  String? _previewAvatar;
  String? _previewBanner;
  bool _clearedAvatar = false;
  bool _clearedBanner = false;
  final Set<String> _builderScopes = <String>{};
  final Set<Permission> _builderPermissions = <Permission>{};
  String? _builderRedirectUri;
  String? _nameError;
  String? _usernameError;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _disposeRedirects();
    super.dispose();
  }

  void _onFormChanged() {
    if (!mounted) {
      return;
    }
    setState(() {
      _nameError = null;
      _usernameError = null;
    });
  }

  void _disposeRedirects() {
    for (final TextEditingController controller in _redirectControllers) {
      controller.dispose();
    }
    _redirectControllers.clear();
  }

  void _bindApplication(ApplicationResponse app) {
    final bool switchedApp = _boundAppId != app.id;
    _boundAppId = app.id;
    _nameController.text = app.name;
    _usernameController.text = app.bot?.username ?? '';
    _bioController.text = app.bot?.bio ?? '';
    _nameController
      ..removeListener(_onFormChanged)
      ..addListener(_onFormChanged);
    _usernameController
      ..removeListener(_onFormChanged)
      ..addListener(_onFormChanged);
    _bioController
      ..removeListener(_onFormChanged)
      ..addListener(_onFormChanged);
    _botPublic = app.botPublic;
    _botRequireCodeGrant = app.botRequireCodeGrant;
    _friendlyBot = isFriendlyBot(app.bot?.flags ?? 0);
    _manualApproval = isFriendlyBotManualApproval(app.bot?.flags ?? 0);
    _previewAvatar = null;
    _previewBanner = null;
    _clearedAvatar = false;
    _clearedBanner = false;
    _nameError = null;
    _usernameError = null;
    _disposeRedirects();
    final List<String> redirects = app.redirectUris.isEmpty
        ? <String>['']
        : List<String>.from(app.redirectUris);
    for (final String uri in redirects) {
      _redirectControllers.add(
        TextEditingController(text: uri)..addListener(_onFormChanged),
      );
    }
    final List<String> redirectOptions = redirects
        .map((uri) => uri.trim())
        .where((uri) => uri.isNotEmpty)
        .toList();
    if (switchedApp) {
      _builderScopes.clear();
      _builderPermissions.clear();
      _builderRedirectUri = redirectOptions.firstOrNull;
    } else {
      final String? current = _builderRedirectUri?.trim();
      if (current == null ||
          current.isEmpty ||
          !redirectOptions.contains(current)) {
        _builderRedirectUri = redirectOptions.firstOrNull;
      }
    }
  }

  bool _isDirty(ApplicationResponse app) {
    if (_nameController.text.trim() != app.name) {
      return true;
    }
    if (_botPublic != app.botPublic ||
        _botRequireCodeGrant != app.botRequireCodeGrant) {
      return true;
    }
    if (_redirectValues().join(',') != app.redirectUris.join(',')) {
      return true;
    }
    if (_previewAvatar != null ||
        _clearedAvatar ||
        _previewBanner != null ||
        _clearedBanner) {
      return true;
    }
    final ApplicationResponseBot? bot = app.bot;
    if (bot == null) {
      return false;
    }
    return _usernameController.text.trim() != bot.username ||
        _bioController.text.trim() != (bot.bio ?? '').trim() ||
        _friendlyBot != isFriendlyBot(bot.flags) ||
        _manualApproval != isFriendlyBotManualApproval(bot.flags);
  }

  List<String> _redirectValues() {
    return _redirectControllers
        .map((controller) => controller.text.trim())
        .where((uri) => uri.isNotEmpty)
        .toList();
  }

  List<String> _redirectOptions() {
    final List<String> options = _redirectValues().toSet().toList();
    final String? current = _builderRedirectUri?.trim();
    if (current != null && current.isNotEmpty && !options.contains(current)) {
      options.add(current);
    }
    return options;
  }

  String? _validateUsername(FluxerLocalizations l10n, String username) {
    final BotUsernameRules rules = botUsernameRules(username);
    if (!rules.validLength) {
      return username.trim().isEmpty
          ? l10n.applicationsUsernameRequired
          : l10n.applicationsUsernameTooLong;
    }
    if (!rules.validCharacters) {
      return l10n.applicationsUsernameInvalid;
    }
    return null;
  }

  Future<void> _save(ApplicationResponse app) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _nameError = l10n.applicationsNameRequired);
      return;
    }
    final String username = _usernameController.text.trim();
    String? usernameError;
    if (app.bot != null) {
      usernameError = _validateUsername(l10n, username);
      if (usernameError != null) {
        setState(() => _usernameError = usernameError);
        return;
      }
    }
    setState(() {
      _nameError = null;
      _usernameError = null;
    });

    final List<String> redirects = _redirectValues();
    final bool appDirty =
        name != app.name ||
        redirects.join(',') != app.redirectUris.join(',') ||
        _botPublic != app.botPublic ||
        _botRequireCodeGrant != app.botRequireCodeGrant;
    final ApplicationResponseBot? bot = app.bot;
    final bool botDirty =
        bot != null &&
        (username != bot.username ||
            _bioController.text.trim() != (bot.bio ?? '').trim() ||
            _friendlyBot != isFriendlyBot(bot.flags) ||
            _manualApproval != isFriendlyBotManualApproval(bot.flags) ||
            _previewAvatar != null ||
            _clearedAvatar ||
            _previewBanner != null ||
            _clearedBanner);

    if (!appDirty && !botDirty) {
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.applicationsNoChanges));
      return;
    }

    final ApplicationsViewModel vm = ref.read(
      applicationsViewModelProvider.notifier,
    );
    try {
      if (appDirty) {
        await vm.saveApplication(
          ApplicationUpdateRequest(
            name: name != app.name ? name : null,
            redirectUris: redirects.join(',') != app.redirectUris.join(',')
                ? JsonNullable.of(redirects)
                : const JsonNullable.undefined(),
            botPublic: _botPublic != app.botPublic ? _botPublic : null,
            botRequireCodeGrant: _botRequireCodeGrant != app.botRequireCodeGrant
                ? _botRequireCodeGrant
                : null,
          ),
        );
      }
      if (bot != null && botDirty) {
        final int nextFlags = applyFriendlyBotFlags(
          flags: bot.flags,
          friendlyBot: _friendlyBot,
          manualApproval: _manualApproval,
        );
        final String bio = _bioController.text.trim();
        final bool bioChanged = bio != (bot.bio ?? '').trim();
        await vm.saveBotProfile(
          body: BotProfileUpdateRequest(
            username: username != bot.username ? username : null,
            bio: bioChanged
                ? JsonNullable.of(bio.isEmpty ? null : bio)
                : const JsonNullable.undefined(),
            avatar: _optionalImage(
              cleared: _clearedAvatar,
              value: _previewAvatar,
            ),
            banner: _optionalImage(
              cleared: _clearedBanner,
              value: _previewBanner,
            ),
            botFlags: nextFlags != bot.flags ? nextFlags : null,
          ),
        );
      }
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.applicationsUpdated));
      final ApplicationResponse? updated = ref
          .read(applicationsViewModelProvider)
          .selectedApplication;
      if (updated != null) {
        setState(() => _bindApplication(updated));
      }
    } on Object catch (e) {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: userFacingErrorMessage(e, l10n.genericError),
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  void _reset(ApplicationResponse app) {
    setState(() => _bindApplication(app));
  }

  Future<void> _pickImage({required bool avatar}) async {
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
      setState(() {
        if (avatar) {
          _previewAvatar = ImageUtils.toDataUri(picked.bytes);
          _clearedAvatar = false;
        } else {
          _previewBanner = ImageUtils.toDataUri(picked.bytes);
          _clearedBanner = false;
        }
      });
      return;
    }
    final Uint8List? cropped = await showImageCropSheet(
      context,
      imageBytes: picked.bytes,
      aspectRatio: avatar ? 1 : 17 / 6,
      title: avatar
          ? FluxerLocalizations.of(context).cropAvatar
          : FluxerLocalizations.of(context).cropBanner,
      maskShape: avatar ? CropMaskShape.circle : CropMaskShape.rectangle,
    );
    if (cropped == null || !mounted) {
      return;
    }
    setState(() {
      if (avatar) {
        _previewAvatar = ImageUtils.toDataUri(cropped);
        _clearedAvatar = false;
      } else {
        _previewBanner = ImageUtils.toDataUri(cropped);
        _clearedBanner = false;
      }
    });
  }

  Future<void> _confirmRotate(ApplicationsSecretKind kind) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await showFluxerSettingsConfirmSheet(
      context,
      title: kind == ApplicationsSecretKind.client
          ? l10n.applicationsRegenerateClientSecretTitle
          : l10n.applicationsRegenerateBotTokenTitle,
      description: kind == ApplicationsSecretKind.client
          ? l10n.applicationsRegenerateClientSecretDescription
          : l10n.applicationsRegenerateBotTokenDescription,
      confirmLabel: l10n.applicationsRegenerate,
      isDanger: true,
    );
    if (confirmed != true || !mounted) {
      return;
    }
    final ApplicationsViewModel vm = ref.read(
      applicationsViewModelProvider.notifier,
    );
    try {
      if (kind == ApplicationsSecretKind.client) {
        await vm.resetClientSecret();
      } else {
        await vm.resetBotToken();
      }
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: kind == ApplicationsSecretKind.client
                  ? l10n.applicationsClientSecretRegenerated
                  : l10n.applicationsBotTokenRegenerated,
            ),
          );
    } on Object catch (e) {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: userFacingErrorMessage(
                e,
                l10n.applicationsRegenerateFailed,
              ),
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<void> _confirmDelete(ApplicationResponse app) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await showFluxerSettingsConfirmSheet(
      context,
      title: l10n.applicationsDelete,
      description: l10n.applicationsDeleteConfirmDescription(app.name),
      confirmLabel: l10n.applicationsDelete,
      isDanger: true,
    );
    if (confirmed != true || !mounted) {
      return;
    }
    try {
      await ref.read(applicationsViewModelProvider.notifier).deleteSelected();
    } on Object catch (e) {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: userFacingErrorMessage(e, l10n.applicationsDeleteFailed),
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ApplicationsViewState state = ref.watch(
      applicationsViewModelProvider,
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ApplicationResponse? app = state.selectedApplication;

    if (state.isDetailLoading && app == null) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (state.detailError != null && app == null) {
      return _DetailError(
        onRetry: () {
          final String? id = state.selectedAppId;
          if (id != null) {
            unawaited(
              ref.read(applicationsViewModelProvider.notifier).openDetail(id),
            );
          }
        },
        onBack: widget.onBack,
      );
    }
    if (app == null) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (_boundAppId != app.id) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        setState(() => _bindApplication(app));
      });
    }

    final bool dirty = _isDirty(app);
    final InstanceConfigSnapshot snapshot = ref.watch(activeInstanceProvider);
    final String origin = resolveOAuthAuthorizeOrigin(
      displayDomain: snapshot.displayDomain,
      marketingUrl: snapshot.wellKnown?.endpoints.marketing,
      webAppUrl: (snapshot.wellKnown?.endpoints.webapp.isNotEmpty ?? false)
          ? snapshot.wellKnown!.endpoints.webapp
          : InstanceEndpoints.webApp,
    );
    final String authorizeUrl = buildOAuthAuthorizeUrl(
      origin: origin,
      clientId: app.id,
      scopes: _builderScopes,
      botRequireCodeGrant: _botRequireCodeGrant,
      redirectUri: _builderRedirectUri,
      botPermissions: oauthBotPermissionsValue(
        _builderPermissions.map((perm) => perm.value),
      ),
    );
    final String? avatarUrl = _clearedAvatar
        ? FluxerMediaUrl.defaultAvatar(userId: app.bot?.id ?? '')
        : _previewAvatar ??
              FluxerMediaUrl.userAvatar(
                userId: app.bot?.id ?? '',
                hash: app.bot?.avatar,
              ) ??
              FluxerMediaUrl.defaultAvatar(userId: app.bot?.id ?? '');
    final String? bannerUrl = _clearedBanner
        ? null
        : _previewBanner ??
              FluxerMediaUrl.userBanner(
                userId: app.bot?.id ?? '',
                hash: app.bot?.banner,
                animated: true,
              );

    Widget content = SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPaddingWithSaveBar(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplicationHeader(
            name: app.name,
            applicationId: app.id,
            onBack: widget.onBack,
            onCopyId: () => copyToClipboard(context: context, value: app.id),
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final bool twoCol = constraints.maxWidth >= 840;
              final ApplicationResponseBot? bot = app.bot;
              final Widget left = Column(
                children: [
                  ApplicationSecretsSection(
                    clientSecret: app.clientSecret,
                    botToken: bot?.token,
                    hasBot: bot != null,
                    isRotatingClient:
                        state.rotating == ApplicationsSecretKind.client,
                    isRotatingBot: state.rotating == ApplicationsSecretKind.bot,
                    onRegenerateClientSecret: () => unawaited(
                      _confirmRotate(ApplicationsSecretKind.client),
                    ),
                    onRegenerateBotToken: () =>
                        unawaited(_confirmRotate(ApplicationsSecretKind.bot)),
                  ),
                  ApplicationInfoSection(
                    nameController: _nameController,
                    nameError: _nameError,
                    botPublic: _botPublic,
                    botRequireCodeGrant: _botRequireCodeGrant,
                    redirectControllers: _redirectControllers,
                    onBotPublicChanged: (value) =>
                        setState(() => _botPublic = value),
                    onBotRequireCodeGrantChanged: (value) =>
                        setState(() => _botRequireCodeGrant = value),
                    onAddRedirect: () {
                      if (_redirectControllers.length >=
                          kMaxApplicationRedirectUris) {
                        return;
                      }
                      setState(() {
                        _redirectControllers.add(
                          TextEditingController()..addListener(_onFormChanged),
                        );
                      });
                    },
                    onRemoveRedirect: (index) {
                      if (index == 0) {
                        return;
                      }
                      setState(() {
                        _redirectControllers.removeAt(index).dispose();
                      });
                    },
                  ),
                  if (bot != null)
                    ApplicationBotProfileSection(
                      usernameController: _usernameController,
                      discriminator: bot.discriminator,
                      bioController: _bioController,
                      usernameError: _usernameError,
                      displayAvatarUrl: avatarUrl,
                      fallbackLetter:
                          (bot.username.isNotEmpty ? bot.username : app.name)[0]
                              .toUpperCase(),
                      hasAvatar:
                          (!_clearedAvatar && bot.avatar != null) ||
                          _previewAvatar != null,
                      displayBannerUrl: bannerUrl,
                      hasBanner:
                          (!_clearedBanner && bot.banner != null) ||
                          _previewBanner != null,
                      friendlyBot: _friendlyBot,
                      manualApproval: _manualApproval,
                      onChangeAvatar: () => unawaited(_pickImage(avatar: true)),
                      onClearAvatar: () => setState(() {
                        _previewAvatar = null;
                        _clearedAvatar = true;
                      }),
                      onChangeBanner: () =>
                          unawaited(_pickImage(avatar: false)),
                      onClearBanner: () => setState(() {
                        _previewBanner = null;
                        _clearedBanner = true;
                      }),
                      onFriendlyBotChanged: (value) => setState(() {
                        _friendlyBot = value;
                        if (!value) {
                          _manualApproval = false;
                        }
                      }),
                      onManualApprovalChanged: (value) =>
                          setState(() => _manualApproval = value),
                    ),
                ],
              );
              final Widget right = ApplicationOauthBuilderSection(
                selectedScopes: _builderScopes,
                selectedPermissions: _builderPermissions,
                redirectOptions: _redirectOptions(),
                selectedRedirectUri: _builderRedirectUri,
                botRequireCodeGrant: _botRequireCodeGrant,
                authorizeUrl: authorizeUrl,
                isFirst: twoCol,
                onToggleScope: (scope) => setState(() {
                  if (!_builderScopes.add(scope)) {
                    _builderScopes.remove(scope);
                  }
                }),
                onTogglePermission: (perm) => setState(() {
                  if (!_builderPermissions.add(perm)) {
                    _builderPermissions.remove(perm);
                  }
                }),
                onRedirectChanged: (uri) =>
                    setState(() => _builderRedirectUri = uri),
                onCopyUrl: () => copyToClipboard(
                  context: context,
                  value: authorizeUrl,
                  message: l10n.applicationsCopiedUrl,
                ),
              );
              if (!twoCol) {
                return Column(children: [left, right]);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: left),
                  SizedBox(width: context.layout.s4),
                  Expanded(child: right),
                ],
              );
            },
          ),
          ApplicationDangerSection(
            isDeleting: state.isDeleting,
            onDelete: () => unawaited(_confirmDelete(app)),
          ),
        ],
      ),
    );
    if (isMobileLayout(context)) {
      content = PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (!didPop) {
            widget.onBack();
          }
        },
        child: content,
      );
    }
    return FluxerSettingsSheet(
      hasUnsavedChanges: dirty,
      isSaving: state.isSaving,
      onReset: () => _reset(app),
      onSave: () => _save(app),
      child: content,
    );
  }
}

class _DetailError extends StatelessWidget {
  const _DetailError({required this.onRetry, required this.onBack});

  final VoidCallback onRetry;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Padding(
      padding: settingsScrollPadding(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PhosphorIcon(
            PhosphorIconsFill.warningCircle,
            size: 48,
            color: context.colors.textPrimaryMuted,
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.applicationsDetailLoadError,
            style: context.textStyles.heading.copyWith(
              color: context.colors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s1),
          Text(
            l10n.applicationsDetailLoadErrorDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(label: l10n.retry, onPressed: onRetry),
          SizedBox(height: layout.s2),
          FluxerButton.secondary(
            label: l10n.applicationsBackToList,
            onPressed: onBack,
          ),
        ],
      ),
    );
  }
}

JsonNullable<String> _optionalImage({
  required bool cleared,
  required String? value,
}) {
  if (cleared) {
    return const JsonNullable.of(null);
  }
  if (value != null) {
    return JsonNullable.of(value);
  }
  return const JsonNullable.undefined();
}
