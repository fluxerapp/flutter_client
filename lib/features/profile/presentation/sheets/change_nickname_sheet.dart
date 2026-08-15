import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

/// Result of the change-nickname sheet: the new nickname, or null to clear it.
typedef ChangeNicknameResult = ({String? nick});

/// Bottom sheet to set or clear a member's nickname. Resolves to a
/// [ChangeNicknameResult], or null when dismissed.
class ChangeNicknameSheet {
  ChangeNicknameSheet._();

  static Future<ChangeNicknameResult?> show(
    BuildContext context, {
    required String username,
    required String? currentNick,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<ChangeNicknameResult>(
      context,
      title: l10n.userProfileChangeNickname,
      useRootNavigator: true,
      builder: (sheetContext, close) =>
          _ChangeNicknameBody(currentNick: currentNick),
    );
  }
}

class _ChangeNicknameBody extends StatefulWidget {
  const _ChangeNicknameBody({required this.currentNick});

  final String? currentNick;

  @override
  State<_ChangeNicknameBody> createState() => _ChangeNicknameBodyState();
}

class _ChangeNicknameBodyState extends State<_ChangeNicknameBody> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.currentNick ?? '',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    final String nick = _controller.text.trim();
    Navigator.of(
      context,
      rootNavigator: true,
    ).pop((nick: nick.isEmpty ? null : nick));
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s2),
          child: FluxerInput(
            controller: _controller,
            label: l10n.userProfileNicknameLabel,
            hint: l10n.userProfileNicknameHint,
            maxLength: 32,
            showCounter: true,
            autofocus: true,
            onSubmitted: (_) => _save(),
          ),
        ),
        FluxerBottomSheetFooter(
          child: FluxerButton.primary(
            label: l10n.userProfileNicknameSave,
            onPressed: _save,
          ),
        ),
      ],
    );
  }
}
