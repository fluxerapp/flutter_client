import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/operator_pass/operator_pass_wall_name_field.dart';
import 'package:fluxer_app/features/settings/providers/operator_pass_listing_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/operator_pass_marketing_urls.dart';
import 'package:fluxer_app/features/settings/utils/operator_pass_utils.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/switch_group/fluxer_switch_group.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';

class OperatorPassWallSettings extends ConsumerStatefulWidget {
  const OperatorPassWallSettings({super.key});

  @override
  ConsumerState<OperatorPassWallSettings> createState() =>
      _OperatorPassWallSettingsState();
}

class _OperatorPassWallSettingsState
    extends ConsumerState<OperatorPassWallSettings> {
  final TextEditingController _nameController = TextEditingController();
  bool _optOut = false;
  bool _sendChanges = true;
  bool _releaseListOptIn = false;
  OperatorPassWallNameProblem? _problem;
  bool _saving = false;
  bool _hydrated = false;
  OperatorPassListingResponse? _listing;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _applyListing(OperatorPassListingResponse listing) {
    _listing = listing;
    final String displayName = ref
        .read(userSettingsViewModelProvider)
        .displayName;
    _nameController.text = listing.wallName ?? displayName;
    _optOut = listing.wallOptOut;
    _sendChanges = !listing.keepAsIs;
    _releaseListOptIn = listing.releaseListOptIn;
    _hydrated = true;
  }

  Future<void> _openUri(Uri? uri) async {
    if (uri == null) {
      return;
    }
    await openExternalUrl(uri);
  }

  String _declineReason(
    FluxerLocalizations l10n,
    OperatorPassWallDeclineReasonSchema reason,
  ) {
    return switch (reason) {
      OperatorPassWallDeclineReasonSchema.guidelines =>
        l10n.operatorPassWallDeclineGuidelines,
      OperatorPassWallDeclineReasonSchema.impersonation =>
        l10n.operatorPassWallDeclineImpersonation,
      OperatorPassWallDeclineReasonSchema.rights =>
        l10n.operatorPassWallDeclineRights,
      OperatorPassWallDeclineReasonSchema.ageSuitability =>
        l10n.operatorPassWallDeclineAge,
      OperatorPassWallDeclineReasonSchema.$unknown => reason.json ?? '',
    };
  }

  Future<void> _handleSave() async {
    final OperatorPassListingResponse? listing = _listing;
    if (listing == null) {
      return;
    }
    final OperatorPassWallNameProblem? nextProblem =
        getOperatorPassWallNameProblem(_nameController.text, _optOut);
    setState(() => _problem = nextProblem);
    if (nextProblem != null) {
      return;
    }
    setState(() => _saving = true);
    try {
      final String normalized = normalizeOperatorPassWallName(
        _nameController.text,
      );
      final bool nameChanged =
          _optOut != listing.wallOptOut ||
          (!_optOut && normalized != (listing.wallName ?? ''));
      final OperatorPassListingUpdateRequest body =
          OperatorPassListingUpdateRequest(
            wallOptOut: _optOut,
            wallName: nameChanged
                ? JsonNullable.of(_optOut ? null : normalized)
                : const JsonNullable.undefined(),
            keepAsIs: _optOut ? null : !_sendChanges,
            releaseListOptIn: _optOut ? null : _releaseListOptIn,
          );
      final OperatorPassListingResponse saved = await ref
          .read(operatorPassListingProvider.notifier)
          .saveListing(body);
      _applyListing(saved);
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(context).operatorPassWallSaved,
            ),
          );
    } on Object {
      if (mounted) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: FluxerLocalizations.of(
                  context,
                ).operatorPassWallSaveFailed,
              ),
            );
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<OperatorPassListingResponse?> listingAsync = ref.watch(
      operatorPassListingProvider,
    );
    final bool selfHosted = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.selfHosted),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return listingAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (OperatorPassListingResponse? listing) {
        if (listing == null) {
          return const SizedBox.shrink();
        }
        if (!_hydrated) {
          _applyListing(listing);
        }
        final bool removed =
            listing.displayState == OperatorPassWallDisplayStateSchema.removed;
        if (!listing.hasWall && !removed) {
          return const SizedBox.shrink();
        }

        final bool nameChanged =
            _optOut != listing.wallOptOut ||
            (!_optOut &&
                normalizeOperatorPassWallName(_nameController.text) !=
                    (listing.wallName ?? ''));
        final bool switchChanged =
            !_optOut &&
            (_sendChanges == listing.keepAsIs ||
                _releaseListOptIn != listing.releaseListOptIn);
        final Uri? infoUri = operatorPassInfoUri(selfHosted: selfHosted);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: layout.s4),
            Text(
              l10n.operatorPassWallTitle,
              style: textStyles.heading.copyWith(
                color: colors.textPrimary,
                fontSize: 18,
              ),
            ),
            SizedBox(height: layout.s2),
            _OperatorPassWallStatus(
              listing: listing,
              selfHosted: selfHosted,
              declineReason: _declineReason,
            ),
            if (!removed) ...[
              SizedBox(height: layout.s3),
              OperatorPassWallNameField(
                controller: _nameController,
                optOut: _optOut,
                problem: _problem,
                disabled: _saving,
                onOptOutChanged: (bool? value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _optOut = value;
                    if (value) {
                      _problem = null;
                    }
                  });
                },
              ),
              if (!_optOut) ...[
                SizedBox(height: layout.s2),
                FluxerSwitchGroupItem(
                  label: l10n.operatorPassWallSendChanges,
                  value: _sendChanges,
                  enabled: !_saving,
                  onChanged: (bool value) =>
                      setState(() => _sendChanges = value),
                ),
                FluxerSwitchGroupItem(
                  label: l10n.operatorPassWallReleaseList,
                  description: l10n.operatorPassWallReleaseListHint,
                  value: _releaseListOptIn,
                  enabled: !_saving,
                  onChanged: (bool value) =>
                      setState(() => _releaseListOptIn = value),
                ),
              ],
              SizedBox(height: layout.s3),
              FluxerButton.primary(
                label: l10n.operatorPassWallSave,
                size: FluxerButtonSize.small,
                isLoading: _saving,
                onPressed: (nameChanged || switchChanged) && !_saving
                    ? _handleSave
                    : null,
              ),
            ],
            SizedBox(height: layout.s2),
            if (infoUri != null)
              GestureDetector(
                onTap: () =>
                    unawaited(_openUri(infoUri.replace(fragment: 'wall'))),
                child: Text(
                  l10n.operatorPassWallHowItWorks,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.brandPrimaryLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _OperatorPassWallStatus extends ConsumerWidget {
  const _OperatorPassWallStatus({
    required this.listing,
    required this.selfHosted,
    required this.declineReason,
  });

  final OperatorPassListingResponse listing;
  final bool selfHosted;
  final String Function(
    FluxerLocalizations,
    OperatorPassWallDeclineReasonSchema,
  )
  declineReason;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final Uri? termsUri = operatorPassTermsUri(selfHosted: selfHosted);

    if (listing.status != OperatorPassListingStatusSchema.listed &&
        listing.displayState != OperatorPassWallDisplayStateSchema.removed) {
      return Text(
        l10n.operatorPassWallNotListed,
        style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
      );
    }
    if (listing.displayState == OperatorPassWallDisplayStateSchema.hidden) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            l10n.operatorPassWallHidden,
            style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
          ),
          if (termsUri != null)
            GestureDetector(
              onTap: () => unawaited(
                openExternalUrl(
                  termsUri.replace(fragment: '8-when-we-remove-perks'),
                ),
              ),
              child: Text(
                l10n.operatorPassWallHiddenWhy,
                style: textStyles.bodySmall.copyWith(
                  color: colors.brandPrimaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      );
    }
    if (listing.displayState == OperatorPassWallDisplayStateSchema.removed) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            l10n.operatorPassWallRemoved,
            style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
          ),
          if (termsUri != null)
            GestureDetector(
              onTap: () => unawaited(
                openExternalUrl(
                  termsUri.replace(fragment: '8-when-we-remove-perks'),
                ),
              ),
              child: Text(
                l10n.operatorPassTermsLink,
                style: textStyles.bodySmall.copyWith(
                  color: colors.brandPrimaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      );
    }

    final bool pending =
        listing.reviewState == OperatorPassWallReviewStateSchema.pending &&
        listing.pendingName != null;
    final bool declined =
        listing.reviewState == OperatorPassWallReviewStateSchema.declined;
    final bool live =
        listing.displayState == OperatorPassWallDisplayStateSchema.live &&
        !pending &&
        !declined;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _WallRow(
          label: l10n.operatorPassWallOnTheWall,
          avatarUrl: listing.shownAvatarUrl,
          name: listing.shownName ?? '',
          trailing: live ? l10n.operatorPassWallLive : null,
        ),
        if (pending)
          _WallRow(
            label: l10n.operatorPassWallInReview,
            name: listing.pendingName ?? '',
            trailing: listing.reviewDueAt == null
                ? null
                : l10n.operatorPassWallReviewBy(
                    formatUserMediumDate(
                      listing.reviewDueAt!.toLocal(),
                      l10n.localeName,
                    ),
                  ),
          ),
        if (declined &&
            listing.declinedName != null &&
            listing.declineReason != null)
          Padding(
            padding: EdgeInsets.only(top: context.layout.s2),
            child: Text(
              l10n.operatorPassWallDeclined(
                listing.declinedName!,
                declineReason(l10n, listing.declineReason!),
              ),
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ),
        if (declined && listing.declineNote != null)
          Padding(
            padding: EdgeInsets.only(top: context.layout.s1),
            child: Text(
              l10n.operatorPassWallTeamNote(listing.declineNote!),
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ),
      ],
    );
  }
}

class _WallRow extends StatelessWidget {
  const _WallRow({
    required this.label,
    required this.name,
    this.avatarUrl,
    this.trailing,
  });

  final String label;
  final String name;
  final String? avatarUrl;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
          ),
          SizedBox(height: context.layout.s1),
          Row(
            children: [
              if (avatarUrl != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: CachedNetworkImage(
                    imageUrl: avatarUrl!,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: context.layout.s2),
              ],
              Expanded(
                child: Text(
                  name,
                  style: textStyles.bodyMedium.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              if (trailing != null)
                Text(
                  trailing!,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textTertiary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
