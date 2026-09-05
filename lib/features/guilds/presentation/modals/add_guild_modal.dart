import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/data/discord_template_fetcher.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_create_view.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_import_template_view.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_landing_view.dart';
import 'package:fluxer_app/features/guilds/providers/add_guild_enabled_provider.dart';
import 'package:fluxer_app/features/guilds/services/create_community_service.dart';
import 'package:fluxer_app/features/guilds/services/join_community_service.dart';
import 'package:fluxer_app/features/guilds/utils/discord_template_parser.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_parser.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/features/ui/stepped_carousel/fluxer_stepped_carousel.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum _AddGuildModalView { landing, create, join, importTemplate }

const List<_AddGuildModalView> _addGuildViewOrder = <_AddGuildModalView>[
  _AddGuildModalView.landing,
  _AddGuildModalView.create,
  _AddGuildModalView.join,
  _AddGuildModalView.importTemplate,
];

enum _AddGuildPresentation { modal, bottomSheet }

Future<void> showAddGuildModal(BuildContext context, WidgetRef ref) {
  if (!ref.read(addGuildEnabledProvider)) {
    return Future<void>.value();
  }
  if (isMobileLayout(context)) {
    return FluxerBottomSheet.show<void>(
      context,
      useRootNavigator: true,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return _AddGuildFlow(
          presentation: _AddGuildPresentation.bottomSheet,
          onClose: close,
        );
      },
    );
  }
  return showDialog<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext dialogContext) {
      return _AddGuildFlow(
        presentation: _AddGuildPresentation.modal,
        onClose: () => Navigator.of(dialogContext).pop(),
      );
    },
  );
}

class _AddGuildFlow extends ConsumerStatefulWidget {
  const _AddGuildFlow({required this.presentation, required this.onClose});

  final _AddGuildPresentation presentation;
  final VoidCallback onClose;

  @override
  ConsumerState<_AddGuildFlow> createState() => _AddGuildFlowState();
}

class _AddGuildFlowState extends ConsumerState<_AddGuildFlow> {
  _AddGuildModalView _view = _AddGuildModalView.landing;
  AddGuildImportStep _importStep = AddGuildImportStep.url;
  final TextEditingController _inviteController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _templateUrlController = TextEditingController();
  final TextEditingController _importNameController = TextEditingController();
  final GlobalKey<AddGuildCreateViewState> _createViewKey =
      GlobalKey<AddGuildCreateViewState>();
  final GlobalKey<AddGuildImportTemplateViewState> _importViewKey =
      GlobalKey<AddGuildImportTemplateViewState>();
  String? _inviteErrorText;
  String? _createErrorText;
  String? _templateUrlErrorText;
  String? _importCreateErrorText;
  DiscordGuildTemplate? _importedTemplate;
  bool _isSubmitting = false;
  bool _isFetchingTemplate = false;
  bool _syncingImportName = false;
  bool _inviteCodeValid = false;
  bool _createNameHasText = false;
  bool _templateUrlHasText = false;
  bool _importNameHasText = false;
  String _invitePlaceholder = '';
  List<String> _instanceInviteUrlBases = const <String>[];

  @override
  void initState() {
    super.initState();
    _inviteController.addListener(_onInviteInputChanged);
    _nameController.addListener(_onNameInputChanged);
    _templateUrlController.addListener(_onTemplateUrlInputChanged);
    _importNameController.addListener(_onImportNameInputChanged);
    unawaited(_loadInvitePlaceholder());
  }

  @override
  void dispose() {
    _inviteController
      ..removeListener(_onInviteInputChanged)
      ..dispose();
    _nameController
      ..removeListener(_onNameInputChanged)
      ..dispose();
    _templateUrlController
      ..removeListener(_onTemplateUrlInputChanged)
      ..dispose();
    _importNameController
      ..removeListener(_onImportNameInputChanged)
      ..dispose();
    super.dispose();
  }

