import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_details_tooltip.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_actions.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_caption_style.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

class ProfileBadgeDetailSheet {
  ProfileBadgeDetailSheet._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required ProfileBadgeResponse badge,
  }) {
    final ProfileBadgeResponseDetails? details = badge.details;
    final String title = details?.title ?? badge.label;

    return FluxerBottomSheet.show<void>(
      context,
      title: title,
      useRootNavigator: true,
      builder: (BuildContext sheetContext, VoidCallback close) {
        final layout = sheetContext.layout;
        final textStyles = sheetContext.textStyles;
        final colors = sheetContext.colors;
        final String? href = badge.href;

        return Padding(
          padding: EdgeInsets.fromLTRB(
            layout.s4,
            layout.s2,
            layout.s4,
            layout.s4 + FluxerBottomSheet.scrollBottomPaddingOf(sheetContext),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (details != null)
                Align(
                  child: ProfileBadgeDetailsTooltip(
                    badge: badge,
                    details: details,
                  ),
                )
              else if (badge.caption != null && badge.caption!.isNotEmpty)
                Align(
                  child: Text(
                    badge.caption!,
                    style: profileBadgeCaptionTextStyle(
                      sheetContext,
                      fontSize: 32,
                    ),
                  ),
                )
              else
                Text(
                  badge.label,
                  style: textStyles.bodyMedium.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              if (href != null) ...[
                SizedBox(height: layout.s3),
                FluxerButton.secondary(
                  size: FluxerButtonSize.small,
                  label: FluxerLocalizations.of(sheetContext).nagbarLearnMore,
                  onPressed: () {
                    close();
                    unawaited(handleProfileBadgeTap(sheetContext, ref, badge));
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
