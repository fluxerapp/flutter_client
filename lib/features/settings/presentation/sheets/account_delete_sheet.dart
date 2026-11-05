import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/account_closure_notice_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_ownership_warning_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/commerce/premium_settings_state_provider.dart';
import 'package:fluxer_app/features/settings/services/premium_checkout_service.dart';
import 'package:fluxer_app/features/settings/utils/commerce/premium_subscription_manage.dart';
import 'package:fluxer_app/features/settings/utils/commerce/premium_subscription_status.dart';
import 'package:fluxer_app/features/settings/utils/sign_out_current_account.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/switch_group/fluxer_switch_group.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

const String _appStoreSubscriptionsUrl =
    'https://apps.apple.com/account/subscriptions';
const String _googlePlaySubscriptionsUrl =
    'https://play.google.com/store/account/subscriptions';

class AccountDeleteSheet extends ConsumerStatefulWidget {
  const AccountDeleteSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId != null) {
      final ownedGuilds = await ref
          .read(guildRepositoryProvider)
          .getOwnedGuilds(userId);
      if (ownedGuilds.isNotEmpty) {
        if (!context.mounted) {
          return;
        }
        return GuildOwnershipWarningSheet.show(
          context,
          ownedGuilds: ownedGuilds,
        );
      }
    }
    if (!context.mounted) {
      return;
    }
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).dangerZoneDeleteTitle,
      useRootNavigator: true,
      builder: (_, _) => const AccountDeleteSheet(),
    );
  }

  @override
  ConsumerState<AccountDeleteSheet> createState() => _AccountDeleteSheetState();
}

class _AccountDeleteSheetState extends ConsumerState<AccountDeleteSheet> {
  bool _deleteMessages = false;
  bool? _loadingImmediate;
  String? _error;

  bool get _loading => _loadingImmediate != null;

