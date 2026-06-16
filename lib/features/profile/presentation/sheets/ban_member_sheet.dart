import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/moderation_duration_labels.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Result of the ban sheet: the resolved ban duration in seconds (0 =
/// permanent), how many days of message history to delete, and an optional
/// reason.
typedef BanMemberResult = ({
  int deleteMessageDays,
  String? reason,
  int banDurationSeconds,
});

/// Bottom sheet to configure and confirm a member ban. Resolves to a
/// [BanMemberResult], or null when dismissed.
///
/// Duration presets and delete-history options mirror the web `BanMemberModal`.
class BanMemberSheet {
  BanMemberSheet._();

  static const int _customSentinel = -1;
  static const int _minCustomSeconds = 60;
  static const int _maxCustomSeconds = 63072000;
  static const List<int> _durations = <int>[
    0,
    3600,
    43200,
    86400,
    259200,
    432000,
    604800,
    1209600,
    2592000,
    _customSentinel,
  ];

  static Future<BanMemberResult?> show(
    BuildContext context, {
    required String username,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<BanMemberResult>(
      context,
      title: l10n.userProfileBanSheetTitle(username),
      useRootNavigator: true,
      builder: (sheetContext, close) => const _BanMemberBody(),
    );
  }
}

class _BanMemberBody extends StatefulWidget {
  const _BanMemberBody();

  @override
  State<_BanMemberBody> createState() => _BanMemberBodyState();
}

class _BanMemberBodyState extends State<_BanMemberBody> {
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _customSecondsController =
      TextEditingController();
  int _duration = 0;
  int _deleteDays = 1;

  @override
  void dispose() {
    _reasonController.dispose();
    _customSecondsController.dispose();
    super.dispose();
  }

  int get _resolvedDurationSeconds {
    if (_duration != BanMemberSheet._customSentinel) {
      return _duration;
    }
    final int parsed =
        int.tryParse(_customSecondsController.text.trim()) ??
        BanMemberSheet._minCustomSeconds;
    return parsed.clamp(
      BanMemberSheet._minCustomSeconds,
      BanMemberSheet._maxCustomSeconds,
    );
  }

  void _submit() {
    final String reason = _reasonController.text.trim();
    Navigator.of(context, rootNavigator: true).pop((
      deleteMessageDays: _deleteDays,
      reason: reason.isEmpty ? null : reason,
      banDurationSeconds: _resolvedDurationSeconds,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FluxerSelect<int>(
                  label: l10n.userProfileBanDurationLabel,
                  value: _duration,
                  items: <FluxerSelectItem<int>>[
                    for (final int seconds in BanMemberSheet._durations)
                      FluxerSelectItem<int>(
                        value: seconds,
                        label: seconds == BanMemberSheet._customSentinel
                            ? l10n.durationCustom
                            : durationOptionLabel(l10n, seconds),
                      ),
                  ],
                  enableSearch: false,
                  stretch: true,
                  scrollableSheet: true,
                  onChanged: (int value) => setState(() => _duration = value),
                ),
                if (_duration == BanMemberSheet._customSentinel) ...<Widget>[
                  SizedBox(height: layout.s3),
                  FluxerInput(
                    controller: _customSecondsController,
                    label: l10n.userProfileBanCustomSecondsLabel,
                    helperText: l10n.userProfileBanCustomSecondsHelper(
                      BanMemberSheet._minCustomSeconds,
                      BanMemberSheet._maxCustomSeconds,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ],
                SizedBox(height: layout.s3),
                FluxerSelect<int>(
                  label: l10n.userProfileBanDeleteHistoryLabel,
                  value: _deleteDays,
                  items: <FluxerSelectItem<int>>[
                    FluxerSelectItem<int>(
                      value: 0,
                      label: l10n.userProfileBanDeleteNone,
                    ),
                    FluxerSelectItem<int>(
                      value: 1,
                      label: l10n.userProfileBanDelete24h,
                    ),
                    FluxerSelectItem<int>(
                      value: 7,
                      label: l10n.userProfileBanDelete7d,
                    ),
                  ],
                  enableSearch: false,
                  stretch: true,
                  onChanged: (int value) => setState(() => _deleteDays = value),
                ),
                SizedBox(height: layout.s3),
                FluxerInput.multiline(
                  controller: _reasonController,
                  textCapitalization: TextCapitalization.sentences,
                  label: l10n.userProfileBanReasonLabel,
                  hint: l10n.userProfileBanReasonHint,
                  maxLength: 512,
                  showCounter: true,
                ),
              ],
            ),
          ),
        ),
        FluxerBottomSheetFooter(
          child: FluxerButton.dangerPrimary(
            label: l10n.userProfileBanSubmit,
            onPressed: _submit,
          ),
        ),
      ],
    );
  }
}
