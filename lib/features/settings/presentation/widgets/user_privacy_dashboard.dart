import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_activity_sharing_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_communication_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_connections_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_data_request_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_profile_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_sensitive_content_section.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class UserPrivacyDashboard extends ConsumerWidget {
  const UserPrivacyDashboard({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(privacyDashboardViewModelProvider);
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    if (state.isLoading) {
      return const Center(child: FluxerLoadingSpinner());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.privacyDashboardLoadFailed,
              style: context.textStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s4),
            SizedBox(
              width: double.infinity,
              child: FluxerButton.primary(
                label: l10n.privacyDashboardRetry,
                onPressedAsync: ref
                    .read(privacyDashboardViewModelProvider.notifier)
                    .loadSettings,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrivacyProfileSection(),
          PrivacyConnectionsSection(),
          PrivacyCommunicationSection(),
          PrivacyActivitySharingSection(),
          PrivacySensitiveContentSection(),
          PrivacyDataExportSection(),
          PrivacyDataDeletionSection(),
        ],
      ),
    );
  }
}