  void _onInviteInputChanged() {
    final bool isValid =
        parseInviteCode(
          _inviteController.text,
          inviteUrlBases: _instanceInviteUrlBases,
        ) !=
        null;
    if (_inviteErrorText == null && isValid == _inviteCodeValid) {
      return;
    }
    setState(() {
      _inviteCodeValid = isValid;
      _inviteErrorText = null;
    });
  }

  void _onNameInputChanged() {
    final bool hasText = _nameController.text.trim().isNotEmpty;
    if (_createErrorText == null && hasText == _createNameHasText) {
      return;
    }
    setState(() {
      _createNameHasText = hasText;
      _createErrorText = null;
    });
  }

  void _onTemplateUrlInputChanged() {
    final bool hasText = _templateUrlController.text.trim().isNotEmpty;
    if (_templateUrlErrorText == null && hasText == _templateUrlHasText) {
      return;
    }
    setState(() {
      _templateUrlHasText = hasText;
      _templateUrlErrorText = null;
    });
  }

  void _onImportNameInputChanged() {
    if (_syncingImportName) {
      return;
    }
    final bool hasText = _importNameController.text.trim().isNotEmpty;
    if (_importCreateErrorText == null && hasText == _importNameHasText) {
      return;
    }
    setState(() {
      _importNameHasText = hasText;
      _importCreateErrorText = null;
    });
  }

  bool _canCreateCommunities(UserSettingsViewState settings) {
    return settings.hasVerifiedEmail && settings.verified;
  }

  bool _canSubmitCreate(UserSettingsViewState settings) {
    return _canCreateCommunities(settings) &&
        !_isSubmitting &&
        _createNameHasText;
  }

  bool _canSubmitImportCreate(UserSettingsViewState settings) {
    return _canCreateCommunities(settings) &&
        !_isSubmitting &&
        _importedTemplate != null &&
        _importNameHasText;
  }

  bool get _canFetchTemplate {
    if (_isSubmitting || _isFetchingTemplate) {
      return false;
    }
    return _templateUrlHasText;
  }

