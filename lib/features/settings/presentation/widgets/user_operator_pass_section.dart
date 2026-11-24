import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/commerce/operator_pass_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class UserOperatorPassSection extends ConsumerStatefulWidget {
  const UserOperatorPassSection({super.key});

  @override
  ConsumerState<UserOperatorPassSection> createState() =>
      _UserOperatorPassSectionState();
}

class _UserOperatorPassSectionState
    extends ConsumerState<UserOperatorPassSection> {
  OperatorPassListingResponse? _listing;
  OperatorPassLabsResponse? _labs;
  bool _busy = false;

  Future<void> _run(Future<void> Function() action) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() => _busy = true);
    try {
      await action();
    } on Object catch (error, stackTrace) {
      talker.warning('[OperatorPass] Update failed', error, stackTrace);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.operatorPassUpdateFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<void> _updateListing({
    required OperatorPassListingResponse listing,
    bool? wallOptOut,
    bool? sendChanges,
    bool? releaseListOptIn,
  }) => _run(() async {
    final bool optOut = wallOptOut ?? listing.wallOptOut;
    final OperatorPassListingResponse result = await ref
        .read(fluxerClientProvider)
        .operatorPass
        .updateOperatorPassListing(
          body: OperatorPassListingUpdateRequest(
            wallOptOut: optOut,
            keepAsIs: optOut ? null : !(sendChanges ?? !listing.keepAsIs),
            releaseListOptIn: optOut
                ? null
                : releaseListOptIn ?? listing.releaseListOptIn,
          ),
        );
    if (mounted) {
      setState(() => _listing = result);
    }
  });

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<OperatorPassSettingsData?> data = ref.watch(
      operatorPassSettingsProvider,
    );
    final OperatorPassSettingsData? value = data.value;
    if (value == null) {
      return const SizedBox.shrink();
    }
    final OperatorPassListingResponse? listing = _listing ?? value.listing;
    final OperatorPassLabsResponse labs = _labs ?? value.passes.labs;
    final bool showWall = listing != null && listing.hasWall;
    return Padding(
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showWall)
            FluxerSettingsSection(
              title: l10n.operatorPassWallTitle,
              children: [
                FluxerSettingsSwitchItem(
                  label: l10n.operatorPassWallShowMeLabel,
                  value: !listing.wallOptOut,
                  enabled: !_busy,
                  onChanged: (bool value) => unawaited(
                    _updateListing(listing: listing, wallOptOut: !value),
                  ),
                ),
                FluxerSettingsSwitchItem(
                  label: l10n.operatorPassWallSendChangesLabel,
                  value: !listing.keepAsIs,
                  enabled: !_busy && !listing.wallOptOut,
                  onChanged: (bool value) => unawaited(
                    _updateListing(listing: listing, sendChanges: value),
                  ),
                ),
                FluxerSettingsSwitchItem(
                  label: l10n.operatorPassWallReleaseListLabel,
                  description: l10n.operatorPassWallReleaseListDescription,
                  value: listing.releaseListOptIn,
                  enabled: !_busy && !listing.wallOptOut,
                  onChanged: (bool value) => unawaited(
                    _updateListing(listing: listing, releaseListOptIn: value),
                  ),
                ),
              ],
            ),
          FluxerSettingsSection(
            title: l10n.operatorPassLabsTitle,
            description: l10n.operatorPassLabsDescription,
            isFirst: !showWall,
            children: [
              FluxerSettingsSwitchItem(
                label: l10n.operatorPassShowOperatorsLabel,
                description: l10n.operatorPassShowOperatorsDescription,
                value: labs.showOperators,
                enabled: !_busy,
                onChanged: (bool value) => unawaited(
                  _run(() async {
                    final OperatorPassPassesResponse result = await ref
                        .read(fluxerClientProvider)
                        .operatorPass
                        .updateOperatorPassLabsOperators(
                          body: OperatorPassLabsOperatorsRequest(
                            showOperators: value,
                          ),
                        );
                    if (mounted) {
                      setState(() => _labs = result.labs);
                    }
                  }),
                ),
              ),
              if (labs.showOperators)
                FluxerSettingsSwitchItem(
                  label: l10n.operatorPassGreetingLabel,
                  description: l10n.operatorPassGreetingDescription,
                  value: labs.greeting,
                  enabled: !_busy,
                  onChanged: (bool value) => unawaited(
                    _run(() async {
                      final OperatorPassPassesResponse result = await ref
                          .read(fluxerClientProvider)
                          .operatorPass
                          .updateOperatorPassLabsGreeting(
                            body: OperatorPassLabsGreetingRequest(
                              greeting: value,
                            ),
                          );
                      if (mounted) {
                        setState(() => _labs = result.labs);
                      }
                    }),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
