import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/moderation_duration_labels.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

/// Bottom sheet to pick a timeout duration for a guild member. Resolves to the
/// chosen duration in seconds, or null when dismissed.
///
/// Durations mirror the web `TimeoutMemberOptions.ts`.
class TimeoutMemberSheet {
  TimeoutMemberSheet._();

  static const List<int> _durations = <int>[60, 300, 600, 3600, 86400, 604800];

  static Future<int?> show(BuildContext context, {required String username}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<int>(
      context,
      title: l10n.userProfileTimeoutSheetTitle(username),
      useRootNavigator: true,
      builder: (sheetContext, close) => const _TimeoutMemberBody(),
    );
  }
}

class _TimeoutMemberBody extends StatefulWidget {
  const _TimeoutMemberBody();

  @override
  State<_TimeoutMemberBody> createState() => _TimeoutMemberBodyState();
}

class _TimeoutMemberBodyState extends State<_TimeoutMemberBody> {
  int _selected = 3600;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s2),
          child: FluxerSelect<int>(
            label: l10n.userProfileTimeoutDurationLabel,
            value: _selected,
            items: <FluxerSelectItem<int>>[
              for (final int seconds in TimeoutMemberSheet._durations)
                FluxerSelectItem<int>(
                  value: seconds,
                  label: durationOptionLabel(l10n, seconds),
                ),
            ],
            enableSearch: false,
            stretch: true,
            onChanged: (int value) => setState(() => _selected = value),
          ),
        ),
        FluxerBottomSheetFooter(
          child: FluxerButton.primary(
            label: l10n.userProfileTimeoutSubmit,
            onPressed: () =>
                Navigator.of(context, rootNavigator: true).pop(_selected),
          ),
        ),
      ],
    );
  }
}