  Future<void> _loadInvitePlaceholder() async {
    final String randomCode = _randomInviteCode();
    try {
      await ref.read(wellKnownProvider.future);
      final String inviteBase = ref.read(instanceInviteBaseUrlProvider);
      if (!mounted) {
        return;
      }
      setState(() {
        _instanceInviteUrlBases = <String>[inviteBase];
        _invitePlaceholder = '$inviteBase/$randomCode';
        _inviteCodeValid =
            parseInviteCode(
              _inviteController.text,
              inviteUrlBases: _instanceInviteUrlBases,
            ) !=
            null;
      });
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() {
        _invitePlaceholder = '${InstanceEndpoints.defaultInvite}/$randomCode';
      });
    }
  }

  String _randomInviteCode() {
    const String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final Random random = Random();
    final int length = random.nextInt(7) + 6;
    return List<String>.generate(
      length,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }

  void _close() {
    widget.onClose();
  }

  void _goToLanding() {
    setState(() {
      _view = _AddGuildModalView.landing;
      _inviteErrorText = null;
      _createErrorText = null;
      _templateUrlErrorText = null;
      _importCreateErrorText = null;
      _importStep = AddGuildImportStep.url;
    });
  }

  void _goToCreate() {
    setState(() {
      _view = _AddGuildModalView.create;
      _createErrorText = null;
    });
  }

  void _goToJoin() {
    setState(() {
      _view = _AddGuildModalView.join;
      _inviteErrorText = null;
    });
  }

  void _goToImport() {
    setState(() {
      _view = _AddGuildModalView.importTemplate;
      _importStep = AddGuildImportStep.url;
      _templateUrlErrorText = null;
      _importCreateErrorText = null;
    });
  }

  void _goToImportUrl() {
    setState(() {
      _importStep = AddGuildImportStep.url;
      _importCreateErrorText = null;
    });
  }

  String _title(FluxerLocalizations l10n) => switch (_view) {
    _AddGuildModalView.landing => l10n.addGuildModalTitle,
    _AddGuildModalView.create => l10n.addGuildCreateTitle,
    _AddGuildModalView.join => l10n.addGuildJoinTitle,
    _AddGuildModalView.importTemplate => l10n.addGuildImportDiscordTemplate,
  };

  bool get _canSubmitJoin {
    return !_isSubmitting && _inviteCodeValid;
  }

  Future<void> _submitJoin() async {
    if (!_canSubmitJoin) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() {
      _isSubmitting = true;
      _inviteErrorText = null;
    });
    try {
      await joinCommunityViaInvite(
        ref: ref,
        rawInput: _inviteController.text,
        l10n: l10n,
      );
      if (!mounted) {
        return;
      }
      _close();
    } on JoinCommunityException catch (e) {
      if (!mounted) {
        return;
      }
      setState(() => _inviteErrorText = e.message);
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _inviteErrorText = l10n.addGuildJoinFailed);
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _submitCreate() async {
    final UserSettingsViewState settings = ref.read(
      userSettingsViewModelProvider,
    );
    if (!_canSubmitCreate(settings)) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() {
      _isSubmitting = true;
      _createErrorText = null;
    });
    try {
      await createCommunity(
        context: context,
        ref: ref,
        name: _nameController.text,
        l10n: l10n,
        iconDataUri: _createViewKey.currentState?.iconDataUri,
      );
      if (!mounted) {
        return;
      }
      _close();
    } on CreateCommunityException catch (e) {
      if (!mounted) {
        return;
      }
      if (e.kind == CreateCommunityFailureKind.apiError &&
          e.message == l10n.addGuildCreateClaimDescription) {
        setState(() => _createErrorText = null);
        return;
      }
      if (e.kind == CreateCommunityFailureKind.maxGuilds ||
          e.kind == CreateCommunityFailureKind.singleCommunity) {
        showCreateCommunityFailureToast(ref: ref, error: e, l10n: l10n);
        setState(() => _createErrorText = null);
        return;
      }
      setState(() => _createErrorText = e.message);
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _createErrorText = l10n.addGuildCreateFailed);
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _fetchTemplate() async {
    if (!_canFetchTemplate) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? code = parseTemplateCode(_templateUrlController.text);
    if (code == null) {
      setState(() => _templateUrlErrorText = l10n.addGuildImportUrlInvalid);
      return;
    }
    setState(() {
      _isFetchingTemplate = true;
      _templateUrlErrorText = null;
    });
    try {
      final DiscordGuildTemplate template = await fetchDiscordGuildTemplate(
        code: code,
      );
      if (!mounted) {
        return;
      }
      _syncingImportName = true;
      try {
        _importNameController.text = template.sourceGuild.name;
        _importNameHasText = _importNameController.text.trim().isNotEmpty;
      } finally {
        _syncingImportName = false;
      }
      setState(() {
        _importedTemplate = template;
        _importStep = AddGuildImportStep.create;
        _importCreateErrorText = null;
        _isFetchingTemplate = false;
      });
    } on DiscordTemplateFetchException catch (e) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isFetchingTemplate = false;
        _templateUrlErrorText = switch (e.kind) {
          DiscordTemplateFetchFailureKind.invalid =>
            l10n.addGuildImportInvalidResponse,
          DiscordTemplateFetchFailureKind.network =>
            l10n.addGuildImportFetchFailed,
        };
      });
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() {
        _isFetchingTemplate = false;
        _templateUrlErrorText = l10n.addGuildImportFetchFailed;
      });
    }
  }

  Future<void> _submitImportCreate() async {
    final UserSettingsViewState settings = ref.read(
      userSettingsViewModelProvider,
    );
    if (!_canSubmitImportCreate(settings)) {
      return;
    }
    final DiscordGuildTemplate? template = _importedTemplate;
    if (template == null) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() {
      _isSubmitting = true;
      _importCreateErrorText = null;
    });
    try {
      await createCommunity(
        context: context,
        ref: ref,
        name: _importNameController.text,
        l10n: l10n,
        iconDataUri: _importViewKey.currentState?.iconDataUri,
        template: template.sourceGuild,
      );
      if (!mounted) {
        return;
      }
      _close();
    } on CreateCommunityException catch (e) {
      if (!mounted) {
        return;
      }
      if (e.kind == CreateCommunityFailureKind.apiError &&
          e.message == l10n.addGuildCreateClaimDescription) {
        setState(() {
          _isSubmitting = false;
          _importCreateErrorText = null;
        });
        return;
      }
      if (e.kind == CreateCommunityFailureKind.maxGuilds ||
          e.kind == CreateCommunityFailureKind.singleCommunity) {
        showCreateCommunityFailureToast(ref: ref, error: e, l10n: l10n);
        setState(() {
          _isSubmitting = false;
          _importCreateErrorText = null;
        });
        return;
      }
      setState(() {
        _isSubmitting = false;
        _importCreateErrorText = e.message;
      });
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() {
        _isSubmitting = false;
        _importCreateErrorText = l10n.addGuildCreateFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserSettingsViewState userSettings = ref.watch(
      userSettingsViewModelProvider,
    );
    final bool showingCreateForm = _canCreateCommunities(userSettings);
    final bool canSubmitCreate = _canSubmitCreate(userSettings);
    final bool canSubmitImportCreate = _canSubmitImportCreate(userSettings);
    final layout = context.layout;
    final dialogTheme = DialogTheme.of(context);
    final themeShape = dialogTheme.shape as RoundedRectangleBorder?;
    final mediaQuery = MediaQuery.of(context);
    final double keyboardInset = mediaQuery.viewInsets.bottom;
    final double maxModalHeight =
        mediaQuery.size.height - mediaQuery.viewPadding.top - layout.s2;
    final bool isBottomSheet =
        widget.presentation == _AddGuildPresentation.bottomSheet;
    final closeButton = Opacity(
      opacity: 0.7,
      child: FluxerButton.ghost(
        onPressed: _close,
        icon: PhosphorIconsBold.x,
        isSquare: true,
      ),
    );
    final Widget body = switch (_view) {
      _AddGuildModalView.landing => AddGuildLandingView(
        onCreateTap: _goToCreate,
        onJoinTap: _goToJoin,
        onImportTap: _goToImport,
      ),
      _AddGuildModalView.create => AddGuildCreateView(
        key: _createViewKey,
        nameController: _nameController,
        errorText: _createErrorText,
        enabled: !_isSubmitting,
      ),
      _AddGuildModalView.join => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            l10n.addGuildJoinDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          FluxerInput(
            controller: _inviteController,
            label: l10n.addGuildInviteLinkLabel,
            hint: _invitePlaceholder.isEmpty ? null : _invitePlaceholder,
            errorText: _inviteErrorText,
            autofocus: true,
            maxLength: 100,
            enabled: !_isSubmitting,
            onSubmitted: (_) => unawaited(_submitJoin()),
          ),
        ],
      ),
      _AddGuildModalView.importTemplate => AddGuildImportTemplateView(
        key: _importViewKey,
        urlController: _templateUrlController,
        nameController: _importNameController,
        step: _importStep,
        template: _importedTemplate,
        urlErrorText: _templateUrlErrorText,
        createErrorText: _importCreateErrorText,
        enabled: !_isSubmitting && !_isFetchingTemplate,
        onUrlSubmitted: () => unawaited(_fetchTemplate()),
      ),
    };
    final List<Widget> footerActions = switch (_view) {
      _AddGuildModalView.landing => const <Widget>[],
      _AddGuildModalView.create => <Widget>[
        FluxerButton.secondary(
          onPressed: _isSubmitting ? null : _goToLanding,
          label: l10n.back,
        ),
        if (showingCreateForm)
          FluxerButton.primary(
            onPressed: canSubmitCreate
                ? () => unawaited(_submitCreate())
                : null,
            isLoading: _isSubmitting,
            label: l10n.addGuildCreateSubmit,
          ),
      ],
      _AddGuildModalView.join => <Widget>[
        FluxerButton.primary(
          onPressed: _canSubmitJoin ? () => unawaited(_submitJoin()) : null,
          isLoading: _isSubmitting,
          label: l10n.addGuildJoinSubmit,
        ),
      ],
      _AddGuildModalView.importTemplate => <Widget>[
        FluxerButton.secondary(
          onPressed: _isSubmitting || _isFetchingTemplate
              ? null
              : _importStep == AddGuildImportStep.create
              ? _goToImportUrl
              : _goToLanding,
          label: l10n.back,
        ),
        if (showingCreateForm)
          switch (_importStep) {
            AddGuildImportStep.url => FluxerButton.primary(
              onPressed: _canFetchTemplate
                  ? () => unawaited(_fetchTemplate())
                  : null,
              isLoading: _isFetchingTemplate,
              label: l10n.next,
            ),
            AddGuildImportStep.create => FluxerButton.primary(
              onPressed: canSubmitImportCreate
                  ? () => unawaited(_submitImportCreate())
                  : null,
              isLoading: _isSubmitting,
              label: l10n.addGuildCreateSubmit,
            ),
          },
      ],
    };
    Widget buildFlowContent() {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isBottomSheet ? double.infinity : 400,
          maxHeight: maxModalHeight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: layout.s4, bottom: layout.s4),
              child: FluxerBottomSheetHeader(
                title: _title(l10n),
                trailing: isBottomSheet ? null : closeButton,
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    0,
                    layout.s4,
                    layout.s4,
                  ),
                  child: FluxerSteppedCarousel<_AddGuildModalView>(
                    step: _view,
                    steps: _addGuildViewOrder,
                    child: body,
                  ),
                ),
              ),
            ),
            ClipRect(
              child: AnimatedSize(
                duration: MediaQuery.disableAnimationsOf(context)
                    ? Duration.zero
                    : context.motion.panel,
                curve: context.motion.curve,
                alignment: Alignment.topCenter,
                child: footerActions.isEmpty
                    ? const SizedBox.shrink()
                    : FluxerBottomSheetFooter(
                        child: footerActions.length == 1
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: footerActions,
                              )
                            : Row(
                                children: <Widget>[
                                  Expanded(child: footerActions.first),
                                  SizedBox(width: layout.s2),
                                  Expanded(child: footerActions.last),
                                ],
                              ),
                      ),
              ),
            ),
          ],
        ),
      );
    }

    final Widget flowContent = buildFlowContent();
    final Widget dialog = Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: layout.radiusXxl,
        side: themeShape?.side ?? BorderSide.none,
      ),
      child: flowContent,
    );
    return wrapFluxerOverlayBackHandler(
      canDismiss: true,
      onBack: _view == _AddGuildModalView.landing ? null : _goToLanding,
      onDismiss: _close,
      child: isBottomSheet
          ? flowContent
          : Stack(
              children: <Widget>[
                Positioned.fill(
                  child: FluxerGestureDetector(
                    onTap: _close,
                    child: ColoredBox(
                      color: Colors.black.withValues(alpha: 0.35),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: const SizedBox.expand(),
                      ),
                    ),
                  ),
                ),
                AnimatedPadding(
                  duration: context.motion.normal,
                  curve: context.motion.curve,
                  padding: EdgeInsets.only(bottom: keyboardInset),
                  child: MediaQuery.removeViewInsets(
                    context: context,
                    removeBottom: true,
                    child: keyboardInset > 0
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: dialog,
                          )
                        : Center(child: dialog),
                  ),
                ),
              ],
            ),
    );
  }
}
