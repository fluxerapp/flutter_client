import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class PrivacyProfileSection extends ConsumerWidget {
  const PrivacyProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(privacyDashboardViewModelProvider);
    final l10n = FluxerLocalizations.of(context);
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);

    return FluxerSettingsSection(
      sectionId: 'profile-privacy',
      title: l10n.privacyDashboardProfilePrivacySection,
      isFirst: true,
      children: [
        FluxerSettingsSubsection(
          title: l10n.privacyDashboardProfilePrivacyTitle,
          children: [
            FluxerRadioGroup<ProfilePrivacyLevel>(
              value: state.profilePrivacy,
              items: [
                FluxerRadioItem(
                  value: ProfilePrivacyLevel.allGuilds,
                  label: l10n.privacyDashboardProfilePrivacyAllCommunities,
                  description:
                      l10n.privacyDashboardProfilePrivacyAllCommunitiesDesc,
                ),
                FluxerRadioItem(
                  value: ProfilePrivacyLevel.smallGuildsOnly,
                  label: l10n.privacyDashboardProfilePrivacySmallCommunities,
                  description:
                      l10n.privacyDashboardProfilePrivacySmallCommunitiesDesc,
                ),
                FluxerRadioItem(
                  value: ProfilePrivacyLevel.friendsOnly,
                  label: l10n.privacyDashboardProfilePrivacyFriendsOnly,
                  description:
                      l10n.privacyDashboardProfilePrivacyFriendsOnlyDesc,
                ),
              ],
              onChanged: (value) => unawaited(vm.updateProfilePrivacy(value)),
            ),
          ],
        ),
      ],
    );
  }
}