  Future<void> _confirmDeleteNow() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await FluxerConfirmSheet.show(
      context,
      title: l10n.dangerZoneDeleteNowConfirmTitle,
      description: l10n.dangerZoneDeleteNowConfirmBody,
      confirmLabel: l10n.dangerZoneDeleteNow,
      cancelLabel: l10n.cancel,
      isDanger: true,
      useRootNavigator: true,
    );
    if (confirmed ?? false) {
      await _handleDelete(immediate: true);
    }
  }

  Future<void> _handleDelete({required bool immediate}) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ProviderContainer container = ProviderScope.containerOf(
      context,
      listen: false,
    );
    final NavigatorState rootNavigator = Navigator.of(
      context,
      rootNavigator: true,
    );

    setState(() {
      _loadingImmediate = immediate;
      _error = null;
    });

    container
        .read(accountClosureInFlightProvider.notifier)
        .setInFlight(value: true);
    final Response<Object?> response;
    try {
      response = await container
          .read(fluxerDioProvider)
          .post<Object?>(
            '/users/@me/delete',
            data: <String, dynamic>{
              'immediate': immediate,
              'delete_messages': _deleteMessages,
            },
          );
    } on DioException catch (error) {
      container
          .read(accountClosureInFlightProvider.notifier)
          .setInFlight(value: false);
      if (!mounted) {
        return;
      }
      if (ApiException.from(error).code == 'USER_OWNS_GUILDS' &&
          await _showOwnedGuilds(container, rootNavigator)) {
        return;
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _loadingImmediate = null;
        _error = isSudoCancellation(error)
            ? null
            : userFacingErrorMessage(error, l10n.genericError);
      });
      return;
    }

    final Object? body = response.data;
    final Object? rawDeletionAt = body is Map<String, dynamic>
        ? body['pending_deletion_at']
        : null;
    final DateTime? deletionAt = rawDeletionAt is String
        ? DateTime.tryParse(rawDeletionAt)?.toLocal()
        : null;
    container
        .read(pendingAccountClosureNoticeProvider.notifier)
        .show(
          AccountClosureNotice(
            kind: immediate && deletionAt != null
                ? AccountClosureKind.immediateDeletion
                : AccountClosureKind.scheduledDeletion,
            deletionAt: deletionAt,
            emailsEnabled: container
                .read(instanceRuntimeConfigProvider)
                .emailsEnabled,
          ),
        );
    rootNavigator.popUntil((Route<dynamic> route) => route.isFirst);
    await signOutCurrentAccount(container, keepInstance: true);
  }

  Future<bool> _showOwnedGuilds(
    ProviderContainer container,
    NavigatorState rootNavigator,
  ) async {
    final String? userId = container.read(currentUserIdProvider);
    List<Guild> owned = const <Guild>[];
    if (userId != null) {
      try {
        owned = await container
            .read(guildRepositoryProvider)
            .fetchOwnedGuilds(userId);
      } on DioException {
        owned = await container
            .read(guildRepositoryProvider)
            .getOwnedGuilds(userId);
      }
    }
    if (!mounted || owned.isEmpty) {
      return false;
    }
    rootNavigator.pop();
    await GuildOwnershipWarningSheet.show(
      rootNavigator.context,
      ownedGuilds: owned,
    );
    return true;
  }

  void _openPrivacyDashboard() {
    final NavigatorState rootNavigator = Navigator.of(
      context,
      rootNavigator: true,
    )..pop();
    unawaited(
      UserSettingsModal.show(
        rootNavigator.context,
        initialSection: UserSettingsSection.privacyDashboard,
        initialFieldId: 'data-export',
        sectionOnly: true,
      ),
    );
  }

  PremiumManageAction? _storeBillingAction() {
    final PremiumStateResponse? premiumState = ref
        .watch(premiumSettingsStateProvider)
        .asData
        ?.value;
    final PremiumSubscriptionStatus status = computePremiumSubscriptionStatus(
      premiumState: premiumState,
      effectiveIsPremium: ref
          .watch(currentUserEntitlementsProvider(watchAccountUserId(ref)))
          .isEffectivelyPremium,
      userPrivate: ref.watch(
        currentUserPrivateReadProvider(watchAccountUserId(ref)),
      ),
    );
    if (!status.isPremium || status.premiumWillCancel) {
      return null;
    }
    final String? fallback = switch (status.subscriptionProvider) {
      PremiumSubscriptionProvider.appStore => _appStoreSubscriptionsUrl,
      PremiumSubscriptionProvider.googlePlay => _googlePlaySubscriptionsUrl,
      _ => null,
    };
    if (fallback == null) {
      return null;
    }
    return premiumManageAction(
      surface: PremiumManageSurface.billing,
      provider: status.subscriptionProvider,
      manageUrl: status.manageUrl ?? fallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final bool official = ref.watch(isActiveInstanceOfficialProvider);
    final PremiumManageAction? billingAction = _storeBillingAction();
    final bool billedByApple =
        ref
            .watch(premiumSettingsStateProvider)
            .asData
            ?.value
            ?.subscriptionProvider ==
        PremiumSubscriptionProvider.appStore;
    final TextStyle secondaryStyle = context.textStyles.bodySmall.copyWith(
      color: colors.textSecondary,
    );

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.dangerZoneDeleteIntro, style: secondaryStyle),
          SizedBox(height: layout.s4),
          FluxerSwitchGroup(
            children: [
              FluxerSwitchGroupItem(
                label: l10n.dangerZoneDeleteMessagesLabel,
                description: l10n.dangerZoneDeleteMessagesHint,
                value: _deleteMessages,
                enabled: !_loading,
                onChanged: (bool value) =>
                    setState(() => _deleteMessages = value),
              ),
            ],
          ),
          if (billingAction != null) ...[
            SizedBox(height: layout.s4),
            FluxerWarningAlert(
              message: billedByApple
                  ? l10n.dangerZoneDeleteAppStoreBilling
                  : l10n.dangerZoneDeleteGooglePlayBilling,
            ),
            SizedBox(height: layout.s2),
            FluxerButton.secondary(
              onPressedAsync: () =>
                  openPremiumManageAction(context, ref, billingAction),
              label: l10n.premiumManageSubscription,
            ),
          ],
          SizedBox(height: layout.s4),
          _buildExportHint(context, l10n, secondaryStyle),
          SizedBox(height: layout.s2),
          Text(
            official
                ? l10n.dangerZoneDeleteLaterHint
                : l10n.dangerZoneDeleteScheduleHint,
            style: secondaryStyle,
          ),
          if (_error != null) ...[
            SizedBox(height: layout.s3),
            Text(
              _error!,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.statusDanger,
              ),
            ),
          ],
          SizedBox(height: layout.s4),
          FluxerButton.dangerPrimary(
            onPressed: _loading
                ? null
                : () => unawaited(_handleDelete(immediate: false)),
            label: official
                ? l10n.dangerZoneDeleteLater
                : l10n.dangerZoneDeleteSchedule,
            isLoading: _loadingImmediate == false,
          ),
          SizedBox(height: layout.s2),
          FluxerButton.dangerSecondary(
            onPressed: _loading ? null : () => unawaited(_confirmDeleteNow()),
            label: l10n.dangerZoneDeleteNow,
            isLoading: _loadingImmediate ?? false,
          ),
          SizedBox(height: layout.s2),
          FluxerButton.secondary(
            onPressed: _loading ? null : () => Navigator.of(context).pop(),
            label: l10n.cancel,
          ),
        ],
      ),
    );
  }

  Widget _buildExportHint(
    BuildContext context,
    FluxerLocalizations l10n,
    TextStyle style,
  ) {
    final String label = l10n.userSettingsNavPrivacyDashboard;
    final String text = l10n.dangerZoneDeleteExportHint(label);
    final int index = text.indexOf(label);
    if (index < 0) {
      return Text(text, style: style);
    }
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: text.substring(0, index)),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: FluxerTextLink(
              text: label,
              onTap: _loading ? null : _openPrivacyDashboard,
              style: style.copyWith(color: context.colors.textLink),
            ),
          ),
          TextSpan(text: text.substring(index + label.length)),
        ],
      ),
    );
  }
}
