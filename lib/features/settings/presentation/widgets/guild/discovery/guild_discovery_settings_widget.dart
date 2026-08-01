import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_application.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_settings_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_banner.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_error_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_form_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_form_utils.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_header.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_status_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_discovery_settings_provider.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GuildDiscoverySettingsWidget extends ConsumerStatefulWidget {
  const GuildDiscoverySettingsWidget({
    required this.guildId,
    required this.state,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final GuildDiscoverySettingsState state;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildDiscoverySettingsWidget> createState() =>
      _GuildDiscoverySettingsWidgetState();
}

class _GuildDiscoverySettingsWidgetState
    extends ConsumerState<GuildDiscoverySettingsWidget> {
  late final TextEditingController _descriptionController;
  late final TextEditingController _tagInputController;
  late int _categoryType;
  late String _primaryLanguage;
  late List<String> _customTags;
  String? _descriptionError;
  String? _syncedFormIdentity;
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController == null) {
      _ownedScrollController = ScrollController();
    }
    _applyFormState(widget.state);
    _descriptionController = TextEditingController(
      text: widget.state.description,
    );
    _tagInputController = TextEditingController();
    _syncedFormIdentity = _formIdentity(widget.state);
  }

  @override
  void didUpdateWidget(covariant GuildDiscoverySettingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final String nextIdentity = _formIdentity(widget.state);
    if (nextIdentity != _syncedFormIdentity &&
        !widget.state.isSubmitting &&
        !widget.state.isWithdrawing) {
      _applyFormState(widget.state);
      _descriptionController.text = widget.state.description;
      _tagInputController.clear();
      _syncedFormIdentity = nextIdentity;
    }
  }

  void _applyFormState(GuildDiscoverySettingsState state) {
    _categoryType = state.categoryType.clamp(0, 8);
    _primaryLanguage = resolveDiscoveryPrimaryLanguage(state.primaryLanguage);
    _customTags = List<String>.from(state.customTags);
  }

  String _formIdentity(GuildDiscoverySettingsState state) {
    final GuildDiscoveryApplication? application = state.application;
    if (application != null) {
      return '${application.status}:${application.appliedAt}';
    }
    return 'new:${state.eligible}:${state.minMemberCount}';
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _tagInputController.dispose();
    _ownedScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildDiscoverySettingsState state =
        ref.watch(guildDiscoverySettingsProvider(widget.guildId)).value ??
        widget.state;
    if (state.loadStatus == GuildDiscoveryLoadStatus.error) {
      return FluxerSettingsSheet(
        child: GuildDiscoveryErrorState(
          onRetry: () => unawaited(
            ref
                .read(guildDiscoverySettingsProvider(widget.guildId).notifier)
                .reload(),
          ),
        ),
      );
    }
    if (state.loadStatus == GuildDiscoveryLoadStatus.loading) {
      return const FluxerSettingsSheet(
        child: Center(child: FluxerLoadingSpinner()),
      );
    }
    return FluxerSettingsSheet(
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: settingsScrollPaddingWithSaveBar(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const GuildDiscoveryHeader(),
            if (state.showsEligibilityWarning) ...<Widget>[
              SizedBox(height: context.layout.s4),
              GuildDiscoveryBanner(
                title: l10n.guildSettingsDiscoveryNotEnoughMembersTitle,
                message: l10n.guildSettingsDiscoveryNotEligible(
                  state.minMemberCount,
                ),
                variant: GuildDiscoveryBannerVariant.warning,
              ),
            ],
            if (state.application != null) ...<Widget>[
              SizedBox(height: context.layout.s4),
              GuildDiscoveryStatusCard(application: state.application!),
            ],
            if (state.application?.status ==
                DiscoveryApplicationStatus.approved) ...<Widget>[
              SizedBox(height: context.layout.s4),
              GuildDiscoveryBanner(
                message: l10n.guildSettingsDiscoveryApprovedInfo,
              ),
            ],
            if (state.application?.status ==
                DiscoveryApplicationStatus.pending) ...<Widget>[
              SizedBox(height: context.layout.s4),
              GuildDiscoveryBanner(
                message: l10n.guildSettingsDiscoveryPendingInfo,
              ),
            ],
            if (state.showsForm) ...<Widget>[
              SizedBox(height: context.layout.s4),
              GuildDiscoveryFormCard(
                state: state,
                descriptionController: _descriptionController,
                tagInputController: _tagInputController,
                categoryType: _categoryType,
                primaryLanguage: _primaryLanguage,
                customTags: _customTags,
                descriptionError: _descriptionError,
                onDescriptionErrorCleared: () {
                  setState(() => _descriptionError = null);
                },
                onCategoryChanged: (int value) {
                  setState(() => _categoryType = value);
                },
                onPrimaryLanguageChanged: (String value) {
                  setState(() => _primaryLanguage = value);
                },
                onTagsChanged: (List<String> tags) {
                  setState(() => _customTags = tags);
                },
                onSubmit: () => unawaited(_handleSubmit(context, l10n, state)),
                onWithdraw: () => unawaited(_handleWithdraw(context, l10n)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmit(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildDiscoverySettingsState state,
  ) async {
    final String description = _descriptionController.text;
    final String? error = validateDiscoveryDescription(l10n, description);
    if (error != null) {
      setState(() => _descriptionError = error);
      return;
    }
    try {
      final bool hadActiveApplication = state.hasActiveApplication;
      await ref
          .read(guildDiscoverySettingsProvider(widget.guildId).notifier)
          .submit(
            description: description.trim(),
            categoryType: _categoryType,
            primaryLanguage: _primaryLanguage,
            customTags: _customTags,
          );
      if (!context.mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: hadActiveApplication
                  ? l10n.guildSettingsDiscoveryListingUpdated
                  : l10n.guildSettingsDiscoveryApplicationSent,
            ),
          );
    } on Object {
      if (!context.mounted) {
        return;
      }
      await FluxerModal.show<void>(
        context,
        title: l10n.genericError,
        centered: true,
        builder: (BuildContext dialogContext, VoidCallback close) {
          return Text(
            l10n.guildSettingsDiscoveryWithdrawErrorDescription,
            style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
          );
        },
      );
    }
  }

  Future<void> _handleWithdraw(
    BuildContext context,
    FluxerLocalizations l10n,
  ) async {
    try {
      await ref
          .read(guildDiscoverySettingsProvider(widget.guildId).notifier)
          .withdraw();
      if (!context.mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.guildSettingsDiscoveryApplicationWithdrawn,
            ),
          );
    } on Object {
      if (!context.mounted) {
        return;
      }
      await FluxerModal.show<void>(
        context,
        title: l10n.guildSettingsDiscoveryWithdrawErrorTitle,
        centered: true,
        builder: (BuildContext dialogContext, VoidCallback close) {
          return Text(
            l10n.guildSettingsDiscoveryWithdrawErrorDescription,
            style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
          );
        },
      );
    }
  }
}
