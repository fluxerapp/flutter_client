import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_utils.dart';

class UserMessagesMedia extends ConsumerWidget {
  const UserMessagesMedia({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userSettingsViewModelProvider);
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FluxerSectionHeading(
            title: l10n.externalLinksSectionTitle,
            description: l10n.externalLinksSectionDescription,
          ),
          SizedBox(height: layout.s4),
          FluxerSwitchGroupItem(
            label: l10n.externalLinkTrustAllLabel,
            description: trustedDomainsDescription(
              l10n: l10n,
              trustAll: state.trustAllDomains,
              trustedCount: state.trustedDomainsCount,
            ),
            value: state.trustAllDomains,
            onChanged: (value) => _handleTrustAllChange(context, ref, value),
          ),
        ],
      ),
    );
  }

  Future<void> _handleTrustAllChange(
    BuildContext context,
    WidgetRef ref,
    bool value,
  ) async {
    final notifier = ref.read(userSettingsViewModelProvider.notifier);
    final l10n = FluxerLocalizations.of(context);

    if (value) {
      final confirmed = await FluxerConfirmModal.show(
        context,
        title: l10n.externalLinkTrustAllConfirmTitle,
        description: l10n.externalLinkTrustAllConfirmDescription,
        confirmLabel: l10n.externalLinkTrustAllConfirmAction,
        isDanger: true,
        onConfirm: () {},
      );

      if (confirmed != true) {
        return;
      }

      await notifier.setTrustAllDomains(true);
      return;
    }

    final confirmed = await FluxerConfirmModal.show(
      context,
      title: l10n.externalLinkStopTrustingAllTitle,
      description: l10n.externalLinkStopTrustingAllDescription,
      confirmLabel: l10n.externalLinkStopTrustingAllAction,
      onConfirm: () {},
    );

    if (confirmed != true) {
      return;
    }

    await notifier.setTrustAllDomains(false);
  }
}
