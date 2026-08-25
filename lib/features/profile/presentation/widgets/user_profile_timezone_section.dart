import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/utils/profile_timezone_utils.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UserProfileTimezoneSection extends ConsumerStatefulWidget {
  const UserProfileTimezoneSection({required this.timezoneOffset, super.key});

  final int timezoneOffset;

  @override
  ConsumerState<UserProfileTimezoneSection> createState() =>
      _UserProfileTimezoneSectionState();
}

class _UserProfileTimezoneSectionState
    extends ConsumerState<UserProfileTimezoneSection> {
  late DateTime _now;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    final String locale = Localizations.localeOf(context).toString();
    final String localTime = formatProfileLocalTime(
      now: _now,
      offsetMinutes: widget.timezoneOffset,
      locale: locale,
      use12Hour: ref.watch(use12HourTimeFormatProvider),
    );
    final String differenceText = formatTimezoneDifferenceText(
      l10n: l10n,
      profileOffsetMinutes: widget.timezoneOffset,
      viewerOffsetMinutes: getViewerOffsetMinutes(),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 2,
      children: <Widget>[
        Text(
          l10n.userProfileLocalTime,
          style: textStyles.label.copyWith(
            color: colors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
        ),
        Text(
          localTime,
          style: textStyles.bodySmall.copyWith(
            color: colors.textChat,
            fontSize: 14,
            height: 1.25,
          ),
        ),
        Text(
          differenceText,
          style: textStyles.bodySmall.copyWith(
            color: colors.textTertiary,
            fontSize: 12,
            height: 1,
          ),
        ),
      ],
    );
  }
}
