import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

const String ageRangeUnlockHelpUrl =
    'https://fluxer.com/help/unlock-mature-content';

bool _offered(WidgetRef ref) {
  if (!ref.watch(declaredAgeReportingSupportedProvider) ||
      ref.watch(matureGeoStatusProvider).value != MatureGeoStatus.restricted) {
    return false;
  }
  final String? userId = accountUserIdOrNull(ref, watch: true);
  if (userId == null) {
    return false;
  }
  final UserPrivateResponse? user = ref.watch(
    currentUserPrivateReadProvider(userId),
  );
  if (user == null || (user.matureContentUnlocked ?? false)) {
    return false;
  }
  return ref.watch(declaredAgeRequirementProvider).value?.available ?? false;
}

class PrivacyAgeRangeUnlock extends ConsumerWidget {
  const PrivacyAgeRangeUnlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!_offered(ref)) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool google = defaultTargetPlatform == TargetPlatform.android;
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      color: context.colors.textSecondary,
    );
    final DeclaredAgeReport? report = ref.watch(declaredAgeReportProvider);
    if (report == DeclaredAgeReport.minor ||
        report == DeclaredAgeReport.underMinimum) {
      return Text(
        google
            ? l10n.ageRangeUnlockUnderAdultGoogle
            : l10n.ageRangeUnlockUnderAdult,
        style: style,
      );
    }
    final String? hint = switch (ref
        .watch(declaredAgeUnlockProvider)
        ?.outcome) {
      DeclaredAgeUnlockOutcome.notInstalledFromPlay =>
        l10n.sensitiveContentInstallFromPlayHint,
      DeclaredAgeUnlockOutcome.playStoreActionRequired =>
        l10n.sensitiveContentFinishInPlayHint,
      DeclaredAgeUnlockOutcome.failed => l10n.ageRangeUnlockFailed,
      DeclaredAgeUnlockOutcome.dateOfBirthRequired =>
        l10n.ageRangeUnlockDateOfBirthRequired,
      _ => null,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          google ? l10n.ageRangeUnlockBodyGoogle : l10n.ageRangeUnlockBody,
          style: style,
        ),
        SizedBox(height: context.layout.s2),
        FluxerTextLink(
          text: l10n.ageRangeUnlockHelpLink,
          url: ageRangeUnlockHelpUrl,
          style: context.textStyles.bodySmall,
        ),
        SizedBox(height: context.layout.s3),
        FluxerButton.secondary(
          label: l10n.ageRangeUnlockButton,
          onPressedAsync: () =>
              ref.read(declaredAgeUnlockProvider.notifier).unlock(),
        ),
        if (hint != null) ...[
          SizedBox(height: context.layout.s2),
          Text(hint, style: style),
        ],
      ],
    );
  }
}
